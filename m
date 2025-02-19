Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009F1A3C00A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEF910E48F;
	Wed, 19 Feb 2025 13:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YPbug1x9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0302510E48F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:35:29 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso42294505e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739972128; x=1740576928; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/HDFDILYx7rzMW3nshuh5AQhUvdQzF7q7CNPi9LQXw=;
 b=YPbug1x9LsgURU/De2MU8UBZIrfsiBN1sZDn4jNlhkyY5DVWWC22y46T1cxufKheeP
 nB8+JwebTzLo1YHGScrTLqy6RYXsePlMV1bpdDrKRAhBNoYhtOaST0iSNnDUkBKEfvv5
 ONN85YH/ISsPv8BtaTcL7AHDh4NfuRnCfb8eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739972128; x=1740576928;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f/HDFDILYx7rzMW3nshuh5AQhUvdQzF7q7CNPi9LQXw=;
 b=kHtVj5a1lwcb079mTEnzaEYGjvUcGhZ38txNOl7bW2G5biKnzkwBr1HQCnk8+BsJNj
 8nij202jFD0s5q/NFxzyYZydWPMcL9l+ssqxYD/qfyBH4kUX/D1MRBEwNm52ZWcarufn
 hXDz5FSmJoxbnDhTK53Vs6j/Tbc+GmC5u8jUI2DPG5Fk6lYcXYobeJDJlb4MQBNDGw2r
 eFt/KoX8QFwIXhethm9iLmrc5zjsoTG1jejqjboXny2E0M8KcXZPShKMS6kFtR3Ce9fL
 W+fKXNs3No/TZWowx82AMCAvYvrQUQyV2MPPFhN+nzfRX0OyLuxy8mewciU0U/j/e4NV
 SIjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHFUi8GQp/CQAMCZrSO3bacjfGcEwUdqCNgcNLjOBkh2A3CJDp+AQAVSEmAhQpGgyR3VfkkJVyFmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkcvX+0IjIGuK8THRR7t/EjvBqXiinUygJnRAsCq1TYiz2dmVv
 U4v67oMO1lFKSs1pI+2jrcov4R6crk6aBTfZH4myJcdECIGxUeBwpt3veTzo1aE=
X-Gm-Gg: ASbGncu5HTQJti/SeIFLCcn4N/ZX2fpB/HV/Fdd8bUznXpcDOL6tY4xRPGc4JzAFWCC
 +KgO/eGbe9tipCpADtN9kYEP6aMatKSi3XE5clbCJT95o1onC3VTU49EPc1sNZxN5DzJY8Po+K0
 x+qMvaPwCbFINvwruHoMIsy2Q5WREWrh1rcaRXHyR2uBtiKmZVC0dyoq6232ZZpkrzHRlhQX2Af
 +/Vx2r1jjFGEH8/sdZTw78Kw/TAcRSRx1nzYlYT0bMyqW0jDgbcBWZ7xURSiyBaKWUj2h2qYJ2j
 vlCNo3qrgryU62pp5gvJECXuXwE=
X-Google-Smtp-Source: AGHT+IGBsXJy4TW3NzQtnHG+441AuJVg+sFRbAo/Yk1ZcOffGOO9VyBDKzMqA723pRTlMbWhiqtsiA==
X-Received: by 2002:a05:600c:45ca:b0:439:967b:46f4 with SMTP id
 5b1f17b1804b1-43999ddb0c7mr29219535e9.26.1739972128402; 
 Wed, 19 Feb 2025 05:35:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm212510785e9.36.2025.02.19.05.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:35:27 -0800 (PST)
Date: Wed, 19 Feb 2025 14:35:25 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 31/37] drm/bridge: Provide pointers to the connector
 and crtc in bridge state
Message-ID: <Z7XeHaTmtS8ClOV-@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
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
 <20250213-bridge-connector-v3-31-e71598f49c8f@kernel.org>
 <Z7NmtF83adILfasi@phenom.ffwll.local>
 <20250218-adamant-translucent-civet-aebcc5@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-adamant-translucent-civet-aebcc5@houat>
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

On Tue, Feb 18, 2025 at 11:23:00AM +0100, Maxime Ripard wrote:
> Hi,
> 
> Thanks for your answer
> 
> On Mon, Feb 17, 2025 at 05:41:24PM +0100, Simona Vetter wrote:
> > On Thu, Feb 13, 2025 at 03:43:50PM +0100, Maxime Ripard wrote:
> > > Now that connectors are no longer necessarily created by the bridges
> > > drivers themselves but might be created by drm_bridge_connector, it's
> > > pretty hard for bridge drivers to retrieve pointers to the connector and
> > > CRTC they are attached to.
> > > 
> > > Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
> > > encoder field, and then the drm_encoder crtc field, both of them being
> > > deprecated.
> > 
> > Eh, this isn't quite how this works. So unless bridges have become very
> > dynamic and gained flexible routing the bridge(->bridge->...)->encoder
> > chain is static. And the crtc for an encoder you find by walking the
> > connector states in a drm_atomic_state, finding the right one that points
> > at your encoder, and then return the ->crtc pointer from that connector
> > state.
> > 
> > It's a bit bonkers, but I think it's better to compute this than adding
> > more pointers that potentially diverge. Unless there's a grand plan here,
> > but then I think we want some safety checks that all the pointers never
> > get out of sync here.
> 
> That work stemed from this series
> https://lore.kernel.org/all/20250210132620.42263-1-herve.codina@bootlin.com/
> 
> and in particular:
> https://lore.kernel.org/all/20250210132620.42263-5-herve.codina@bootlin.com/
> 
> Bridges, outside of the modesetting code path, don't have a way to
> access the drm_atomic_state since drm_bridge_state->state is typically
> cleared after swap_state. So accessing the connectors and CRTCs don't
> work anymore.
> 
> In this particular case, we needed to access those from the bridge
> interrupt handler.

Uh for interrupt handler you can't use anything stored in state objects
anyway. So I'm even more confused.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
