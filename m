Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01159CEC195
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 15:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D4010E1C7;
	Wed, 31 Dec 2025 14:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ued3BZzi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590BC10E1C7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 14:38:19 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b73161849e1so2079313166b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 06:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767191898; x=1767796698; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nLbaMCIjSuuimKPRaZzy2+ZfuglyLTZsRd/zUw1VYM8=;
 b=Ued3BZzi04tWT5SUydB1fYn3jUEt5+uhhPDt73VoyO1Pa1x9pGsso0Q762fR4cwqHl
 91OGqn8/aReUM+zQoYrDEklw6Cmc4ldDnLKjSIJaDf/2aZ+Rn7TQ9cy6wIUf0Hm1LoFz
 EOlkQ/bWoFbWSQfR1ElWXuHO9xmKH5FXz9VI/zn1NwPCzGZDpdM3tiSbeMYysi9DHDcF
 Ega6mg7BuZoprtV3j0STMXeLM/4NvVMs/Pm+W1TW+REe6OfhqTDd0koQwbdLCJoOKzUY
 TlIyN4vdvpcycgqpyEkSHsHAiHKLxWWd0rlLKG+tb2+yql1DwUlDdlgjSLynLI05VKYx
 yB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767191898; x=1767796698;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nLbaMCIjSuuimKPRaZzy2+ZfuglyLTZsRd/zUw1VYM8=;
 b=QpBvgzkfXPcKZ1KFth8bOYodfVxJkWxaajpplg7e8OXEuitvM15LNx6tadhxNeGQP4
 AG7niSNaPvA0oIJ/bwLh4Yw3NWmEUsgI9tkonWL/cNyMW+ZxrrUMvA9fBfSeTm6Ux4ex
 Wn0TCAhbPAyLE2p0tPA8nSm0nMaqKU74q5QKLGtr82B126s/kZB/aKzgUU9oeDf+DyYX
 7o8g47NXIc8jafZoYFKh4tRIS5TlaRyEb2ZQXPMrN0YAbHN3mwl3Gj6fdBuIwglRpPNY
 JcuNkCvx4L/NEeYEwZ5RfgzTdFeiDEw4oZ6NrgQgnfLHNHVAxcaltuW3VJgUmW+jI6tg
 lcyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkcxKruOuYIwQQCcmAcI5BVzBPJgE7jCQhnM0cVrMb85kFSBR6mg8EIaksFxhODuj5W6XUZA45VO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNxyNBrz5/YHtCiOwy2IG66xZm/5TLBsUu6/dPi/rplSwD/wSv
 IAjyCtCMKrTHFUQJQYZjwkfrc/0mEWqgq/7WYkEdeLxDmgKsCg8KSsk+
X-Gm-Gg: AY/fxX7zfg5mj+PsRnUH15VPZqqEaNUbpOjiG1eqN+fR4uwbK9oXOVHPeGw3IUw3Lgi
 JRA4rlIwrTBeatgri7GSZEYiNiiUGT2czOVs9QocBb86eLQVxl9kZDIUYXrT3H3nzpA4+qzw6vF
 pWPm4GAFWacFBZ+7+onzF+/0zuWIUugPyhQsIe+9u93CltNr81tRciCAYqRoH5z+2I9qRRt2pQy
 bNkOGUcHUaUqkBOgO6dDgMTHGUMOdx1Liwxbz5fdO4/xvCTs08XoGWj8LpdpXH0ZlyMJO+avUWg
 rRozIpgBwucs3hLfnye5iY3CymS4sH4xsz9RWk/GHPz00VDVOwYHY7z/6ZifiaheE6yj28NzhEx
 fcuThLEF/vX+Ej1fFPU/uyTZQxQWKXJgphrns8A2MHTzdGP44OeW6OgNja218DOucndV+icnkFA
 CRwyMrZMQYtIA/
X-Google-Smtp-Source: AGHT+IHo11GLNdzN0xc8eu2YrCtj6KWXaR8GqZPN+jp2a2EX+hxp8jfzxnhHPFpRITxjtPv/qRT6Sw==
X-Received: by 2002:a17:906:4fcf:b0:b83:7fb8:1f54 with SMTP id
 a640c23a62f3a-b837fb81fb0mr911378966b.39.1767191897480; 
 Wed, 31 Dec 2025 06:38:17 -0800 (PST)
Received: from osama ([2a02:908:1b4:dac0:75b2:7ca6:1e15:d2e6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f3e271sm4024323566b.60.2025.12.31.06.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 06:38:17 -0800 (PST)
Date: Wed, 31 Dec 2025 15:38:14 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andy Yan <andy.yan@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: synopsys: dw-dp: return when attach bridge
 fail
Message-ID: <aVU1Vh_gLf4uEsg0@osama>
References: <20251226223229.123860-1-osama.abdelkader@gmail.com>
 <DFCGN2M06GGU.25B1SFMCHNMKL@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFCGN2M06GGU.25B1SFMCHNMKL@bootlin.com>
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

On Wed, Dec 31, 2025 at 03:09:51PM +0100, Luca Ceresoli wrote:
> On Fri Dec 26, 2025 at 11:32 PM CET, Osama Abdelkader wrote:
> > When drm_bridge_attach() fails, the function should return an error
> > instead of continuing execution.
> >
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> 
> Looks like a bugfix, should it have a 'Fixes:' tag and 'Cc: stable@...'?
> See https://docs.kernel.org/process/submitting-patches.html
> 
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> > @@ -2062,8 +2062,10 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
> >  	}
> >
> >  	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > -	if (ret)
> > +	if (ret) {
> >  		dev_err_probe(dev, ret, "Failed to attach bridge\n");
> > +		return ERR_PTR(ret);
> > +	}
> >
> >  	dw_dp_init_hw(dp);
> >
> 
> It could be more concise, without adding braces:
> 
> 	if (ret)
> 		return ERR_PTR(dev_err_probe(dev, ret, "Failed to attach bridge\n"));
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thanks, v2 is on the way.

Best regards,
Osama
