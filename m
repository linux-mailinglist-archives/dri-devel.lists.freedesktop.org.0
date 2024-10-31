Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FD69B86AB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 00:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A4E10E946;
	Thu, 31 Oct 2024 23:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wkDl05Kt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C95710E946
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 23:08:55 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539f4d8ef84so1961396e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 16:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730416133; x=1731020933; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=t7irn5X6Q4RzDqBkS5zaHUO06iLZ9k//3tTZHqfIElI=;
 b=wkDl05KtPpTjYlqmXU7euibwZWZJWtYakQ/OYADBBPntMOKzaFDkTFl6zRvBpquF4d
 3JdXPu+2JK9sbPyg2l5IAYltST1XcXkC/q1BNMXClFBYZyH282Cp2cwEQmhWqvO7nxrG
 nx0xTvIK6qYfS2KJVfalbDmHtrX6jUW2TnfHLpysnyEFOZ12Bc09avHc4t8XSQ7Lp0Iw
 bRbnlGA/R2tEzgMtWmJwTTRs+Vjp/yzI/ThDwBkQuUfrvU1pa1M8DZKacK7vJXG+SSDL
 DK6cbnXY9BqlgRXdCkRsHyKDB0wQYldW0QLWnyeVx2bVnR1rlIhSaxRwaIRmIov03QbS
 Ln9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730416133; x=1731020933;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7irn5X6Q4RzDqBkS5zaHUO06iLZ9k//3tTZHqfIElI=;
 b=ZuItxP2H5Vs6YSt/3WTj7ElxQRyBqWnhfDubtX7AcTkgVEzH2nuBlWNWDXkPXzp+AP
 IaxD6xnD0rdkxxorhyD0kq5uBeJCDjfa5hDcFZr73P8KX0ehc1dN9ziOenq6yBp/32DP
 dsN1ajgia3haUVqeWuVZGX5bzCqzHTTRJURNmrSfgZj/mGHbPzSztB7q4VeJHSrfr3bK
 tFAB9u94IVweyPARMu/KSPPsv6NKiCKpyQk7DWwf+Dr3JGbAa2p/tGXizhcTbgrYbUKk
 2hFxcaojhaQ19HYkQoJdV+dI9T1Mq0NBN19b0NELODaIyrCEJtMuyWQ+XFFN2yFySrvd
 vFKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJU4XfdhlFASTjh2l3U/T9U7a/67xr16nLqS6USSxH6GhhqrBbzc3h0IENvoSeX15euJy/JuyIvPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCYy0apgNfefTsMNrlHEAr2WFaIoLyYE3FIcqEBkUDJTiCCezV
 +x17GKvFhhHYSIB4sfXbAzIc9clQaninclvBy/bT7a+bMCmQk1Wruc9qxx4jO7U=
X-Google-Smtp-Source: AGHT+IGcbH47VZVJ0vUumHdL7DXTh2Bwm7YoZFL4FZ1O5B93PT2hWYeoRotGnuNV/K83ckBsAxgGZw==
X-Received: by 2002:a05:6512:ac3:b0:536:56d8:24b4 with SMTP id
 2adb3069b0e04-53c79e15746mr2875337e87.5.1730416133378; 
 Thu, 31 Oct 2024 16:08:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bde3a89sm349830e87.285.2024.10.31.16.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 16:08:51 -0700 (PDT)
Date: Fri, 1 Nov 2024 01:08:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Doug Anderson <dianders@chromium.org>, Greg KH <gregkh@linuxfoundation.org>, 
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
Message-ID: <ujvjmcq3fvvu32dkrxqhsmqfgcki2e46f3cq3vdwq2okbbxyzf@ih2t2qkk3tpf>
References: <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh>
 <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
 <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
 <CAD=FV=VHxvbofWmq6bPVcVokn4kqZ9Bckytw5cv-xYFEGpEtcg@mail.gmail.com>
 <CAMuHMdXAKH224=fFjohM0Kg702bc7xP+rErtiNDAu+LgFBhX2Q@mail.gmail.com>
 <CAD=FV=UOqoRSwPxn9BFwmVTGhQptTyS0u8EEjYp0NA8ojOBqdA@mail.gmail.com>
 <mmmy4mmk435m6i4ic7aelkggzklrwv34vi7yam6mmasadffv2l@fi6ralq5e6vv>
 <CAMuHMdV3sEPW+k_ObTxQiLPdSsNpMRKwtUvtRt_6njy=WW4N4Q@mail.gmail.com>
 <20241030102846.GB14276@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241030102846.GB14276@pendragon.ideasonboard.com>
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

