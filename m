Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85507C57E5E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5E210E824;
	Thu, 13 Nov 2025 14:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U5v1PGXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA4D10E824
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:21:48 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-42b427cda88so620665f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763043707; x=1763648507; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=we6ktqHl8CIb+a6ejDPrewCJowKT1E/8mfmEjuw9yCE=;
 b=U5v1PGXJ5Dralwmg/ey7tCS0GZFIbOvcvacUwHvDvf9U+/8VZHzo+boc0Wc50DaQdp
 I6KMStHd+ClrCj6aPf8TLaJ/H650RdRIDJRnBlLXn88vGFFmSIECocj2YD6hpM8j97Wb
 gWK5aK4f+Xz6DUtwQdbhJgi6cMWA0U1YC/u5/QjgTcSSRt73myCrlcX/7iNfUJvEBtxB
 pud3va4j0oUdNqjNZMUvH91JYUZfmB+6oV3qcMFd2z4iKd/RXN9FT1E2QTSyXapqvUwv
 rZ6oEGop3wo0T8m/vUnun9sZ6nMARc/grUrIYfNx6IxWcLJia8w0VXX+XRL9oLUlcYUt
 jD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763043707; x=1763648507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=we6ktqHl8CIb+a6ejDPrewCJowKT1E/8mfmEjuw9yCE=;
 b=omgpVbkOeslVToFp2mCLr8VJQklOkKLfdOWx/pg3z2JiURzkJX1gSfldYrH585uqnx
 dTN+7DN1/eQBHSwwvZDoCfOtRvv5GqjPiBYcBAc3YhdEj85VQ9VPIVcoTV3Q/sUIhTAK
 uc9Ek7mE/bPxZJPyGs6QGnyH+YRvn+fdIn2Yeh3wzmV8uozC+bQU2VOIlmcDSMnr+XoN
 EAUoJBK5UzB+cvA1hpu4lwHTS+sTh5BegNNR18YU8/GqlucBLoE+D+FbbCsoQehWDMAI
 +zrrEIZOme7fn8dXKHdh3dcBMRpoSqgSU2Tf2u1okd251i8/yK6Ym3Zjur6YhkO7NNWN
 Rx1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnRrdTQAC0DjpCPE36OvnfOQ0JX24BWuJcVE31XeB0uAIbTSGQDJ6jXwV7atDuU3frcfHqIr+K1mg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoR0MDNhR6Ce4gl5/5uFpkZwJu3mfg6j4Ktd5ZNxRxFmOHSW0D
 cts36Te3prS1RLCDe2oNNvjQMxyVvAiqx4HUTJVT7Hi/FAE+GlxjITHo
X-Gm-Gg: ASbGncsc45bycu59BICl3V9YZYo7uF/J6N2IrEteCjwLigqD/TB/vqIE0VHhjtnWn/V
 W3Hte1+TsvEpK7Z9p9bok3GUzmT6neDWd5DIaUZMJ5sjiVEHsZ89QZEuvaSkkZifgrAFEavdUNK
 AEQxhAnRxX+T2tiglolE4DJvOWYfd/vHXCGz3QAKO6qPigNaZdWS3zhrTqH9/h9dIbLb9/DL2GF
 SCya0j4f9e705cihz+kmUPKHy63l6WipBhP6ju6KoLhTvb2s60HYwYqaZWge1O34uzkITxCRe6s
 OuZq9O83JDGMF9m6TNkmR4ruPaLgCErl4omuyZWOrbxvvL9O12fzagnX4NMtlXxiEniZ7Vj0J2X
 uugnJ2NGKxGvQzwFRNcEQE3fhQ5PgY+S1K1uG1SnIgC1Cyr6MAV1ReO8oqu9QaNpVuQF/rW75wA
 ==
X-Google-Smtp-Source: AGHT+IGldfDXCrb7BH7hy572KrLOiAR1Lp75or0+sxa276AqeqbFud8+BeO55XZxpLa7Ug0Up1nVpw==
X-Received: by 2002:a05:6000:40cd:b0:42b:4803:75e8 with SMTP id
 ffacd0b85a97d-42b4bdb44c0mr4800835f8f.43.1763043706616; 
 Thu, 13 Nov 2025 06:21:46 -0800 (PST)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f21948sm4239920f8f.43.2025.11.13.06.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:21:46 -0800 (PST)
Date: Thu, 13 Nov 2025 15:21:44 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RESEND v2 06/32] drm/vkms: Introduce configfs for plane
 name
Message-ID: <aRXpeE2fCRj4uyBY@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-6-a49a2d4cba26@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-vkms-all-config-v2-6-a49a2d4cba26@bootlin.com>
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

On Wed, Oct 29, 2025 at 03:36:43PM +0100, Louis Chauvet wrote:
> Planes can have name, create a plane attribute to configure it. Currently
> plane name is mainly used in logs.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst           |  3 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 3574e01b928d..1fe6e420c963 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,10 +87,11 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 1 configurable attribute:
> +Planes have 2 configurable attributes:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> +- name: Name of the plane

I'd like to mention again my comment on limiting the name to a set of
well-known characters [1].

The reason is that, in libinput, we had a format string vulnerability
due to the kernel exposing devices with names containing strings like
"%s" in the name (CVE-2022-1215):
https://gitlab.freedesktop.org/libinput/libinput/-/issues/752

In my opinion, we should avoid surprising user-space too much and allow
only a set of "safe" characters.

Maybe I'm too cautious, as this is valid code, but I'd like to bring up
the discussion again to see if someone else agrees or disagrees.

[1] https://lore.kernel.org/all/aPtgCUX5kixTh2ua@fedora/
  
>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 07ab794e1052..be6c3ba998b9 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -322,10 +322,42 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
>  	return (ssize_t)count;
>  }
>  
> +static ssize_t plane_name_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	const char *name;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		name = vkms_config_plane_get_name(plane->config);
> +
> +	return sprintf(page, "%s\n", name);
> +}
> +
> +static ssize_t plane_name_store(struct config_item *item, const char *page,
> +				size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		if (plane->dev->enabled)
> +			return -EBUSY;
> +
> +		vkms_config_plane_set_name(plane->config, page);
> +	}
> +
> +	return (ssize_t)count;
> +}
> +
>  CONFIGFS_ATTR(plane_, type);
> +CONFIGFS_ATTR(plane_, name);
>  
>  static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
> +	&plane_attr_name,
>  	NULL,
>  };
>  
> 
> -- 
> 2.51.0
> 
