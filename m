Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDE4A34739
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333EF10E055;
	Thu, 13 Feb 2025 15:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hqBghxN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E21410E055
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:32:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43937cf2131so7296165e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 07:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739460777; x=1740065577; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MfLc32cRf3eetQpPP5I7Ug+lhC4HSsOzdCRi3IPd+cY=;
 b=hqBghxN0dXxX1W++lcCKNSZA0Q2jJXVokcEA/5etvJLRTfCDPpzD6FMvzM7UG5/fsI
 0q9YtqhkfU6z6SUj1VmPZcN3Tlk/QCYBtTv5CVC1686dNAs7xZuDUBDd66agHhcRJDbM
 1/7rDnzQCT2HFDv9cVEmVkOqeR9+gCxLyv1IW0pf6NizCFShDa46bVY/BFKLqmL/r5Ha
 po2Dq+NLEbUPxcm4oiaVApYx7OBVA//VV6sHEcFjtskS2or57MEf1q+jkAIspDYDxYWF
 /Kp8CrWeYcWf67aqhMrUm00kCrYlXFAhwOu5pOAcZuJd82qG76d3VCOewP48mqYjJyXw
 zQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739460777; x=1740065577;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MfLc32cRf3eetQpPP5I7Ug+lhC4HSsOzdCRi3IPd+cY=;
 b=dMuCrWXw13u3wWXnW2pnBEiqJC6m+SQWTxGSVhC2OwKg0kQTB6plLJC1GfWfW3UnSE
 IIuTc9Gm1grpkqyAuz57XbgByEf+t+6vmiLXHAQbtF4tFz+7lqbvc4fQ2B/2YpH4IIMb
 rJNtwjLPEMYxtCj/ISvub2M5O9ZS0WUMpRixjZtioZYc91dX4zaZjJrlak6t6mG/t5p1
 oDyBMWr5xVHd9qBBxn8CM1rr5b7RGypePDD/1PGb8WIXOM5Vvbej3dahF+ZsaPSFENCO
 d3EKrhdUiiDZzkAjJoZXVUBNx8G5c9cKzKhDsdQaNughsIG0IB9NUyzbhjG9qLiKikhn
 Wi+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6/iflPZ1eGgu6JrZALTPzgZLvbhvydDPZVpJo7MmVpDFRhl3T6NxczK/KA+Da4DAUNXexrviOMIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLOG8BYfpLn5jrf4KERU7vKiiGspGgRvC6pjunDG/DZzu/MyTw
 qIXKr8vIwkZ0P0JbljbGrYsl2gleqKCRDOHJOLNqY0CA/mAgyqe2
X-Gm-Gg: ASbGnctblxxbCnfOoNy4w/ss8Wl5joXRVX2GjTWS9CZbG3Ccvol3EFtqFJw//Ci/RFy
 +2MIpguOL7BhEZl2DVu8VE+C/jY2UujCdGOrd+3Ni4AsS4tl/e0GFlvLj05BAtta79/nPgbXKK8
 hVLijnNqAcJO95Ak9kqYxxcxHVE7VTUXbGJDRnfDXhv7qNg7dOvKdnf9rezsbeP0zyfVjEzn18e
 4jQVqAUpfI7EF8/VJ156HKsK71OY9yARSLT0XjATOj9p5e0kMJZi3xdpEQSHqbxflPedHhZVG/8
 cWhBw47kHPJTdxs=
X-Google-Smtp-Source: AGHT+IFlrVjfyCynKmQHnjJcSFdCu8zrg+P3t2BTmUgSmBdpMC/9LI9CKtj1SkjQ1nL3tla2lBW9fQ==
X-Received: by 2002:a05:6000:402c:b0:38b:d7c3:3768 with SMTP id
 ffacd0b85a97d-38dea3cfaabmr7191145f8f.12.1739460777196; 
 Thu, 13 Feb 2025 07:32:57 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5eeesm2200468f8f.63.2025.02.13.07.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 07:32:56 -0800 (PST)
