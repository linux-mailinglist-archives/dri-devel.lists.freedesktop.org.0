Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 241EF2B1755
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387616E461;
	Fri, 13 Nov 2020 08:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F2D6E10D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 09:07:43 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id me8so6614161ejb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 01:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h9u5Hd/k602S0Bq8sFpKbzZCXBppMuyyaNJFma4F5QE=;
 b=ATw238UzY8CkoOP/BcuZxyhhEruWXvBv8RLXARErrKNDzHlh6KQFXQC0ncFMsuC6ua
 gpjKPJRjXUvAgADluKLG9wSZ7LJQtQ0xNMbWxfh4kTqfFGhBr0FhHCvt+Obu9WvUEmMm
 K6tfy6kj79u1gZU1cSoMNa9kf8Ph4Ev1Vv0sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h9u5Hd/k602S0Bq8sFpKbzZCXBppMuyyaNJFma4F5QE=;
 b=ojpQ1+AgutsI2Pna/mK3OZ+/Upop8cYfBABa8hRm+LLFgnQ/ukcRoG1Ok6UTJk5826
 efLzK9+wVFQVOzv/1Qt7cfvonTSzONzEkcD447ku6cOFbBuPpvKJNP9FYdR0Bgt3ksLi
 kx74W2Vo27l8ZEmZ98JqnYbJ9L8q8u7DE9kD4tZTVTaDHragGaIoqQibfgwj4EEBolLU
 1n647GAAKYpqUDT/ZQN/uDcs0RvL5JYxs6RkuYeYBdsaYxBRktLWrWR8O/EoJy3K5PXD
 xCnU1UXo5LbdoouaSFjSaxe5F5doPmXJwgjeJkssuMbNKXDKS+F3f9knVTpKiiX005vr
 wXsw==
X-Gm-Message-State: AOAM530pJ7OMQ3/MWeHgXMHgdL7z7pUYkrTYzv1w2+TYwkCEz9RlWjev
 2+GS6+0hZQYqpRChOSkVgLcxad9w/N9qI+rKgFJu9g==
X-Google-Smtp-Source: ABdhPJzxNklwusGJ+2JRv2DnbMZ3qgM8ZPseYvtZ8KlaKgS9SKNyVEE5WuuRwiVGYGYezRJmS7hx/ngCbMSs39+qLJI=
X-Received: by 2002:a17:906:1e04:: with SMTP id
 g4mr28399323ejj.72.1605172061677; 
 Thu, 12 Nov 2020 01:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20201112064051.3716968-1-pihsun@chromium.org>
 <20201112085920.GB1367855@google.com>
In-Reply-To: <20201112085920.GB1367855@google.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Thu, 12 Nov 2020 17:07:05 +0800
Message-ID: <CANdKZ0cGXkcVfevpT4y_za5vu_y0s-NdCvhw1AVibK-q_W8yBw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Add anx7625 port switching.
To: Prashant Malani <pmalani@chromium.org>
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

Hi Prashant,

Please see inline reply as below.

On Thu, Nov 12, 2020 at 4:59 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Hi Pi-Hsun,
>
> I haven't gone through the code, but did have a high-level comment
> (kindly see inline)
>
> On Thu, Nov 12, 2020 at 02:40:40PM +0800, Pi-Hsun Shih wrote:
> > When output 2 lanes DP data, anx7625 can output to either TX1/RX1 or
> > TX2/RX2. In typical usage, these two TX/RX pairs corresponds to two
> > orientations of typec.
> >
> > On some board one anx7625 is used as DPI to DP converter for two typec
> > ports. In this case, the TX1/RX1 and TX2/RX2 are connected to two usb
> > muxes, which mux the DP data with the rest of the USB3 data, and
> > connects to the two typec ports.
> >
> > This patch adds option for anx7625 to acts as a usb typec switch and
> > switch output lanes based on the typec orientation, or acts as two usb
> > typec mux and switch output lanes depending on whether the two ports
> > currently has DP enabled.
> >
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> >
> > ====================================================================
> >
> > This is an attempt to use typec framework with how we're using anx7625
> > on Chrome OS asurada board.
> >
> > An example of the dts for the two ports case can be found at
> > https://crrev.com/c/2507199/6
>
> Do you plan on submitting DT schemas & bindings documentation for the switch(es)
> that are intended to be used?

Yes I plan to submit corresponding DT schemas & bindings documentation
changes if this change looks good.

>
> I would strongly recommend that for usb-c-connector since AFAIK they don't exist, and
> I don't believe there is explicit support for them in the Type C connector class framework
> (even .
>
> IMO this would be needed to ensure an implementation here doesn't break
> in the event of modifications to the connector class framework (or Type
> C port drivers like cros-ec-typec) in the future. I think some patches
> were floated for this for orientation switch [1] so those might provide
> some hints about how to proceed.
>
> I've CC-ed Heikki (Type C maintainer) in case he has additional comments regarding this.
>
> >
> > Sending this as a RFC patch since I'm not sure about the best approach
> > here. Should the logic of switching output lanes depends on ports be
> > coupled inside anx7625 driver, or in another driver, or is there
> > any existing way to accomplish this?
>
> Might be good to add [RFC] as a tag instead of [PATCH] in case this
> iteration is chiefly to solicit comments.

Ah I did have [RFC] tag in some local .patch files before. I guess I
somehow forgot it in later `git format-patch` runs...
I'll add the tag in the next version, thanks for the comments.

>
> Best regards,
>
> -Prashant
>
> [1]:
> https://lore.kernel.org/linux-usb/1604403610-16577-1-git-send-email-jun.li@nxp.com/
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
