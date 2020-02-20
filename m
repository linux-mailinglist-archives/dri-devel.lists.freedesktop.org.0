Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BDB1669F2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 22:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177836EE6F;
	Thu, 20 Feb 2020 21:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E126EE6F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 21:37:26 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id a2so5018869qko.12
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 13:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oh9NnMK5dEkxSL8LqLeezQXMtkg2eo9bP7+6KDERK7c=;
 b=dkZ+fmKTL4NxfsQL//wkNrqdn+7ALxc9PWB4/cJdjaMYai6+a2ObaTrZTi3QiRCL0V
 TMTIpnezZMnaC9KNCUXgF5o59tmklGM0vyhpkCSUldlOCdklJMYjN8kgqicn7b0H5uvR
 mRyrf9vU9fUmbYaeaIRealAwfliz91+76OSwSjZRyYEy8UDGoP0f0sy8JOKnLJPzFxbC
 rMegihWdjYtYGneebotaZntHloXNCy8nrj2aAhjn/yFq/gWFTTJg6TRppJoIn0GMcVsY
 NpvhM1m57XvH2otQn99m5FFoJbCjQ9wgnJAVRPPA+LBskBn1YeWZ4SpX//vhyZqwvvN3
 mFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oh9NnMK5dEkxSL8LqLeezQXMtkg2eo9bP7+6KDERK7c=;
 b=QaL0wb904I7yQf9SS5eGLqAqtAJvc/mG//DmfrBCrBaT8YVpiSaQap7WyJRGxtDfPH
 HGXAH8ckXu0pHaDrZdrwd/LgrUBHwNizNMR0rs8yyy0HheNiBt9Z+P1twxBnJ1UkYqFK
 3BosLY+BGoPGaTYtjC2arO1d+zOtMIU5kHd196383R+9DW1SMy0pg1vV6Bl2Bl8tCGs3
 cXXD8fXrTO2DlfCQ1DS2cLln0WKwYp/SDKnWvKVo1vlL+b/PVrDgXpP3Z7yTDMwu3GxF
 UIVXG/VLYdLAQwlt6RZaZgK7ryNzSiGE2gmK2XJ8l8pD5LAZPX6XPngCpRzra1baAsIB
 gd1Q==
X-Gm-Message-State: APjAAAUoNbl4yg/HIN17Jprq7gi6Ig44ivB8A29E9GlKGD2xMyxUr/Hh
 YoyW1Yc4x+I+bBjPW8PGr1KQPTrPnE4GOgHeWtw=
X-Google-Smtp-Source: APXvYqxbMtUxwi5PqTgTmL0zS8fcAZIOH3LG0rqKdR9B+eNvxbGatS+IgDq4lagM0iirCc+ygm9t5HGOeR8kbKdfxTs=
X-Received: by 2002:a05:620a:1426:: with SMTP id
 k6mr30609606qkj.276.1582234645770; 
 Thu, 20 Feb 2020 13:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20200220083508.792071-1-anarsoul@gmail.com>
 <20200220083508.792071-4-anarsoul@gmail.com>
 <20200220093528.GA10402@ravnborg.org>
In-Reply-To: <20200220093528.GA10402@ravnborg.org>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 20 Feb 2020 13:37:12 -0800
Message-ID: <CA+E=qVf2eGddyBd7G5+W0cScLSQF3qmPgw-ja_F=4LeEMeLn5Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: Add Guangdong Neweast Optoelectronics
 CO. LTD vendor prefix
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
 Stephan Gerhold <stephan@gerhold.net>, Jonas Karlman <jonas@kwiboo.se>,
 Torsten Duwe <duwe@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 1:35 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Vasily
>
> On Thu, Feb 20, 2020 at 12:35:05AM -0800, Vasily Khoruzhick wrote:
> > Add vendor prefix for Guangdong Neweast Optoelectronics CO. LTD
> >
> > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 6456a6dfd83d..a390a793422b 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -665,6 +665,8 @@ patternProperties:
> >      description: Nexbox
> >    "^nextthing,.*":
> >      description: Next Thing Co.
> > +  "^neweast,.*":
> > +    description: Guangdong Neweast Optoelectronics CO., LT
>
> Alphabetical order.
> "new" comes before "nex".

Will fix in v2

>
>         Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
