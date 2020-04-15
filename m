Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD6F1AB466
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 01:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C3A6EAB8;
	Wed, 15 Apr 2020 23:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425236EAB5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 23:49:15 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id t8so2148731uap.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 16:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+3cVFHINQK8034Q5fMosJmLqjR0x/8UAQMOjZSVJrM=;
 b=hymJOGYOl8wyGrt54ea9ETuKrBuw+wFtIDoosE9VbbTh3G2do1iFapNRgpRzht7cF+
 1h4tsTDnwoUY7vgAf0B6t9n+FyslLxRcQhLeXANSqSnY1BwHGWOO/CGr+ch7TrC7Y1be
 poo1PAE0JVXRF1RDYuyH/o1HSC4r+3OiFuCMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+3cVFHINQK8034Q5fMosJmLqjR0x/8UAQMOjZSVJrM=;
 b=nhaWFEV1Njio2vPh1MN0UZbdA7YbSMqLcuVYMU70szFgm0nJjT2ahuYyyYTtOHpMbA
 PGM3gFL/uVmHmdTWAp4SuJI4x8OETLLYuctzfxqAg7n0XOkw9/UtM1AEIsyXCHrUutfb
 wSQc54pxhKYxANLWmw0RypYmcvOxPoy7qcTUvw5cacRdBhxtZZsDCyVTGpAmaRO5ehmk
 a3L0iUYVXstoS88RuMIhg4Kh9P4BmyIxol1gvpMeGAdzUQMDZRcVlKPkGAEho0LSIfiC
 TTXiUg7dUM2DzLHKyN5pNFifb6OYeLd5ajZ7dMP8NLqOMdnhdGLDg32hjuw5TnXgh4If
 ZZ4w==
X-Gm-Message-State: AGi0PuZLHoK9PTYZDJgRlL1iDkWCdwU7vd1sD+8wD7Zp9YvfkP1ORHqC
 k42XC47AZ6WybXLHTZYI00Y7L6NJ2n4=
X-Google-Smtp-Source: APiQypJ//1xJCQ4ZZjJqU3m0FfHEbRnCxNB2CvfbdZAsa7WnT5C/qBg/KuqmPkknpk+JN28oylVCGQ==
X-Received: by 2002:ab0:408:: with SMTP id 8mr6973763uav.2.1586994553725;
 Wed, 15 Apr 2020 16:49:13 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id s74sm569959vkb.48.2020.04.15.16.49.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 16:49:12 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id 1so1236830vsl.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 16:49:11 -0700 (PDT)
X-Received: by 2002:a67:1e46:: with SMTP id e67mr7126201vse.106.1586994551498; 
 Wed, 15 Apr 2020 16:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
 <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
 <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com>
 <20200415203256.GP4758@pendragon.ideasonboard.com>
In-Reply-To: <20200415203256.GP4758@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Apr 2020 16:49:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U1U7y_U4+zySzA9e_uYE0ECdM1Bd-ew0OxG3ciqjRVSA@mail.gmail.com>
Message-ID: <CAD=FV=U1U7y_U4+zySzA9e_uYE0ECdM1Bd-ew0OxG3ciqjRVSA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios
 to the bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Apr 15, 2020 at 1:33 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 15, 2020 at 12:53:02PM -0700, Stephen Boyd wrote:
> > Quoting Douglas Anderson (2020-04-15 08:48:40)
> > > Allow people to specify to use a GPIO for hot-plug-detect.  Add an
> > > example.
> > >
> > > NOTE: The current patch adding support for hpd-gpios to the Linux
> > > driver for hpd-gpios only adds enough support to the driver so that
> > > the bridge can use one of its own GPIOs.  The bindings, however, are
> > > written generically.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > index 8cacc6db33a9..554bfd003000 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > @@ -60,6 +60,10 @@ properties:
> > >      const: 1
> > >      description: See ../../pwm/pwm.yaml for description of the cell formats.
> > >
> > > +  hpd-gpios:
> > > +    maxItems: 1
> > > +    description: If present use the given GPIO for hot-plug-detect.
> >
> > Shouldn't this go in the panel node? And the panel driver should get the
> > gpio and poll it after powering up the panel? Presumably that's why we
> > have the no-hpd property in the simple panel binding vs. putting it here
> > in the bridge.
>
> Same question really, I think this belongs to the panel (or connector)
> node indeed.

Hrm.

To me "no-hpd" feels OK in the panel because the lack of a connection
is somewhat symmetric.  Thus it's OK to say either "HPD isn't hooked
up to the panel in this system" or "HPD isn't hooked up to the bridge
in this system" and both express the same thing (AKA that there is no
HPD connection between the bridge and the panel).  In the case of
"no-hpd" it's more convenient to express it on the panel side because
the panel driver is the one whose behavior has to change if HPD isn't
hooked up.  The panel datasheet is the one that says how long of a
delay we need if HPD isn't hooked up.

...but when you're talking about where the bridge driver should look
to find the HPD signal that it needs, that really feels like it should
be described as part of the bridge.  Specifically imagine we were
using our bridge for DP, not for eDP.  In that case simple-panel
wouldn't be involved because we could get any type of display plugged
in.  Thus it couldn't go in the panel node.  Here it feels clearer
that hpd-gpio needs to be a property of the bridge driver.

Looking at other usages of "hpd-gpio" in the kernel, it seems like the
usage I'm proposing is also common.  Grepping for "hpd-gpios" shows
numerous examples of "hpd-gpios" being defined at the display
controller level and (effectively) I believe the bridge is at the
equivalent level.


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
