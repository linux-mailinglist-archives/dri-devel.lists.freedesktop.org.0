Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0FA3CC4F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 23:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3CE10E07B;
	Wed, 19 Feb 2025 22:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="TK2X9elk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 333 seconds by postgrey-1.36 at gabe;
 Wed, 19 Feb 2025 22:30:01 UTC
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3E610E07B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 22:30:01 +0000 (UTC)
Date: Wed, 19 Feb 2025 17:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1740003863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xMfsg5DjP984vJzEzWbqHu3ycxE0CABCHHT+osJG0mk=;
 b=TK2X9elkDpBOX2YBfg+uMrNqyNts+X52y/QzniWg6JrzyvxeB3lIghOKBC1qm3NO/V+Djq
 /R1QXFACzF0ZBIX/Z4Weo5OMEkM7eBO8Vq9LfhNR9imUxpyLtHbyGDKX3ZLOWg+3pvnIhq
 X0KdTnNfV8ROGPRIH/XbxQ4eiqXaYJAmlZdd4bAI0tfouQ1maFmmYYXVaNuTwtSkjbK6cr
 bQacqsXOXV3U1t6Wq2LoJeZ82OQfWJOXACcuQceK5fJDju9+scnC6AQQeqLsrhrocZTnLv
 oGoSTVen0Z+4DW+W3phMKxsbT9WBqwVrvCbq2QRHnr92mUF0CSjRTSUkPITBLA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Janne Grunau <j@jannau.net>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject: Re: [PATCH] drm: add modifiers for Apple twiddled layouts
Message-ID: <Z7ZaC9d_AyIe07n5@blossom>
References: <20250218-apple-twiddled-modifiers-v1-1-8551bab4321f@rosenzweig.io>
 <20250219214224.GB57799@robin.jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219214224.GB57799@robin.jannau.net>
X-Migadu-Flow: FLOW_OUT
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

> > +/*
> > + * Apple twiddled and compressed layout.
> > + *
> > + * This is the main lossless image compression layout supported by Apple GPUs.
> > + *
> > + * The image is divided into tiles that are internally twiddled.  In addition to
> 
> Does the compressed format uses the same the sime tile sizes (in pixel
> dimensions) and layout as DRM_FORMAT_MOD_APPLE_TWIDDLED? I'd assume so
> but I think it's worth stating explictly.

It does. I'll reword to make that more clear.
