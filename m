Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6302A560CC2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 00:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5825D10F08C;
	Wed, 29 Jun 2022 22:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD92710F08C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 22:55:23 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id h187so28407707ybg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 15:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y5ZTGoJWK8uoT//Ot+7y7C0qNgpOLHB415dUDB/bM2E=;
 b=V3LS6TmSOlPaVFdCJ0BuXUrJbm9ByWprG9K7HC9tmT10nT8kfB2ueJ5fw4gRIIgxsi
 hjQth58XT0ZxT0rxLmC8XnJOOZcs0sOOmkAhVhQjxsBBiXzh28ez6t7aGFLuC4jmRjdN
 rqWdKH92Zyx+IbHkg8Og4+2IlarHko6eURmHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y5ZTGoJWK8uoT//Ot+7y7C0qNgpOLHB415dUDB/bM2E=;
 b=Y0vDCeYqDf/yT8QbuGFanWLSLHenpIguRgQvAcW8tbhutPTmlBewyIMBXyO9MShhZL
 WdN5W6VIMkcUM5cbEaoDUXLgbXgfsLQnkLp+Cm1QBpToDcNpPrEgWdc9I/zRuj+vqJ/2
 Jnvu6T8DBumBV9/RHf9l1rKvuaiyMa01Dqo8iTQ18J4fDpALJUazOi0f+ggmsgtQUDZB
 XL5W+mbu70uQsGrd7vu122YiPlV0d9to8MeKlaBDOTNIKnm+Bt4JIo8MDE78BVNJ3Eic
 iPFvJFcIS+7kX5i0I9KoaS0SwtRfV4f1qvyBYR/JkoldVYrnSQO12rh9C3Ob1xEv1lIV
 Ai7g==
X-Gm-Message-State: AJIora+Ht830gIyAUhv9UkdEG7FuYpGNWGTmlAT70CYL55Wesmsw5OXH
 OqStGBuJflw0u7xhep+F6s+QenRc4ggri8J6OdAzzw==
X-Google-Smtp-Source: AGRyM1vYoOdLWULQbH68SDkQmn0KXQiOTLkNIVGkUaz44XEXYq1Av98xn5aI+4eBZ+6aEtA9QjkYgcCPn8rqByb70u4=
X-Received: by 2002:a25:bcc:0:b0:66c:b80a:2d5 with SMTP id
 195-20020a250bcc000000b0066cb80a02d5mr6437342ybl.196.1656543322872; 
 Wed, 29 Jun 2022 15:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220622173605.1168416-1-pmalani@chromium.org>
 <20220622173605.1168416-2-pmalani@chromium.org>
 <20220627210407.GA2905757-robh@kernel.org>
 <CACeCKackdbDZrk5fk7qyMwSdTdzyTS=m1vHPFnQOj672W=2nOA@mail.gmail.com>
 <20220628182336.GA711518-robh@kernel.org>
 <CAEXTbpex9nxP-nyPWvSBchAW4j3C4MZfVHTb=5X0iSLY1bSAKg@mail.gmail.com>
 <CAEXTbpf_jxK-R5aA81FCbpAH4bChA2B9+8qExZUbA7Y+Ort=Gg@mail.gmail.com>
 <CAL_Jsq+C04RXLtm6Ac85Ru3EGwJbqV_UD3_dDWVrKvFSvdm7Ng@mail.gmail.com>
 <CAE-0n53ers881LOTCEmKDDxJQt+5vvXJSURs=o6TcOiR5m_EAw@mail.gmail.com>
In-Reply-To: <CAE-0n53ers881LOTCEmKDDxJQt+5vvXJSURs=o6TcOiR5m_EAw@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 29 Jun 2022 15:55:10 -0700
Message-ID: <CACeCKacJnnk4_dXEX7XiboOWrYpfAcE=ukP63agVAYUxWR9Vbg@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] dt-bindings: usb: Add Type-C switch binding
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

