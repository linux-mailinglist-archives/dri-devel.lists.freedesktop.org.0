Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66C992CB8A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 09:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D7710E09D;
	Wed, 10 Jul 2024 07:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bzlW4xXV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DD210E09D;
 Wed, 10 Jul 2024 07:01:12 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5c7aff2005bso14622eaf.2; 
 Wed, 10 Jul 2024 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720594872; x=1721199672; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0g/tbN5BOdpCUSIAXDAOLNWIFD9iOc+XZRuFSDfjuIw=;
 b=bzlW4xXVxNEcNldTwEEjXKs82x0LsYfj86NmuEd+WB8/S4RUmtvBX7OqVmZkALK5Ev
 sWfLG7dh7iRQVHKea0cSTR379jq2Fqv293x9F+i7awgIpBQaNEz54H4Ul+AjmrWZRf7Q
 nnmDdI5sSyPmMMgd2w3d7GDy+sNdgSLxu9P3GfKzJvTLNrT8ATpyQ/aFHcRk3QbduhdP
 2ea1KccsqDst3NfEDG7PXmeibaWVYjaqcKVRk8+r+ILYIg+Y448r8FQAwe7ksR/sl5vV
 jt/ub0ymnDtHiN3rB6UqIpoAqQ95bvvn4t4gVfpDLoITNBuSpA1Z4AqD1Ub8J+xbh/Mv
 GrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720594872; x=1721199672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0g/tbN5BOdpCUSIAXDAOLNWIFD9iOc+XZRuFSDfjuIw=;
 b=BWLhVrxovYWZyMxxEtHY7bS95C4h/D3O4L8wXX5e1x5tF9oZjhSjG1zxI35rygJdcS
 Cut7OGIQw+bktFjPlh1pFeFee2FIi5Rn6tmWOhPO11+RKD/dh3RI0uHp6GQwnhSesXJx
 oJuEt678RjnJFNM/1mQbXe58yoVxee4mPTVqKMPxoT9VPLVQlrVUDWoCBg5Oxc8DMgmv
 Rbga1ThwrBuO0hM8QwyDV6Clv0SKvEq5gDJHeiRziWaT1Kae/KoUbgAKO+oLcAjStIhP
 4MesAhYAFNzp++P/2rOwc2pwpae1p7thcHJ7C2EEySHn47leWSYpuQGsy+0rwzoF5GBp
 nkTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURzRtduydDGpkcQHLE4kfB7y4gHTMNNyX2YXMOK9mzGtZcgcuiWvmC/F+QTHQvd+iEM3yvfFl7amwilY4yupPFk7aNnz6g9h20bYSZwOxcmLMwUYl/7bYVULbSiX4H40An4ibkpXV0Iw44e+33WA==
X-Gm-Message-State: AOJu0YwRPGTQzykoyWo2BpfrYrFNA38VISs/UlaYhTH2G/aNzPc/UksJ
 Twq0N96Pu/hlLb8Uonc+ZOG+T8/7j04QpfvOlSwMfefMK7fLuB3hFWLFE/KkAqPhhPzj+xLARuX
 x36Dr2a52mxiLnyT3JZpxpPKiWrM=
X-Google-Smtp-Source: AGHT+IFx2BRvjtFXqoSg1+PvMMQRdSDlmRVGe6OqPGstIMZOnCPopgGEXsf8wsKHq0X3hpEtGSjUw3Isc0L2F8oBYBc=
X-Received: by 2002:a05:6820:2c05:b0:5c7:b587:40a7 with SMTP id
 006d021491bc7-5c7b58743aemr806363eaf.1.1720594871696; Wed, 10 Jul 2024
 00:01:11 -0700 (PDT)
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
In-Reply-To: <2915a8c4-ebac-4dae-8f09-32a5b4d9aeda@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 10 Jul 2024 12:01:00 +0500
Message-ID: <CABXGCsPuRViSd_WeOciLKcQ4hjYxJ7e3i7LomwsUMzd0a+zvBw@mail.gmail.com>
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

