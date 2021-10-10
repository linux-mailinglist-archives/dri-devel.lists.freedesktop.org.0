Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCDF428344
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 21:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988F66E3D2;
	Sun, 10 Oct 2021 19:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AFD6E3D2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 19:17:02 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g10so57867875edj.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 12:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VBFL6GCvIE63pT6L4elWuBAyd63dDM9PMkZVaRZBVzg=;
 b=AXdD8NTq4UVv3cC4PUTYqIcXn++a57U6YpXLjBfNq4mcA4yipywyjL4nUbMGoBtitC
 y05mONM6NePy22NZ+5f92R6QzvxEh174MX+5ATN8xnL8mAKS0eLAlmZTq9zVjhLvFmI/
 j9BtLQCMS+bDm9ABFVpnb3GIKYL96nz/pC9Tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBFL6GCvIE63pT6L4elWuBAyd63dDM9PMkZVaRZBVzg=;
 b=7vMyj3nX8m6xMnospGuQWntRzQKwnUWmvWlcaiB23466SzBsF+719I5Zu13BZjpaIK
 Bw2Lm3zYD8tMD8YcSuoYP2O54HQH+pyU5XmDgNXv31gAsy0vQ5mn70io88AvsDqPXYOw
 /nZy+UzEEtLOHUAIeHYM9gQVoG/I6fwkW6Np9fQlNl6g7kLjFdneqkMsZaVyyF7yFfLO
 6p+aV1rnUwIYRN+2SHF+anCHdQS/Whp1W58aNyeZ+1T31z7Z11jViTZ+SRHK7hJeJ2aS
 Q2e+2hf4ww4Fl6k+w2ybISTG/hhjnOOV8e2u9WOeunEVPuGSaT7jl1tx5eNp+wQJA4HR
 nsIg==
X-Gm-Message-State: AOAM531xu6dJQj389GF9XGRBU7wxxVkfn0LXgrpYxxyDq1LD6bzXcWJy
 gmry2ZePWdItd/fF5xyvdMiYNGhvObQPKU1q8zvJFg==
X-Google-Smtp-Source: ABdhPJzJCM4jVtSMiY4d4M7SoWdVXQ9z1gQZcvKabD7EuUjNgAtvtQE8RZAm4QyuHiHIFOTzeOkui6sR2NTz4YX4p4M=
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr34721434edt.237.1633893421045; 
 Sun, 10 Oct 2021 12:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBKZaGCJ18GmnDO3hPrTT9hQSJfDLGc-M0+KV8MyFwVXQ@mail.gmail.com>
 <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
In-Reply-To: <09edd742-bed6-bd29-0e73-02b63d31df32@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 11 Oct 2021 00:46:50 +0530
Message-ID: <CAMty3ZCo99iHR+__icE8+toXnzmhUJvoK0TmxduBFK7ytSDL-A@mail.gmail.com>
Subject: Re: DSI Bridge switching
To: Andrzej Hajda <andrzej.hajda@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, 
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

Hi Andrzej,

On Fri, Oct 8, 2021 at 6:57 PM Andrzej Hajda <andrzej.hajda@gmail.com> wrote:
>
> Hi,
>
> Removed my invalid email (I will update files next week).
>
>
> On 08.10.2021 13:14, Jagan Teki wrote:
> > Hi,
> >
> > I think this seems to be a known use case for industrial these days with i.mx8m.
> >
> > The host DSI would configure with two bridges one for DSI to LVDS
> > (SN65DSI83) and another for DSI to HDMI Out (ADV7535). Technically we
> > can use only one bridge at a time as host DSI support single out port.
> > So we can have two separate device tree files for LVDS and HDMI and
> > load them static.
> >
> > But, one of the use cases is to support both of them in single dts, and
> > - Turn On LVDS (default)
> > - Turn Off LVDS then Turn On HDMI when cable plug-in
>
> Are you sure it will work from hardware PoV? Do you have some demuxer?
> isolation of pins?

Correct. I have noticed after you mentioned this. Design has two 2:1
MIPI Switch PI3WVR626 [1] which take 2 data-lanes and clock from Host
and produce 4 data-lane and 1 clock to connect to ADV7535 and
SN65DSI84 bridges.

The switch has OE, SEL pins to select the desired to MUXed lanes/clock
routing to an appropriate bridge.

>
> >
> > The HDMI event can be detected via some HDMI-INT GPIO on-board design.
> >
> > The possible solution, I'm thinking of adding LVDS on port 1, HDMI on
> > port 2 in the DSI host node, and trying to attach the respective
> > bridge based on HDMI-INT like repeating the bridge attachment cycle
> > based on the HDMI-INT.
>
> I think more appropriate would be to share the same port, but provide
> two endpoints inside this port - we have two hardware sharing the same
> physical port.

Make sense to me. I think we can in-corporate the MIPI Switch on the
pipeline as input data and clock lanes are muxing. not sure how it can
be done.

>
> >
> > Can it be possible to do bridge attachment at runtime? something like
> > a bridge hotplug event? or any other possible solutions?
> >
> > Any suggestions?
>
> Practically it is possible, see exynos_dsi + panels, or exynos_dsi +
> some toshiba bridge - panel and bridge are dynamically 'plugged' and
> 'unplugged' from exynos_drm, but they do not use bridge chain for this
> and some other reasons. (un|re|)plugging should be performed of course
> when pipeline is off (connector disconnected). I am not sure about
> bridges added to bridge chain - you need to inspect all opses to ensure
> it can be done safely.

I will check with this. However i did tried of hot-plug mechanism for
bridge in exiting DSI host sun6i_mipi_dsi.c [2] look like it surely
not possible with bridge-chain as hot-plug require drm pointer where
the same pointer is not available during attach call.

>
> And the main issue: Daniel does not like it :)

[1] https://www.diodes.com/assets/Datasheets/PI3WVR626.pdf
[2] https://elixir.bootlin.com/linux/v5.15-rc4/source/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c#L976

Jagan.
