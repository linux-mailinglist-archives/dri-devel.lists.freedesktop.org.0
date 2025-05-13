Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29291AB5514
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 14:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C8F10E598;
	Tue, 13 May 2025 12:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DKf3wwGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791B610E598
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 12:43:08 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ad21a5466f6so799898166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747140187; x=1747744987; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3SBXEjjhVC1EuH3UOI0/Jmhx9LET+hs3zHGAFUvLwZE=;
 b=DKf3wwGjRxaK18wnu530mvOOGYS4e4/vWvyCTsogxdreCA/f5aonskPCu0WT0uXFZP
 zwwE0kb89D0KUa33yuK+1v7p1q6O16u6ikbzP+gvH6o0F6nYFziP2rnYwNFfuW9Ba/28
 bxdIiKIh/l+g284IW00pJkgRNgnj0936QWOJFbgfKQWELTBUYj7F978apaR5jdaG1Yeb
 Qbgiyi4kVZIg6KKSgOC89ruIUCjmKxO10r7SZtDtu+1FJwMa/Gx5YlQSnbGXsHL+r9PD
 n1c/9dGCEoou6T1k+d/5sR1VGIRzEnno+g6OF/3isYY++DY7R/+AhdGnXkg7/CVo5lQL
 PXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747140187; x=1747744987;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3SBXEjjhVC1EuH3UOI0/Jmhx9LET+hs3zHGAFUvLwZE=;
 b=XYh4EQLi1+I2uZRjvC7LJq8F5ya1xX4WjOO1o89I2VJMlLAdg/EhfyeVwr7+x3L30/
 cvRJqUA6EV22eG//R6biSlEFEp5JtEUbrOAeA8QsId1eF8RGgsy6pbalW/hjJK72HKhD
 vRaPUaW9HghaZHTf9qo+3MSIUTwscUepfH98fklq0mEniO2DldIr16ru0+d1Ag3HkLgC
 VTiHCHuvK7OlHzR/svvAfEcwCWpDaZGw6LESkEN67m4rvcs88jL62jUUm0Cp3kENDVlW
 KgAjxfP+ulexabvoC53mMfA7soLiDkuWbm+Urzi/VBgHSH2b39DUIFYEFMubgJ9tXq+8
 dHnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeOMkXpd75NHJdE96cnKozxYUwNGTxwMYY+GujOmc62TFvfqreCTaHDdzNe90J/tiV0oQL/CKOE8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyclqdzlXaGglz7U6gpZp17oaxH/MaGH2nNvwqhd9P+Op0ebKNY
 HJoTQwB1eb+ycT2ZVEoOLxgw0Xuh3a3e6SZatVSI7ehXPsqxSl2C
X-Gm-Gg: ASbGncs47kMjkQ6eQKzyh1yONJW+naM3v+IjBLL8aoFXx7wJlikU6/Xieta6sLJ9cvB
 8YmQLbzwmQy+qbNOl6VWTRAwtOUMD22ettm0CBXAuBmiJ6Nscjy7ZQmzFyrflXgzcXhE39QPB5c
 eJkC590LF4IauoapK67YCA0j8VdUJgwORmzs+xzaIWdlev1AxXpe4Ywf08oXEjPXbdLkMhswyyv
 XnyH6ZaE4kqfhHcuGGhTsAyg7RlmEViTbdncnNMon055oZs58j1n8tykeqL4oihUSy7+nRuqYR2
 hPe69e0T4hHTVlxig3dFIVMEHObCcXfM6AzZUOHZrqtGAhnfMr0CVHbU+Vy0Ak6g9hNS37ozU1/
 ibBLlKqMsTKzG6tz61yYrrmTbw1gcyqHb
X-Google-Smtp-Source: AGHT+IEEJwaGQNEs+ETh8ls4sgLALLfU3bE4rJnfCyJldPf5oRxxddJO1sK4tUJgKQ3fhtsC0sJiuw==
X-Received: by 2002:a17:907:2ce4:b0:ad2:3c4e:2fc2 with SMTP id
 a640c23a62f3a-ad4d52be8e5mr333035766b.29.1747140186540; 
 Tue, 13 May 2025 05:43:06 -0700 (PDT)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch.
 [83.173.201.248]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21937b329sm773797466b.78.2025.05.13.05.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 05:43:06 -0700 (PDT)
