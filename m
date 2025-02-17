Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85B4A38966
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BAE10E15C;
	Mon, 17 Feb 2025 16:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Lv6REnH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359D710E15C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:38:13 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4398c8c8b2cso7844155e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739810292; x=1740415092; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RlNG99GTV+OPIhKK6SzcOvuW8gdnJ6Gb1Ice7bp65SM=;
 b=Lv6REnH4ifVEEYd0LsMMEyMS9zWDXTucM1ZZcehKoV/eh5X2hgDEfzFLwskPoRDso8
 sW1iwtE94hdFdKu6XPio/1mjr+iNfut83DcqIKc9YerWWh6Kh+D0RppVZrc0bGvk+4Nh
 4Lm39lOtYxemcCOz1aV97jqqvYMYI+SqI0E1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810292; x=1740415092;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RlNG99GTV+OPIhKK6SzcOvuW8gdnJ6Gb1Ice7bp65SM=;
 b=YzTMgUVZOmg6JglG67WVIuMuvF/iFOkieMmTJuK7N6GY+AY7WdfcN/gK9k/FDSI0Fr
 Xh0MInaxfJm4azy2kUmTbo3nkny5Oouc/ScA7gb+6wvOWb2WjHch+kR24LEwtK6CRhXT
 rfS7+yBEoTaOw/YmSilnFSrwniKNEkTOvmoP/fvLfBvnX2FlBy7VonvfmD8dr2LC53p9
 T1MX5IsYNJMPLWo0Qru1DlTMjVicwgyDdxi/Lf6e3n4ZDfP/cc5NzKmC57m35eqIJulb
 nXWaaUE1CkaQjnsCMxdCPGezFyamtI+KCuISEFd3HO0e0O1vhr8c328DroxWJahZZ7b/
 EQNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlKrbmvn2gcqF38oeCUWJqt/ffjI0Uvqd6k4bjNPg1z4Wjtm/tRgAVZ1bD/OISRhj46BOjyrg1C0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLbyrUkWFJqLw/QyDOpx/hvEfhAqBg9chBDjP0AnLaGZ3HEpUH
 EJry9QM8P0YOIgIyjLlgrVZo5HqW0ysNE0Fp8lzY47QL9EqkzuxYDkoPkGPU8Es=
X-Gm-Gg: ASbGnctHVuZsK38AA2eQm47IhiLe4qsegjCXcFZ2C5ApmFenG6VY1Owvw0sU7in1/N/
 TAFztOLt+BvwQtHdxC8tTJLF1PB3/nKRv74kHB9ktXiyfl/6F0B1LjuhlSOyOy2I7Kj23fg/s6v
 ZO0EMH8QuMEGspyQJ35FllXwsqBQa77RIhcGbHQhz6rwOm1F0qusPSOgLJgu3KCSkv+8J+pDEqD
 KUk/74qxT/Bha/aIHdJTH37j7lLTxLeZM3GpoX9cZ9wGOuJTmIcoLAqfHqCoRp66ZlhJk0TOiv5
 tn7QNNuXJEp2wgXq+vZWoYr7d/U=
X-Google-Smtp-Source: AGHT+IFd60CRWw/crQ4PqJA9O3LrM84lDIdHjWDAqTBxNvL64UjwetWcSQc4ZaOGrZvRZATo4YxAqg==
X-Received: by 2002:a5d:638d:0:b0:38d:d2ea:9579 with SMTP id
 ffacd0b85a97d-38f33f5651dmr8950428f8f.46.1739810291617; 
 Mon, 17 Feb 2025 08:38:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5d8bsm12704381f8f.70.2025.02.17.08.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:38:10 -0800 (PST)
Date: Mon, 17 Feb 2025 17:38:08 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 32/37] drm/bridge: Make encoder pointer deprecated
Message-ID: <Z7Nl8JiFncngynNy@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-32-e71598f49c8f@kernel.org>
 <nfb4fb6lzjw4j5brsh242htgw3au2moklqjalfa3zzxjsi2qn5@l3censelmgbz>
 <20250214-arrogant-strong-hoatzin-efdcd8@houat>
 <yy37e4kne7i2hl7coix6v7vajb5bm4zohod4fdzayvxr52l57u@cxturs2uxgcm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yy37e4kne7i2hl7coix6v7vajb5bm4zohod4fdzayvxr52l57u@cxturs2uxgcm>
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

On Fri, Feb 14, 2025 at 03:29:12PM +0200, Dmitry Baryshkov wrote:
> On Fri, Feb 14, 2025 at 02:07:18PM +0100, Maxime Ripard wrote:
> > On Thu, Feb 13, 2025 at 06:35:15PM +0200, Dmitry Baryshkov wrote:
> > > On Thu, Feb 13, 2025 at 03:43:51PM +0100, Maxime Ripard wrote:
> > > > Other entities (drm_connector.crtc, drm_encoder.crtc, etc.) have
> > > > pointer to other currently bound entities. They are all considered
> > > > relevant only for non-atomic drivers, and generally perceived as
> > > > deprecated in favour of the equivalent pointers in the atomic states.
> > > 
> > > I think there is a significant difference between mentioned fields and
> > > drm_bridge.encoder: the former fields are variable and can change. The
> > > latter one is static and set at the bridge attachment time. Nevertheless
> > > I think it is a good idea to deprecate it.
> > 
> > I'm sorry, it's not clear to me here what you want here either. Do you
> > want me to change anything to that patch?
> 
> Well... I was thinking if we should expand the commit message. Most
> likely it's fine though. In the end, I've r-b'ed the patch.

I think this one is wrong, since the bridge->encoder link is static. This
is unlike the connector->encoder->crtc chain, which isn't, and where you
really want to go through the atomic states or you get funny stuff.

I don't think we have bridge chains with multiple connectors though, so
this is fairly academic and so maybe still a good idea to make this all
more flexible? Unless I've missed the memo and atomic bridges have
flexible routing, and in that case yes this shouldn't be used.

Mildly confused ...
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
