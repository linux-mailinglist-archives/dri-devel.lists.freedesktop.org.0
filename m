Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C537996A7A0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 21:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1946110E228;
	Tue,  3 Sep 2024 19:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CZTU3v5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5720710E228
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 19:43:53 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42bbbff40bbso39037625e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 12:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725392631; x=1725997431; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j8o2OkmWPZZcp65uqoxhRKRu68eJNGhpAZ9MtbWA6xc=;
 b=CZTU3v5UuE6qUxLNczm/O1Re0XKvCWaqAGfgf5sQKR6LNXf1z9ItlShNh2ln991DW3
 e6yg3ciMWPKwmTih5LuVhV0dyUWx0yX9feb0McmaulEHghu9MnCzY9yLOmPfsNbCXQNy
 fPY4hikL3ADHP2QhXtt+MIz+Yb5+yY4zTv4Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725392631; x=1725997431;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8o2OkmWPZZcp65uqoxhRKRu68eJNGhpAZ9MtbWA6xc=;
 b=Q/0FBfCXyCnnGJCrlD5GL6wcMc4RGksaQJGxwE5WxJn3HdXuuTrBBvOrCRC8L1c6W7
 xbJnGEa0RHd96kdEsBH+N06DM+6RHMt+CUtAu0Kg1f6bwZpk314zrOb6kiUTE1BoiEHy
 aQc+Tq6bztv9Wy37etSsxkYXd5AhT/DLMeVDauwjXGhgbGPGU+6Xdo9qwl67x/oP3KiT
 h95StGCHs8cJLD5nvAMPvAOOkvoAJG29FXBTg3aOYWAXLKVuIfcxQ4oGOAPONGMNephn
 SsDzoAuCSoC2yGsTaqmCXgd/5vchg12K/tusRaHKRAH2Nk4zIwjQ4ANYVYDfUm0tMP62
 cpeg==
X-Gm-Message-State: AOJu0YzdoLIUi2MGmogfjdWt9QXy+55jjuQn3/Q9oicHqZvBIb7vYxz7
 SIzr+LdEYpYksNFXLKbAaD2/SHg4mWIOM08Ue/QPVZWYYV0NpVFuH6mNDMDaVbk=
X-Google-Smtp-Source: AGHT+IHs7i9tn7rBs8Xn1EtYcGJ4eDYrjn+dDAlFGgeMfGOWuc1K07PXLA0h9ZhKnJxxPtsc+MRfUA==
X-Received: by 2002:a05:600c:3b0c:b0:426:65bf:5cc2 with SMTP id
 5b1f17b1804b1-42bbb10cd56mr91932315e9.1.1725392631177; 
 Tue, 03 Sep 2024 12:43:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e2737dsm180240625e9.29.2024.09.03.12.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 12:43:50 -0700 (PDT)
Date: Tue, 3 Sep 2024 21:43:48 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
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
Message-ID: <Ztdm9EdoguXKxGMV@phenom.ffwll.local>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-11-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229162230.2634044-11-boris.brezillon@collabora.com>
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

On Thu, Feb 29, 2024 at 05:22:24PM +0100, Boris Brezillon wrote:
> - Add our job fence as DMA_RESV_USAGE_WRITE to all external objects
>   (was previously DMA_RESV_USAGE_BOOKKEEP). I don't get why, given
>   we're supposed to be fully-explicit, but other drivers do that, so
>   there must be a good reason

Just spotted this: They're wrong, or they're userspace is broken and
doesn't use the dma_buf fence import/export ioctl in all the right places.
For gl this simplifies things (but setting write fences when you're only
reading is still bad, and setting fences on buffers you don't even touch
is worse), for vulkan this is just bad.

I think you want a context creation flag for userspace that's not broken,
which goes back to USAGE_BOOKKEEP for everything.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
