Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BC1A31A94
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 01:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B67710E781;
	Wed, 12 Feb 2025 00:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x9WJ0dSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D2810E77C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 00:38:57 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5450cf0cb07so2290929e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739320736; x=1739925536; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=czMy4XGzgzOziSIiMmQSPFWId2I629I8Sv1+VTv4Uos=;
 b=x9WJ0dSarfo4jm6X939+X8Qr4kdLGwsOL5BaAjy7UyW8CjmNsPBp2fK7W1iug/cW4i
 wIk/z1O1NPXTipLPvka0GCrT2zD7qQ1vNBMdfeU0BHgPQc1IPJ+t1QqiWFOBs0+L8GwM
 UrcSTScVL+DhPX58YIcpcCA/fVOenVJ0RhN3o98/xdS2AIP0zCYTVQeXw7GrqathhouZ
 g+32yPz4kvohHB1WfBtuPiBGkXKx7lhwSthkdv33cq1rqSJVwWClDQeBuPB8AiJYRPSu
 ZL4t7BIXY1Gx7xB9hLoQ1Ed8IfQN5eNLTeYSS0MOSzXFrw6Sz76b4tTfCXayncG5TpP/
 tvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739320736; x=1739925536;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czMy4XGzgzOziSIiMmQSPFWId2I629I8Sv1+VTv4Uos=;
 b=k+FSho2QvgMLoRow2pZRya/76woxV2THW1fSongxr5yUHNceJE/9VWbIh61gLFKfFD
 Q8dTWlV9WRTbkT55aQBnr86pe9j0qu54LmcE8q4QnthwQgmmTkMa+fAIvmVjmRlWdfdM
 0PdkgpwVihyGEXbSEulqgMB9SYSwVvV2KiHRR+PPvN0dq6iI69WbDW8xPwM9f2Az7UaB
 dm8gpNjpVNc+D7SoM69yNHeatKMrqp90nL6UHIakzyCp5W2fZfzpd3hRhFADZ4kw7x/2
 3R+DudexNs0eViON1/7+Z1ns9ZIgYy+b5/PNpigyXSyzuOMiZVGca7yY78eyNPFCPFKf
 1RKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlKBTtF5Hc6/rwXoS7y2HK5tv3sivYDXlubEmKkdqSJrDOoXq5xY1MxPYVq7NHhixzR+Jg1Gc16Qs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBIAB4cW/+KxTJn50RtuDZyuxJ6WvqaN4Btlr4lVWWtE+ZChCf
 J0gm7us2fr39zJUle99ADf3BuLjNNAs77vPSRywxfgkosBkGcuxafZlRGehaPns=
X-Gm-Gg: ASbGnctBt69ypNXpMgMa2mSwGkjH/xyCkZ2eF9JR3pZZ6PsbjNhNTxyGU79/Td5Rw3V
 Ww4Q68J2w7TG8fUGPttHLabApEyPMqXTkTGtFNw2E7re/kOyyvaUHdbOwtYX+BokgEFUtDoMoBe
 HvCfA+GDfvMiHZ+WXGeXdTns882L8+1NIo8GLHh6ffIWpt49RUiLV4Xl2u5kODd9K+KwvR98WBc
 2PMqU8m6BU+dBGkVNBh/eBsm15nvnv8Tl/T/UmgLHtsMPd7/x13joZ68JS2BrplPno6d7jlbNw2
 0ypo54dPKWo1LvPmdsAy4E3hgNkx9noZyPaA1Nq9vt6cPu/hK849o4fLjGIet/QZPgpyiRY=
X-Google-Smtp-Source: AGHT+IE0R9s5EbTp2hypzARdUk83hsK/GvBuTLYE+EmInEQl+LSG5FC1N0b213UOW2tBegrVy9Dl8Q==
X-Received: by 2002:a05:6512:1288:b0:545:1104:617d with SMTP id
 2adb3069b0e04-545180ea318mr257971e87.11.1739320735950; 
 Tue, 11 Feb 2025 16:38:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053eb53sm1689954e87.36.2025.02.11.16.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 16:38:54 -0800 (PST)
Date: Wed, 12 Feb 2025 02:38:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 34/35] drm/bridge: tc358768: Convert to atomic helpers
Message-ID: <btehhpvkv6iqd4pofumspqbxzr5gxwp6vs5oh7vflbcmzqj5wz@s6yem2ryw6vs>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-34-35dd6c834e08@kernel.org>
 <nbghrrl74xsuzomp7d6qjfosxfiooezipppjhxkx2ibnlpi6rj@b6ovgosmpuhl>
 <20250211-solemn-meticulous-angelfish-85d1ce@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-solemn-meticulous-angelfish-85d1ce@houat>
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

On Tue, Feb 11, 2025 at 03:33:58PM +0100, Maxime Ripard wrote:
> On Sun, Feb 09, 2025 at 09:13:36AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 04, 2025 at 03:58:02PM +0100, Maxime Ripard wrote:
> > > The tc358768 driver follows the drm_encoder->crtc pointer that is
> > > deprecated and shouldn't be used by atomic drivers.
> > > 
> > > This was due to the fact that we did't have any other alternative to
> > > retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> > > in the bridge state, so we can move to atomic callbacks and drop that
> > > deprecated pointer usage.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/bridge/tc358768.c | 30 +++++++++++++++++++++++-------
> > >  1 file changed, 23 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> > > index 6db18d1e8824dd7d387211d6d1e668645cf88bbe..6ff6b29e8075d7c6fa0b74b4fec83c5230512d96 100644
> > > --- a/drivers/gpu/drm/bridge/tc358768.c
> > > +++ b/drivers/gpu/drm/bridge/tc358768.c
> > > @@ -601,17 +601,29 @@ static void tc358768_bridge_disable(struct drm_bridge *bridge)
> > >  	ret = tc358768_clear_error(priv);
> > >  	if (ret)
> > >  		dev_warn(priv->dev, "Software disable failed: %d\n", ret);
> > >  }
> > >  
> > > +static void tc358768_bridge_atomic_disable(struct drm_bridge *bridge,
> > > +					   struct drm_atomic_state *state)
> > > +{
> > > +	tc358768_bridge_disable(bridge);
> > > +}
> > > +
> > 
> > Please change corresponding functions into atomic_disable() and
> > atomic_post_disable(). Calling sites have access to the atomic state, so
> > there is no need to have yet another wrapper.
> 
> It's pretty hard to do (at least without the hardware), both
> tc358768_bridge_disable() and tc358768_bridge_post_disable() have
> multiple call sites in the driver, and passing a state enabling the
> bridge doesn't make sense for those.

I think it makes sense. The function knows that the bridge needs to be
disabled. The state is totally unused (or it can be used to get
connectors / CRTC / etc).

> 
> I guess I can still drop that patch.
> 
> Maxime



-- 
With best wishes
Dmitry
