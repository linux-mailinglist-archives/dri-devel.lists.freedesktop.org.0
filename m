Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE1E94B097
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 21:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA95110E19B;
	Wed,  7 Aug 2024 19:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OGM8VEM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E53110E19B;
 Wed,  7 Aug 2024 19:47:51 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-76cb5b6b3e4so161091a12.1; 
 Wed, 07 Aug 2024 12:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723060071; x=1723664871; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8fOPzmtqiLIFR7hdlUGU7hbaoMoJU1ECSwmA8wwi8k=;
 b=OGM8VEM/FxZ/pNRlrFPfNC5RS/QUzy/4sHeR7VJDkDv7GtlxPaaYbqX91T/LkMzmSl
 qhIpgLEWz7xrnEqLJyysKCdTHYDK9qOGnm+t0PhhjbSTD3wAyTpuYRzTZbwhn22GQRT3
 ZarSt/HrmNzznpVLuxtjTtUGdA+bPJmdgZRxdwJR3kalpQ9WiAU960NKa62pt6IDwPJK
 Mxwz4JxY8Ej5UbiVPB6kNy5vlXmE1iQWDYZOcpQ76smLTrKwuocLG/xdbUunf7R+zRKI
 7d4IBoRjJX7kcJ5Vx9R3wS9g6HLKidmCqt00cqP4a0SV3QR3cizfy5ILsh2bil//Ed68
 +L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723060071; x=1723664871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8fOPzmtqiLIFR7hdlUGU7hbaoMoJU1ECSwmA8wwi8k=;
 b=iY4ckIaio6ADRSUYXcFWVROzGVcCX4a++Q/2ADloAl8k829tLwukpTqeZBoApwwILb
 iFzsRYre+hoHsc6sYzC859o07bf2xemAcaQuGhnl8zC4nM5ruQt+8KnoCcyOC4ZgFDjj
 TNJscJ4+NYf1fI/YcpIpc4Nuov3B0N6wcH8EIrKYYzqbQGF4xj4MbIOnr7URzt8kx8gP
 0zAPyVBiBJRFMDrzH2IUJ+/QnOlyLkfaZJMqktoe299edKY523Ou1Ozex57e1gV/Cc5J
 PfYmLqajoq3nw3R4SDZalxdSXPBPbiAuJEQW6Zrg1U1NRj9SHGEpHlJ7fBAUza7CM8hV
 4JCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnhKC+W7SsvZVYJrtqYd0ObttUYFbFkt81tCYTOGCXzpJObv/ue3lXNmBZQnIoPcArl6TbwopaQhDPXO+YwW4RjlrwGDe2RoAwQSazaHel3zNxcUzMwGHPwOqb2MFbX7G+X4Xahtn2yNLNKHbLQGHd29dWE07sYfDdaiw2Vipvc3/+2/SysXLnypYnLQcroSFTWF3jecIgABEg9X3pQED4cXv0KaFfeBF4P95fuo6R
X-Gm-Message-State: AOJu0YzfoO4wFmV2exSYxVjnDq6l74wNFP29uMKgKOTEvaILlzBQg0wA
 7kl1u4sn/moPV9gEetMKKbGSpQbZwVwgFQ/iXt7SNqRRokRP6agXDGkuZQ4whciDBCoffiWSpgW
 ApWX7A9uZ1oBgNEmwZQVr8SfhzUQ=
X-Google-Smtp-Source: AGHT+IHmFlEPW3T9TfVRn+SCIYDPVxch8xQRSjUwcj3bFrKKJ2emjniSP+27GrHeI++j0gGMn/UeW1lRfqmrGRN+oIc=
X-Received: by 2002:a17:90a:ec0b:b0:2c9:62be:292a with SMTP id
 98e67ed59e1d1-2cff9449548mr18631680a91.21.1723060070533; Wed, 07 Aug 2024
 12:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-2-tzimmermann@suse.de>
 <BL1PR12MB514410E846FEB773DC0CAEEFF7BE2@BL1PR12MB5144.namprd12.prod.outlook.com>
 <6156f386-9316-4777-8cdb-f46ca3a9c183@suse.de>
In-Reply-To: <6156f386-9316-4777-8cdb-f46ca3a9c183@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 Aug 2024 15:47:38 -0400
Message-ID: <CADnq5_NyVDp2kGK1t-XLyvF0qQL+3NNY+hCeRD8MOeY7wbApEg@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/amdgpu: Use backlight power constants
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>
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

On Tue, Aug 6, 2024 at 3:06=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 05.08.24 um 21:00 schrieb Deucher, Alexander:
> > [Public]
> >
> >> -----Original Message-----
> >> From: Thomas Zimmermann <tzimmermann@suse.de>
> >> Sent: Wednesday, July 31, 2024 8:17 AM
> >> To: maarten.lankhorst@linux.intel.com; mripard@kernel.org;
> >> airlied@gmail.com; daniel@ffwll.ch
> >> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; in=
tel-
> >> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas
> >> Zimmermann <tzimmermann@suse.de>; Deucher, Alexander
> >> <Alexander.Deucher@amd.com>; Koenig, Christian
> >> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
> >> Subject: [PATCH 1/9] drm/amdgpu: Use backlight power constants
> >>
> >> Replace FB_BLANK_ constants with their counterparts from the backlight
> >> subsystem. The values are identical, so there's no change in functiona=
lity or
> >> semantics.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> > This patch and the radeon patch are:
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Feel free to take them via whatever tree makes sense if you are trying =
to keep the patches together, or let me know if you want me to pick them up=
.
>
> Thank you for the reviews. Please pick up both patches into the rsp AMD
> trees. The i915 patch already went into Intel trees and the rest of the
> series will go into drm-misc.

What changes do these depend on?  BACKLIGHT_POWER_ON isn't declared in
my -next tree yet.  Might be easier to just run them through drm-misc
if that's where the change is.

Alex

>
> Best regards
> Thomas
>
> >
> > Thanks,
> >
> > Alex
> >
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> >> b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> >> index 25feab188dfe..650ec95bb40a 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> >> @@ -215,7 +215,7 @@ void
> >> amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder
> >> *amdgpu_encode
> >>        dig->bl_dev =3D bd;
> >>
> >>        bd->props.brightness =3D
> >> amdgpu_atombios_encoder_get_backlight_brightness(bd);
> >> -     bd->props.power =3D FB_BLANK_UNBLANK;
> >> +     bd->props.power =3D BACKLIGHT_POWER_ON;
> >>        backlight_update_status(bd);
> >>
> >>        DRM_INFO("amdgpu atom DIG backlight initialized\n");
> >> --
> >> 2.45.2
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
