Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149ABA4B969
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC2710E373;
	Mon,  3 Mar 2025 08:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hVal6jx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01AF10E373
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:33:43 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-390eebcc331so1421263f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740990822; x=1741595622; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bT1LQfCLCGwFX0qetA3ELWVouvB3S1JZXxghCyOJvvU=;
 b=hVal6jx36P42tXvYh8YH3PZGM88vbNvlqft2muMydYKEhbz/fpq+iFDIaPoc8Exy/S
 OhE+q8poLav02sQORJ/Qlfub6XfqUejH3PSC5zYsIMkR30LjquHdgguxf1pqocC/o22E
 Slie2l+CyF7kEGtapHcHB9+K01ERv8YlpzKNoy667s6qGskDSi8MEWj2VZpXraVJyFmu
 lxqPuaAdnJiQKyKKs1W8GomnzK6D3WVEBOMrJ1ds1kLI89Rnnh8jDn/iHvIHtYx3KVOa
 LlJKe7cz8+po0nPESVsOf2/09qPoI7/3ZgYnNblryFsvtA27G4wLmSSV4/PWKtL62Y/q
 J0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740990822; x=1741595622;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bT1LQfCLCGwFX0qetA3ELWVouvB3S1JZXxghCyOJvvU=;
 b=CG91wk43E0kKaTCAhg6aXxzIDAufdov4Q03RfC2q7BC5GFRFIU5XHlxpWoDujmSMON
 9YlhyC5SvHkkeI60cfd0yzV0I+AT8dO4IJSOKgHPxSk9aDADi5OvceTmdqj25PmiSPJX
 TM+dnXsKyPLLT7RIXGcn1acFQ2+B6y372dCYRYMmNAEx0pW/xQdQqdEEPxKUS/mmgfdk
 MenYAXDZI80YaY5efhvYGdnvpFCT9PYzJKPhItWwbguxRESBAcG/rXt0hBfWi72U+euv
 qWRkxroYFlh1PtQxJ0TBZD4a2Y19LsBhVrKiKXIGb7KCUGsLwJVdOBs3lC7bddSInRoE
 r2YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4j2bYQLPWYL3KhWPirwqP6HZUA3STOeHYnREOjfSPZRIpL7865bhdXbssLsFAeuZr9ZBA9i0TlAs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz70eIeJZADf/g8KZCUI6R8qIR6bFR5LZl9TFdrmuD0Ii5TcluG
 FMwhxlXFLzIttc7izLtuyOb9vlKtbAPq99uFMESttsjOEvV6V0yA
X-Gm-Gg: ASbGnctg8OZKbwiJzWPegdPSt8DCbJbjzMnfuMmpzLvHXIcOaLZR7rzqitIaQHxmajt
 N4CZerao2VMlZItQpoK6mQLQyLKkk+gco09F+d9Qu5U2Mx+mvy89K93blYbJcHeWlJy446wZwvX
 JOStxk0hdlhCzFbCl62x4zugKbe08QIkha2uGU2qE/rbKQRS//x1yjUrYHHZ+PWkaWOhdOaxSJ+
 7wppQRLfhTMbFZAsdl8LUaRQHp5pK8E9BaLhy4cJ8pNtJG+NvAS7eGbH9+9R+Ei9xRkg7QR+X9i
 sVJTXxquoA/zLz8moQ6lceXgWyG6md1Ff+iUrV/00E3f
X-Google-Smtp-Source: AGHT+IGoyhMpApGxBbybGU+2w7DqVmAprIREr2pjwLAwSYV8ty0wbFF8bOrHY9ajuwHbykFmytcwag==
X-Received: by 2002:a05:6000:1fa9:b0:391:e1f:4c29 with SMTP id
 ffacd0b85a97d-3910e1f4d09mr1213416f8f.13.1740990822293; 
 Mon, 03 Mar 2025 00:33:42 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b6cd8sm13541473f8f.44.2025.03.03.00.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 00:33:41 -0800 (PST)
Date: Mon, 3 Mar 2025 09:33:40 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/16] drm/vkms: Add and remove VKMS instances via
 configfs
Message-ID: <Z8VpZJLoVq312ONH@fedora>
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
 <20250225175936.7223-3-jose.exposito89@gmail.com>
 <16d2f49f-02f6-44dd-91f2-05b2e5d598da@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16d2f49f-02f6-44dd-91f2-05b2e5d598da@bootlin.com>
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

Hi Louis,

On Fri, Feb 28, 2025 at 04:19:13PM +0100, Louis Chauvet wrote:
> Le 25/02/2025 à 18:59, José Expósito a écrit :
> > Allow to create, enable, disable and destroy VKMS instances using
> > configfs.
> > 
> > For the moment, it is not possible to add pipeline items, so trying to
> > enable the device will fail printing an informative error to the log.
> > 
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > [...]
> > diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> > new file mode 100644
> > index 000000000000..92512d52ddae
> > --- /dev/null
> > +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> > @@ -0,0 +1,169 @@
> > [...]
> > +static ssize_t device_enabled_store(struct config_item *item, const char *page,
> > +				    size_t count)
> > +{
> > +	struct vkms_configfs_device *dev;
> > +	bool enabled;
> > +	int ret = 0;
> > +
> > +	dev = device_item_to_vkms_configfs_device(item);
> > +
> > +	if (kstrtobool(page, &enabled))
> > +		return -EINVAL;
> > +
> > +	guard(mutex)(&dev->lock);
> > +
> > +	if (!dev->enabled && enabled) {
> > +		if (!vkms_config_is_valid(dev->config))
> > +			return -EINVAL;
> > +
> > +		ret = vkms_create(dev->config);
> > +		if (ret)
> > +			return ret;
> > +	} else if (dev->enabled && !enabled) {
> > +		vkms_destroy(dev->config);
> > +	}
> > +
> > +	dev->enabled = enabled;
> 
> Sorry, I was maybe not clear enough, and you may hate me: I don't like
> `guard(mutex)` :‑(. I proposed scoped_guard because it makes very clear when
> the mutex is taken/released.
> 
> For me guard(mutex) is almost the same as mutex_lock/unlock. Yes, your mutex
> is always released, but:
> - without reading the code carefully, you don't know you have a mutex (even
> worse than a mutex_lock because you don't have a bunch of mutex_unlock to
> remind you)
> - you keep it until the end of the function, which may lock your mutex for
> too long
> 
> The scoped_guard solves the two issues:
> - you are in a dedicated block + indentation, so it is very easy to see that
> you currently have a mutex
> - you know exactly when the mutex is released: leaving the block
> 
> I am very sorry to make you work twice on this

It is fine, don't worry :) I'll send v3 using scoped_guard() and addressing
other review comments.

Thanks for your reviews,
Jose
