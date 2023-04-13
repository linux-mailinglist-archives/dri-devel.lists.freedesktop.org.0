Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5926E0A93
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 11:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3449B10EA9C;
	Thu, 13 Apr 2023 09:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE7610EA9C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 09:50:56 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-329518648ebso2072315ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 02:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681379455; x=1683971455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dL7RXszTwl3tWYCqDnlZ/0M+VW4TE/OYlCTVcW3Fizw=;
 b=OZCLuONnhpVUw+ouXWcwATwLdSgo2Ccez85OEpH4qGtsFb/Xwjd69EWMaj8vdeU4QT
 AMARb2wLMMcxVtzGKHqq4cT6FZtGWPQaSgIysE3v4KUhB2dsGTTKY9MCrp0gX3hK4Xwk
 LUOYG1jTeCZH//fvUjMX+ZlzayLM0iiMU2rsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681379455; x=1683971455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dL7RXszTwl3tWYCqDnlZ/0M+VW4TE/OYlCTVcW3Fizw=;
 b=EqeXphwqQ9QvtyA2l3LIHK1GiiqcbUggLS2XAuz/ZAPNDv4eU6TTOolUIbx22Jp2/4
 pmtWbElcRI4umG6OpsACFPWlbZdwIoxyKtVpb/DVoyVqX+jVVaVQso5qwmUKQ2M8fk65
 knoMW2lR45U98t4iWA4JFAMPiFBJBqfh4c9fQ0Gj9if9HCQC4rpTLt358qTR8ALOA6Oe
 /L8r4urTZ/co+LDsbEfnjmKiIONdpSb2migT6B0Bf+TzrYcK6IIpPOTS7RTbYyrgaaeB
 9zuv6hPipn5j56DAIMUKEnbT6cGOdmSHwZdb7oOqqSm8t/Ho1KprQoBTDSrp3dSCAAWg
 LiAg==
X-Gm-Message-State: AAQBX9dZWSNw6t94UOKS7l35pHERQanBfDrZX2cnZTtvoPubohRfBs2L
 TsMOQ+FQSdNjtmorcUg473V8pZ1PhZoDKXjW4H+0FA==
X-Google-Smtp-Source: AKy350bxQ09gUsUhos5IrYrCCoE/uVEAz2HLzWomfX73unodlYIHo5VgDH6iXIfg0Mc9wy4HFN++atjznGCfSKtAlIE=
X-Received: by 2002:a05:6e02:6c9:b0:316:f93f:6f83 with SMTP id
 p9-20020a056e0206c900b00316f93f6f83mr590699ils.6.1681379455141; Thu, 13 Apr
 2023 02:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230331091145.737305-1-treapking@chromium.org>
 <20230331091145.737305-5-treapking@chromium.org>
 <CAE-0n51E5foFWQAsA73662_5e6XP426wuUCVVmcS5UWwiYpDmw@mail.gmail.com>
In-Reply-To: <CAE-0n51E5foFWQAsA73662_5e6XP426wuUCVVmcS5UWwiYpDmw@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 13 Apr 2023 18:50:44 +0900
Message-ID: <CAEXTbpdcbB_z4ZGCGzc-cM74ECKyxekbroKCWFnhH8eR=4HmvA@mail.gmail.com>
Subject: Re: [PATCH v15 04/10] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Robert Foss <rfoss@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Wed, Apr 12, 2023 at 10:38=E2=80=AFAM Stephen Boyd <swboyd@chromium.org>=
 wrote:
>
> Quoting Pin-yen Lin (2023-03-31 02:11:39)
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,=
anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,an=
x7625.yaml
> > index b42553ac505c..604c7391d74f 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625=
.yaml
> > @@ -12,7 +12,8 @@ maintainers:
> >
> >  description: |
> >    The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
> > -  designed for portable devices.
> > +  designed for portable devices. Product brief is available at
> > +  https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_Prod=
uctBrief.pdf
> >
> >  properties:
> >    compatible:
> > @@ -112,9 +113,40 @@ properties:
> >                data-lanes: true
> >
> >        port@1:
> > -        $ref: /schemas/graph.yaml#/properties/port
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> >          description:
> > -          Video port for panel or connector.
> > +          Video port for panel or connector. Each endpoint connects to=
 a video
