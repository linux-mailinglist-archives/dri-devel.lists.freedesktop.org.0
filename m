Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7CA92CB92
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 09:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B9F10E5ED;
	Wed, 10 Jul 2024 07:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JktpBqIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D5B10E1EA;
 Wed, 10 Jul 2024 07:03:42 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-447f0b046d4so1362431cf.1; 
 Wed, 10 Jul 2024 00:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720595021; x=1721199821; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p3BXcqkjeuhZC3iXU7hUkrYXvkUrW95a4kWlrA8Wcs0=;
 b=JktpBqIhdbPwGeNz897t5mxoEfAzJ5XqpheBtRJhKz2Ojc1G9Y9VknLbPLxCEQZ+gK
 /KMfdAWqe9gDOgtis4kKbufDqkO1L3SzAtwzvfv9VH0Zhx3wJuKshOTaLVnBRbrPns3j
 C16q5ILN0I8kmid9x/kkM9wItEt0mbaVd3Ny+oV/oAxHs3cycz3D+qyYANs3Y+YERhCI
 5AWo3rC67p3IlktF3UQ+PxRwnVSe9N212C3I2y3H8DkT8Bqy0bigZAnrSv8kEtrGTPxC
 /MdtJjC4V14GG9abjY5OVc7tnUFHoF3jHSC1fO+zRudiU8DmQY3UZ1RCQe7z/ZeNCQSn
 FEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720595021; x=1721199821;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p3BXcqkjeuhZC3iXU7hUkrYXvkUrW95a4kWlrA8Wcs0=;
 b=WIALk5ull74UO9k+g2AuYzUK7RtsJG2hIdWn+MTGwlsArI0NGLIP8opeQ8anIDFQST
 CboZ9ksNTD5T5gceXG0ugVlAyKf6Cu5jU6Ny+7JPH0+jJOCtVDv6057XAQEJknvBcKyS
 alH/p3s5gHNP9FMaKGmAP5UWDVaO9bUn3phFSPtOWzGWkaJBxayGuCvULFjkv5RXIZr0
 iRB87qFHyapsMaXKdKXiGKarLiKpt/jf4QR/+uqBrRcoMzz+YeEz6ge5MySF/3gNOMeo
 RUm28aUuLFbFxrJ3ikpqIroNUQd/bZhn51V9vzGLQ3rUBfpMOkgu/mLV2itU8/kxhCDT
 XVEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZKIkBi+VW1ia5mjt5rvs1vPRuY7LAeFUPICDORQuiDWUtkzzjzfrm1hYxodau56Gu0CDYjJjufrEx7+jy3PqfNKcsC9SMJq3kB7mxsOEpg4c5jMid8Xq0dZa2D8HUEfBx+nJU1nGxdNeoID1OVg==
X-Gm-Message-State: AOJu0Yz2OWAlECrsgI/9F73uHs/fMsrik0O8f+Ot6Iz5Inj3MPcnkyyP
 JyL/AaCbayL80yxVxIjIAhw5prmlwTGa7XKtiK15i1PZPiX9NKWLjbQno52rQYOZc5QI2PkEiB9
 lq2xaMAaU2X6ijoVpwrlnLbELNNo=
X-Google-Smtp-Source: AGHT+IGoTFtKJW2jS7acG2Oi3QXPtRAexd48mCUJWxKk2iudODVVH1vr9AaGCM32ITeGQ3dDowuFjyKpv2ALtupjw7I=
X-Received: by 2002:a05:6214:514d:b0:6b2:b13d:5b75 with SMTP id
 6a1803df08f44-6b61bc801a7mr50698376d6.1.1720595021031; Wed, 10 Jul 2024
 00:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
 <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
 <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com>
 <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
 <2915a8c4-ebac-4dae-8f09-32a5b4d9aeda@amd.com>
 <CABXGCsPuRViSd_WeOciLKcQ4hjYxJ7e3i7LomwsUMzd0a+zvBw@mail.gmail.com>
In-Reply-To: <CABXGCsPuRViSd_WeOciLKcQ4hjYxJ7e3i7LomwsUMzd0a+zvBw@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 10 Jul 2024 12:03:30 +0500
Message-ID: <CABXGCsOsfP2SToiDhRAS51nPJ+Qr2v7B3Kjr+yVeP4G7zFZpMA@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>, 
 Linux regressions mailing list <regressions@lists.linux.dev>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
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

