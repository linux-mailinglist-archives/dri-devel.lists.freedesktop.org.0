Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DFE560DC2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 01:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C528510EEA7;
	Wed, 29 Jun 2022 23:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6FB10E3CF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 23:55:28 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-101bb9275bcso23583058fac.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 16:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=QIrFb0TvnpVHjaIE7mc40LIegGWl6DWKRa7QFDrhXk4=;
 b=dzXf1XH/uJtFJmyqbLVoMDMPAYAj6sb1j8kiY+8ViFmkNF6z2vJK2PUHdY7n3PdoNz
 RAthHwRiglNjYgT9bYusntOHvCjwkUiEZviNZHr48BxkUgarRJETK4O0Ba4pq/TjNLTb
 Qcrj8eD5Qk5o6AU2YL8XCYsIfhXVJo+hapNEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=QIrFb0TvnpVHjaIE7mc40LIegGWl6DWKRa7QFDrhXk4=;
 b=ze9K+f0hb7qbsILyEeGJTUMbI2k1OoI98JZff++pCQf8fPAXdXf/t5K7p72N9jKZzJ
 mmY9sTpOPq/dgtSUlqVq3VPWdfUfq13zZH6bYFr3nrjH984BYKzRmV9d7n3yfsS5damg
 BJUfwSLWvLVKr3bfplaqrRLmdDCShSs58AUG/yhdk4rgxknVvn0ce7Jrmmqslf2SKrqG
 pAX4jPM7YSIM7L2iudBMr5yDCGvsVtQc94khCMfw/BeZB4BgC5yy3+Wc0MS75dI6JJ34
 fZn0/VLOhn2bGoH1j/N7VmQTS6Dy90BG16O0Wl0nLfusqLKFMftMLWA47aP0VgRLhawa
 XMmw==
X-Gm-Message-State: AJIora8bEaRLsJJSlJXxlPny+ZyaC8ZX3eIyWYTHEqjc/9ozroJAbqel
 6U9ysI9eGRWlQKbxlsUvZ7+iE0l95QeWvErC91yuiQ==
X-Google-Smtp-Source: AGRyM1vpUvFCCsQzt5IbfXsbZexe5tAektMajPk2Ws67cqHCtLoPBL/N7tys7Y1E555LDoAzvPZi9JmQZ9QWlaTpjPg=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr3535404oab.193.1656546928082; Wed, 29
 Jun 2022 16:55:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Jun 2022 16:55:27 -0700
MIME-Version: 1.0
In-Reply-To: <CACeCKacJnnk4_dXEX7XiboOWrYpfAcE=ukP63agVAYUxWR9Vbg@mail.gmail.com>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <20220627210407.GA2905757-robh@kernel.org>
 <CACeCKackdbDZrk5fk7qyMwSdTdzyTS=m1vHPFnQOj672W=2nOA@mail.gmail.com>
 <20220628182336.GA711518-robh@kernel.org>
 <CAEXTbpex9nxP-nyPWvSBchAW4j3C4MZfVHTb=5X0iSLY1bSAKg@mail.gmail.com>
 <CAEXTbpf_jxK-R5aA81FCbpAH4bChA2B9+8qExZUbA7Y+Ort=Gg@mail.gmail.com>
 <CAL_Jsq+C04RXLtm6Ac85Ru3EGwJbqV_UD3_dDWVrKvFSvdm7Ng@mail.gmail.com>
 <CAE-0n53ers881LOTCEmKDDxJQt+5vvXJSURs=o6TcOiR5m_EAw@mail.gmail.com>
 <CACeCKacJnnk4_dXEX7XiboOWrYpfAcE=ukP63agVAYUxWR9Vbg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 29 Jun 2022 16:55:27 -0700
Message-ID: <CAE-0n50jm1ovUcBC0GCQJszk-4u+0vDQtAxHxsu9SLyn_CkQuQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
To: Prashant Malani <pmalani@chromium.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-yen Lin <treapking@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Prashant Malani (2022-06-29 15:55:10)
> On Wed, Jun 29, 2022 at 2:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > My understanding is there are 4 DP lanes on it6505 and two lanes are
> > connected to one usb-c-connector and the other two lanes are connected
> > to a different usb-c-connector. The IT6505 driver will send DP out on
> > the associated two DP lanes depending on which usb-c-connector has DP
> > pins assigned by the typec manager.
[...]
>
> We can adopt this binding, but from what I gathered in this thread, that
> shouldn't be done, because IT6505 isn't meant to be aware of Type-C
> connections at all.

How will the driver know which usb-c-connector to route DP to without
making the binding aware of typec connections?

> >
> > I think the difficulty comes from the combinatorial explosion of
> > possible configurations. As evidenced here, hardware engineers can take
> > a DP bridge and use it as a DP mux as long as the bridge has lane
> > control. Or they can take a device like anx7625 and ignore the USB
> > aspect and use the internal crosspoint switch as a DP mux. The anx7625
> > part could be a MIPI-to-DP display bridge plus mux that is connected to
> > two dp-connectors, in which case typec isn't even involved, but we could
> > mux between two dp connectors.
>
> Each containing a single DP lane, right?

Yes.

> I think that will not be a valid configuration, since there is only 1 HPD
> pin (so it's assuming both DP lanes go to the same DP sink).

HPD can be signalled out of band, or not at all (no-hpd). I suspect it's
valid to ignore/disconnect the HPD pin here and start/stop DP when, for
example, the HPD pin toggles within a dp-connector. HPD could be
signaled directly to the kernel via an out of band gpio going from the
dp-connector to the SoC. In this case HPD for each dp-connector could be
a different gpio and the driver may be required to arbitrate between the
two dp-connectors with some 'first to signal wins' logic or something.

>
> But yes, your larger point is valid: h/w engineers can repurpose these
> bridges in ways the datasheet doesn't originally anticipate.

Yeah, I'm also trying to say that devices with typec logic may not be
used for typec purposes.

>
> >
> > Also, the typec framework would like to simply walk the graph from the
> > usb-c-connector looking for nodes that have 'mode-switch' or
> > 'orientation-switch' properties and treat those devices as the typec
> > switches for the connector. This means that we have to add these typec
> > properties like 'mode-switch' to something like the IT6505 bridge
> > binding, which is a little awkward. I wonder if those properties aren't
> > really required. Would it be sufficient if the framework could walk the
> > graph and look for registered typec switches in the kernel that have a
> > matching of_node?
>
> My interpretation of the current mode-switch search code [1] is that
> a top level property of "mode-switch" is required.

Yeah that's how it is right now, but does it have to stay that way?
Could the code search the graph and look for a matching node that's
registered with the typec framework? The goal is to avoid adding typec
properties like 'mode-switch' to bindings like bridge converters that
aren't expected to work with typec. Hopefully the binding can be written
with the output pins in mind and what modes on those pins the hardware
supports (e.g. two lanes on anx7625 can't be split apart whereas on
it6505 each pair can be used directly).
