Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E8B12E839
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 16:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9B76E10D;
	Thu,  2 Jan 2020 15:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0886E10D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 15:43:48 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id b10so38630037iof.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2020 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tocxIO5F9WiGwdyi59k65eYp6LMpmfQ5nQn9VUEVPqU=;
 b=Mtxy2+o0bGr/YIkhtVJRxWVKb9Ts8KHINjjApSRDlUQUw8j5A3XxCYZ8CKfnITE+FA
 /KkxbNERhd0WMLvxeqjJLVICjFaIgydE1Rc8bRMLYlyYjj3njZG1bjNacTARHK5oNFaw
 jbDX9RRTa4yi7hWnPb7e0E5g/8zfiz+SWjmiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tocxIO5F9WiGwdyi59k65eYp6LMpmfQ5nQn9VUEVPqU=;
 b=q1EfBHwEGH7yo9k/yIP3uSkn+8U+v9fNUgzxE03S6j6RGCPBnfy/59t2Twscq/rNxo
 WSxaITmh2yU4c0DAv51Q118sp4IXTNHSGUhOUBzozR+ExiTzBFM+m6acfSs6oYtm1Ghl
 8Jl5R0JiFfGMGR10pxYXga/Jpb0G18GCubbUOnRL/ySC+tgTea3bk8IJJ3QAg/hguIe9
 1AP1un/wsv6MreE6ncsCmZgt3FadkyT1GPAXgfiTd0/Jl8F2v4sOgkqDjTG20hcLIZ8O
 x8TI0fXBxgyVKt+at4hS1yK+siwevKqI7NDlYhbaRokPo8fwTtU6xMZrYLiu9hQ7yke0
 o84g==
X-Gm-Message-State: APjAAAXyriyAer4GvqqTev4LPgln/LzveeC9VIEc2IQUsNExIkXg4X6S
 lkUE7JSN0E1Tx2Z8R3+rXG996JfVvNbQTUWWDwjkkQ==
X-Google-Smtp-Source: APXvYqygOqKSlxE+0TT0WUiiUg0DLdEp+in8oQr92U8mxkGOhOUcB0XCaUZGiQdDnqZWvyQeVmWXtdoyza5Z2wi099Q=
X-Received: by 2002:a6b:f716:: with SMTP id k22mr44050760iog.297.1577979828013; 
 Thu, 02 Jan 2020 07:43:48 -0800 (PST)
MIME-Version: 1.0
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
 <20191231130528.20669-7-jagan@amarulasolutions.com>
 <20200102110347.v7lsnmmsbp66r3ia@gilmour.lan>
In-Reply-To: <20200102110347.v7lsnmmsbp66r3ia@gilmour.lan>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 2 Jan 2020 21:13:37 +0530
Message-ID: <CAMty3ZAwaqE31=rCiub3bRZBOa68ck5Ld=A7kVsQjssps9TCxg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] dt-bindings: sun6i-dsi: Add R40 DPHY compatible
 (w/ A31 fallback)
To: Maxime Ripard <mripard@kernel.org>
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
 devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 2, 2020 at 4:33 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Dec 31, 2019 at 06:35:25PM +0530, Jagan Teki wrote:
> > The MIPI DSI PHY controller on Allwinner R40 is similar
> > on the one on A31.
> >
> > Add R40 compatible and append A31 compatible as fallback.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - update the binding in new yaml format
> >
> >  .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml   | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> > index 8841938050b2..0c283fe79402 100644
> > --- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
> > @@ -18,6 +18,7 @@ properties:
> >      oneOf:
> >        - const: allwinner,sun6i-a31-mipi-dphy
> >        - items:
> > +          - const: allwinner,sun8i-r40-mipi-dphy
> >            - const: allwinner,sun50i-a64-mipi-dphy
> >            - const: allwinner,sun6i-a31-mipi-dphy
>
> This isn't doing what you say it does.
>
> Here you're stating that there's two valid values, one that is a
> single element allwinner,sun6i-a31-mipi-dphy, and another which is a
> list of three elements allwinner,sun8i-r40-mipi-dphy,
> allwinner,sun50i-a64-mipi-dphy and allwinner,sun6i-a31-mipi-dphy, in
> that order.

I got it Maxime, thanks for pointing this.

>
> Did you run make dtbs_check and dt_bindings_check?

I sure I didn't, thanks for the clue.

Will do this on another patch as well.

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
