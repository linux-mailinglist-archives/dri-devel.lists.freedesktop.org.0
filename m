Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B737494BE71
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 15:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DF010E726;
	Thu,  8 Aug 2024 13:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FoIqLC1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5076510E724;
 Thu,  8 Aug 2024 13:20:09 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1fd66cddd4dso9713695ad.2; 
 Thu, 08 Aug 2024 06:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723123209; x=1723728009; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMOQC+83+H5ULYyBVPldcGyHjz07ML2fM11pXW7zyQY=;
 b=FoIqLC1BqeIQrwAUVQ8IQXPh6fFjYYIXi1a2DwCoEE1rEMiz+N0WrIiUegWPeJozXx
 LHUyDFgd0tXYhjOA9BRViAjClbh0E/bI6UARBEOpKz165jxzN/hdXOXeAVOfKrocRU28
 TsLiAhpqIrJs2apruBn8tu6SacDEwH7RbwcJMRfMY0QRKqcK3elhBc+8TD7V9aEewtWs
 jNV1bFAhahEYiTKhCMEPgeFp5fIGjmPIW9L3Oq4HGbLszbsKz2tn3D6AZ6DIIDxcPXTU
 Ol3IYvM8PLWAnCzu5+rkbfzudu45GpMbYl7ZRo3/Bn86Mdh4yLTzuoyK9tgyyDnCKzEK
 sRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723123209; x=1723728009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FMOQC+83+H5ULYyBVPldcGyHjz07ML2fM11pXW7zyQY=;
 b=gWjnv2VaCo4MjcrWooJtrPDN8h1HraYRnErcuFucg9vey+ElpzZO7RoS+IAqUjh8Bj
 KK/FCqiU48eKu2iM9+zJzuFxWsyJjdHpUybCYLTgXURsQzCAlunR80mbHvNholLG3uOD
 ki4NfSULeIfjHNBJh6xZq20eFDBHIgx1aVTrsKRxDp6pSjHkv79z3MoWpPzigl7cBg5u
 VHW1xZ653i0dESS8HO1956zGpfxiZtVMUdmTZQG1zWt3G+/AwXYxTx3pXPjOevfXT4i2
 gpkrWb/vUtibnRFsLEn9eGpZ6vdnam/Rl7eHauuSe0bNBG29kxm8Wmk0QGCdB1qkIt1/
 MVAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj5bW75cjN7jPSUxKXLgsC3vvF1aTUgRkYQGISMJaAMNcQeZ2ze9HywjMGZvgbCquwDRr7V0T3genxCw4GkMqb8zvuHtFIkwQNz1+v0ROnD2V2yfAz4reMa7JQnRpn6pmNnEH4r8IF/5k/c1hmA7ASVMZkhhRmeCIph1phmf3/gtsVaOe2NroXda9UjcqITjUSLFweZAIZ18LG0FLkFgJj7EMSJldLxeluCUbLa7iI
X-Gm-Message-State: AOJu0YxC77vsMG2qc5GRb5Ic/I/OBMGcPvLAX3uZJutw8gC9edgJ1NLO
 3JJ9quDFFf/Vr8iSmF+2wGNBGid+7AvIxZBgWlwAiz832BREx4HZwVcqtoy3IO69K+9oC8lInf2
 z4v2S6RheFeK9qxb4HZLw2NRUi5E=
X-Google-Smtp-Source: AGHT+IFzp1SicDB7ejdIR24YxDXccKUMoqnfKrM5Cp60rZvNkU9f10Y5eqt6QTH4o/P4VajhzqSh578RsKDq9rDq+jY=
X-Received: by 2002:a17:902:e84f:b0:1fb:44e1:b5d6 with SMTP id
 d9443c01a7336-2009526c238mr26598655ad.23.1723123208613; Thu, 08 Aug 2024
 06:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-2-tzimmermann@suse.de>
 <BL1PR12MB514410E846FEB773DC0CAEEFF7BE2@BL1PR12MB5144.namprd12.prod.outlook.com>
 <6156f386-9316-4777-8cdb-f46ca3a9c183@suse.de>
 <CADnq5_NyVDp2kGK1t-XLyvF0qQL+3NNY+hCeRD8MOeY7wbApEg@mail.gmail.com>
 <d9918867-83fe-4859-84fe-684433cd5619@suse.de>
