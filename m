Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A21B55DB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01C06E339;
	Thu, 23 Apr 2020 07:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00576E3C7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 10:26:44 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id p25so826817pfn.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 03:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=+LkW/BzJ32FsN2pGJCrXVy4OKBpG4PL3ExgFBZeWAHg=;
 b=l/AgPPBVB7ZnyY6U66gMOrbJvBgO3tQRcVjGDqLNEBuZMo0KRrdys14l5NrYS2uqIb
 TBmsxmEicXKLeUCGAnLzeuOJkVu5w8L8TZgR4gHKWn/0MJHFk+9T3pv9vi2QHq6g8oNa
 D1iZtgy8CyjNCJQqw0mjxle4ztTML67IsaPgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=+LkW/BzJ32FsN2pGJCrXVy4OKBpG4PL3ExgFBZeWAHg=;
 b=o0HB5V7/dNtGhNYdoXiC7cR3TdceQJXkXzG8XjnEPAfmMpweYNmZaDewGQgdyXK+GD
 LgbomGheN+SARMXkr29cf46J3Cup7nQ1fU9sFLHZ10DvOe3JI4L3yxiiddccwav1lMCB
 sy+0lTSrBu3kYy7/ol6Bkx8TNTt7KfBAbPmXxtq+Q9pA8eHDU88EcSZL2lZrkyiWheVP
 hKImVK3SdwdurLvkNc9MtOWcrR5rekIJdntI3CDJd4cE2FeUH3s7rQAyPwhlh6q5ZJjV
 6Ybi+d2qrmr9QStGowU3OJCg+AqWRN5SSbxGKAT7cQPCMPc0LzDxkuPoF86tdiST+UxL
 VHRQ==
X-Gm-Message-State: AGi0PuYuN46fYIh4cnVVQhak4knRHdtAZHWyMgStbLjEuFTHlKOmfoSl
 EJOZwgw2T56SWYYKjb9w44UMww==
X-Google-Smtp-Source: APiQypLib3O6RbgwVKPe4RvKuaAL9L9i2kDZxvwLTOMEd5N7BqAlzniwrFclGQhmjQRCmw7yE1+ZTQ==
X-Received: by 2002:aa7:96e8:: with SMTP id i8mr26630487pfq.222.1587551204530; 
 Wed, 22 Apr 2020 03:26:44 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id i6sm5080712pfg.138.2020.04.22.03.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 03:26:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200420220458.v2.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
References: <20200421050622.8113-1-dianders@chromium.org>
 <20200420220458.v2.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
Subject: Re: [PATCH v2 5/6] dt-bindings: drm/bridge: ti-sn65dsi86: Document
 no-hpd
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Laurent.pinchart@ideasonboard.com,
 a.hajda@samsung.com, airlied@linux.ie, bgolaszewski@baylibre.com,
 daniel@ffwll.ch, linus.walleij@linaro.org, narmstrong@baylibre.com,
 robh+dt@kernel.org, spanda@codeaurora.org
Date: Wed, 22 Apr 2020 03:26:43 -0700
Message-ID: <158755120316.159702.16847202705854698366@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-04-20 22:06:21)
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
> found it useful implement support for the HW HPD pin on the bridge.

useful to implement?

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
> 
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