On Wed, Oct 30, 2024 at 12:28:46PM +0200, Laurent Pinchart wrote:
> On Wed, Oct 30, 2024 at 11:25:40AM +0100, Geert Uytterhoeven wrote:
> > On Mon, Oct 28, 2024 at 2:34 PM Dmitry Baryshkov wrote:
> > > On Tue, Oct 22, 2024 at 07:37:01AM -0700, Doug Anderson wrote:
> > > > On Tue, Oct 22, 2024 at 12:12 AM Geert Uytterhoeven wrote:
> > > > > > > > > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > > > > > > > > in the TI driver does sound like a good idea to me...
> > > > > > > > >
> > > > > > > > > Great!
> > > > > > >
> > > > > > > > With the I2C adapter numbers, that becomes:
> > > > > > > >
> > > > > > > >     /sys/bus/auxiliary/devices
> > > > > > > >     ├── ti_sn65dsi86.gpio.1
> > > > > > > >     ├── ti_sn65dsi86.pwm.1
> > > > > > > >     ├── ti_sn65dsi86.aux.1
> > > > > > > >     ├── ti_sn65dsi86.bridge.1
> > > > > > > >     ├── ti_sn65dsi86.gpio.4
> > > > > > > >     ├── ti_sn65dsi86.pwm.4
> > > > > > > >     ├── ti_sn65dsi86.aux.4
> > > > > > > >     └── ti_sn65dsi86.bridge.4
> > > > > > > >
> > > > > > > > > adapter->nr instead like other aux subsystems already do.
> > > > > > >
> > > > > > > Unfortunately the devil is in the details, as usual: there can be
> > > > > > > multiple instances of the sn65dsi86 bridge on a single I2C bus,
> > > > > > > so adapter->nr is not guaranteed to generate a unique name.
> > > > > >
> > > > > > In the case of sn65dsi86 I think we'd actually be OK. The TI bridge
> > > > > > chip is always at bus address 0x2d so you can't have more than one on
> > > > > > the same bus. Unless you added something funky atop it (like a mux of
> > > > > > some sort) you might be OK.
> > > > >
> > > > > It's 0x2c on mine ;-)
> > > > >
> > > > >     8.5.1 Local I2C Interface Overview
> > > > >     The 7-bit device address for SN65DSI86 is factory preset to 010110X
> > > > >     with the least significant bit being determined by the ADDR control
> > > > >     input.
> > > >
> > > > Doh! I missed that in my search of the doc. I guess because they
> > > > decided to specify the address in binary in that part so my searching
> > > > for both the 7-bit and 8-bit I2C address didn't trigger. Oh well.
> > > >
> > > > > > > Changing the auxiliary bus to use the parent's name instead of the
> > > > > > > module name, as suggested by Laurent, would fix that.
> > > > > >
> > > > > > Right. On my system dev_name() of the sn65dsi86 device is "2-002d". If
> > > > > > we had a second on i2c bus 4, we'd have:
> > > > > >
> > > > > >     /sys/bus/auxiliary/devices
> > > > > >     ├── 2-002d.gpio.0
> > > > > >     ├── 2-002d.pwm.0
> > > > > >     ├── 2-002d.aux.0
> > > > > >     ├── 2-002d.bridge.0
> > > > > >     ├── 4-002d.gpio.0
> > > > > >     ├── 4-002d.pwm.0
> > > > > >     ├── 4-002d.aux.0
> > > > > >     └── 4-002d.bridge.0
> > > > > >
> > > > > > ...and I think that's guaranteed to be unique because all the i2c
> > > > > > devices are flat in "/sys/bus/i2c/devices".
> > > > >
> > > > > Correct.
> > > >
> > > > So given everything, using the dev_name() of the "parent" sounds
> > > > pretty good and seems like it addresses everyone's concerns. Was there
> > > > a part of the conversation where someone pointed out problems with it
> > > > that I missed? Is the next step to post a patch implementing that?
> > > > It'll change sysfs paths and dev names for everyone using AUX bus, but
> > > > presumably that's OK?
> > >
> > > It also requires changing in the way the auxiliary_match_id() works.
> > > Currently matching is done using modname + ID.
> > 
> > Right, so just using the parent's name instead of modname won't work,
> > as the former is not a fixed string.
> > 
> > > So, maybe using MODNAME.NAME.parent-name.ID is better (e.g.
> > > ti_sn65dsi86.gpio.2-002d.1). It will still require changes to the
> > > match_id function, but they won't be that intrusive (one just has to
> > > skip two parts of the name instead of skipping just one).
> > 
> > IMHO this is becoming too complex. What if the parent's name contains
> > a period?
> > 
> > So just using ida_alloc() in the caller seems like the most
> > straight-forward solution.
> 
> Why would we duplicate that in every user, when it should really be the
> responsibility of the bus ? We need a better solution.

Make AUX bus keep a hashtable of parent -> ID relationship and
get from the table / allocate via IDA the ID each time somebody adds new
AUX device?

-- 
With best wishes
Dmitry