Date: Tue, 13 May 2025 14:43:04 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: Doug Anderson <dianders@chromium.org>, max.krummenacher@toradex.com,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Use HPD in a DP use case
Message-ID: <aCM-WPobRYwUP7RC@toolbox>
References: <20250501074805.3069311-1-max.oss.09@gmail.com>
 <CAD=FV=W=NjbM9ZXLw7gH-_4CnpU7QU=sKCVQVxgmgP-Qpt-3hg@mail.gmail.com>
 <aBo8elFPYgPleK5n@toolbox>
 <68f0c5ef-ac51-4652-b829-2bc56c5a75c8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68f0c5ef-ac51-4652-b829-2bc56c5a75c8@ti.com>
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

On Wed, May 07, 2025 at 03:45:52PM +0530, Jayesh Choudhary wrote:
> Hello Max,
> 
> On 06/05/25 22:14, Max Krummenacher wrote:
> > On Thu, May 01, 2025 at 08:38:15PM -0700, Doug Anderson wrote:
> > > Hi,
> > > 
> > > On Thu, May 1, 2025 at 12:48 AM <max.oss.09@gmail.com> wrote:
> > > > 
> > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > 
> > > > The bridge driver currently disables handling the hot plug input and
> > > > relies on a always connected eDP panel with fixed delays when the
> > > > panel is ready.
> > > 
> > > Not entirely correct. In some cases we don't have fixed delays and
> > > instead use a GPIO for HPD. That GPIO gets routed to the eDP panel
> > > code.
> > 
> > Will reword in a v2
> > 
> > > 
> > > 
> > > > If one uses the bridge for a regular display port monitor this
> > > > assumption is no longer true.
> > > > If used with a display port monitor change to keep the hot plug
> > > > detection functionality enabled and change to have the bridge working
> > > > during runtime suspend to be able to detect the connection state.
> > > > 
> > > > Note that if HPD_DISABLE is set the HPD bit always returns connected
> > > > independent of the actual state of the hot plug pin. Thus
> > > > currently bridge->detect() always returns connected.
> > > 
> > > If that's true, it feels like this needs:
> > > 
> > > Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge
> > > connector operations for DP")
> > > 
> > > ...and it would be nice to get Laurent to confirm. Seems weird that he
> > > wouldn't have noticed that.
> > 
> > I retested by adding a print in ti_sn_bridge_detect().
> > With the HPD_DISABLE bit set the HPD_DEBOUNCED_STATE is always true
> > resulting in reporting always connected.
> > 
> > When one does not set the HPD_DISABLE bit and is in runtime suspend
> > (i.e. detect() enables the bridge with its call to
> > pm_runtime_get_sync() ) then the HPD_DEBOUNCED_STATE is only set
> > after the debounce time. As it is immediately read here detect()
> > always reports disconnected.
> > 
> 
> I have same observations on my end.
> 
> > > 
> > > 
> > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > 
> > > > ---
> > > > 
> > > >   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
> > > >   1 file changed, 11 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > index 01d456b955ab..c7496bf142d1 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > @@ -333,9 +333,11 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> > > >           * If HPD somehow makes sense on some future panel we'll have to
> > > >           * change this to be conditional on someone specifying that HPD should
> > > >           * be used.
> > > > +        * Only disable HDP if used for eDP.
> > > >           */
> > > > -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > > > -                          HPD_DISABLE);
> > > > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
> > > > +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> > > > +                                  HPD_DISABLE, HPD_DISABLE);
> > > > 
> > > >          pdata->comms_enabled = true;
> > > > 
> > > > @@ -357,6 +359,10 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
> > > >          struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
> > > >          int ret;
> > > > 
> > > > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort &&
> > > > +           pdata->comms_enabled)
> > > > +               return 0;
> > > > +
> > > 
> > > I don't understand this part of the patch. You're basically making
> > > suspend/resume a no-op for the DP case? I don't think that's right...
> > 
> > That is what I wanted to do as nothing else worked ...
> > Probably there are better solutions.
> > 
> > > 
> > > First, I don't _think_ you need it, right? ...since "detect" is
> > > already grabbing the pm_runtime reference this shouldn't be needed
> > > from a correctness point of view.
> > 
> > Correct, it shouldn't. However if the bridge is coming out of
> > powerup/reset then we have to wait the debounce time time to get the
> > current state of HPD. The bridge starts with disconnected and only
> > sets connected after it seen has the HPD pin at '1' for the debounce
> > time.
> > 
> > Adding a 400ms sleep would fix that.
> > 
> 
> 
> While adding this delay fixes the detect issue, it could lead to other
> problems.
> Detect hook is called every 10 sec and considering that, 400ms is a
> considerable amount of time. And it could cause performance issues like
> frame drops and glitches in display.
> 
> For 1920x1080@60fps resolution, when I run weston application, I see
> around ~24 frames being dropped every 10 sec with visual glitch in
> display. This seems consistent with 400ms delay for 60fps or 16.67ms per
> frame (24*16.67ms).
> 
> root@j784s4-evm:~# weston-simple-egl
> libEGL warning: MESA-LOADER: failed to open tidss:
> /usr/lib/dri/tidss_dri.so: cannot open shared object file: No such file or
> directory (search paths /usr/lib/dri, suffix _dri)
> 
> 276 frames in 5 seconds: 55.200001 fps
> 301 frames in 5 seconds: 60.200001 fps
> 277 frames in 5 seconds: 55.400002 fps
> 301 frames in 5 seconds: 60.200001 fps
> 277 frames in 5 seconds: 55.400002 fps
> 301 frames in 5 seconds: 60.200001 fps
> 277 frames in 5 seconds: 55.400002 fps
> 301 frames in 5 seconds: 60.200001 fps
> 277 frames in 5 seconds: 55.400002 fps
> 301 frames in 5 seconds: 60.200001 fps
> 277 frames in 5 seconds: 55.400002 fps
> 301 frames in 5 seconds: 60.200001 fps
> 278 frames in 5 seconds: 55.599998 fps
> ^Csimple-egl exiting
> root@j784s4-evm:~#
> 
> > > 
> > > Second, if you're looking to eventually make the interrupt work, I
> > > don't think this is the right first step. I think in previous
> > > discussions about this it was agreed that if we wanted the interrupt
> > > to work then we should just do a "pm_runtime_get_sync()" before
> > > enabling the interrupt and then a "pm_runtime_put()" after disabling
> > > it. That'll keep things from suspending.
> > 
> > The HW I use doesn't has the interrupt pin connected. So for me that is
> > out of scope but should of course work.
> > 
> > > 
> > > Does that sound correct, or did I goof up on anything?
> > 
> > If I remove disabling suspend/resume and fix detect() to report the
> > 'correct' HPD state in both runtime pm states I now get another issue
> > after disconnecting and then reconnecting the monitor:
> > 
> > [   50.035964] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read lane count (-110); assuming 4
> > [   50.212976] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read eDP rev (-110), assuming 1.1
> > [   50.389802] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read max rate (-110); assuming 5.4 GHz
> > [   50.686572] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Link training failed, link is off (-5)
> > 
> > monitor stays black without signals.
> > 
> > So it seems the bridges internal state is not completely restored by
> > the current code. Looking into that now.
> > 
> 
> I have seen such link training failures occasionally when the
> display connector is not connected but the state is not reflected
> correctly.
> Maybe it could be attributed to long polling duration???
> Are you observing it even on re-runs?

I think it is caused by the used hardware allowing to control the enable
signal but not controlling the power supplies.
If that is really true I have yet to find out.

> 
> 
> > > -Doug
> > 
> > Regards
> > Max
> 
> 
> Warm Regards,
> Jayesh

In my opinion we should drop this patch in favour of Jayesh's V2 [1].
I will comment there.

Regards
Max

[1] https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/
