Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9086A3624D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565A710E347;
	Fri, 14 Feb 2025 15:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GYujDMaR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99E210E347
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 15:53:15 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4396740abe9so6372705e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 07:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739548394; x=1740153194; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LUeXql4TWDHCjVh3ewbV3baFX6FxknoLfQ1URmQIH8w=;
 b=GYujDMaRKD7Ozv39fes/39ctl4AM8yxxW7laIeRA7NjbgiHTWSqCCcLv+GzCnJhWfF
 pvHPc90gqusNtDvEsFI2rRiGys3mx2Vu3tu+54d9enj19KsExH2QirP6mT/388k39sVY
 WFnCKFgaJ9eSnb1e6ww/HKaOpWxVE++Y4Wv+Aj1/l5aC6+l9NKOfmVamAUA0yflGhOIl
 zBO9OvueBrxLRpg/84k90ZEYQanbLUHIRiXY8erab3j3LV1AzaSnQbSsOUbs2+f2CivL
 xbD0Pl9zUM16ItkkX2VqNobboacitJqW7RsDbJ+az2mbC7Bvgp3PgF3T/0V2hUU7Zfqp
 6g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739548394; x=1740153194;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LUeXql4TWDHCjVh3ewbV3baFX6FxknoLfQ1URmQIH8w=;
 b=Hb21T5WKMfnyGFNevOt6LKLAVWn9dUjoq5rEy6vhMDgOPtZKNCukQ43ciK6YewM6o7
 em+8EdfRCr7/KGl7qjpHg/vcwfAHUpev1teKbkzl2lKlOwqhzXL7B5b1d2KQ0bftSSEN
 DQ19aF+F2oW4kDvrk+a43GNVa0dq3P2bLGwn+jZHkoVQu/L2zDVKvxkOAoxmug7QG6sP
 bEEdHqR/2HIKdXITs/4thBPmyh8QLJHLMdBR+DZvuun8Ytu/gtfw6chd0aaihLC3bUvv
 Ue0oeQbAmvTqgzjRLjn8WcfVPXujnYS/PjCiefrlmKn5lO3DNXjPLztBp3WbZeaH2DN2
 BEIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKapW3XitWhnomD2zLSHU4Klq5DQxlGF+j4NfzYCznTc+9O+TgO4fWcGUb6y9io1WcVQeK4Bn3SYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIZKKZOaJfJ0qUGcP92kMCE4pcME6GnjJks38Rz1HQfvey8phJ
 oZa9pTFpQqYx7UxqFG/Agt6V98MaGijMXbQlPOI/U1Hu2Tn3HpN6
X-Gm-Gg: ASbGncv7OOneSSjQKYvLbRwOQBE5qVn/gcvDTqOAN1M05InW5ACC5cNFNrYJxj9r3El
 3midc8pFdSQ9TUGIyDUpfxC7slp6jqEAl5JA3KmSxxZOMNPPWiQcwn4F+IDXxYMXV1EoGOhUoQG
 7yxWXuvFFCjWfdzR0dmi59Uiq6sthXN2Mae0hr3PvzyNzzWNQlUxHzDO1NArOcvURLMBTt3MGgT
 8XAKb6dDjd29oox/jDI1STcAz9lGv5/+6TnYfIyB1r3A80pbPY9RWTV8WuAdktBOTALbVvqn61Q
 Sc01uV40u9XRnvA=
X-Google-Smtp-Source: AGHT+IG0lJQY6xjpwwK0gCbW2yA9JBNFByk5LNr2enf7zbh05eh9v7dpT+s+DVjyajrRMWDBxnwtyQ==
X-Received: by 2002:a05:600c:501f:b0:439:5560:c9a3 with SMTP id
 5b1f17b1804b1-43960169713mr107862715e9.6.1739548393929; 
 Fri, 14 Feb 2025 07:53:13 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06c95bsm77848905e9.17.2025.02.14.07.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 07:53:13 -0800 (PST)
Date: Fri, 14 Feb 2025 16:53:11 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/15] drm/vkms: Add a validation function for VKMS
 configuration
Message-ID: <Z69m50L8NzcYt45j@fedora>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
 <20250211110912.15409-9-jose.exposito89@gmail.com>
 <Z6362KrzjLUL6Mj6@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6362KrzjLUL6Mj6@louis-chauvet-laptop>
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

On Thu, Feb 13, 2025 at 02:59:52PM +0100, Louis Chauvet wrote:
> On 11/02/25 - 12:09, José Expósito wrote:
> > From: Louis Chauvet <louis.chauvet@bootlin.com>
> > 
> > As the configuration will be used by userspace, add a validator to avoid
> > creating a broken DRM device.
> > 
> > For the moment, the function always returns true, but rules will be
> > added in future patches.
> > 
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Co-developed-by: José Expósito <jose.exposito89@gmail.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> The compilation is broken when building as module:
> 
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index b9267aef4804..82335006c94a 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -55,6 +55,7 @@ bool vkms_config_is_valid(struct vkms_config *config)
>  {
>         return true;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(vkms_config_is_valid);

Fixed the issue in all patches, thanks!
 
> > [...]
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> > index fcaa909fb2e0..0376dceaf6be 100644
> > --- a/drivers/gpu/drm/vkms/vkms_config.h
> > +++ b/drivers/gpu/drm/vkms/vkms_config.h
> > @@ -67,6 +67,16 @@ vkms_config_get_device_name(struct vkms_config *config)
> >  	return config->dev_name;
> >  }
> >  
> > +/**
> > + * vkms_config_is_valid() - Validate a configuration
> > + * @config: Configuration to validate
> > + *
> > + * Returns:
> > + * Whether the configuration is valid or not.
> > + * For example, a configuration without primary planes is not valid.
> > + */
> > +bool vkms_config_is_valid(struct vkms_config *config);
> > +
> 
> I think here we can take a const pointer.
> 
> >  /**
> >   * vkms_config_register_debugfs() - Register a debugfs file to show the device's
> >   * configuration
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index a74a7fc3a056..95afc39ce985 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -204,7 +204,7 @@ struct vkms_config;
> >  struct vkms_device {
> >  	struct drm_device drm;
> >  	struct platform_device *platform;
> > -	const struct vkms_config *config;
> > +	struct vkms_config *config;
> 
> So we can keep a const pointer here (for me the device should never modify 
> vkms_config)

I tryed keeping the const pointer, but, since list_count_nodes() is used in
several valid_* functions and it takes a non-const pointer, it causes
warnings.

We can fix them with a cast:

  n_planes = list_count_nodes((struct list_head *)&config->planes);

But I feel that keeping the "const" creates more issues than it solves.

Anyway, if you prefer this pointer to be const, I will change it in v3.

Jose
 
> >  };
> >  
> >  /*
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > index 068a7f87ecec..414cc933af41 100644
> > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > @@ -16,6 +16,9 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> >  	int writeback;
> >  	unsigned int n;
> >  
> > +	if (!vkms_config_is_valid(vkmsdev->config))
> > +		return -EINVAL;
> > +
> >  	/*
> >  	 * Initialize used plane. One primary plane is required to perform the composition.
> >  	 *
> > -- 
> > 2.48.1
> > 
