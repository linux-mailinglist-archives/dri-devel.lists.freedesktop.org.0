Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8B62B1765
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C34A6E48F;
	Fri, 13 Nov 2020 08:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DAB88249
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 08:59:22 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id g11so2431103pll.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 00:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=no/VBwmUjyEkDBIEofBNskIYF3ICygqIU7/YLyjE5C4=;
 b=b/jcmDDMQAT1WbXCvjBYsCflryrWai8ZDgcuYqrDbfJVyYRszRnIqGdg8pN7ionBqy
 ptzYc7wrkbIYnHS5mXKB/s1CKc8bZXiuUkzYsxSD74LAm+Y+gN8Yw7+8sAHfRr8YSfjJ
 iCPhWBqgGWPURrzG0vtRy2S3bKBJh5DVFWuK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=no/VBwmUjyEkDBIEofBNskIYF3ICygqIU7/YLyjE5C4=;
 b=ArvuuF8itfewMmiLOoaXlTIDzCDgrYh7gASJulZ9VeHlBRit4ju8fXgRGUJ/9Tab0n
 zQPFhjWjEmZ1lbd/TyQJUpeNJpzd+vbzU1OIljSbdpnCjM60VoNy+7SRkgNTHONFh7V3
 k31ZKAOu6sZgCIrTjUIo9QbcKKUQ+2onnSJ2FA1FU1WJM3jZroZdUWrDOqwBAbGLSNnW
 HrneltVXrn0vZA7wz1ooqhKe1bBrbz7ekpUGMPrWEIjVGkkc2zcvkDvgb7X/1i0S6mLP
 qvdpBGgWIhJJh/yo9Orw1SU7/Uq4RrZVuu2UjHXYjW4QVjc1jaXiiIZHvJTz0+/qZQ59
 +x6w==
X-Gm-Message-State: AOAM532LfPZ3HNHMi8KW23laNXwVezgQcdbCNPyClxhOUkSd+Id8VfBq
 IugvWGe6MlGTQ2D+n798n25xpA==
X-Google-Smtp-Source: ABdhPJwf/qNRp3cdldTds8ed7cGrz7q2smzK8HoQ1pypne4fSV0HbvzbGqmxypGV6+H8R+U4q+Reig==
X-Received: by 2002:a17:902:eb42:b029:d6:ba60:ba41 with SMTP id
 i2-20020a170902eb42b02900d6ba60ba41mr24797270pli.0.1605171561915; 
 Thu, 12 Nov 2020 00:59:21 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
 by smtp.gmail.com with ESMTPSA id mv16sm5741013pjb.36.2020.11.12.00.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 00:59:21 -0800 (PST)
Date: Thu, 12 Nov 2020 00:59:20 -0800
From: Prashant Malani <pmalani@chromium.org>
To: Pi-Hsun Shih <pihsun@chromium.org>
Subject: Re: [PATCH] drm/bridge: anx7625: Add anx7625 port switching.
Message-ID: <20201112085920.GB1367855@google.com>
References: <20201112064051.3716968-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112064051.3716968-1-pihsun@chromium.org>
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, heikki.krogerus@linux.intel.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pi-Hsun,

I haven't gone through the code, but did have a high-level comment
(kindly see inline)

On Thu, Nov 12, 2020 at 02:40:40PM +0800, Pi-Hsun Shih wrote:
> When output 2 lanes DP data, anx7625 can output to either TX1/RX1 or
> TX2/RX2. In typical usage, these two TX/RX pairs corresponds to two
> orientations of typec.
> 
> On some board one anx7625 is used as DPI to DP converter for two typec
> ports. In this case, the TX1/RX1 and TX2/RX2 are connected to two usb
> muxes, which mux the DP data with the rest of the USB3 data, and
> connects to the two typec ports.
> 
> This patch adds option for anx7625 to acts as a usb typec switch and
> switch output lanes based on the typec orientation, or acts as two usb
> typec mux and switch output lanes depending on whether the two ports
> currently has DP enabled.
> 
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> 
> ====================================================================
> 
> This is an attempt to use typec framework with how we're using anx7625
> on Chrome OS asurada board.
> 
> An example of the dts for the two ports case can be found at
> https://crrev.com/c/2507199/6

Do you plan on submitting DT schemas & bindings documentation for the switch(es)
that are intended to be used?

I would strongly recommend that for usb-c-connector since AFAIK they don't exist, and
I don't believe there is explicit support for them in the Type C connector class framework
(even .

IMO this would be needed to ensure an implementation here doesn't break
in the event of modifications to the connector class framework (or Type
C port drivers like cros-ec-typec) in the future. I think some patches
were floated for this for orientation switch [1] so those might provide
some hints about how to proceed.

I've CC-ed Heikki (Type C maintainer) in case he has additional comments regarding this.

> 
> Sending this as a RFC patch since I'm not sure about the best approach
> here. Should the logic of switching output lanes depends on ports be
> coupled inside anx7625 driver, or in another driver, or is there
> any existing way to accomplish this?

Might be good to add [RFC] as a tag instead of [PATCH] in case this
iteration is chiefly to solicit comments.

Best regards,

-Prashant

[1]:
https://lore.kernel.org/linux-usb/1604403610-16577-1-git-send-email-jun.li@nxp.com/
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