On Wed, Jul 10, 2024 at 12:01=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> On Tue, Jul 9, 2024 at 7:48=E2=80=AFPM Rodrigo Siqueira Jordao
> <Rodrigo.Siqueira@amd.com> wrote:
> > Hi,
> >
> > I also tried it with 6900XT. I got the same results on my side.
>
> This is weird.
>
> > Anyway, I could not reproduce the issue with the below components. I ma=
y
> > be missing something that will trigger this bug; in this sense, could
> > you describe the following:
> > - The display resolution and refresh rate.
>
> 3840x2160 and 120Hz
> At 60Hz issue not reproduced.
>
> > - Are you able to reproduce this issue with DP and HDMI?
>
> My TV, an OLED LG C3, has only an HDMI 2.1 port.
>
> > - Could you provide the firmware information: sudo cat
> > /sys/kernel/debug/dri/0/amdgpu_firmware_info
>
> > sudo cat /sys/kernel/debug/dri/0/amdgpu_firmware_info
> [sudo] password for mikhail:
> VCE feature version: 0, firmware version: 0x00000000
> UVD feature version: 0, firmware version: 0x00000000
> MC feature version: 0, firmware version: 0x00000000
> ME feature version: 38, firmware version: 0x0000000e
> PFP feature version: 38, firmware version: 0x0000000e
> CE feature version: 38, firmware version: 0x00000003
> RLC feature version: 1, firmware version: 0x0000001f
> RLC SRLC feature version: 1, firmware version: 0x00000001
> RLC SRLG feature version: 1, firmware version: 0x00000001
> RLC SRLS feature version: 1, firmware version: 0x00000001
> RLCP feature version: 0, firmware version: 0x00000000
> RLCV feature version: 0, firmware version: 0x00000000
> MEC feature version: 38, firmware version: 0x00000015
> MEC2 feature version: 38, firmware version: 0x00000015
> IMU feature version: 0, firmware version: 0x00000000
> SOS feature version: 0, firmware version: 0x00000000
> ASD feature version: 553648344, firmware version: 0x210000d8
> TA XGMI feature version: 0x00000000, firmware version: 0x00000000
> TA RAS feature version: 0x00000000, firmware version: 0x00000000
> TA HDCP feature version: 0x00000000, firmware version: 0x1700003f
> TA DTM feature version: 0x00000000, firmware version: 0x12000016
> TA RAP feature version: 0x00000000, firmware version: 0x00000000
> TA SECUREDISPLAY feature version: 0x00000000, firmware version: 0x0000000=
0
> SMC feature version: 0, program: 0, firmware version: 0x00544fdf (84.79.2=
23)
> SDMA0 feature version: 52, firmware version: 0x00000009
> VCN feature version: 0, firmware version: 0x0311f002
> DMCU feature version: 0, firmware version: 0x00000000
> DMCUB feature version: 0, firmware version: 0x05000f00
> TOC feature version: 0, firmware version: 0x00000007
> MES_KIQ feature version: 0, firmware version: 0x00000000
> MES feature version: 0, firmware version: 0x00000000
> VPE feature version: 0, firmware version: 0x00000000
> VBIOS version: 102-RAPHAEL-008
>

I forgot to add output for discrete GPU:

> sudo cat /sys/kernel/debug/dri/1/amdgpu_firmware_info
[sudo] password for mikhail:
VCE feature version: 0, firmware version: 0x00000000
UVD feature version: 0, firmware version: 0x00000000
MC feature version: 0, firmware version: 0x00000000
ME feature version: 44, firmware version: 0x00000040
PFP feature version: 44, firmware version: 0x00000062
CE feature version: 44, firmware version: 0x00000025
RLC feature version: 1, firmware version: 0x00000060
RLC SRLC feature version: 0, firmware version: 0x00000000
RLC SRLG feature version: 0, firmware version: 0x00000000
RLC SRLS feature version: 0, firmware version: 0x00000000
RLCP feature version: 0, firmware version: 0x00000000
RLCV feature version: 0, firmware version: 0x00000000
MEC feature version: 44, firmware version: 0x00000076
MEC2 feature version: 44, firmware version: 0x00000076
IMU feature version: 0, firmware version: 0x00000000
SOS feature version: 0, firmware version: 0x00210e64
ASD feature version: 553648345, firmware version: 0x210000d9
TA XGMI feature version: 0x00000000, firmware version: 0x2000000f
TA RAS feature version: 0x00000000, firmware version: 0x1b00013e
TA HDCP feature version: 0x00000000, firmware version: 0x1700003f
TA DTM feature version: 0x00000000, firmware version: 0x12000016
TA RAP feature version: 0x00000000, firmware version: 0x07000016
TA SECUREDISPLAY feature version: 0x00000000, firmware version: 0x00000000
SMC feature version: 0, program: 0, firmware version: 0x003a5a00 (58.90.0)
SDMA0 feature version: 52, firmware version: 0x00000053
SDMA1 feature version: 52, firmware version: 0x00000053
SDMA2 feature version: 52, firmware version: 0x00000053
SDMA3 feature version: 52, firmware version: 0x00000053
VCN feature version: 0, firmware version: 0x0311f002
DMCU feature version: 0, firmware version: 0x00000000
DMCUB feature version: 0, firmware version: 0x02020020
TOC feature version: 0, firmware version: 0x00000000
MES_KIQ feature version: 0, firmware version: 0x00000000
MES feature version: 0, firmware version: 0x00000000
VPE feature version: 0, firmware version: 0x00000000
VBIOS version: 113-D4120100-100


--=20
Best Regards,
Mike Gavrilov.
