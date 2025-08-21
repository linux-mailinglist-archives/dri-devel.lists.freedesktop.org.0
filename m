Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB90BB2FA4C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 15:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E10210E99E;
	Thu, 21 Aug 2025 13:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IDTTlSpH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358C010E9A2;
 Thu, 21 Aug 2025 13:26:27 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-246180dc32cso760935ad.0; 
 Thu, 21 Aug 2025 06:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755782787; x=1756387587; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D9dWZgSSt8ISrV45OhIH6KV6b2TkNENPxFwpEI1fMF8=;
 b=IDTTlSpHLx2YA6O/4p/h7v1Rba/4UWgNU0vKCN1UxOaTYZ4kMSBeacK5CICFZAmw6o
 RJ+Np4VeDnjLkTOgyHWLYNyxDffxm3G+u9JTodQWqh9JMc9ZTDEz/VkhtGJk69F3D5tw
 z8MosWU39F44mPc5AiaJDB7WrUITtEghMieJelnweEtekIWcitnNOhA68Te24i20RNr+
 ZwbE/91UzSDigbf9YIO+caQ+lZRan/y2ym4xcbFSjkJ/6tDfeGbGzqRj6/FRAfBh6Q1W
 Xx36SEol2ncolJYtT+SprMIX0QM0R5VZdHr9ApxJk/BTau5deynsD1uxkMCjh37Qc+YV
 DlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755782787; x=1756387587;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D9dWZgSSt8ISrV45OhIH6KV6b2TkNENPxFwpEI1fMF8=;
 b=n7vAFZ1N5TUFz4fzL9ZfKJVCJaxJnGAHDcoFuI3uC1rFayi3wQN4EVoIWVM4R4OJVk
 WpR8pdPn27I8Ul6tiVNxv6N+Dk5lC5RkYNI3tS3CEQm0QHS4NLQxR3WgDmu6VjtLnWFh
 aYMwrrZhbrMTL2crs/n1CY/TQ+BlMOKAcuZ0D0jf8vRKM4wwLQ5VNjkyrXL7MH4ty08h
 b8+cGcisI2MuJKXCYy2G+Tdh5F+5RsDRUd91e4n6j9h7ZyaOQsX9S9OhLa/fItFraXOh
 IHL3T6uJBUL0+qwRN5nYBMDFohHdF+36eG7eXnye5M6ibKdCcf9fvkXbjgr9MH2QkhS+
 w0Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD3ut3Iu+o2V2sclWhFaJLDqbnJj2Koz2VdHQlGMNveijMUElEmnj9DZI0ANsn2p6s0PlbwxQP@lists.freedesktop.org,
 AJvYcCVQrPcN1lWjZ4h39NEPhhBd6fUXTJNQW6XrDnFHhz4hoajJZk6A7qEle+ewbXjDc53ynQyGRhRp9OBx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZgmR0qYULFN215oz3PD3ky9D0ZuZk2Xw+gpgXs99MDghWD/mB
 BZE9be3aKZGt06ho81RSLkJg6oC+lcKYInCQlXEy0yw6L1MDlf2la2tNWEGtE83wJgeZ5Szj89q
 vGWOHrrJTZs73Be/vP4ZkBHVyaRAWklE=
X-Gm-Gg: ASbGncuXz/MpxNylBemNAPfFKJMTMRJUFelpdNZel0Zh7toSIowhCtxUDh8QjaH5VyM
 SZoK/dBkJlk5EfvfpH4IFSsOeqeo+Y7S40njR/y0yzY3lzc/N5XBSKJEUEdCDYIbhjZZBthBSs3
 U2tbBAZpK8pAVyWfCfMGbDUmttpFk3w7KzhY/SLOWHjzS+C1TwxvdOpqKM6CJeiCpmy8II2ovE1
 hCVg7o=
X-Google-Smtp-Source: AGHT+IGkzEhWos4QUYblfEYxDYZWTU24EonAwoXWEJPD3CYAfFEpsYnY3g5hssFjVogU0QTSVNu3ZE8xuk0RjUB/1/E=
X-Received: by 2002:a17:902:c40d:b0:245:f904:8922 with SMTP id
 d9443c01a7336-245ff8ca9dfmr19297695ad.7.1755782786607; Thu, 21 Aug 2025
 06:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250505221419.2672473-1-sashal@kernel.org>
 <20250505221419.2672473-107-sashal@kernel.org>
 <0e8a1005-baa6-493e-a514-cd5d806949e1@suse.de>
