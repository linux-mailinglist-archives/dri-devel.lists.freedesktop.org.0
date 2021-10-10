Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77184428346
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 21:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE18C6E3CE;
	Sun, 10 Oct 2021 19:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DC56E3CE
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 19:21:34 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id t16so36738575eds.9
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 12:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GjuuNnyhMlSZ4F6VPZJ9HNGE8sxGIDjlIK+m9w/se/w=;
 b=IlHe/+nh4f901NvrkG59+NNlMPa/ZtsTTOruR0Q2VCADkXSKl8LNlMXELhswuBz+Cr
 ZPQYEdH9/VX8im1Lne52p3WFU21ZziBOd4dA/fr0iJ3q8aTBuThp1VXeUXDwZTJ7LHFC
 BbEtVPWtfQwUO70iBqEr1XbAKtAn+2RWco4HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GjuuNnyhMlSZ4F6VPZJ9HNGE8sxGIDjlIK+m9w/se/w=;
 b=3vo5K+N/fIZYNZk9IJvtw9G6km5hUOTy7HHMjgRv6yabbGUQHEVGCBw4I38qRk15DA
 xI2D9pullMi5lv2/CY4EvhXg8Fgeq0pBrNRxezjzqAd+v33PYar861oib5PYJVDnvVfk
 24F9gEYlsdQ1q0DBtd/ycpB9qUpKkeFT4wTagvH1gT5sTqskSQDs0vtmKqRYHzopPBVJ
 YMc6clCKuq5UPxwAXMtiAdJwAvmcjDSKoWHP1yZiBWBVZ+B4yhfs0IlzHV5CFgH9edgW
 TD7ZpT8gcPugAHo0Q9mrd6ZxNbcOlT0gPnpwSn9BJkUNX3VxVGYDKn8Ug3egWcCWNJcu
 7uaw==
X-Gm-Message-State: AOAM531LLPVqUJwaDEcvNsDShv62CDw5cmqPcGz8XCuiNy+eoJr1Bq4G
 Gm14LdsMkXakv00qREQzZ9wMOkn548x1EMrhzKu8DA==
X-Google-Smtp-Source: ABdhPJzK/aC21p4vxJyUHXER+1iGpe5hGXxEHOZV6LIKv4LF3V/SS9YCK+8RGNvEWH5kqXC7XY1o6PxAkW9Q5NwUXDA=
X-Received: by 2002:a17:906:32c9:: with SMTP id
 k9mr21361787ejk.218.1633893692793; 
 Sun, 10 Oct 2021 12:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
 <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
 <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
 <CAPY8ntC=mjLRbLY28C5M-3H-jTjN=WasYL9sn9=MxUmnKsMxaw@mail.gmail.com>
In-Reply-To: <CAPY8ntC=mjLRbLY28C5M-3H-jTjN=WasYL9sn9=MxUmnKsMxaw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 11 Oct 2021 00:51:22 +0530
Message-ID: <CAMty3ZA6O8sXknKaPb6ySZHweGrM3=1V+TBPsVi8oLEri3S3_g@mail.gmail.com>
Subject: Re: DSI Bridge switching
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Maxime Ripard <maxime@cerno.tech>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Dave,

On Fri, Oct 8, 2021 at 9:32 PM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> On Fri, 8 Oct 2021 at 14:37, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hello,
> >
> > On Fri, Oct 08, 2021 at 03:27:43PM +0200, Andrzej Hajda wrote:
> > > Hi,
> > >
> > > Removed my invalid email (I will update files next week).
> > >
> > > On 08.10.2021 13:14, Jagan Teki wrote:
> > > > Hi,
> > > >
> > > > I think this seems to be a known use case for industrial these days with i.mx8m.
> > > >
> > > > The host DSI would configure with two bridges one for DSI to LVDS
> > > > (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technically we
> > > > can use only one bridge at a time as host DSI support single out port.
> > > > So we can have two separate device tree files for LVDS and HDMI and
> > > > load them static.
> > > >
> > > > But, one of the use cases is to support both of them in single dts, and
> > > > - Turn On LVDS (default)
> > > > - Turn Off LVDS then Turn On HDMI when cable plug-in
> > >
> > > Are you sure it will work from hardware PoV? Do you have some demuxer?
> > > isolation of pins?
> >
> > It may be in the category of "you shouldn't do this, but it actually
> > works". I've seen the same being done with two CSI-2 camera sensors
> > connected to the same receiver, with one of them being held in reset at
> > all times.
>
> Surely the correct way to do this would be with a D-PHY mux chip such
> as OnSemi FSA642 [1] or those from Diodes Incorporated [2].
> How you'd integrate such a mux into DRM is a totally different question.
> With V4L2 and CSI2 it'd be relatively simple via Media Controller.
>
> Just wiring them together isn't going to work very well for DSI
> reverse direction communication, but neither of the chips Jagan lists
> support this.

Sorry to mention it before, we have two 2:1 MIPI D-PHY Switch [1] on
the design which take 2 data-lanes and clock from Host and produce 4
data-lane and 1 clock to connect to ADV7535 and SN65DSI84 bridges. The
switch has OE, SEL pins to select the desired to MUXed lanes/clock
routing to an appropriate bridge.

I think supporting the switch in the pipeline or logic that handle the
bridge switching might help.

[1] https://www.diodes.com/assets/Datasheets/PI3WVR626.pdf

Jagan.
