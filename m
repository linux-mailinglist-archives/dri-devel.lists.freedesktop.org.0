Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06F2D3D7D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498D26E9D8;
	Wed,  9 Dec 2020 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E8C6E046
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 22:02:19 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id 15so181409oix.8
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 14:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aFLiOxATEwVPZ54YnQmIiBEk09z7ej1KbGicavDyd/4=;
 b=JR5oMMWrkAg9dt9AY6ede7oX5k900mPAfz3VEE6vi4Aodp+Mv/ZmXxwWkEVyU+O5ca
 BXjh8rkSKVV0BbEu9cnYsrZQI3ffG3PcQpW1PlkYtsV3xjAd8Rm+D8IWTJ8lO4Y7HiyF
 z8PDX7Um6dRXa1umfShWKijS/16y02R7nCsx/vlK5HojffTg8jQhQHxCcf9EsEH61U7C
 XMVR7d2CRplLo6u8Chy8e4j7PkIMciw++68T7CD0hP56A1wjrsrru3Bvuuw/KWXv/WB9
 MIii2wzQ+eHBPUj9ENe8/sFkSwtihYuT4s3QokRdI5Co+A4tf+Dl4OHE2yucvFkrTph7
 dp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aFLiOxATEwVPZ54YnQmIiBEk09z7ej1KbGicavDyd/4=;
 b=q0HYiEpQCuqb+8l/aNa1YqxgtyfiQRN+sxc2qTeyoCjLdovVK6xQVj1EH719WIbXZM
 dZt4+c7PDhq+EJ4gt47V+96fpuuzLvZbsh6spWwo406qWNB4byApcM8O/yEqPfJhwaXE
 8If3IvgjiAuXbipwmKkqemm8lEuEAfE3GHajLDCRT6ljfxBKZZ+kz2BExJ6ct5M/ZUde
 nYvdkWywSz9cSeQOpMn3R8tu/hc20shpjvepmlolnGJ+jh93EEWLW7i9xpXvlGoFT5hZ
 QMbuI2v44mxI0bo89cnirzW7gesoJu+LToUL1eRBq8haurIHds/AsoqtI3ut3bdgq3PE
 mLkA==
X-Gm-Message-State: AOAM530peztnIic08BtNpM6hMxLfzdOx6dEqcI65eiIb8pcLNE3AwcQt
 udaqwrnqTQm8bAq3b8V2Nzw7tA==
X-Google-Smtp-Source: ABdhPJxEBsXdgE6F4kOII6gY46qvCzgKEzVaGS1kOzteGyGNXa++TBi8fx6esKChL9Avx/cMo5bgbA==
X-Received: by 2002:aca:afd0:: with SMTP id y199mr4415574oie.7.1607464939235; 
 Tue, 08 Dec 2020 14:02:19 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id h7sm18126otq.21.2020.12.08.14.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 14:02:18 -0800 (PST)
Date: Tue, 8 Dec 2020 16:02:16 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH] drm/panel: Make backlight attachment lazy
Message-ID: <X8/36HXL1IYPXA0J@builder.lan>
References: <20201208044446.973238-1-bjorn.andersson@linaro.org>
 <X891/LvEJT1bLtjH@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X891/LvEJT1bLtjH@ulmo>
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 08 Dec 06:47 CST 2020, Thierry Reding wrote:

> On Mon, Dec 07, 2020 at 10:44:46PM -0600, Bjorn Andersson wrote:
> > Some bridge chips, such as the TI SN65DSI86 DSI/eDP bridge, provides
> > means of generating a PWM signal for backlight control of the attached
> > panel. The provided PWM chip is typically controlled by the
> > pwm-backlight driver, which if tied to the panel will provide DPMS.
> > 
> > But with the current implementation the panel will refuse to probe
> > because the bridge driver has yet to probe and register the PWM chip,
> > and the bridge driver will refuse to probe because it's unable to find
> > the panel.
> 
> What you're describing is basically a circular dependency. Can't we get
> rid of that in some other way? Why exactly does the bridge driver refuse
> to probe if the panel can't be found?
> 
> In other words, I see how the bridge would /use/ the panel in that it
> forward a video stream to it. But how does the panel /use/ the bridge?
> 

Yes, this is indeed a circular dependency between the components.

The involved parts are:
* the bridge driver that implements the PWM chip probe defers on
  drm_of_find_panel_or_bridge() failing to find the panel.
* the pwm-backlight driver that consumes the PWM channel probe defer
  because the pwm_chip was not registered by the bridge.
* the panel that uses the backlight for DPMS purposes probe defer
  because drm_panel_of_backlight() fails to find the pwm-backlight.

I looked at means of postponing drm_of_find_panel_or_bridge() to
drm_bridge_funcs->attach(), but at that time "deferral" would be fatal.
I looked at registering the pwm_chip earlier, but that would depend on a
guarantee of the pwm-backlight and panel driver to probe concurrently.
And the current solution of not tying the backlight to the panel means
that when userspace decides to DPMS the display the backlight stays on.


The proposed solution (hack?) means that DPMS operations happening
before the pwm-backlight has probed will be missed, so it's not perfect.
It does however allow the backlight on my laptop to turn off, which is a
big improvement.

But I'm certainly welcome to suggestions.

Regards,
Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
