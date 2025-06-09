Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70AAD1EF8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 15:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050CB10E368;
	Mon,  9 Jun 2025 13:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JjJYRApA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFF010E368
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 13:35:28 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-313756c602fso391978a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 06:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749476128; x=1750080928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kR77AmYEmMIchXiqyUQZ2QG2OUiyQNsZAcRzINVkNVo=;
 b=JjJYRApAovmdR7s+hXm8k9AVB6Jj6LDSAKt8QNwNHr4r7nu8INA+KJrTxAv8csM7Hx
 X5R9eLjiXZixjNygiRuT+ueaRbuH8oJI10QGcl79B6bygA+1QCDH/b73H1gvoRE5iYFg
 IO2DDpCLOrtoqdqBpQgGfc6Eaz/4VvdLfcXhiRqtSu032lDo2ZdQ55+G6lubNUQ22djw
 t7lz1Cd4elZ33+6e2aTRsw5loQ2Gnh0tA7hxNoK8u9mZlSg+X+1wOzhp3wfQUQGKMWBQ
 ale8kfiYq+gCgVxLFSMIXWmjA4/AsEzdJJZhmDZR+NH5I1aXHNAPVexw+451tW1G9Z6Y
 gxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749476128; x=1750080928;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kR77AmYEmMIchXiqyUQZ2QG2OUiyQNsZAcRzINVkNVo=;
 b=CbRo1ndghV4ThTGJ/hmKzslzI3N5CbCktwBSiVE7x4zurTMUbhVbQzm4Z7/pB28vAG
 oZWfHOyreSxSBh5QrShtiNp9aJ+1ZnUTI269Rd974ZPU1uWsFcfxRhDBmyGohpsSfcbA
 +ZYR5389etfNB/b8TpBfBnQLrEIGfeW54qAMsoSsdaNf3Lbi0zXN1hIMOD3UYxPjoN+Q
 omiRjIqBROqN0XjecCzyXpzzY6NcHALL3aOYw6MIXizwXgW0fpCtlYCHdsFQFGCfNA2T
 epF9CSRAWdFblxUMdl/xLFWcPn2pU5P1T6VGaatWFKGUkm/luYEbwXcg2H/ElbfEeeCR
 sE0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7g/SXL3ZmXVWpZaJM6kPBFHkvUXZPjsxVpygu/7RjFjjQGi1x5VMIz/LwHZiirANURQaUOuF5ess=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW5p1y4kHq/iM8cRxhelW5Vw58LgiMPeFITjS/z15ZHYGE4ds+
 /1CO++Fp/8J37MENEQb4GVK/XjCITJdkPWD3/DmYcie6XpYa+KGs3C8S/nIwTbjRHeiEVt+nAis
 pgX99hc/hv/bUOzuFTQRo7ainVbXzrdk=
X-Gm-Gg: ASbGncu7f9a52RGfOI28wmGAGWzpFKX0SCwV7JalLl3/8eUc1LPhRrVE3QgaZv9Wg3b
 nmPL/VGEXJ3m0InhAlzbnir6QXCW+r2bjeeHgm2pQuM49m0ADbACpZpLzwCRUm+jCIsz41cAweQ
 S7+ukU21ilGo2yhl+60jSjm1kcNOXm73D9MfoHihgyB/u9
X-Google-Smtp-Source: AGHT+IGfU+CqdloT5GBJL83j24+S9O39U27/9Cv/iwTRCHBLVy+1t7Ge2dAKqKUqXmLkN/deorY4UjIhIhNkkV8HVeE=
X-Received: by 2002:a17:90b:268e:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-3134e3e4268mr5910935a91.3.1749476127603; Mon, 09 Jun 2025
 06:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250604143217.1386272-1-lizhi.hou@amd.com>
 <CADnq5_NMamTAd0whqwr+xcokFThCNX7T7qFBfX+u3vnS6oc=tA@mail.gmail.com>
 <e70bdb30-66cc-7e9e-b666-efff3203bf27@amd.com>
In-Reply-To: <e70bdb30-66cc-7e9e-b666-efff3203bf27@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Jun 2025 09:35:15 -0400
X-Gm-Features: AX0GCFtHAdAXqeZYjliT8FlmZt1QcxBvWEaZDPv2NuDeO2whS7UOtK8ST1uKIjo
Message-ID: <CADnq5_P8eFYdPJv5qV+N5JdLCDv4bhWDzpVZCiXTU3jNmgCy_Q@mail.gmail.com>
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect PSP firmware size
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: ogabbay@kernel.org, quic_jhugo@quicinc.com, 
 jacek.lawrynowicz@linux.intel.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, max.zhen@amd.com, min.ma@amd.com, 
 sonal.santan@amd.com, mario.limonciello@amd.com
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

On Wed, Jun 4, 2025 at 8:12=E2=80=AFPM Lizhi Hou <lizhi.hou@amd.com> wrote:
>
>
> On 6/4/25 07:51, Alex Deucher wrote:
> > On Wed, Jun 4, 2025 at 10:42=E2=80=AFAM Lizhi Hou <lizhi.hou@amd.com> w=
rote:
> >> The incorrect PSP firmware size is used for initializing. It may
> >> cause error for newer version firmware.
> >>
> >> Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engin=
e")
> >> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> >> ---
> >>   drivers/accel/amdxdna/aie2_psp.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/=
aie2_psp.c
> >> index dc3a072ce3b6..f28a060a8810 100644
> >> --- a/drivers/accel/amdxdna/aie2_psp.c
> >> +++ b/drivers/accel/amdxdna/aie2_psp.c
> >> @@ -126,8 +126,8 @@ struct psp_device *aie2m_psp_create(struct drm_dev=
ice *ddev, struct psp_config *
> >>          psp->ddev =3D ddev;
> >>          memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
> >>
> >> -       psp->fw_buf_sz =3D ALIGN(conf->fw_size, PSP_FW_ALIGN) + PSP_FW=
_ALIGN;
> >> -       psp->fw_buffer =3D drmm_kmalloc(ddev, psp->fw_buf_sz, GFP_KERN=
EL);
> >> +       psp->fw_buf_sz =3D ALIGN(conf->fw_size, PSP_FW_ALIGN);
> >> +       psp->fw_buffer =3D drmm_kmalloc(ddev, psp->fw_buf_sz + PSP_FW_=
ALIGN, GFP_KERNEL);
> > Why do you need the extra PSP_FW_ALIGN in the allocation?
>
> The start address of the firmware is also required to be PSP_FW_ALIGN
> aligned.

Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
>
> Thanks,
>
> Lizhi
>
> >
> > Alex
> >
> >>          if (!psp->fw_buffer) {
> >>                  drm_err(ddev, "no memory for fw buffer");
> >>                  return NULL;
> >> --
> >> 2.34.1
> >>
