Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3BC426E58
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 18:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443D66E0CB;
	Fri,  8 Oct 2021 16:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBABC6E0CB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 16:02:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v25so31200306wra.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+tpTi0dkXhpTRraED2mpSlDODALHrjwKgcEU6U3tNY=;
 b=QYCQlgslC35jmgz/stzG2xlis9o6NYa0BLhnNd+6Vwq1TJF4VcNiBWCicdNYWaQJCL
 XEdhSzU1Ceb+bANTyvff4O7ymLII0QSDvCM9MHQrJprQeGXaKTktCJCM/TaKSarP+/QU
 njDLgf5SZquO5YMjVgPxF5kf3wtj3kREbz7wCxze5J7DTg8Z1HaFuGdBoNoDmatVTcKR
 9iH7JhdiOi01+BdK+VF48ViFZwcTvo4CwkCeIs0gfMBRiop7h0dlktehBW7GsOZj/yHj
 DbvvgVUX+2yZbGksDvE4FTuWSYYpddCKYOV4D9So4768qFBd0Y2IjXPq5f8KN7c+xkle
 ii6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+tpTi0dkXhpTRraED2mpSlDODALHrjwKgcEU6U3tNY=;
 b=Hx4VEsbp/D2iUk5Pq46lmLpfbMw9XNOr2zVwXMH1wsCKN7Zi5RRqyRKimEfZ2taQf4
 OwTNqYovHnFPZnAo9iN9JNHfqZ72rqesWU0tsKJAn626WTYMJ84MQdZZIQpG9nyT0xYz
 irReZxG8UnbrYblhr3GZKUOQ/NkMyaNsa4JRa+b9MztmcPXziYM+weHlAAqxJsZWe3d9
 Bo1Z3ol86Rpl1Y5DnZ90A48HrKzliEm1G6qvoDEujEEtCRK5M3SHHPC7RYiG0L0Cw5y+
 ObLwaHHlo6q+r+RHUO0lThm/Gr5dQc7gfASeg7Kl+Reh7o8N1O23akcSq93XEUvxibeA
 zP4g==
X-Gm-Message-State: AOAM530JibcXKl6G/4hO5p5ag15fNzuQu79p3FfDvqXbbyYYo62Rj3IT
 E/u8Mvhz5ThXfhhmI6/hPZnxnPIuaJOBLDie3KZFyA==
X-Google-Smtp-Source: ABdhPJy3nevDu4HY0mDof/dP2SItH+M9tTpHnYeKFTDgg2wBdFXrKc3+b/B2k2ReBv3w00JYGEQavGT+5fRgrXhcQvU=
X-Received: by 2002:adf:aa88:: with SMTP id h8mr5156218wrc.112.1633708923270; 
 Fri, 08 Oct 2021 09:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
 <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
 <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
In-Reply-To: <YWBJfkoiXy6aBUjQ@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 8 Oct 2021 17:01:47 +0100
Message-ID: <CAPY8ntC=mjLRbLY28C5M-3H-jTjN=WasYL9sn9=MxUmnKsMxaw@mail.gmail.com>
Subject: Re: DSI Bridge switching
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 8 Oct 2021 at 14:37, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Fri, Oct 08, 2021 at 03:27:43PM +0200, Andrzej Hajda wrote:
> > Hi,
> >
> > Removed my invalid email (I will update files next week).
> >
> > On 08.10.2021 13:14, Jagan Teki wrote:
> > > Hi,
> > >
> > > I think this seems to be a known use case for industrial these days with i.mx8m.
> > >
> > > The host DSI would configure with two bridges one for DSI to LVDS
> > > (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technically we
> > > can use only one bridge at a time as host DSI support single out port.
> > > So we can have two separate device tree files for LVDS and HDMI and
> > > load them static.
> > >
> > > But, one of the use cases is to support both of them in single dts, and
> > > - Turn On LVDS (default)
> > > - Turn Off LVDS then Turn On HDMI when cable plug-in
> >
> > Are you sure it will work from hardware PoV? Do you have some demuxer?
> > isolation of pins?
>
> It may be in the category of "you shouldn't do this, but it actually
> works". I've seen the same being done with two CSI-2 camera sensors
> connected to the same receiver, with one of them being held in reset at
> all times.

Surely the correct way to do this would be with a D-PHY mux chip such
as OnSemi FSA642 [1] or those from Diodes Incorporated [2].
How you'd integrate such a mux into DRM is a totally different question.
With V4L2 and CSI2 it'd be relatively simple via Media Controller.

Just wiring them together isn't going to work very well for DSI
reverse direction communication, but neither of the chips Jagan lists
support this.

  Dave

[1] https://www.onsemi.com/products/interfaces/analog-switches/fsa642
[2] https://www.diodes.com/products/connectivity-and-timing/switches-mux/protocol-switches/mipi-switches/

> > > The HDMI event can be detected via some HDMI-INT GPIO on-board design.
> > >
> > > The possible solution, I'm thinking of adding LVDS on port 1, HDMI on
> > > port 2 in the DSI host node, and trying to attach the respective
> > > bridge based on HDMI-INT like repeating the bridge attachment cycle
> > > based on the HDMI-INT.
> >
> > I think more appropriate would be to share the same port, but provide
> > two endpoints inside this port - we have two hardware sharing the same
> > physical port.
>
> That sounds like the correct DT description to me.
>
> > > Can it be possible to do bridge attachment at runtime? something like
> > > a bridge hotplug event? or any other possible solutions?
> > >
> > > Any suggestions?
> >
> > Practically it is possible, see exynos_dsi + panels, or exynos_dsi +
> > some toshiba bridge - panel and bridge are dynamically 'plugged' and
> > 'unplugged' from exynos_drm, but they do not use bridge chain for this
> > and some other reasons. (un|re|)plugging should be performed of course
> > when pipeline is off (connector disconnected). I am not sure about
> > bridges added to bridge chain - you need to inspect all opses to ensure
> > it can be done safely.
> >
> > And the main issue: Daniel does not like it :)
>
> Neither do I :-) Could it be handled with two DRM connectors that are
> mutually exclusive ?
>
> --
> Regards,
>
> Laurent Pinchart