On Wed, Jun 29, 2022 at 2:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > What device controls the switching in this case? Again, block diagrams
> > please if you want advice on what the binding should look like.
>
> My understanding is there are 4 DP lanes on it6505 and two lanes are
> connected to one usb-c-connector and the other two lanes are connected
> to a different usb-c-connector. The IT6505 driver will send DP out on
> the associated two DP lanes depending on which usb-c-connector has DP
> pins assigned by the typec manager.
>
>                                                      +-------+
>                                                      |       |
>           +--------+                            /----+ usb-c |
>           | IT6505 |                           / /---+       |
>           |        +------------ lane 0 ------/ /    |       |
>           |        +------------ lane 1 -------/     +-------+
>  DPI -----+        |
>           |        |                                 +-------+
>           |        |                                 |       |
>           |        +------------ lane 2 -------------+ usb-c |
>           |        +------------ lane 3 -------------+       |
>           |        |                                 |       |
>           +--------+                                 +-------+
>
> The bridge is a mux that steers DP to one or the other usb-c-connector
> based on what the typec manager decides.
>
> I would expect this to be described with the existing port binding in
> the it6505 node. The binding would need to be extended to describe the
> output side.
>
>         bridge@5c {
>             compatible = "ite,it6505";

We'll need a top level "mode-switch" property here.
>             ...
>
>             ports {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
>                 port@0 {
>                     reg = <0>;
>                     it6505_in: endpoint {
>                         remote-endpoint = <&dpi_out>;
>                     };
>                 };
>
>                 port@1 {
>                     #address-cells = <1>;
>                     #size-cells = <0>;
>                     reg = <1>;
>
>                     it6505_out_lanes_01: endpoint@0 {
>                         reg = <0>
>                         data-lanes = <0 1>;
>                         remote-endpoint = <&typec0>;
>                     };
>
>                     it6505_out_lanes_23: endpoint@1 {
>                         reg = <1>
>                         data-lanes = <2 3>;
>                         remote-endpoint = <&typec1>;
>                     };
>                 };
>             };
>         };
>
>         usb-c-connector {
>             compatible = "usb-c-connector";
>             ....
>             ports {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
>                 port@1 {
>                     reg = <1>;
>                     typec0: endpoint {
>                         remote-endpoint = <&it6505_out_lanes_01>;
>                     };
>                 };
>             };
>         };

We can adopt this binding, but from what I gathered in this thread, that
shouldn't be done, because IT6505 isn't meant to be aware of Type-C
connections at all.

>
> I don't see the benefit to making a genericish binding for typec
> switches, even if the hardware has typec awareness like anx7625. It
> looks like the graph binding can already handle what we need. By putting
> it in the top-level ports node we have one way to describe the
> input/output of the device instead of describing it in the top-level in
> the display connector case and the child typec switch node in the usb c
> connector case.

Ack, I'll drop the generic binding for future revisions.

>
> I think the difficulty comes from the combinatorial explosion of
> possible configurations. As evidenced here, hardware engineers can take
> a DP bridge and use it as a DP mux as long as the bridge has lane
> control. Or they can take a device like anx7625 and ignore the USB
> aspect and use the internal crosspoint switch as a DP mux. The anx7625
> part could be a MIPI-to-DP display bridge plus mux that is connected to
> two dp-connectors, in which case typec isn't even involved, but we could
> mux between two dp connectors.

Each containing a single DP lane, right?
I think that will not be a valid configuration, since there is only 1 HPD
pin (so it's assuming both DP lanes go to the same DP sink).

But yes, your larger point is valid: h/w engineers can repurpose these
bridges in ways the datasheet doesn't originally anticipate.

>
> Also, the typec framework would like to simply walk the graph from the
> usb-c-connector looking for nodes that have 'mode-switch' or
> 'orientation-switch' properties and treat those devices as the typec
> switches for the connector. This means that we have to add these typec
> properties like 'mode-switch' to something like the IT6505 bridge
> binding, which is a little awkward. I wonder if those properties aren't
> really required. Would it be sufficient if the framework could walk the
> graph and look for registered typec switches in the kernel that have a
> matching of_node?

My interpretation of the current mode-switch search code [1] is that
a top level property of "mode-switch" is required.

[1] https://elixir.bootlin.com/linux/v5.19-rc4/source/drivers/usb/typec/mux.c#L347
