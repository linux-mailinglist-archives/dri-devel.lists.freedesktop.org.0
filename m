Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2554D04BC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3883C10E08B;
	Mon,  7 Mar 2022 16:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8295010E08B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:57:59 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id b8so14239337pjb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 08:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tIhXGZLVpZ9gpPB8Y0IEDVl0g8sNd0sXb4aXiUdZXd0=;
 b=YP2FNy86W7N8nKMNMqM2YUGV/GbODjCGqey24vRQhOQVk5clrTz+DAxqejvidakQBI
 9TtFA05SljyJ4KDFxjiN0umUq+/62+jga/bbaQdWUCLFfYvljIcv4m9X07eYaYh0Nadd
 DQuK/PW1H4wFsAybKEPfJVLdPlSP3bAmsH1B3AbYFXJSnSoGSKcjtg9OJUWvYtY3JuFR
 nUOmT0BkXOrKM/WQSvWbp9PZTq2KswXC8vo4U+i925uXsuuaZkdSAV4S3wC2QQBiR+ra
 amwbzwb/jnl2ZttKE0v8nzwzkmsCIX0ezC7DO1vPG97dlUA+tsLIOXhpelHcLD5a3Fzj
 6vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tIhXGZLVpZ9gpPB8Y0IEDVl0g8sNd0sXb4aXiUdZXd0=;
 b=3YSuBRquyfhP9HnK+SfguKIoxylStna2h3yrA5A5SrjW0KvUCjTcQ6Q+EhH8bZRCFa
 vnYAY2hz8bV1BGBE6qwBfZ24oAcYkfH5V0pjIwLV9eAhsk4iWlBfbt3taF33Exi85V0H
 q1PLWp2HPn9B4qLoAr3VdtQFrasO3z4BPkGjM7dEYO6UAbvif2KoThgatISIncwXVYBA
 jIDbLsFPs95ThKZTfPIXKen6ZjA4j/KZXTTXs0A/+Vv25jNR322kOEJN4JmsGs4vDOn1
 VSPcxnsL47D4P2V+U0lFzz6TYb5rfyc4N8FaRivJoOR0FEOR6KNpcPTlgPx/SmlB2nvT
 smJQ==
X-Gm-Message-State: AOAM532LNIjyHQiAGrui2YQsEZD0MWNq0nuzUF3+/e3aHLGGTOFR0tB9
 cQtFJ4SM9A/q63EHSVcVDqa7s4c6yaf41GOqAxwugQ==
X-Google-Smtp-Source: ABdhPJx8XmL3ynHyeduH/5RI2S24f5ccnfYE5r4H7NIQr7UVkGE6yqNch4rjeZxEKJVjLao5GJVTFGn1w108kteXJF8=
X-Received: by 2002:a17:902:7044:b0:14e:e1b1:bb0e with SMTP id
 h4-20020a170902704400b0014ee1b1bb0emr12959564plt.65.1646672279034; Mon, 07
 Mar 2022 08:57:59 -0800 (PST)
MIME-Version: 1.0
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-2-robert.foss@linaro.org>
 <YiY1CP6DkfgU4re/@robh.at.kernel.org>
