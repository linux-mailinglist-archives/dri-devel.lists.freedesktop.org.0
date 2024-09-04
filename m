Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FC196B671
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC51189561;
	Wed,  4 Sep 2024 09:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="IxBXpGlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DAA89561
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:23:03 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42c2e50ec6aso2975255e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 02:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725441782; x=1726046582; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qVslFqpuPP+120vssIK6AkWG5dPpY7iEjTvwvHnyW80=;
 b=IxBXpGlIbR3lS9NbbqDBgvRlqtNpyuf0QwLWnoH3h9fL2kE5bHBdUmwfsQZBUIA7Z6
 TCYh7LkqyrzgVLZMAttyPkx8MCaMmEQa2l3VVBM6yJYxL/skNhG9go1SJUVlMeFI7ZcM
 uzPCqzP5iPArQl81QQ9VCdha8mmzVSOfKLILY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725441782; x=1726046582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qVslFqpuPP+120vssIK6AkWG5dPpY7iEjTvwvHnyW80=;
 b=UBgeBUxXPuR3wwZ6JCHLuTaPNZBy7mxukRBmq6l+ClJLjVzLVmsbDhTrwpjmfN/ypv
 bsmR7YvWR3+zFomwA+J43owqMrvnXaN6eJsLuNv2nxVhOwixj5wR9w1WVaByri2jkZOm
 QswF9Rl6JPnbUiY1KquM3V7g0HgVMjtp7QZAT6IgOl1wNtbTFfYuFqSJOgSggYR6ooS7
 6ZANJDDtXsnrUl2859XoH9hrYC/WnUXSk4F1GlwHtYTFoURP0/MwJJAFiq4mPxB8V2j5
 1BJl6aC7m32bYKwnhVr9pqq+Uuwd+19u4DoajOlhMEQkrGfG6lHSEgkAJxuAkFrGWZ9Q
 eq1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU38KPmyGTX9OJJ7cWw1Kg30jL40PuNJuWAsnDZfoOvXST0dxZNMYFKWxQ77lYlMth9S+Pqm1lWsSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/EkCngM4dRc1iIikDW2yJaTh2BOuiLelhUPQGHs1qa6og+F3X
 mDcKAwIj8+87MaxbWUUhRPKvZGA9/XZuYiXjPUmiG5sFYb56IlUhxuygxoQ0xP8=
X-Google-Smtp-Source: AGHT+IGqSU633ylJiMkwwUvqLrTm57cmDl02YuXTUBO295Ehq62SsdSwLz0w24vbX7C8zDb/b41O+Q==
X-Received: by 2002:a05:600c:310a:b0:426:676a:c4d1 with SMTP id
 5b1f17b1804b1-42c95b133f8mr9577635e9.8.1725441781771; 
 Wed, 04 Sep 2024 02:23:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb273sm199213375e9.8.2024.09.04.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:23:01 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:22:59 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Rob Herring <robh@kernel.org>,
 =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, kernel@collabora.com,
 Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v6 10/14] drm/panthor: Add the scheduler logical block
Message-ID: <Ztgm89fJCZ6EnK2y@phenom.ffwll.local>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-11-boris.brezillon@collabora.com>
 <Ztdm9EdoguXKxGMV@phenom.ffwll.local>
 <20240904090953.77d5b8d7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090953.77d5b8d7@collabora.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Wed, Sep 04, 2024 at 09:09:53AM +0200, Boris Brezillon wrote:
> On Tue, 3 Sep 2024 21:43:48 +0200
> Simona Vetter <simona.vetter@ffwll.ch> wrote:
> 
> > On Thu, Feb 29, 2024 at 05:22:24PM +0100, Boris Brezillon wrote:
> > > - Add our job fence as DMA_RESV_USAGE_WRITE to all external objects
> > >   (was previously DMA_RESV_USAGE_BOOKKEEP). I don't get why, given
> > >   we're supposed to be fully-explicit, but other drivers do that, so
> > >   there must be a good reason  
> > 
> > Just spotted this: They're wrong, or they're userspace is broken and
> > doesn't use the dma_buf fence import/export ioctl in all the right places.
> > For gl this simplifies things (but setting write fences when you're only
> > reading is still bad, and setting fences on buffers you don't even touch
> > is worse), for vulkan this is just bad.
> 
> For the record, I remember pointing that out in some drm_sched
> discussion, and being told that this was done on purpose :-/.

Nouvea gets it right, if it was xe people then I think they were a bit
confused. I cleared that up with some irc chat on #xe yesterday evening.

> > I think you want a context creation flag for userspace that's not broken,
> > which goes back to USAGE_BOOKKEEP for everything.
> 
> Honestly, given the only user (the gallium driver) is already designed
> to do the explicit <-> implicit dance, and the fact the driver just got
> merged in the last release, I'd rather go for a silent USAGE_WRITE ->
> USAGE_BOOKKEEP if things keep working with that.

Ah yeah if you can get away with just flipping that, even better. It
really shouldn't be needed when your driver uses the dma-buf fence
import/export ioctls to handle implicit sync needs.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
