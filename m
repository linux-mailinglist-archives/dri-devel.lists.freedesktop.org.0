Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C1A34698
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCC410EB0F;
	Thu, 13 Feb 2025 15:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NdvJ8wDe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A099E10EB0F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:26:59 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso11717245e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 07:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739460418; x=1740065218; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wZ8ZpchhsuyR5ZoxAfEGSuPJ2IZfU52CW6+CcKm/nhw=;
 b=NdvJ8wDeWZXoudht92VUiMBrZ9EtkrEr4a4PHSXFdaZQz68BqGC755YGe/Xd184jg0
 vaKF3shAsxOeIRkunIJSBfqGXNrOfB2ygOkT2Ud0cRcT42nTGlqYYjgdzrzEUowqNXDw
 3oLU+LTEu2OlBauIXcSJ6Z6ZbZwNzQOk9e+IdL7wGBE921nGmlfq6fQGAICkGQEvalHo
 OV+i4RwGNRl60U/aO5Fn0p4ouqO7NgnRWDRY0EYjhFxG8V5CzNJHzUvIPCB/OzD0CQQ4
 wnK0EW0l76jO4++fvSWiEdLXjBOZ7kAXgdt3TLch3qdcaIqWLQLznDOEcSzKOsZ8VGZP
 dUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739460418; x=1740065218;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wZ8ZpchhsuyR5ZoxAfEGSuPJ2IZfU52CW6+CcKm/nhw=;
 b=AHh/POCP7YqjbIYUtJjzKMWNRGr3L6OSpyhBtOQSOGzVJW7APCKCbrjPQvnHArh89b
 tPyovO11sxFSZY3SK3am1eQJuAuhb/uoXNRF6ko8c0VdZ0Pbf6jgZLlvTbhz3mScYssp
 QwyBPA4HdDgJUWomLeud/b5KcoP3lLv+K0yL99k5WAebBmEOmST4Q+J3ywimI23Osmc5
 XUafxDUfout9Mi54HxJbMXtn5Lsat7vC97OPSbpKlC8/73rua6HMbrgV33kNBLDO6e7u
 atA2tyTA9Al2Sx1mcxXrLQJ9Re9Ay7aZRrVAoiLDhcucRbOTiu05yVlOdc9a4C6r/Adf
 m48g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4mL/TCs0TfagSMhkPCes2XLsQE7o0Ul6+PemZHc+J3/uzqV0NpSPf4vv3t5Mv3bU/FXtxRi19Htg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwydXiHwyDp4V9QuYy4LdD7h+LZAAULPnRpl002wVwsPTm9hb/h
 V9f3Fc/6YfRqekGzq1AGeF5ANcL4KPvzuWAd+L4qsY/XpswKumpg
X-Gm-Gg: ASbGncvcJu7iy43yfxKhqfDSTR6YbiYNx7OiL98s/nkIjJcllemif/ua4gIyEn+i12m
 URbyS5Pmdx2BPS2BVd3GpGfFDlbub3XUzl7aWBo6SUZvSdd//4IJLAvdmDvDcoyX2BTYUxcPh3A
 GdTO+NcEjO7WkuPXmhGr16iD0nDDwCOqELZij2ZxtpjtzJG/NcYEY8C7fJ10hoWgbIx7OCWRsMT
 Ae/I3Mkb9tASzBmsUPZx/KmYtdtsfBU/vsgBDDDRVgOdSRL0nUHSj8HMZ1X2ehnqBxoaYyWFWaP
 qyPllflln6J3UEY=
X-Google-Smtp-Source: AGHT+IFJN2idfeKviFAXxT0FMTPm4iA4ABO72SDLoUa4IX8M3gdwMQpklCgVqavU1tPGVp+KVL34Dg==
X-Received: by 2002:a05:600c:1d1d:b0:430:57e8:3c7e with SMTP id
 5b1f17b1804b1-439601c5066mr46025755e9.28.1739460417641; 
 Thu, 13 Feb 2025 07:26:57 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4394dc48d9dsm44747855e9.0.2025.02.13.07.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 07:26:56 -0800 (PST)
Date: Thu, 13 Feb 2025 16:26:54 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/13] drm/vkms: Allow to configure multiple CRTCs
Message-ID: <Z64PPk5At0JGB4Xp@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-9-jose.exposito89@gmail.com>
 <Z5uDJFHnn1HzWOz4@louis-chauvet-laptop> <Z6sqFdvtwSxHD-FO@fedora>
 <2466f201-2d2b-4626-a359-50f58c873c2c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2466f201-2d2b-4626-a359-50f58c873c2c@bootlin.com>
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

Hey Louis,

On Wed, Feb 12, 2025 at 03:12:13PM +0100, Louis Chauvet wrote:
> 
> 
> Le 11/02/2025 à 11:44, José Expósito a écrit :
> > On Thu, Jan 30, 2025 at 02:48:20PM +0100, Louis Chauvet wrote:
> > > On 29/01/25 - 12:00, José Expósito wrote:
> > > > Add a list of CRTCs to vkms_config and helper functions to add and
> > > > remove as many CRTCs as wanted.
> > > > 
> > > > For backwards compatibility, add one CRTC to the default configuration.
> > > > 
> > > > A future patch will allow to attach planes and CRTCs, but for the
> > > > moment there are no changes in the way the output is configured.
> > > > 
> > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > 
> > > Co-developped-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > > 
> > > [...]
> > > 
> > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > @@ -181,7 +181,8 @@ static int vkms_create(struct vkms_config *config)
> > > >   		goto out_devres;
> > > >   	}
> > > > -	ret = drm_vblank_init(&vkms_device->drm, 1);
> > > > +	ret = drm_vblank_init(&vkms_device->drm,
> > > > +			      vkms_config_get_num_crtcs(config));
> > > 
> > > At this point we only create one crtc, can you move this change in the
> > > commit where you create multiple crtc?
> > 
> > Since the code to add more than one CRTCs is unused but technically present, I
> > think that this is the right patch to use this function.
> 
> I don't totally agree: you can create multiple vkms_config_crtc, but the
> code only creates one drm_crtc.
> 
> For me it is more logical to keep 1 here, as the rest of the code only
> creates one CRTC. With the next patch, the code will create more than one
> CRTC, so it makes sense to use vkms_config_get_num_crtcs.
> 
> It is not a strong blocking point, but if a v3 is needed, could you change
> it?

Fair enough, moved to the next patch in my local branch.

I'll send it in v3.

Jose

> > Anyway, at the moment it'll always return 1, so it is a no-op.
> 
> The current user is only default_config, so yes I agree, it is always 1.
> 
> > I didn't change it in v2, let me know if it works for you.
> > 
> > Thanks,
> > Jose
> > 
> > > >   	if (ret) {
> > > >   		DRM_ERROR("Failed to vblank\n");
> > > >   		goto out_devres;
> > > > -- 
> > > > 2.48.1
> > > > 
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
