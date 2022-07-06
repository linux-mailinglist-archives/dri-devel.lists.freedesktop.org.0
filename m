Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01B35691AF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 20:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8F3112E46;
	Wed,  6 Jul 2022 18:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EBE112E46
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 18:26:30 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31c8bb90d09so94873237b3.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AKNzyuxVbT+auUhZLi3IyFDil3epaFKjcWDvpCGicX8=;
 b=Uxpv0YELVEct5DKRBFz2Fhk7QOvnqJthA8Ckw5wBsDZGh8wJXJiOrindJG/RdyVU2K
 5kOY4qIummQC7LrVENX11WZTxRSqjS7URB43qjRq8OGIZqeDgCN81GIPSiMWTmCOOup2
 QQdGRwejIFzn0MvwrWJWBomzFz7wDHAU+ejoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AKNzyuxVbT+auUhZLi3IyFDil3epaFKjcWDvpCGicX8=;
 b=vGCBuM1v+DUz9QHtCIODkBnpktWhJJ0TeXyF9RLL8MWJo3J/Yda3zgItNmqKqBCDKB
 YwXmJUex0/G2zVhi7FmlJOgAA0VdxNtIe5aiHthqYUdMzeQCawUcAVLl/gCWUoT21jzh
 TCeMp/g7iUNlTlZjytnaaNf7IZv+3AsILt0UQgfKB81Liv0EXvF7CUSVhFo9jFa4q8d0
 WQhQL/ELcaiNcoFLJFrdHnjPBRYHhZu/uaLbDZtY4yTmc8ko73WKRblpZ/Aj39n3z1VH
 9hq+HWLoVKSgG39/8IZ9AtUNCRhY072j7Oe362pE+Hs9P1vIMBz4/8DpNxWgmb7I7PFJ
 ZoGA==
X-Gm-Message-State: AJIora80IMFxP6Fuqg8Ed3po4G7msBgehAq0C87KJCX47Jci6NeM/p0j
 3xH8jDSMXluVs06FmOTWvC9aOYNpOD705t9bQfr1uw==
X-Google-Smtp-Source: AGRyM1udr5yyAZaFO4FJIEc1fs4jCrlvFfgCL6OO6ePlgo7ORdpuX2cwPgLlDUrByF02oMjAX082RxZNAQZV1iQkw1A=
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr47186325ywd.283.1657131989488; Wed, 06
 Jul 2022 11:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-6-pmalani@chromium.org>
 <CAE-0n517BB8YbN5AZG6M3ZrZGOJDV=+t0R9d8wD+gVqO1aD1Xg@mail.gmail.com>
 <CACeCKafR8hFke_tc2=1VGDNF-CFrZoAG1aUKuxGJG-6pd37hbg@mail.gmail.com>
 <CAE-0n50XbO5Wu4-429Ao05A4QrbSXoi1wBjTpGFjKm3pZj1Ybg@mail.gmail.com>
 <CACeCKafzB0wW_B2TOEWywLMyB+UhYCpXYDVBV=UbyxBiGnv1Rw@mail.gmail.com>
 <CAE-0n50Akd8QikGhaAQgxLkJBhE-7KQf5aJ_P2ajOmCjLk555g@mail.gmail.com>
 <CACeCKafQT_RBrkHJNE2ezahSsHLPrbnS69QbfnjxBoUhi6hjwQ@mail.gmail.com>
In-Reply-To: <CACeCKafQT_RBrkHJNE2ezahSsHLPrbnS69QbfnjxBoUhi6hjwQ@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 6 Jul 2022 11:26:19 -0700
Message-ID: <CACeCKafya_XA+C3eJUvT4vjQSgsjdewVkCb+Jr2tA1605jjfjg@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] drm/bridge: anx7625: Add typec_mux_set callback
 function
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 4:38 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> On Thu, Jun 30, 2022 at 4:21 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Prashant Malani (2022-06-28 13:56:22)
> > > On Tue, Jun 28, 2022 at 1:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > I suppose none of those things matter though as long as there is some
> > > > typec switch registered here so that the driver can be informed of the
> > > > pin assignment. Is it right that the "mode-switch" property is only
> > > > required in DT if this device is going to control the mode of the
> > > > connector, i.e. USB+DP, or just DP? Where this device can't do that
> > > > because it doesn't support only DP.
> > >
> > > If the anx7625 is used just to route all lanes from 1 usb-c-connector (i.e
> > > the USB+DP case), a mode-switch wouldn't be of much use, since one
> > > would also route the CC lines to the built-in PD controller; so it will
> > > already have knowledge of what mode the switch is in.
> > >
> > > The mode-switch is likely only relevant for this hardware configuration(
> > > it's "DP only" in the sense that the USB pins to the SoC never go anywhere).
> > > One only has 2 SS lanes each (from each usb-c-connector).
> > >
> > > Since there is no CC-line, the anx7625 needs to know which one has DP
> > > enabled on it.
> >
> > Can the CC line be "captured" and not actually sent to the anx7625?
>
> That's what happens on Chrome OS. The cc line goes to the EC (and is "consumed"
> by the TCPM (Type C Port Manager)) and signals are then sent to the AP
> over the Host command interface to `cros-ec-typec`. The signals here being all
> the PD messages communicated between the peripheral and the port.
>
> > I imagine if that is possible, maybe the CC lines would go to some
> > micro-controller or something that did more typec management things and
> > then the anx7625 driver would need to do software control of the mode
> > and orientation control.
>
> I _guess_ that is possible (though it would seem odd to not use all the PD
> control hardware in that configuration)? If an system implements it in
> such a way
> then:
> 1. mode-switch: Can be updated to do something when num_typec_switches == 1 (
> in the mux_set function imp.l I haven't looked into what registers
> need to be configured, since we
> don't have this hardware implementation.
> 2. orientation-switch: This should be registered, and then flip the
> lanes when the port
> driver tells it the orientation is one way or another.
>
> So, if someone uses it that way, I think the driver needs only minor
> updates to support it.

Stephen, any pending concerns?
If not,I will post a v6 series with the suggested changes:
- Drop typec-switch binding; instead add a new top-level port with
end-points for each Type-C connector's switch.
- Drop it6505 patches.
- Squash anx7625 driver patches into one patch.
- Add a comment mentioning that we aren't registering the orientation-switch.
