Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12713A3273A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 14:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444D810E8A1;
	Wed, 12 Feb 2025 13:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Q2jwX79f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC52D10E8B1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 13:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1739367280; x=1739972080; i=markus.elfring@web.de;
 bh=IJpXWBH0NGGKrYEeXnn9LivG+hfjpqHbcrFfOBiO3zs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Q2jwX79fHL+oIeGvcLSN+e/paohTILpNb1XLyHcpSqr362FvvLRbEmk7joRXxw73
 97VrmswABL6sFJkxSvUXVQWg4D2mcnNWukichLhcKXY9MSz76BoZP0lI3XpnTBLf6
 xfAGpkMX9/VjbHYjSkauy9X8Opfc1BO452IPxUeWbGVJygZmEk/3n0LnQ6tAu4eAb
 e5qcrpbJsEjIPmUcxd1Ci7dyPmFcf/Z+TX97CRBgf/zseP7NDosPdkQW+9gDwxtlD
 YnHDNxQ49GeAHU/bhG16x/A6oMQe/kRYg9pgcC6XRf5NfXJlVdF00S188Et5zfPnF
 rvx87oy0n4OAEqomKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.11]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N79NA-1tIprg0n9A-012ZCp; Wed, 12
 Feb 2025 14:34:40 +0100
Message-ID: <82e2c0f3-6cb7-425e-bc68-923f6d0d5b35@web.de>
Date: Wed, 12 Feb 2025 14:34:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tao Zhou <tao.zhou1@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>
References: <20250212070302.806-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] drm/amdgpu: Remove redundant return value checks for
 amdgpu_ras_error_data_init()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250212070302.806-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cWJedd82uv0Epg92CPpPp3225yjZ//OUtDWkiqg6LCifP3RO6n1
 pDnGZyjNHVPzcH/A88Rv3MTYzodPxsoqf9/vmfxrHdJxe+uR6w0wCfDgV4X9HXkiBzRG+am
 Ujo0JA2ERuQ3e58QjEtuGWmY/DQFDVgWS6ipBod3AS5VIXWJFDtu7VMyoAC9Y/WdyLse4ta
 rv6wTzLJSggGYUSuzVg1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KnRxe6PDBMo=;cmKBneo8zFhq7Q14wnqOGsrEIce
 JGtjiAy7ptnusOCTqtpJ+HHSs+BiZCQU/EaOZI0mX3KcbXYQQIjuUhF9i9IEYDmmUnS/XYyFs
 dYECaM9rfbVDHyes066fSE2aUY5JumpqTm7Zw2BcdQ8dQorZ3CWymSPPojF3/yBIrcewsMwH5
 6YntjosxuZJNSXwwOTLh1N52QrK6FenYbBjBo879IL2KwAguSAccUWjOuQR8+afb8WCKbyR1Q
 Rd8t1LWRt1g9RcDxOzxfW9PReNB12r3uAB7HW8QbLoT5SGxSIDyPDLJUNd9R5Z8y1JflAWXJT
 z7FrWDL0LcTqmA2R30qpBjdtM9KbbFLA/owqe7Faei+NL0meYFvsNA/7SuLVblf7OenOrs1vd
 0IlFxVtI3uiAKpi9o1Vv41+8tx6Iqh3BjVAOdW7MbFcD2kbp9FuyHtqPVFwz7vs6ORCmZ9og5
 kKrlDXlw/Vxs0tNhdjDP0NdLfqI343VGp1l9v/tZ+iAyPjSpUz1qPVoxP1396x27vuf4uRmXX
 6kganKVJXQr/tKjRHUT1WE3YMoDhQu51gxWeZCd8uPpXFhyTLxQnB+6WRE/2YUJg4lyXYpW5r
 dbaRxOLn4+1KnpsD2YJ1D2za3OzSHFqmSq64sPTM76A2gJfbhH6sjrcexzMNyaze7n9/hZ2MG
 NKlEMmr7rCfnX1xIXeNsX5I3wf2WJTkez8EuNl9O6zCjk/3GWVJbfLbk/KZxBVPjg4Gxq10cw
 Rm62OsAM2q294+QJLwN1TLOAOlgiTHmyceXijGUah7tOYrmX9Qbbqu9rSjKhk/arv8O7HqaGg
 6P1PoQd8hevagglWH/5XF/R7rjWWGVP6vw2MCo8+rWL0+wXhXAwAc8uKeYmi4toM4YwTaKwhk
 yu0YuCbwPC3WVhtkzaQDH33JS8rVlzhcO7O7DbBqzgAJKNvILOLxjjRmpx0HK9Lu0Ogu/NP5Z
 mBQ69V2Oej7QkCNvpy0Vf98MGpf7Vb42Ow0Lw8BGPHuFD3EUH2FN8aQqyKhp66q/LEe4lj6sC
 O6K1PB1OtleydaYgIsNN+hDwMv8uUj0hjLLmMyp1ia7lOM80TqOiriyCfe58GeVLmMBp1yvBj
 0EVI9Ywe37ZEM6RdLAhrvOD9o57gQYgJFEN8hMwRQnqDohkuCWh4J7tfqm3f1ak4XlASDzR0z
 5fnMHIioYUR8h0B9v72voXCSAv3150/Q75QkjkmOR3p9f0dMkgpM/R+Vj5HnFUGm+QR50sR3X
 kl8/kBsNU1AiCPVOfckY+0+n765w7Pd8ldL7LDiA2zkp5cJeaknqLYUR5JOAJgJEPBUKWxWj/
 puL8BByC6VaJ0oeU1RSW13TMj8BTvXT8VzxOSBBw/JEIgGjfS45t8h5ZyhQ1yoXWYqDRkhqfY
 +m2tabE65duCIQbH6FHQULVrLEdoEIyIvWwrLHX5uK4LidNIKG+uusUJkQfK7HWlWCvW+fxFW
 V7cbYOMA7xd4Nizkahesm/0jftaQ=
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

> =E2=80=A6 This patch changes its return type =E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n94


> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

How good does such an email address fit to the Developer's Certificate of =
Origin?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n440

Regards,
Markus