In-Reply-To: <0e8a1005-baa6-493e-a514-cd5d806949e1@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Aug 2025 09:26:13 -0400
X-Gm-Features: Ac12FXwT83z3FJkEquv0LVv6izQd9aD-KnfjvDGnoi9pyikuUotQPjIuIFaDo3I
Message-ID: <CADnq5_OzjCA2WaJi14PSc9-gFmeC=vp3pCQ0zJxXbNRQ=9ncLg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.14 107/642] drm/amdgpu: adjust
 drm_firmware_drivers_only() handling
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, 
 Alex Deucher <alexander.deucher@amd.com>, Kent Russell <kent.russell@amd.com>, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 lijo.lazar@amd.com, mario.limonciello@amd.com, rajneesh.bhardwaj@amd.com, 
 kenneth.feng@amd.com, Ramesh.Errabolu@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Thu, Aug 21, 2025 at 5:33=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 06.05.25 um 00:05 schrieb Sasha Levin:
> > From: Alex Deucher <alexander.deucher@amd.com>
> >
> > [ Upstream commit e00e5c223878a60e391e5422d173c3382d378f87 ]
> >
> > Move to probe so we can check the PCI device type and
> > only apply the drm_firmware_drivers_only() check for
> > PCI DISPLAY classes.  Also add a module parameter to
> > override the nomodeset kernel parameter as a workaround
> > for platforms that have this hardcoded on their kernel
> > command lines.
>
> I just came across this patch because it got backported into various
> older releases. It was part of the series at [1]. From the cover letter:
>
>  >>>
>
> There are a number of systems and cloud providers out there
> that have nomodeset hardcoded in their kernel parameters
> to block nouveau for the nvidia driver.  This prevents the
> amdgpu driver from loading. Unfortunately the end user cannot
> easily change this.  The preferred way to block modules from
> loading is to use modprobe.blacklist=3D<driver>.  That is what
> providers should be using to block specific drivers.
>
> Drop the check to allow the driver to load even when nomodeset
> is specified on the kernel command line.
>
> <<<
>
> Why was that series never on dri-devel?

I guess I should have sent these to dri-devel as well.

>
> Why is this necessary in the upstream kernel? It works around a problem
> with the user's configuration. The series' cover letter already states
> the correct solution.

IIRC, the customers were not willing to change their kernel
configurations across their fleet, but required a way to load the
amdgpu driver, but keep nouveau blocked.  That said, doing this in the
core would also not solve the problem since the goal of nomodeset was
to block nouveau.

>
> Firmware-only parameters affect all drivers; why not try for a common
> solution? At least the test against the PCI class appears useful in the
> common case.

I can port the changes to the core if there is interest.

Alex

>
> Best regards
> Thomas
>
>
> >
> > Reviewed-by: Kent Russell <kent.russell@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_drv.c
> > index f2d77bc04e4a9..7246c54bd2bbf 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -173,6 +173,7 @@ uint amdgpu_sdma_phase_quantum =3D 32;
> >   char *amdgpu_disable_cu;
> >   char *amdgpu_virtual_display;
> >   bool enforce_isolation;
> > +int amdgpu_modeset =3D -1;
> >
> >   /* Specifies the default granularity for SVM, used in buffer
> >    * migration and restoration of backing memory when handling
> > @@ -1033,6 +1034,13 @@ module_param_named(user_partt_mode, amdgpu_user_=
partt_mode, uint, 0444);
> >   module_param(enforce_isolation, bool, 0444);
> >   MODULE_PARM_DESC(enforce_isolation, "enforce process isolation betwee=
n graphics and compute . enforce_isolation =3D on");
> >
> > +/**
> > + * DOC: modeset (int)
> > + * Override nomodeset (1 =3D override, -1 =3D auto). The default is -1=
 (auto).
> > + */
> > +MODULE_PARM_DESC(modeset, "Override nomodeset (1 =3D enable, -1 =3D au=
to)");
> > +module_param_named(modeset, amdgpu_modeset, int, 0444);
> > +
> >   /**
> >    * DOC: seamless (int)
> >    * Seamless boot will keep the image on the screen during the boot pr=
ocess.
> > @@ -2244,6 +2252,12 @@ static int amdgpu_pci_probe(struct pci_dev *pdev=
,
> >       int ret, retry =3D 0, i;
> >       bool supports_atomic =3D false;
> >
> > +     if ((pdev->class >> 8) =3D=3D PCI_CLASS_DISPLAY_VGA ||
> > +         (pdev->class >> 8) =3D=3D PCI_CLASS_DISPLAY_OTHER) {
> > +             if (drm_firmware_drivers_only() && amdgpu_modeset =3D=3D =
-1)
> > +                     return -EINVAL;
> > +     }
> > +
> >       /* skip devices which are owned by radeon */
> >       for (i =3D 0; i < ARRAY_SIZE(amdgpu_unsupported_pciidlist); i++) =
{
> >               if (amdgpu_unsupported_pciidlist[i] =3D=3D pdev->device)
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
>
