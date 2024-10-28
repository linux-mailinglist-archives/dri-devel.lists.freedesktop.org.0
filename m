Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D933A9B31C4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F65610E4AC;
	Mon, 28 Oct 2024 13:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b2IFHo13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F6F10E4AC
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:34:13 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53a097aa3daso3680573e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730122452; x=1730727252; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h/gFo5P3Ww8t4SEEYAXGao1xK+VemSYBJS2VY80eGpI=;
 b=b2IFHo13/EpuWFvn+yySUd5/D4YYAwLLI5qNmd775YtDqZEXiGDcY63TT5JTvdfLee
 cdZJOPtU8UC1IryOApaXp3Gpqq3IyE2khM2JEad5d64U9IhOyic0CvwMOziTTIJzBJ3+
 ShVO/mvl3Xn9ZJR/5njwfu4SMRV8fxaXVyQT3SY955WXY/0TIMr2zyYpBfc6MmhL+12m
 UwZm9BwENM9alJaFW7iRX9//Gyhn1G2K9g11jmsSQ0J4tUauh7t5J/PAC9QnkHQkLTJr
 I/g4QBy2FGabOIqmESbzns7iyNAg7YCmjboVKki+2z3lxWBuR5pmdRhn26lMv84QELe/
 Agxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730122452; x=1730727252;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h/gFo5P3Ww8t4SEEYAXGao1xK+VemSYBJS2VY80eGpI=;
 b=ueWiRB4tgNdSQl6PRBlrXf2Nk61LgQnzQLlcytr6n6V5Vy7ChfJNN6rRfBEQCskFeQ
 TDS2z2aPifNdyrUJSTsjWq1cTEn6Q68NScnWD+k/lfrBeacKF2fjBNfveicXtUJXOPho
 QESX0ZRIF0UuTzmMGUpbBbjUp7uVq994oS2si5CYo8hZHankYZ1p9R1LOBbjR+ggzO9x
 1t6HuMyJnyiWtSfnvr7Gf4zc+GxwfVzFYGO0oJqvrlhdi/HG1/wXOsCHwBk8VX0GRUgI
 J0qyzYOSNWUNbjJ6qSMOI8qEhFDdC9Rm5hm+ruc8S8UZffNtYbBRR+DGm0zH1SittdbO
 G1Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqAKidjO8zTNkrfETAFHfxP8jcC6emZFvMCDgnXNoelCkKLCqZj4y7LmxrVoAj+ui7JM+1uW0OAQ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxdrw6qw2fBg/Z3bZBYCGUkyDQXWPA8UZ+MOd10mLyDfxO/73s0
 mQnboDlyV3f1QEAuQaN9iAjNtLOFGTgr3BHr7T3V7iATgfRVTK9vHPqhfYQtByw=
X-Google-Smtp-Source: AGHT+IFXnzMeykWMvF2BHdy48eIlWz7qcYhj6URlUTMPfqMe+ksPt1U8e6ZDLwPs7NJ0oyKpF8Fqzw==
X-Received: by 2002:a05:6512:e88:b0:536:a6c6:33f with SMTP id
 2adb3069b0e04-53b348ce5d5mr3297068e87.13.1730122451800; 
 Mon, 28 Oct 2024 06:34:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e124859sm1091735e87.64.2024.10.28.06.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 06:34:10 -0700 (PDT)
Date: Mon, 28 Oct 2024 15:34:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Greg KH <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
Message-ID: <mmmy4mmk435m6i4ic7aelkggzklrwv34vi7yam6mmasadffv2l@fi6ralq5e6vv>
References: <2024101837-crushed-emphasis-b496@gregkh>
 <20241020143629.GC28934@pendragon.ideasonboard.com>
 <2024102119-oversweet-labored-aa07@gregkh>
 <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh>
 <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
 <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
 <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
 <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
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

On Tue, Oct 22, 2024 at 07:37:01AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 22, 2024 at 12:12 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> >
> > > > > > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > > > > > in the TI driver does sound like a good idea to me...
> > > > > >
> > > > > > Great!
> > > >
> > > > > With the I2C adapter numbers, that becomes:
> > > > >
> > > > >     /sys/bus/auxiliary/devices
> > > > >     ├── ti_sn65dsi86.gpio.1
> > > > >     ├── ti_sn65dsi86.pwm.1
> > > > >     ├── ti_sn65dsi86.aux.1
> > > > >     ├── ti_sn65dsi86.bridge.1
> > > > >     ├── ti_sn65dsi86.gpio.4
> > > > >     ├── ti_sn65dsi86.pwm.4
> > > > >     ├── ti_sn65dsi86.aux.4
> > > > >     └── ti_sn65dsi86.bridge.4
> > > > >
> > > > > > adapter->nr instead like other aux subsystems already do.
> > > >
> > > > Unfortunately the devil is in the details, as usual: there can be
> > > > multiple instances of the sn65dsi86 bridge on a single I2C bus,
> > > > so adapter->nr is not guaranteed to generate a unique name.
> > >
> > > In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
> > > chip is always at bus address 0x2d so you can't have more than one on
> > > the same bus. Unless you added something funky atop it (like a mux of
> > > some sort) you might be OK.
> >
> > It's 0x2c on mine ;-)
> >
> >     8.5.1 Local I2C Interface Overview
> >     The 7-bit device address for SN65DSI86 is factory preset to 010110X
> >     with the least significant bit being determined by the ADDR control
> >     input.
> 
> Doh! I missed that in my search of the doc. I guess because they
> decided to specify the address in binary in that part so my searching
> for both the 7-bit and 8-bit I2C address didn't trigger. Oh well.
> 
> 
> > > > Changing the auxiliary bus to use the parent's name instead of the
> > > > module name, as suggested by Laurent, would fix that.
> > >
> > > Right. On my system dev_name() of the sn65dsi86 device is "2-002d". If
> > > we had a second on i2c bus 4, we'd have:
> > >
> > >     /sys/bus/auxiliary/devices
> > >     ├── 2-002d.gpio.0
> > >     ├── 2-002d.pwm.0
> > >     ├── 2-002d.aux.0
> > >     ├── 2-002d.bridge.0
> > >     ├── 4-002d.gpio.0
> > >     ├── 4-002d.pwm.0
> > >     ├── 4-002d.aux.0
> > >     └── 4-002d.bridge.0
> > >
> > > ...and I think that's guaranteed to be unique because all the i2c
> > > devices are flat in "/sys/bus/i2c/devices".
> >
> > Correct.
> 
> So given everything, using the dev_name() of the "parent" sounds
> pretty good and seems like it addresses everyone's concerns. Was there
> a part of the conversation where someone pointed out problems with it
> that I missed? Is the next step to post a patch implementing that?
> It'll change sysfs paths and dev names for everyone using AUX bus, but
> presumably that's OK?

It also requires changing in the way the auxiliary_match_id() works.
Currently matching is done using modname + ID.

So, maybe using MODNAME.NAME.parent-name.ID is better (e.g.
ti_sn65dsi86.gpio.2-002d.1). It will still require changes to the
match_id function, but they won't be that intrusive (one just has to
skip two parts of the name instead of skipping just one).

-- 
With best wishes
Dmitry
