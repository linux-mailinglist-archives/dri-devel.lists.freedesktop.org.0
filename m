Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABD3A3BFC7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C15010E2F6;
	Wed, 19 Feb 2025 13:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="g7bo0ZYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD6710E2F6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:25:03 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-38f2cb1ba55so4202054f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739971502; x=1740576302; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8iG/fqmBFTqqJwFASf3T8KEK+JxvvaWHo7YdHpjwpt8=;
 b=g7bo0ZYGDwv+J4h+Gjdk6BoG4U2ifJIZoTNo1B+JnJu4VMYEC6GmUU7RvNY++fPTWy
 rplRhjUyW0EP1eQsUCXi4wCTNnSl2A4j7O6Fp5zrGb3xI8zhP5/NSyCIV11UyLieGJ/M
 /5XjInOHJ60Fx1QXglAhZ4hpPrAl7HncC5LGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739971502; x=1740576302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8iG/fqmBFTqqJwFASf3T8KEK+JxvvaWHo7YdHpjwpt8=;
 b=N7XzhR62fuBwO0KmQHTYD5nw00pRyoo5SH/CaPn33UUlbryqFmVUBGxhED2oxurH+S
 x87rbme0CN0A4e96OwBsNA4PiCXx6wTr7u5QqjHcmS7JaxQeS45KcRtFK4FHrg+vm0io
 gJSgYyJUp8VOrzr0D/vIO3y1eizXkeCbmQgg07tninTSbdZjyGgJRIvG9c+zv4v1n39+
 pKUcC8/41Qo5glyOgkxcIJudqVrPLVQck0WNN3hvktZ7HtiDYykT/fhz0l5dBeOVGYq2
 XR33NuNCbKfJWp70B911BMaCifxoOWABEczxxqR9x4tcUARyH2rp6UGIXF13rszSoE/q
 Z+hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9B4fKbfUie600EHISDp03iD4QuHEjutSdsnohAnHJcpIgQwMVRH10tZDpmUk+dqgo7HfZGBshEJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBJjE4tuFYpkerrbbbXNFrHHxDEyOp2+Bnzt+RDJRqKRdfMWEz
 fmx3iGVnyI9OwEFpT+ihibxAgGEJA3acL5xPyHrszYsf2il45xXWZW6u6IhMIdo=
X-Gm-Gg: ASbGnctyC19zAVT4ji5O+33L3ZBnJzXaPVCAsf0OrtKYPJrXYOCOVj4DsHvo/k8+yv/
 Q28Mkkr4BJRe800F47hcsTyOhzkhPLdnUCOtdsWRDxA6WB518CBgjM7yBaPiKvBKFVXhSWduEoa
 Su2XY9BBbefmY8E1EFMIsFnLoBiNPrZpFgQHpJE9tvUCIrw2B6eVWMI9U6szSgXCrhTohfNx+j7
 8YaqZi29hGt1ouce3gaE50nHlSn9y/0W/soE2RnYNyiUZDQ8jO+fMvZ4DxeF9IosOvJa/tmhd4d
 X6r9BdeYDcJo7H+VwtHQ+tU+QzE=
X-Google-Smtp-Source: AGHT+IEox4ZqUHFiOC3/A4WizZnNGy/FZoJa5/z9gjKcBTvJzOboshGsrsIqVqonyZ6bdo8wUrVQ6g==
X-Received: by 2002:a05:6000:1a86:b0:38f:2ddd:a1bb with SMTP id
 ffacd0b85a97d-38f587813a0mr2989557f8f.8.1739971502046; 
 Wed, 19 Feb 2025 05:25:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ccd3bsm17880386f8f.22.2025.02.19.05.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:25:01 -0800 (PST)
Date: Wed, 19 Feb 2025 14:24:59 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/doc: Document KUnit expectations
Message-ID: <Z7Xbq-P0RTttJfz-@phenom.ffwll.local>
References: <20250113101100.1373856-1-mripard@kernel.org>
 <87v7t6paks.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7t6paks.fsf@minerva.mail-host-address-is-not-set>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Wed, Feb 19, 2025 at 10:06:59AM +0100, Javier Martinez Canillas wrote:
> Maxime Ripard <mripard@kernel.org> writes:
> 
> > The DRM and KMS frameworks and helpers gain more and more kunit
> > coverage, so let's document what our expectations are.
> >
> > Suggested-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >
> > ---
> >
> 
> Seems a reasonable expection to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

I think some more acks from folks working on Kunit tests would be great,
but that aside I think this accurately summarizes the discussion we had a
while back.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