In-Reply-To: <d9918867-83fe-4859-84fe-684433cd5619@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Aug 2024 09:19:56 -0400
Message-ID: <CADnq5_N2bPP1hJUhry7Rp+bq7DSSbWeUVjrx7WCBtjAytdn_7A@mail.gmail.com>
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

On Thu, Aug 8, 2024 at 1:19=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 07.08.24 um 21:47 schrieb Alex Deucher:
> > On Tue, Aug 6, 2024 at 3:06=E2=80=AFAM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> >> Hi
> >>
> >> Am 05.08.24 um 21:00 schrieb Deucher, Alexander:
> >>> [Public]
> >>>
> >>>> -----Original Message-----
> >>>> From: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> Sent: Wednesday, July 31, 2024 8:17 AM
> >>>> To: maarten.lankhorst@linux.intel.com; mripard@kernel.org;
> >>>> airlied@gmail.com; daniel@ffwll.ch
> >>>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; =
intel-
> >>>> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas
> >>>> Zimmermann <tzimmermann@suse.de>; Deucher, Alexander
> >>>> <Alexander.Deucher@amd.com>; Koenig, Christian
> >>>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
> >>>> Subject: [PATCH 1/9] drm/amdgpu: Use backlight power constants
> >>>>
> >>>> Replace FB_BLANK_ constants with their counterparts from the backlig=
ht
> >>>> subsystem. The values are identical, so there's no change in functio=
nality or
> >>>> semantics.
> >>>>
> >>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>>> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> >>> This patch and the radeon patch are:
> >>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >>>
> >>> Feel free to take them via whatever tree makes sense if you are tryin=
g to keep the patches together, or let me know if you want me to pick them =
up.
> >> Thank you for the reviews. Please pick up both patches into the rsp AM=
D
> >> trees. The i915 patch already went into Intel trees and the rest of th=
e
> >> series will go into drm-misc.
> > What changes do these depend on?  BACKLIGHT_POWER_ON isn't declared in
> > my -next tree yet.  Might be easier to just run them through drm-misc
> > if that's where the change is.
>
> The constants are in commit a1cacb8a8e70 ("backlight: Add
> BACKLIGHT_POWER_ constants for power states"), available in v6.11-rc1
> and later.

Ah, ok.  My current -next branch is based on drm-next from near the
merge window, but I guess it doesn't have the patch yet.

>
> Please let me know if I should take the AMD patches into drm-misc-next.

Please go ahead.  Thanks.

Alex

>
> Best regards
> Thomas
>
> >
> > Alex
> >
> >> Best regards
> >> Thomas
> >>
> >>> Thanks,
> >>>
> >>> Alex
> >>>
> >>>> ---
> >>>>    drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> >>>> b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> >>>> index 25feab188dfe..650ec95bb40a 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> >>>> @@ -215,7 +215,7 @@ void
> >>>> amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder
> >>>> *amdgpu_encode
> >>>>         dig->bl_dev =3D bd;
> >>>>
> >>>>         bd->props.brightness =3D
> >>>> amdgpu_atombios_encoder_get_backlight_brightness(bd);
> >>>> -     bd->props.power =3D FB_BLANK_UNBLANK;
> >>>> +     bd->props.power =3D BACKLIGHT_POWER_ON;
> >>>>         backlight_update_status(bd);
> >>>>
> >>>>         DRM_INFO("amdgpu atom DIG backlight initialized\n");
> >>>> --
> >>>> 2.45.2
> >> --
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Frankenstrasse 146, 90461 Nuernberg, Germany
> >> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> >> HRB 36809 (AG Nuernberg)
> >>
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
