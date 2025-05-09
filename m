Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C78AB17CA
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 16:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF3D10EA77;
	Fri,  9 May 2025 14:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WU7dQJgA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7410A10E266;
 Fri,  9 May 2025 14:53:01 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b1ff8a0a13cso316296a12.0; 
 Fri, 09 May 2025 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746802381; x=1747407181; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+rxbByUDk8aWnHNgzHLW6dECRjoJFMK9UM6OVD8v+Xw=;
 b=WU7dQJgAwrl/pLOGnPUk1uSwWpmm7H8wvrt/79EwI5jJmJcCy/GmKzhGyVGZFr2kgq
 1lVeWT/N2M7CBVGcGnekCcttjGC4+FlWiT6E+Wzzk5mM5alr3mEECTrWeXtCU7/Ciol0
 Lvv3Bo4GeQKhQyIt+W/IQHnQSPo5taOxI4Cs16reKCzNp9GfJjva+QDhk3TIELou+7aC
 ZWK2sIEtGq6Y4lNQZ5AqTj3Bj8Yl9xDQjp7f5qcCL6+7RKTKrD32sMvcN8Ljl+S4x7Xj
 1VjjZzvZ9LFdsl6dZzx2oqcNDQSZpOB9ySXfcRXSH6sYlBv6a1nyBZWgNjTL7G9pLDJl
 f4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746802381; x=1747407181;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rxbByUDk8aWnHNgzHLW6dECRjoJFMK9UM6OVD8v+Xw=;
 b=hyVfY5bDxe19FnyusI85vhoo1n+JktRSmqnORMCPvMFKW7jZCDpEqFE8SfWqLGkDZ0
 5vDUcmWoTSQrtkAxd17jNC7wvTVY+e0YIW4HIFm28IUkhzdKNDMBQ0r4G9caUcH39bpG
 fwGP6rSEwdBUZYGr7dr66DWtmmBiL+V+VqvNuYlLNTgtoDwnCvv2UyPov2JgY/bCjEQB
 Vbaup0rMbrbZ8BBx0HiJVQLW1iYzCoaxG3mce6MXxK0n4GJQ8KD1djOKLFj7cBSPMwJM
 W7seWbG8G5ZXpPg2CSo/dRqvAq5s54NQSuN74dSfEl6gZ3VvwgD6h1oZnT2oPVQgVQI2
 t+kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiTn9ITysveTwwpBVomrhFvxEmeNVGE/BCspsNXxe/JfYSbWStX/Ebg7VwuhNgRhMm04Xn4ldkYFEx@lists.freedesktop.org,
 AJvYcCXZ5TBqTN/lZMAMptUDdGXSKWZEa3pdJZQwQI13gRf23+t/iuh/zynWNeGNT9xqlrdWCm6b7iDPQIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzd4S6xp9EsqzDBMSYoDcUrm1He3yo/D+Dipr/cH8T9upFriM0S
 54Slyf0viV1yHuXkOY2Ejsnz8/ZI4ru3phvJXE6uIwLxyWE3UDRVMsTvNSP4xmxTLwt7Mw4ruYW
 LWiSLxiNT6Igzj5YxOU4uVrnGznQ=
X-Gm-Gg: ASbGncsyOmnpop2Hkvg8rbxpCsF2cLPIwPFUI/MI4RxZs8bxhcKV0hqliPQ12zbrmsN
 gCgL7EQWX0dZ82UYS4tNCrwa4i5WtaJn96XpWmr4WCVAEhrKy/MXT4FQccsRvLSCkwwrJT973Fp
 KX64NuTz+8bh9uWJXS0RbBoU5G+XL6CJPM
X-Google-Smtp-Source: AGHT+IGid2gLml23kAy5JozTRzpOaIiTgbiZSQS9UGrMDQLCun2YHqZxUOx848O/tx+F/rBCo9iZAuD/WYolOsp7HdA=
X-Received: by 2002:a17:902:e94d:b0:22e:6ea8:8a07 with SMTP id
 d9443c01a7336-22fc9087803mr20059425ad.9.1746802380873; Fri, 09 May 2025
 07:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com>
 <c4921bf8-5eb5-458e-8afa-eeb86d5b5f34@oss.qualcomm.com>
In-Reply-To: <c4921bf8-5eb5-458e-8afa-eeb86d5b5f34@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 9 May 2025 10:52:49 -0400
X-Gm-Features: ATxdqUE5coNf8D2sY3OL3JNiiVLl1uKE6rRwgQNy_gcoY6h_rxUnCjyB9CqZysk
Message-ID: <CACu1E7HYdq2a3phPoXHwDYXGQX6G36hCiyu1LMpyY6G+M4HuWg@mail.gmail.com>
Subject: Re: [PATCH RFT 10/14] drm/msm/a6xx: Stop tracking macrotile_mode
 (again)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 9, 2025 at 8:45=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/8/25 8:33 PM, Connor Abbott wrote:
> > On Thu, May 8, 2025 at 2:14=E2=80=AFPM Konrad Dybcio <konradybcio@kerne=
l.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> SC8180X (A680) and SA8775P (A663) require a write to that register,
> >> while other SKUs are fine with the default value. Don't overwrite it
> >> needlessly, requiring the developer to read the value back from
> >> hardware just to put it in the driver again, introducing much more roo=
m
> >> for error.
> >
> > I'm not sure I understand that last sentence. The original reason I
> > always wrote it was that for host image copy we need to know the value
> > of macrotile_mode, so again the value exposed to userspace must match
> > what's set in the HW. We can't read the value from the HW and send it
> > to userspace, because userspace queries this when creating the
> > physical device during device enumeration and we really don't want to
> > spuriously turn on the device then. That means the safest thing is to
> > always program it, guaranteeing that it always matches. Otherwise we
> > just have to hope that the default value matches what we expect it to
> > be.
> >
> > I know you're copying this from kgsl, but kgsl doesn't expose the
> > macrotile_mode to userspace. I expect that HIC was added afterwards
> > and only works via hacks there (if it's even supported at all on the
> > relevant SoCs).
>
> Alright, I think I'll include it in the common UBWC config (even though
> it only concerns the GPU), as IIUC it may differ between platforms
> implementing the same GPU SKU
>
> Konrad

It most definitely does not concern just the GPU. It determines the
way tiles are swizzled within a macrotile so it also has to be in sync
between blocks.

Also, as said in the comments it's introduced with UBWC 3.1, so you
could turn this into another getter based on the version if you
introduce UBWC_3_1. In a future where we have proper modifiers derived
from this config struct instead of the current lie that everything is
the same, it would save us a bit.

Connor
