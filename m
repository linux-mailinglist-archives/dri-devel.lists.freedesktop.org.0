Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0F796B549
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9145310E6EE;
	Wed,  4 Sep 2024 08:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WH6vMKyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAD610E6E3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:45:28 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-374c8cef906so2169515f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725439527; x=1726044327; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qR3yD/10xu6u+2Q3lxcuyl83e9lyyGPDQ7L36cc1aM4=;
 b=WH6vMKyzciIN4Ix18qo9XedivKecUldFD2L7mzbZSqGPULZxJuMYNZm4MzMBcZwbvK
 8vF+/MrkpHzNF8f3HEki5Pgn5+boZEhvb5voRAvur9YthFLjpXTZUHbbiUe0dA0eHUVE
 X+//2fg+tm7RGSH2mtKW6EUAERzJPfelg1GP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725439527; x=1726044327;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qR3yD/10xu6u+2Q3lxcuyl83e9lyyGPDQ7L36cc1aM4=;
 b=EAisYKq//JZOkGdq/m0Yt+LoSRLYteXsLza6jVymNuEy9moGdtIvY27QxUyPKBIbmh
 b/gmDg6xbeHGmnjkci69HcCWq9ZXXOlL9Ge3XPkYNDb7+kbotZ0to0dMY8D2Em+YEMEt
 BGGjVZqre/8j49xIVC/JxwUQMu2KjURcTpZeD9YkAFAZKVNS6zck3dh3R2jaM0YgXNKg
 zm6ERznxdhFniaPxmS3A6tg4VW5qbX4sS1gbsXD6UBE0kGi36chibPoTEWzfH8G/SB4l
 M2MGSiS2xTTKyiNtgboBe+BQfQasfPL0PNFgcBYW3Pm6mxy6wYjrT2Ttm7oAYEUWBRNZ
 tsMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLSWMYRNlCewMVnYN0fSfgYqJeTionzKFVXG+pTadC/48wWHleUcM/pShP/U4rwWq1cgTWdQEnzyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC0Uyx5lhfFgwICTTbGwB7EBFtsffiPJFmRvAyJPGWqwzoGXz1
 J00E1y46wk0oQcNXDGOvO1glQMzzA79vYKnzr7t4sXgavMxWnUrZ73kQPkoGK18=
X-Google-Smtp-Source: AGHT+IG5rD0cFIDvJz46pOVHhIdyBdSz/mISsBCqAICbWy9bV4Mc6njPBdOueJWehv/W96Pm8vmS2Q==
X-Received: by 2002:adf:e544:0:b0:374:be28:d808 with SMTP id
 ffacd0b85a97d-376dd15b11emr2245955f8f.20.1725439526991; 
 Wed, 04 Sep 2024 01:45:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c5792acbsm9547540f8f.76.2024.09.04.01.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 01:45:26 -0700 (PDT)
Date: Wed, 4 Sep 2024 10:45:24 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
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
Message-ID: <ZtgeJKvqFm6Bqc5O@phenom.ffwll.local>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-11-boris.brezillon@collabora.com>
 <Ztdm9EdoguXKxGMV@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ztdm9EdoguXKxGMV@phenom.ffwll.local>
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

On Tue, Sep 03, 2024 at 09:43:48PM +0200, Simona Vetter wrote:
> On Thu, Feb 29, 2024 at 05:22:24PM +0100, Boris Brezillon wrote:
> > - Add our job fence as DMA_RESV_USAGE_WRITE to all external objects
> >   (was previously DMA_RESV_USAGE_BOOKKEEP). I don't get why, given
> >   we're supposed to be fully-explicit, but other drivers do that, so
> >   there must be a good reason
> 
> Just spotted this: They're wrong, or they're userspace is broken and
> doesn't use the dma_buf fence import/export ioctl in all the right places.
> For gl this simplifies things (but setting write fences when you're only
> reading is still bad, and setting fences on buffers you don't even touch
> is worse), for vulkan this is just bad.
> 
> I think you want a context creation flag for userspace that's not broken,
> which goes back to USAGE_BOOKKEEP for everything.

Did some more looking, and nouveau seems to get this right. Also
imagination, because they don't do any dynamic memory mananagement at all
right now they don't bother with fences and leave it all to userspace.
Which is the same as USAGE_BOOKKEEP if you do have dynamic memory
management.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
