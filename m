Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C21C562729
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 01:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A1010E122;
	Thu, 30 Jun 2022 23:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8B210E0CE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 23:38:35 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id o19so1185293ybg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 16:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=btsdDzLHXuWyocFwUf8WNzReTu4AL/b5BRU/bdo9QNM=;
 b=QOsAKew+rQrtATgi/aVrHtrYo0c9mo88CuuEuMw27xXWshXhNOAidEZC/YjJi3Ijye
 +2muzrOzD1F4SqvFLSn3pe55M9pPTjfIQML3+Th30czA6dXsDHlK5h02z55Nycg4hTUw
 0lQh/dXd6gqtU7ucvGY2iqqBBCrGm1uVOrfqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=btsdDzLHXuWyocFwUf8WNzReTu4AL/b5BRU/bdo9QNM=;
 b=fu3lttZJA/H3pirP1gL8r4bxSWMHwbwWHyEbT8CwQ1P2Y98UxnC8nVs7geiHterOhK
 FS2GON0ickcevAe9AG7Bjij/9/7LXCdea3vvJz6ckt8uecr5FsuSKcU9Jt673WrVjJ2q
 Ke/9YpBDugAKSgBfAxqUvw9eYVmkLaO19H72X1upY0++qIRsllPwjYsLOPWUiT5uVL+T
 JQfTPav1vKjHNxvYdfosT5uDuoEX/JABt2GOgdXlf74WPZgFxlIr/M0zlUW8RHBg+bi3
 bSpofUVnUjmV2S8PfWDkA7b+g31qc3ZSFbMCvsPcl8PrUNwHJ4e8BDQBFO/Rc8fo0VHE
 Kc1w==
X-Gm-Message-State: AJIora+ZbEdJu4eOlOOxz6p6zN+9nnnKkH3Zniq6J05z0CWPbuyjiLic
 3q5MOZXcrygavXost0iWDBAwQrTDr3U59bRPwGctTV6zKVTcKQ==
X-Google-Smtp-Source: AGRyM1uxVdFc9o6L6ctk+dneyKFL7RlsqngXci+gacBBkyMNQ/h1aAr1e/Yp6tzP84ZsRnw16tUSA7B3BTpSiAnOakQ=
X-Received: by 2002:a25:df15:0:b0:66c:8c2d:7897 with SMTP id
 w21-20020a25df15000000b0066c8c2d7897mr12028962ybg.445.1656632314516; Thu, 30
 Jun 2022 16:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-6-pmalani@chromium.org>
 <CAE-0n517BB8YbN5AZG6M3ZrZGOJDV=+t0R9d8wD+gVqO1aD1Xg@mail.gmail.com>
 <CACeCKafR8hFke_tc2=1VGDNF-CFrZoAG1aUKuxGJG-6pd37hbg@mail.gmail.com>
 <CAE-0n50XbO5Wu4-429Ao05A4QrbSXoi1wBjTpGFjKm3pZj1Ybg@mail.gmail.com>
 <CACeCKafzB0wW_B2TOEWywLMyB+UhYCpXYDVBV=UbyxBiGnv1Rw@mail.gmail.com>
 <CAE-0n50Akd8QikGhaAQgxLkJBhE-7KQf5aJ_P2ajOmCjLk555g@mail.gmail.com>
In-Reply-To: <CAE-0n50Akd8QikGhaAQgxLkJBhE-7KQf5aJ_P2ajOmCjLk555g@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 30 Jun 2022 16:38:24 -0700
Message-ID: <CACeCKafQT_RBrkHJNE2ezahSsHLPrbnS69QbfnjxBoUhi6hjwQ@mail.gmail.com>
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

On Thu, Jun 30, 2022 at 4:21 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Prashant Malani (2022-06-28 13:56:22)
> > On Tue, Jun 28, 2022 at 1:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > I suppose none of those things matter though as long as there is some
> > > typec switch registered here so that the driver can be informed of the
> > > pin assignment. Is it right that the "mode-switch" property is only
> > > required in DT if this device is going to control the mode of the
> > > connector, i.e. USB+DP, or just DP? Where this device can't do that
> > > because it doesn't support only DP.
> >
> > If the anx7625 is used just to route all lanes from 1 usb-c-connector (i.e
> > the USB+DP case), a mode-switch wouldn't be of much use, since one
> > would also route the CC lines to the built-in PD controller; so it will
> > already have knowledge of what mode the switch is in.
> >
> > The mode-switch is likely only relevant for this hardware configuration(
> > it's "DP only" in the sense that the USB pins to the SoC never go anywhere).
> > One only has 2 SS lanes each (from each usb-c-connector).
> >
> > Since there is no CC-line, the anx7625 needs to know which one has DP
> > enabled on it.
>
> Can the CC line be "captured" and not actually sent to the anx7625?

That's what happens on Chrome OS. The cc line goes to the EC (and is "consumed"
by the TCPM (Type C Port Manager)) and signals are then sent to the AP
over the Host command interface to `cros-ec-typec`. The signals here being all
the PD messages communicated between the peripheral and the port.

> I imagine if that is possible, maybe the CC lines would go to some
> micro-controller or something that did more typec management things and
> then the anx7625 driver would need to do software control of the mode
> and orientation control.

I _guess_ that is possible (though it would seem odd to not use all the PD
control hardware in that configuration)? If an system implements it in
such a way
then:
1. mode-switch: Can be updated to do something when num_typec_switches == 1 (
in the mux_set function imp.l I haven't looked into what registers
need to be configured, since we
don't have this hardware implementation.
2. orientation-switch: This should be registered, and then flip the
lanes when the port
driver tells it the orientation is one way or another.

So, if someone uses it that way, I think the driver needs only minor
updates to support it.
