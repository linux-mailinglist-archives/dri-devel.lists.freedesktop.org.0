Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22346A0C38D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 22:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227ED10E4CC;
	Mon, 13 Jan 2025 21:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OlOJtNus";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3361110E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 21:20:45 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54252789365so5643449e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 13:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736803183; x=1737407983; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=auolGcBUcHd/JEoGxGiZs9F7L7UJFnvDf2yzuAyYqU4=;
 b=OlOJtNuswoE3B12Yui/7wmUmVptva9Y1OG5pR39Ni/ZlHuetywhzA52Z9kG4Yf6GdJ
 h6q43bVm7C4BIWhUHnKrWTc1ojmT8+YVjUWRT2OIoBSScZqeHFbpUwBj/n1ZhhLTQWwG
 t7JokaUrnCPOz6JPqDkPMn4dQ4acjBeEJcsMVEKsucRv3n1gUe4aGNb94RnCu89gfDnX
 F1JkgPB2DD4lBs9xE8ZfAutl9C2+I6yrxvv+boguFSagPabs6KTomNfivY8tcpnhAMml
 EB4QFJyEhoXrKL4RKTnz07LObSGBOMF+qPPhFexfoxBoJqRjLB41eBPXzHtGJ4xCDKAa
 Ks7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736803183; x=1737407983;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=auolGcBUcHd/JEoGxGiZs9F7L7UJFnvDf2yzuAyYqU4=;
 b=RTx7DjnmswuYaQ7qKLOmMfLQYvo+eRW18buzhfuEqMUTS4oIuD8DvNrq1aB14f0RX3
 p9Jm1tXnFEo0Ww37VcxTdhuS5qZTgmyVshWqONqiM4YqcQEUMjYrXgD6HCVi6oZ6eqAx
 lUiiFE2mFBozCEN2oivasBo9YhfdFZhmteTvLZl/BKv5r/6tfIXEh6CGGUAGd2rkNufY
 cKXP9BDoPX38Gb9OQCT3WWuAyx9V3xXJmo1+Il0++/P6Pfz8hJGJqfSzPavOFXvYJJ73
 hJl8lRaNXRtIw5GzpeSJePgqn08PfjUMxke6kDBYHiNCAbxdZ0OOqSmk8F06H0jfhc44
 P2kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4mLyJU8mzZCiK3ylA8DR5eTqcvT80n3ACxWj8LUakzBR9jOzgjZL4WdqKXle7TdTqnpz/PIOaNYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ5A3X+iQMynov1/O7on02BcaSTjxIBTxqZ8gwMZwRLKXem3p1
 yWIATgEiksKrONj98N3P3Hbmfy5jvYzzdF6q02+m6eM9jvwDgcn084zXC8fxvc8=
X-Gm-Gg: ASbGncvTmRAEbaFzX723Z/vpcN1RwGJPbImwE3G5+g+TF79mg4BeXAPpcMYptNJviCZ
 1nbv6DuppnPjy1z8KldPWMqxDmm8vmGGXrA8/133VCrvEKZdq4Kbs2Frr9VA9Zep9xEAbyPgwk7
 7xAab7gwt+PQGP2uXxx7qfl/kLkT2Iph3U/DkdExh1pZOuBp+aVVAzMlve8jlOAqtR72t5GYkvL
 a95OHEr4yYiQV/TzXsdxU8RTij5U1mH1VpFKPhu3YKWJyNS9H2wvCuh4rt5pI+GH0XnE77KyBvd
 PcmkHGXt7g3oGjk8qhF9hb+X0WlptGO3cSa2
X-Google-Smtp-Source: AGHT+IG4HNf2OdrQtEVEMxchWQ4BRVPCf9mNemEPXu6SiyokvYgvf/Pf55zSaTnCvvZ+Tt2RSZT45g==
X-Received: by 2002:a05:6512:31d6:b0:540:1b41:c75f with SMTP id
 2adb3069b0e04-542845bf4acmr7764693e87.16.1736803183428; 
 Mon, 13 Jan 2025 13:19:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0643sm1486547e87.187.2025.01.13.13.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 13:19:42 -0800 (PST)
Date: Mon, 13 Jan 2025 23:19:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 03/12] drm/bridge: cdns-dsi: Fix phy de-init and flag
 it so
Message-ID: <eosysems4evgucm4cprcntufi7w6wwhhpm6cai6wls5f75ugvy@k4v2suh376w6>
References: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
 <20250111192738.308889-4-aradhya.bhatia@linux.dev>
 <dqmzdxhgnabfq6zzbd424ajfd734gza5aitmk5bfswff52d76r@2swxl627az3d>
 <79fc67a5-ac2a-48e2-b3ae-b96b6c29191e@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79fc67a5-ac2a-48e2-b3ae-b96b6c29191e@linux.dev>
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

On Mon, Jan 13, 2025 at 09:09:11PM +0530, Aradhya Bhatia wrote:
> Thank you for reviewing the patches, Dmitry.
> 
> On 1/13/25 15:10, Dmitry Baryshkov wrote:
> > On Sun, Jan 12, 2025 at 12:57:29AM +0530, Aradhya Bhatia wrote:
> >> From: Aradhya Bhatia <a-bhatia1@ti.com>
> >>
> >> The driver code doesn't have a de-initialization path as yet, and so it
> >> does not clear the phy_initialized flag while suspending. This is a
> >> problem because after resume the driver looks at this flag to determine
> >> if a Phy re-initialization is required or not. It is in fact required
> >> because the hardware is resuming from a suspend, but the driver does not
> >> carry out any re-initialization causing the D-Phy to not work at all.
> >>
> >> Add the counterpart of phy_power_on(), that is phy_power_off() from the
> >> _bridge_disable() and clear the flags so that the Phy can be initialized
> >> again when required.
> >>
> >> Move the Phy initialization from _bridge_enable() to _resume(), and
> >> de-initialize during the _suspend() - so that the phy_{init, exit}()
> >> take place once every resume/suspend cycle.
> > 
> > Is it okay to call phy_init() before writing MCTL_DPHY_CFG0 ?
> 
> The phy_init() is a no-op when we look at the D-Phy driver, which does
> not implement the _init() hook at all. So, in this case, all phy_init()
> call ever manages to do is book-keeping. Book-keeping that isn't
> required to be done every time we do a bridge enable/disable.
> But despite the no-op nature of the call, I guess it would still not
> make sense to call it before the reset assert done in MCTL_DPHY_CFG0.

Yes, please.

> Instead of moving it to resume(), I can keep phy_init() as is, and add
> phy_exit() in the bridge disable path, instead of the suspend path.
> 
> 
> Regards
> Aradhya
> 
> > 
> >>

> >> The order of calls still remains the same. phy_init() needs to be called
> >> before phy_power_on() - which happens still. What this patch changes is
> >> the frequency of the phy_init() call. Instead of it being called once
> >> every bridge enable/disable cycle, it is now being called once every
> >> resume/suspend cycle. This move has been considered safe after numerous
> >> tests with the hardware.
> >>
> >> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
> >> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> >> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> >> ---
> >>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 10 ++++++++--
> >>  1 file changed, 8 insertions(+), 2 deletions(-)
> > 

-- 
With best wishes
Dmitry