On Tue, Jul 9, 2024 at 7:48=E2=80=AFPM Rodrigo Siqueira Jordao
<Rodrigo.Siqueira@amd.com> wrote:
> Hi,
>
> I also tried it with 6900XT. I got the same results on my side.

This is weird.

> Anyway, I could not reproduce the issue with the below components. I may
> be missing something that will trigger this bug; in this sense, could
> you describe the following:
> - The display resolution and refresh rate.

3840x2160 and 120Hz
At 60Hz issue not reproduced.

> - Are you able to reproduce this issue with DP and HDMI?

My TV, an OLED LG C3, has only an HDMI 2.1 port.

> - Could you provide the firmware information: sudo cat
> /sys/kernel/debug/dri/0/amdgpu_firmware_info

> sudo cat /sys/kernel/debug/dri/0/amdgpu_firmware_info
[sudo] password for mikhail:
VCE feature version: 0, firmware version: 0x00000000
UVD feature version: 0, firmware version: 0x00000000
MC feature version: 0, firmware version: 0x00000000
ME feature version: 38, firmware version: 0x0000000e
PFP feature version: 38, firmware version: 0x0000000e
CE feature version: 38, firmware version: 0x00000003
RLC feature version: 1, firmware version: 0x0000001f
RLC SRLC feature version: 1, firmware version: 0x00000001
RLC SRLG feature version: 1, firmware version: 0x00000001
RLC SRLS feature version: 1, firmware version: 0x00000001
RLCP feature version: 0, firmware version: 0x00000000
RLCV feature version: 0, firmware version: 0x00000000
MEC feature version: 38, firmware version: 0x00000015
MEC2 feature version: 38, firmware version: 0x00000015
IMU feature version: 0, firmware version: 0x00000000
SOS feature version: 0, firmware version: 0x00000000
ASD feature version: 553648344, firmware version: 0x210000d8
TA XGMI feature version: 0x00000000, firmware version: 0x00000000
TA RAS feature version: 0x00000000, firmware version: 0x00000000
TA HDCP feature version: 0x00000000, firmware version: 0x1700003f
TA DTM feature version: 0x00000000, firmware version: 0x12000016
TA RAP feature version: 0x00000000, firmware version: 0x00000000
TA SECUREDISPLAY feature version: 0x00000000, firmware version: 0x00000000
SMC feature version: 0, program: 0, firmware version: 0x00544fdf (84.79.223=
)
SDMA0 feature version: 52, firmware version: 0x00000009
VCN feature version: 0, firmware version: 0x0311f002
DMCU feature version: 0, firmware version: 0x00000000
DMCUB feature version: 0, firmware version: 0x05000f00
TOC feature version: 0, firmware version: 0x00000007
MES_KIQ feature version: 0, firmware version: 0x00000000
MES feature version: 0, firmware version: 0x00000000
VPE feature version: 0, firmware version: 0x00000000
VBIOS version: 102-RAPHAEL-008

> Also, could you conduct the below tests and report the results:
>
> - Test 1: Just revert the fallback patch (drm/amd/display: Add fallback
> configuration for set DRR in DCN10) and see if it solves the issue.

It's not enough.
I checked revert commit bc87d666c05 on top of 34afb82a3c67.

> - Test 2: Try the latest amd-staging-drm-next
> (https://gitlab.freedesktop.org/agd5f/linux) and see if the issue is gone=
.

I checked commit 7cef45b1347a in the amd-staging-drm-next branch. Same here=
.

> - Test 3: In the kernel that you see the issue, could you install the
> latest firmware and see if it fix the issue? Check:
> https://gitlab.freedesktop.org/drm/firmware P.S.: Don't forget to update
> the initramfs or something similar in your system.

Is this any sense? Fedora Rawhide always ships with the latest kernel
and firmware.

--=20
Best Regards,
Mike Gavrilov.
