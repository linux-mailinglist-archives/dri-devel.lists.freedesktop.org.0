Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E56CAD6FAF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C6E10E7EA;
	Thu, 12 Jun 2025 12:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="hq88WZBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364E210E7E9;
 Thu, 12 Jun 2025 12:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oldschoolsolutions.biz; s=s1-ionos; t=1749729771; x=1750334571;
 i=jens.glathe@oldschoolsolutions.biz;
 bh=9TF4TS7HJTGPNOkFIxQGNmmFmjlfd1e/5O/TAB6Zj10=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hq88WZBS/UZk1CLqJ5Y4whdiepavhaheE0DTj4N4enSKSJdgOwD+GJYaadckRVAg
 tH7sdODyk/6WnQDGA4UQiRPA5SKO8Af1vUDluLzz6r9SB5aETlnfVYDtlTy7Qp7wA
 UfT050iwsWJQuo+DwgtWo5awDbUTcfyFjoL2JS7m49bcrbzMPzgrY9MRNPWO/SY0D
 0iiDSI7upSlLysms9LbaWXg4P7LXeJb284oldpPzGIUb53F/Cm9vE1wf4RVJHBh0V
 ZsJOGf5zSuo0r3KjnWwr2UNTfvI8aeMS684Pxd137VnC4yMI+DEII0DzZ2rDYk3dF
 PwHJ1i/8xmlqoszmgw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.192] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MY6TD-1uKSMI1X8H-00LaH9; Thu, 12 Jun 2025 14:02:51 +0200
Message-ID: <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
Date: Thu, 12 Jun 2025 14:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PA710ORLSCeaHxN8hFzgvAQEIwCwCDgAqOPxruFizn/AlMGjSUW
 85uyv+NKj8CJmTO0sQnvMTIrZKQ6go/mQ+6xlAatX56T7sbfoY9mrlGxuK9GqULgAmnaFnI
 SRZ9HjMKSXySd+iYIlVnC8F/m6mNicG0sb5pyedZWjPtYWzcuTS7566I4WNuxQLOEyqK+x9
 Bh/Uz2SCZsJOfkrhXHa1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L1EqaybFqPc=;SH5yWekgKGHaAg1DHQsy+EzoiJq
 Fl33glttMNku1XZ3PTQbtb1rmTcDXbw/vl6qSCG/34IBmm/DS8vKdIccBDVBP8bvI/DqmMJez
 6byvoL6GFFNM1CzDtjKWZABX9NJ4LnQbkIpGuj1Y/Z6MN9X3klsIW2zF8chmAuuQdzLNN0pqA
 PoqPsBYemVKVNhE3XnbyZCuHtha/Q0gfKOyhl5icS1r70P47mUuNWR4cfk9LEjrRm//zd/8cY
 WzQ5F792ABH62d95D1KWBO8AjRUshhpAHKvH4ThW7NJ60XhXuPnqMZeyRmeOusx+NBn2FpgxF
 J0yLdMiIMLTAk41h1Dlhg7zy4o6gjT9jsegg9l9k5X9Bi0hTsjtQiRJFTnY6Id4dmxT5GlMEq
 RenJBljZbzGPcA/rFtr0cukkKmtA8osWr+fsey1+lXU8LCSXGwi+dATMTpW7JnR0ingmsdM+Z
 YKUjVso7pM+kd4zpmNR2Q3JPozM3VMR0ZDH+t/STUVNeiFgCDYUaPmHczxPJTpBRdpBKLehhR
 SOySjY8o/cs8vTG0PQnUjCgO6NdHRt81X0Vq9/2gcoRAxjBfhQuV0cHJ+Kx0fTpsY8ubz1ul/
 myEmfKl1BwJ0nnK636uqKlkh2pVOgN6i3lZv2UbRmtjtIAJ6IMiXQ969R+AGuuyIQ8UxH6sxt
 FZigztwQCqqYwZGlABZzY7ZGb8sXiHw+CRSHq7Tf2ddwl8rz4H+ALxOBNFuYtWo6Q30NT0RTs
 gfW8TXxhGDGay92JfTOmmaePFtXJXKmhHUytOWrvwfmJoA5/qvqFXkwfm9hsZCAyLMW6Rr5Nv
 Dup8v0DVyMrM9CjYr4zCsEarLgGkTGOAF2BPED53kmP5iQBCPKoYLz72NlKRgyNfdUyWDNy2K
 dTtdW7K8AYxt4ZhH6eSVWHQsBd5pfUy/svx8mJJtnNhTKhNsJLu2+Wfr+PASg7eIRHHtH6T/I
 b5Qsn35pG1HRk11oxA8Rzvhwb4SgPmuJN4SRzV1JNj6roLIRwB55utfAiGpMdIZRTHr0aMd2q
 tzMaB2gTpJt/8iT3lypRZuSrQPxIe7Bl/tGWiqwNJiwZ+IvsYb3DhRyx1PyWON/xc8OdnGgcj
 K/9WeZoUvksWB2cXT2ppehye2Ng5A+QwmgTeKoHp4meAOiNN7ZSSndmchBFGVrYA503WOpm0f
 LDurQ1mJ9EQVTQJOMtYM9kqpDTt0rhwRxzYGgkkOygitExSsr6C1TVGcAf3Vesk4tG+6Ctkvw
 PPtbXm1kMH5pmSk86Ek+TqY9T93192Ci7WQ5rE/vF4qmA3DhitQJDGZn+Hyxtx4b4Qn0+aOUx
 4vBkLmiZxmrdt2llTj0c44+bd707cNzq/WJQNEfhJ5RhEeHG0fNTFv9106zHmCODAl2l44zqX
 v/xI4aoMh/F4Yb/2uTgcBijj7AMpCZ+9s8g7pkk0Dn81sYe3pNcjsb+Ix/t+fed23Qp+bv82f
 KOWpJFA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/11/25 13:15, Akhil P Oommen wrote:

> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
>
Hi Akhil,

when loading the driver (still without firmware files) I'm getting a=20
speedbin warning:

[=C2=A0=C2=A0=C2=A0 3.318341] adreno 3d00000.gpu: [drm:a6xx_gpu_init [msm]=
] *ERROR*=20
missing support for speed-bin: 233. Some OPPs may not be supported by=20
hardware

I've seen that there is a table for speed bins, this one is not there.=20
Tested on a Lenovo ThinkBook 16 G7 QOY.

with best regards

Jens

