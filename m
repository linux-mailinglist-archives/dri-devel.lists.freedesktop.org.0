Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB2655A5C4
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 03:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C466F10F2E4;
	Sat, 25 Jun 2022 01:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE4D10F2E4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 01:21:18 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-fe023ab520so5975059fac.10
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 18:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=BRJxtK7by35Zc8QH/nnvKQKs9hK/8AIEzJouUPpaTpA=;
 b=ipnQNOEUKRMUQtRZdBO/Uv8XHyRCyACkN75EaXH9G5TIYduaIi6Fs3ClcaZUdqHlQ/
 +azX+aM5vTZ05ypVs97hsPIGZ6MeiRi0gG49Mkz0HiH4qpW09CVB+6Nr2tzBDQpHvTYT
 AgDl0IMUAOBERWThy7J32xiYX4nq4ZwFo2lak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=BRJxtK7by35Zc8QH/nnvKQKs9hK/8AIEzJouUPpaTpA=;
 b=gkR2D4PObZ78D5/MIqHFnn9ZUwAJbAThBi+4pJjLDBwpuSlyvwN9AKagVA5oZOB82V
 qJGnQ6NUbYyMSQ+r4mqtyoNdao6gybdZ4/k3DJ9RAV2Kz7R9rw5lunwmlhnN7J3JIE7P
 YM+EcLWXywmcokNWBbepxSVaJJaRO74jyGaRXI4hnLwNxDlJULBRIj4ySd87B4aTYJjs
 UqUPG/mTZ8i5dTqphvKc/ehjesuIho9p9MULZ7E2FwqONqD+v+x+veRbNiKtyZCzF1BM
 dhB+kh9pl2+SBuS/qWiueb6Xt7HxCCSSZTl025RuRpD0oGjqsP5DO/Hq952uLkTI+aQs
 ltZw==
X-Gm-Message-State: AJIora/pIQnr+9vItDjeTKqUYMow1bl1Rkb+SGOU1e0HKff2i7Dk6iF8
 RF/Vi4qCrAKJ4mOH5AUUpsONodAWd9UMfPbWASzy5w==
X-Google-Smtp-Source: AGRyM1u6/T+WcVjOW9N89LEkv92dI1MrVPLEX2x3G21Lc4IDCSUfjTNLNtnwWFOb4IiXjzG08Co3TRX9cSNHdNMmXMo=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1223058oap.63.1656120078008; Fri, 24 Jun
 2022 18:21:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 18:21:17 -0700
MIME-Version: 1.0
In-Reply-To: <CACeCKad_vB+cHzwkBrvi90u7mBmJbk=YuecOwsp1xexYUiq-_A@mail.gmail.com>
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <CAE-0n51kcr3VGdR2Kf8j1JaBbLcCmWo9GYhhvkUQ4+jn2iEKLg@mail.gmail.com>
 <CACeCKac4eL9++QwbDBKrVTpUzhes=WczqZfh+cFiVgoO4py4MQ@mail.gmail.com>
 <CAE-0n51E1TLMRNWnqiV-jU_qg15BF4D6A+0G1y1SRTu1zNs2Dg@mail.gmail.com>
 <CACeCKacGZFY-_yn1R33OVcsdG47oqNTGBA43L5hrH2zyhK=cRw@mail.gmail.com>
 <CAE-0n53i90ZUFSmrR=ScXtMdn_bWPY49WWTf9LXbxu_udGgP9w@mail.gmail.com>
 <CACeCKaffqb6v7TFji2u00VSQ=DGvRe-gcxMnAEbZCC1qtDZF6A@mail.gmail.com>
 <CAE-0n51AYqr4wcD-JaVaTYjFgxCj+iX+xAYKCrZCqGHE2XEUgA@mail.gmail.com>
 <CACeCKad_vB+cHzwkBrvi90u7mBmJbk=YuecOwsp1xexYUiq-_A@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 18:21:17 -0700
Message-ID: <CAE-0n50yT79TTqBWqqG8jpuhFZhCqV75hpViESgojRutCZ1M9A@mail.gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Prashant Malani (2022-06-24 14:41:36)
> On Fri, Jun 24, 2022 at 12:50 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Prashant Malani (2022-06-23 19:48:04)
> > > On Thu, Jun 23, 2022 at 7:13 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Quoting Prashant Malani (2022-06-23 17:35:38)
> > > > > On Thu, Jun 23, 2022 at 4:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > > >
> > > > > > I'm not aware of any documentation for the dos and don'ts here. Are
> > > > > > there any examples in the bindings directory that split up a device into
> > > > > > subnodes that isn't in bindings/mfd?
> > > > >
> > > > > usb-c-connector [3] and its users is an example.
> > > >
> > > > What are the subnodes? The graph ports? That is not what I meant.
> > >
> > > cros-ec-typec [4] uses subnodes of usb-c-connector. Chrome OS DTs
> > > use the ports from the included usb-c-connector to switching hardware.
> >
> > Ok, got it. usb-c-connector nodes are children of the typec controller
> > (in this case cros-ec-typec) because otherwise we would need to make a
> > phandle link from the usb-c-connector node(s) under the root node / to
> > the typec controller. The phandle link may need to be done in both
> > directions, so it makes more sense to put the usb-c-connector nodes
> > underneath the typec controller to express the direct relationship
> > between the typec controller and the usb-c-connectors.
> >
> > Furthermore, the usb-c-connector is not integrated as part of the EC in
> > the same package. There is a discrete part placed on the board that
> > corresponds to the usb-c-connector and that is separate from the EC. The
> > connectors are in essence only controllable through the EC because
> > that's the typec controller.
>
> From the perspective of the AP, the `usb-c-connector` *is* an integrated part of
> the Chrome EC; there is no alternative way to control it except
> through the Chrome EC.
> So the above example reinforces the usage model for typec-switch (which is
> also an "integrated" component).

No the usb-c-connector is not an integrated part of the EC. It is a
discrete part with a part number that gets placed on the PCB. From the
perspective of the AP it is controlled via the EC, but it is not
integrated into the same package that the EC is packaged in to be
soldered down to the PCB.

So the example of usb-c-connector as a subnode doesn't reinforce the
argument for a typec-switch binding. It highlights the difference that
I've been trying to explain. The difference between internal vs.
external components of a device. In the EC case the usb-c-connector is
an external component from the EC, hence the two nodes. In the anx or
ite case the typec switch is an internal component, hence the single
node for the anx or ite part.

>
> This really is a limited binding change that helps describe connections
> between Type-C components, helps these components integrate with
> the kernel Type-C framework, and consolidates the associated properties.
> I believe it works for most current use cases in the upstream kernel.
>
> I'm happy to discuss more theoretical use cases further, but
> respectfully, I prefer to do
> so off-list.

I'm happy to move the discussion to the anx or ite bindings if you'd
prefer to discuss more concrete bindings.

>
> If the maintainer is OK with it (Krzysztof has reviewed it, but I
> don't want to presume
> what the protocol is for patches in this subsystem), and we've
> provided 2 users as asked for
> in v4 [5], then I request its consideration for submission.
> If the maintainers have further concerns, we'd be happy to address them.
>

Rob?
