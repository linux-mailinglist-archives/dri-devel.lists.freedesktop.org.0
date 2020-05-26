Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25EE1E3264
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 00:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB296E233;
	Tue, 26 May 2020 22:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA646E266
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 22:22:24 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id q18so1000037ilm.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 15:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ynq91C3bWjCUnWc0GV/GZg7ncDaeExN2lTxhHszV0qY=;
 b=b4Ku/dnuvRgQ4lg5cgZKrGrEAaSR0xbozPpDqdBYUwnTchf2uL38E/5Zxm9bpRP8YX
 MjkqFxkTRDwFJgYqsuD2eXum/zJARRVnhD26K1voBRdGduETp5he4ry0feYINUF+mNZz
 I7Unfk1zgHK23i016P4BSW9+gvu0lSrHsYH/+ZxI59ix1MfY0Fv9dHcZOJAlByXTHbL3
 ggDwb/xIpReEFXBtDmUYEPMXurPsSDQDAkVMIgSXjHgTpI0RdEKlnkE3AP6m7FZ88kU2
 J8vrBSr58vKeFll/aLqdNkp1/Oasvsrjnq6jIm8EiT2o1JgXFvUHIW6u00jnp7AebsfV
 vRQA==
X-Gm-Message-State: AOAM530AsMO2nGQERDhKElpLMDtHBTELTMJprlBDB88srUIcD42LgtVK
 J8+evFRXxpB0RY2HJaNCXg==
X-Google-Smtp-Source: ABdhPJz4zwTFycpM7xWxPlcIjR9So1dYYKyguqhio4ecnACld0RI8Pfko2UrIAIq7kJ0pfTEHAQqMw==
X-Received: by 2002:a05:6e02:e46:: with SMTP id l6mr3316013ilk.1.1590531744025; 
 Tue, 26 May 2020 15:22:24 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id b18sm609005ilh.77.2020.05.26.15.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 15:22:23 -0700 (PDT)
Received: (nullmailer pid 489202 invoked by uid 1000);
 Tue, 26 May 2020 22:22:22 -0000
Date: Tue, 26 May 2020 16:22:22 -0600
From: Rob Herring <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v6 3/3] dt-bindings: drm/bridge: ti-sn65dsi86: Document
 no-hpd
Message-ID: <20200526222222.GA467364@bogus>
References: <20200513215902.261547-1-dianders@chromium.org>
 <20200513145807.v6.3.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513145807.v6.3.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 a.hajda@samsung.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 narmstrong@baylibre.com, jeffrey.l.hugo@gmail.com, spanda@codeaurora.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 bgolaszewski@baylibre.com, jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com,
 linux-gpio@vger.kernel.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 02:59:02PM -0700, Douglas Anderson wrote:
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has a dedicated hardware
> HPD (Hot Plug Detect) pin on it, but it's mostly useless for eDP
> because of excessive debouncing in hardware.  Specifically there is no
> way to disable the debouncing and for eDP debouncing hurts you because
> HPD is just used for knowing when the panel is ready, not for
> detecting physical plug events.
> 
> Currently the driver in Linux just assumes that nobody has HPD hooked
> up.  It relies on folks setting the "no-hpd" property in the panel
> node to specify that HPD isn't hooked up and then the panel driver
> using this to add some worst case delays when turning on the panel.
> 
> Apparently it's also useful to specify "no-hpd" in the bridge node so
> that the bridge driver can make sure it's doing the right thing
> without peeking into the panel [1].  This would be used if anyone ever
> found it useful to implement support for the HW HPD pin on the bridge.
> Let's add this property to the bindings.
> 
> NOTES:
> - This is somewhat of a backward-incompatible change.  All current
>   known users of ti-sn65dsi86 didn't have "no-hpd" specified in the
>   bridge node yet none of them had HPD hooked up.  This worked because
>   the current Linux driver just assumed that HPD was never hooked up.
>   We could make it less incompatible by saying that for this bridge
>   it's assumed HPD isn't hooked up _unless_ a property is defined, but
>   "no-hpd" is much more standard and it's unlikely to matter unless
>   someone quickly goes and implements HPD in the driver.
> - It is sensible to specify "no-hpd" at the bridge chip level and
>   specify "hpd-gpios" at the panel level.  That would mean HPD is
>   hooked up to some other GPIO in the system, just not the hardware
>   HPD pin on the bridge chip.

I would say 'no-hpd' belongs wherever HPD is broken. So it may still 
make sense in the panel. (Otherwise, it needs to be removed from 
panel-common.yaml and some panel bindings, right?)
 
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

In any case,

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