> > +          output downstream, and the "data-lanes" property is used to =
describe
> > +          the pin connections. 0, 1, 2, 3 in "data-lanes" maps to SSRX=
1, SSTX1,
> > +          SSRX2, SSTX2, respectively.
> > +
> > +        patternProperties:
> > +          "^endpoint@[01]$":
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            properties:
> > +              reg: true
> > +
> > +              remote-endpoint: true
> > +
> > +              data-lanes:
> > +                oneOf:
> > +                  - items:
> > +                      - enum: [0, 1, 2, 3]
> > +
> > +                  - items:
> > +                      - const: 0
> > +                      - const: 1
> > +
> > +                  - items:
> > +                      - const: 2
> > +                      - const: 3
> > +
> > +              mode-switch:
>
> Is it possible to not have this property? Can we have the driver for
> this anx device look at the remote-endpoint and if it sees that it is
> not a drm_bridge or panel on the other end, or a DP connector, that it
> should register a typec mode switch (or two depending on the number of
> endpoints in port@1)? Is there any case where that doesn't hold true?
>
> I see these possible scenarios:
>
> 1. DPI to DP bridge steering DP to one of two usb-c-connectors
>
> In this case, endpoint@0 is connected to one usb-c-connector and
> endpoint@1 is connected to another usb-c-connector. The input endpoint
> is only connected to DPI. The USB endpoint is not present (although I
> don't see this described in the binding either, so we would need a
> port@2, entirely optional to describe USB3 input). The driver will
> register two mode switches.
>
> 2. DPI to DP bridge with USB3 to one usb-c-connector
>
> In this case, endpoint@1 doesn't exist. The SSTX1/2 and SSRX1/2 pins are
> all connected to a usb-c-connector node. The input ports (0 and 2) are
> connected to both DPI and USB. The device acts as both a mode-switch and
> an orientation-switch. It registers both switches. I wonder if there is
> any benefit to describing SBU connections or CC connections? Maybe we
> don't register the orientation-switch if the SBU or CC connection isn't
> described?
>
> 3. DPI to DP bridge connected to eDP panel
>
> In this case, endpoint@1 doesn't exist. The USB endpoint is not present
> (port@2). Depending on how the crosspoint should be configured, we'll
> need to use data-lanes in the port@1 endpoint to describe which SSTRX
> pair to use (1 or 2). Or we'll have to use the endpoint's reg property
> to describe which pair to drive DP on. Presumably the default
> configuration is SSRX2/SSTX2 providing 2 lanes of DP to an eDP panel.
> The endpoint@0 in port@1 will be connected to a drm_panel, and the
> driver will be able to detect this properly by checking for the
> existence of an aux-bus node or the return value of
> of_dp_aux_populate_bus().

Can we assume that the eDP panel always stays behind an `aux-bus`
node? Can't the panel be connected to the bridge directly in the
graph? Though this might not matter if we only register mode switches
when there are usb-c-connectors connected.
>
> 4. DPI to DP bridge connected to DP connector
>
> This is similar to the eDP panel scenario #3. In this case, endpoint@1
> doesn't exist. The USB endpoint is not present (port@2). Same story
> about port@1 and lane configuration, but we don't have an aux-bus node.
> In this case, the drivers/gpu/drm/bridge/display-connector.c driver will
> probe for the dp-connector node and add a drm_bridge. This anx driver
> will similarly add a drm_bridge, but it needs to look at the node
> connected on port@1:endpoint@0 with drm_of_get_bridge() and check if it
> is a drm_bridge (DP connector) or if it is some type-c thing (connector
> or orientation-switch).
>
> I think having this mode-switch property here lets us avoid calling
> drm_of_get_bridge() unconditionally in anx7625_parse_dt().
> drm_of_get_bridge() will always return -EPROBE_DEFER when this is the
> last drm_bridge in the chain and the other side of the endpoint is a
> type-c thing (scenarios #1 and #2). Maybe we should teach
> drm_of_get_bridge() that a drm_bridge might be connected to a type-c
> device and have it not return -EPROBE_DEFER in that case. Or make some
> new API like drm_of_get_bridge_typec() that checks if the typec
> framework knows about the endpoint in question (as either a typec switch
> or a connector) and returns a NULL bridge pointer. If we had that then I
> think this property is not necessary.
>
> Hopefully the usb-c-connector can always be registered with the typec
> framework? I'm worried that the driver that registers the
> usb-c-connector node may want to form a struct typec_port with
> typec_register_port() and that will get stuck in a similar -EPROBE_DEFER
> loop waiting for this mode-switch to appear. So having this property
> also avoids that problem by telling typec framework to wait until this
> driver can register a mode-switch.
>
> TL;DR: Is this mode-switch property a workaround for probe defer? Can we
> figure out where the mode switch is in software and not have the
> property in DT? If we can it would certainly improve things because
> forgetting to add the property can lead to broken behavior, and we don't
> do anything like this for chains of drm_bridge devices. We just describe
> the display chain and let the kernel figure out which bridge should
> handle hpd, edid reading, or mode detection, etc.

Actually the `mode-switch` property here is mainly because
`fwnode_typec_mux_get`[1] and `typec_mux_match`[2] only return matches
when the property is present. I am not sure what side effects would be
if I remove the ID-matching condition in `typec_mux_match`, so I added
the property here.

Is it feasible to remove the `mode-switch` property here given the
existing implementation of the Type-C framework?

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/usb/typec/mux.c=
#L351
[2]: https://elixir.bootlin.com/linux/latest/source/drivers/usb/typec/mux.c=
#L290

Best regards,
Pin-yen