In-Reply-To: <YiY1CP6DkfgU4re/@robh.at.kernel.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 7 Mar 2022 17:57:47 +0100
Message-ID: <CAG3jFyssPxuRXzZsZkVHWrSS8b6pRHRRmpZCTvLmDV-t2CDA1g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Revert "dt-bindings:drm/bridge:anx7625:add vendor
 define"
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, xji@analogixsemi.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Mar 2022 at 17:38, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Mar 07, 2022 at 04:45:57PM +0100, Robert Foss wrote:
> > This reverts commit a43661e7e819b100e1f833a35018560a1d9abb39.
>
> S-o-b and reason for the revert?
>
> > ---
> >  .../display/bridge/analogix,anx7625.yaml      | 65 +------------------
> >  1 file changed, 2 insertions(+), 63 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > index 1d3e88daca041..ab48ab2f4240d 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > @@ -43,70 +43,14 @@ properties:
> >    vdd33-supply:
> >      description: Regulator that provides the supply 3.3V power.
> >
> > -  analogix,lane0-swing:
> > -    $ref: /schemas/types.yaml#/definitions/uint8-array
> > -    minItems: 1
> > -    maxItems: 20
> > -    description:
> > -      an array of swing register setting for DP tx lane0 PHY.
> > -      Registers 0~9 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> > -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> > -      Swing1_Pre2, Swing0_Pre3, they are for [Boost control] and
> > -      [Swing control] setting.
> > -      Registers 0~9, bit 3:0 is [Boost control], these bits control
> > -      post cursor manual, increase the [Boost control] to increase
> > -      Pre-emphasis value.
> > -      Registers 0~9, bit 6:4 is [Swing control], these bits control
> > -      swing manual, increase [Swing control] setting to add Vp-p value
> > -      for each Swing, Pre.
> > -      Registers 10~19 are Swing0_Pre0, Swing1_Pre0, Swing2_Pre0,
> > -      Swing3_Pre0, Swing0_Pre1, Swing1_Pre1, Swing2_Pre1, Swing0_Pre2,
> > -      Swing1_Pre2, Swing0_Pre3, they are for [R select control] and
> > -      [R Termination control] setting.
> > -      Registers 10~19, bit 4:0 is [R select control], these bits are
> > -      compensation manual, increase it can enhance IO driven strength
> > -      and Vp-p.
> > -      Registers 10~19, bit 5:6 is [R termination control], these bits
> > -      adjust 50ohm impedance of DP tx termination. 00:55 ohm,
> > -      01:50 ohm(default), 10:45 ohm, 11:40 ohm.
> > -
> > -  analogix,lane1-swing:
> > -    $ref: /schemas/types.yaml#/definitions/uint8-array
> > -    minItems: 1
> > -    maxItems: 20
> > -    description:
> > -      an array of swing register setting for DP tx lane1 PHY.
> > -      DP TX lane1 swing register setting same with lane0
> > -      swing, please refer lane0-swing property description.
>
> These apply to the DP side, so no need to revert this part.

Ack.

>
> > -
> > -  analogix,audio-enable:
> > -    type: boolean
> > -    description: let the driver enable audio HDMI codec function or not.
> > -
>
> Not sure on this one...

These additions are independent from my reading of this, would you
like a v2 with only the bus-type related changes reverted?

>
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> >      properties:
> >        port@0:
> > -        $ref: /schemas/graph.yaml#/$defs/port-base
> > -        unevaluatedProperties: false
> > +        $ref: /schemas/graph.yaml#/properties/port
> >          description:
> > -          MIPI DSI/DPI input.
> > -
> > -        properties:
> > -          endpoint:
> > -            $ref: /schemas/media/video-interfaces.yaml#
> > -            type: object
> > -            additionalProperties: false
> > -
> > -            properties:
> > -              remote-endpoint: true
> > -
> > -              bus-type:
> > -                enum: [1, 5]
>
> I think the error here is really 1 should be 4 which corresponds to
> D-PHY which is used by both CSI and DSI. Otherwise, I don't really see
> the issue with bus-type being shared between CSI and DSI.

I think that would be a correct solution. And ignoring everything
else, the range of this property is something that should be fixed.

But that would mean that CPI (camera parallel interface) and DPI
(display parallel interface) would share the
V4L2_FWNODE_BUS_TYPE_PARALLEL enum. I think that would be perfectly
functional, but it is not what V4L2_FWNODE_BUS_TYPE_PARALLEL is
documented to represent. As far as I can see it's only intended to
represent CPI.

Instead of having V4L2_FWNODE_BUS_TYPE_PARALLEL represent two
standards, I think they should be split. And possibly
V4L2_FWNODE_BUS_TYPE_PARALLEL should be renamed for CPI, but that is a
separate story. This would provide for the neatest and most legible
solution. If this solution is implemented, this range would be
incorrect. Additionally the snippet reverted in 2/2 of this series
would no longer be valid.

As it stands V4L2_FWNODE_BUS_TYPE_PARALLEL was used to represent DPI
due to not being caught in the review process.

>
> > -                default: 1
> > -
> > -              data-lanes: true
> > +          Video port for MIPI DSI input.
> >
> >        port@1:
> >          $ref: /schemas/graph.yaml#/properties/port
> > @@ -143,9 +87,6 @@ examples:
> >              vdd10-supply = <&pp1000_mipibrdg>;
> >              vdd18-supply = <&pp1800_mipibrdg>;
> >              vdd33-supply = <&pp3300_mipibrdg>;
> > -            analogix,audio-enable;
> > -            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> > -            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
> >
> >              ports {
> >                  #address-cells = <1>;
> > @@ -155,8 +96,6 @@ examples:
> >                      reg = <0>;
> >                      anx7625_in: endpoint {
> >                          remote-endpoint = <&mipi_dsi>;
> > -                        bus-type = <5>;
> > -                        data-lanes = <0 1 2 3>;
> >                      };
> >                  };
> >
> > --
> > 2.32.0

Signed-off-by: Robert Foss <robert.foss@linaro.org>