Date: Thu, 13 Feb 2025 16:32:54 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/13] drm/vkms: Allow to attach planes and CRTCs
Message-ID: <Z64QpktpcVjtelKY@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-10-jose.exposito89@gmail.com>
 <Z5uDJd4iV9Vnrp9e@louis-chauvet-laptop> <Z6sq0h0lKxjmBcxk@fedora>
 <b05831de-c67b-4ba9-8808-f049d97b3654@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b05831de-c67b-4ba9-8808-f049d97b3654@bootlin.com>
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

On Wed, Feb 12, 2025 at 03:10:49PM +0100, Louis Chauvet wrote:
> 
> 
> Le 11/02/2025 à 11:47, José Expósito a écrit :
> > On Thu, Jan 30, 2025 at 02:48:21PM +0100, Louis Chauvet wrote:
> > > On 29/01/25 - 12:00, José Expósito wrote:
> > > > Add a list of possible CRTCs to the plane configuration and helpers to
> > > > attach, detach and get the primary and cursor planes attached to a CRTC.
> > > > 
> > > > Now that the default configuration has its planes and CRTC correctly
> > > > attached, configure the output following the configuration.
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
> > > > +int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *plane_cfg,
> > > > +					       struct vkms_config_crtc *crtc_cfg)
> > > > +{
> > > > +	struct vkms_config_crtc *possible_crtc;
> > > > +	unsigned long idx = 0;
> > > > +	u32 crtc_idx = 0;
> > > > +
> > > > +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
> > > > +		if (possible_crtc == crtc_cfg)
> > > > +			return -EINVAL;
> > > 
> > > Is it really an error? After this call, we expect plane and crtc to be
> > > attached, so if the plane is already attached, I don't see any issue.
> > 
> > In my opinion, this could be either handled as an error or not. I think that
> > there are arguments for both approaches but, for our use case, I think that it
> > is better to return an error.
> > 
> > Since the main (and for the moment only) user of this function will be configfs,
> > it is very convenient to return an error to avoid creating 2 links between
> > plane <-> crtc.
> > 
> > If we allow to create multiple links, and the user deletes one of them, the
> > items would be still linked, which is a bit unexpected.
> > 
> > The same applies to the other vkms_config_*_attach_* functions.
> 
> I see your reasoning, I did not think about this issue.
> We can keep the error, but can we use `EEXIST` to reflect better the status?

Very good point, I'll change it to EEXIST in v3.
 
> And I just think about it, maybe we can add here the check "is the crtc part
> of the same config as the plane" (and return EINVAL if not)? It will remove
> the need to do the check in configFS + avoid errors for future users of
> vkms_config.

Another excellent point. Since we can not use the vkms_config_plane.plane and
vkms_config_crtc.crtc pointers to check if they belong to the same device, the
only solution I see is adding a pointer to the parent vkms_config to every
structure (vkms_config_plane, vkms_config_crtc, etc).

In this way we can do something like:

  if (plane_cfg->config != crtc_cfg->config)
          return -EINVAL;

I tried with container_of(), but I don't think it'll work with the current data
structure.

Unless you can think of a better solution, I'll implement this in v3.

Thanks for the great comments,
Jose

> > For these reasons, I didn't change it in v2, let me know your opinion.
> > Jose
> > 
> > > > +	}
> > > > +
> > > > +	return xa_alloc(&plane_cfg->possible_crtcs, &crtc_idx, crtc_cfg,
> > > > +			xa_limit_32b, GFP_KERNEL);
> > > > +}
> > > > +
> > > 
> > > [...]
> > > 
> > > > +struct vkms_config_crtc **vkms_config_plane_get_possible_crtcs(struct vkms_config_plane *plane_cfg,
> > > > +							       size_t *out_length)
> > > > +{
> > > > +	struct vkms_config_crtc **array;
> > > > +	struct vkms_config_crtc *possible_crtc;
> > > > +	unsigned long idx;
> > > > +	size_t length = 0;
> > > > +	int n = 0;
> > > > +
> > > > +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc)
> > > > +		length++;
> > > > +
> > > > +	if (length == 0) {
> > > > +		*out_length = length;
> > > > +		return NULL;
> > > > +	}
> > > > +
> > > > +	array = kmalloc_array(length, sizeof(*array), GFP_KERNEL);
> > > > +	if (!array)
> > > > +		return ERR_PTR(-ENOMEM);
> > > > +
> > > > +	xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
> > > > +		array[n] = possible_crtc;
> > > > +		n++;
> > > > +	}
> > > > +
> > > > +	*out_length = length;
> > > > +	return array;
> > > > +}
> > > 
> > > Same as before, can we use an iterator?
> > > 
> > > > +static struct vkms_config_plane *vkms_config_crtc_get_plane(const struct vkms_config *config,
> > > > +							    struct vkms_config_crtc *crtc_cfg,
> > > > +							    enum drm_plane_type type)
> > > 
> > > Even if this is a private function, can we add a comment explaning that
> > > the returned value is only one of the available planes of this type?
> > > 
> > > 	/**
> > > 	 * vkms_config_crtc_get_plane() - Get the first attached plane
> > >           * found of a specific type
> > > 	 * @config: configuration containing the crtc and the planes
> > > 	 * @crtc_cfg: Only find planes attached to this CRTC
> > > 	 * @type: Plane type to search
> > > 	 *
> > > 	 * Returns:
> > > 	 * The first plane found attached to @crtc_cfg with the type
> > > 	 * @type.
> > > 	 */
> > > 
> > > > +{
> > > > +	struct vkms_config_plane *plane_cfg;
> > > > +	struct vkms_config_crtc *possible_crtc;
> > > > +	enum drm_plane_type current_type;
> > > > +	unsigned long idx;
> > > > +
> > > > +	list_for_each_entry(plane_cfg, &config->planes, link) {
> > > > +		current_type = vkms_config_plane_get_type(plane_cfg);
> > > > +
> > > > +		xa_for_each(&plane_cfg->possible_crtcs, idx, possible_crtc) {
> > > > +			if (possible_crtc == crtc_cfg && current_type == type)
> > > > +				return plane_cfg;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	return NULL;
> > > > +}
> > > 
> > > [...]
> > > 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> > > 
> > > [...]
> > > 
> > > > +/**
> > > > + * vkms_config_crtc_primary_plane() - Return the primary plane for a CRTC
> > > > + * @config: Configuration containing the CRTC
> > > > + * @crtc_config: Target CRTC
> > > > + *
> > > > + * Returns:
> > > > + * The primary plane or NULL if none is assigned yet.
> > > > + */
> > > 
> > > Same as above, can you speficy that it is one of the primary plane?
> > > 
> > > > +struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_config *config,
> > > > +							 struct vkms_config_crtc *crtc_cfg);
> > > > +
> > > > +/**
> > > > + * vkms_config_crtc_cursor_plane() - Return the cursor plane for a CRTC
> > > 
> > > Ditto
> > > 
> > > [...]
> > > 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > > 
> > > [...]
> > > 
> > > > @@ -35,19 +41,54 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> > > >   			ret = PTR_ERR(plane_cfg->plane);
> > > >   			goto err_free;
> > > >   		}
> > > > +	}
> > > > +
> > > > +	for (n = 0; n < n_crtcs; n++) {
> > > > +		struct vkms_config_crtc *crtc_cfg;
> > > > +		struct vkms_config_plane *primary, *cursor;
> > > > +
> > > > +		crtc_cfg = crtc_cfgs[n];
> > > > +		primary = vkms_config_crtc_primary_plane(vkmsdev->config, crtc_cfg);
> > > > +		cursor = vkms_config_crtc_cursor_plane(vkmsdev->config, crtc_cfg);
> > > 
> > > Linked with a previous comment: here we have no garantee that primary is a
> > > valid pointer, can we check it or call vkms_config_is_valid to ensure it?
> > > 
> > > > +		crtc_cfg->crtc = vkms_crtc_init(dev, &primary->plane->base,
> > > > +						cursor ? &cursor->plane->base : NULL);
> > > > +		if (IS_ERR(crtc_cfg->crtc)) {
> > > > +			DRM_ERROR("Failed to allocate CRTC\n");
> > > > +			ret = PTR_ERR(crtc_cfg->crtc);
> > > > +			goto err_free;
> > > > +		}
> > > 
> > > [...]
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
