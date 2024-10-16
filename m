Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2803D9A0C2A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 16:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9947F10E714;
	Wed, 16 Oct 2024 14:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="la6L1nZ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1702610E714
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 14:00:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B7DC25C537D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 14:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25230C4CEDC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729087241;
 bh=BK+m1uMt60o3i/gpdeSpzqCx2kCyhlvBP3c0lem4WOI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=la6L1nZ8A/M8d3ZhCf0yfHlWopy06/p5gHBlv+bsqEttIao/9pPVxOZyI3/8T5l3z
 SlyyNhZc3DMDOwxC4WYFEqNUch9xQ0Nu8ZOazIyHK3Yy3/xXfW3ednwG1MMQC/Op0V
 zvdcFCU+cvDHtOCz1cmR7211ImMEdGy3u2b143i0jnnxcB9+9QUYlCQx/SE6cw5xnU
 YgSKxxT/pzO8GI1Tf+TD4jeNzwDpUfp4GmrlX69LoiGHibnAFqTC0SfYh0ginaDAGn
 2gu0GZyboaeGE6X9gSLDBKHi4kgdk8mwstCLS2x74wGnGBGpeO81Ve/k9uNcufnLzj
 h+Gh2XsRTrOqQ==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539fbbadf83so4103461e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 07:00:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmk8E7wDj9oV8K4hjpM8f9Ydq3poaYoerxHFywjOSQ1rp+5y6lC3cFAJijrvzoEQn6/UNVqqtDuZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL5en54vGVKroYrRmQkwf3KEf4mJsNiBSCRtm26QDe6g5XoSsX
 nZYJxpc89VGuAqM8VIFbwkNB/8XsTGJ54Jc7dcxFhzublffu0fcW5UVPWQ1IgdaSPAtoyS+k/zB
 vNMAQwYYcbWcQgeFUi7unxfjT8Q==
X-Google-Smtp-Source: AGHT+IHPNCs8MLQVCkQZQoxybDWunU9F2SX3BzDcHCSDYdOE+qgMEiK6HJiUfa4Hxo6OfVwl0wtqw2rR+HzDyvgDK+M=
X-Received: by 2002:a05:6512:1317:b0:536:52c4:e45c with SMTP id
 2adb3069b0e04-539da4eb323mr9683702e87.31.1729087238930; Wed, 16 Oct 2024
 07:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241014085148.71105-1-angelogioacchino.delregno@collabora.com>
 <20241014085148.71105-2-angelogioacchino.delregno@collabora.com>
 <CAL_Jsq+hpTPCkuXoCF88nyS_D+iFZB5osrt1q04RxffDsY7cXw@mail.gmail.com>
 <ec14b01e-7237-4f52-82a6-b8de42fb120b@collabora.com>
 <20241015134802.GB447702-robh@kernel.org>
 <e5612a1d-b609-4f4a-aec4-601f7060e4cf@collabora.com>
In-Reply-To: <e5612a1d-b609-4f4a-aec4-601f7060e4cf@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Oct 2024 09:00:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLsFbJbLn76QYwzCfu+bmpjfsxCDp_OuKAFnktMXMbTBA@mail.gmail.com>
Message-ID: <CAL_JsqLsFbJbLn76QYwzCfu+bmpjfsxCDp_OuKAFnktMXMbTBA@mail.gmail.com>
Subject: Re: [PATCH v12 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, matthias.bgg@kernel.org, 
 chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 wenst@chromium.org, kernel@collabora.com, sui.jingfeng@linux.dev, 
 michael@walle.cc, sjoerd@collabora.com, 
 Alexandre Mergnat <amergnat@baylibre.com>, Michael Walle <mwalle@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 16, 2024 at 4:23=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 15/10/24 15:48, Rob Herring ha scritto:
> > On Tue, Oct 15, 2024 at 10:32:22AM +0200, AngeloGioacchino Del Regno wr=
ote:
> >> Il 14/10/24 19:36, Rob Herring ha scritto:
> >>> On Mon, Oct 14, 2024 at 3:51=E2=80=AFAM AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>
> >>>> The display IPs in MediaTek SoCs support being interconnected with
> >>>> different instances of DDP IPs (for example, merge0 or merge1) and/o=
r
> >>>> with different DDP IPs (for example, rdma can be connected with eith=
er
> >>>> color, dpi, dsi, merge, etc), forming a full Display Data Path that
> >>>> ends with an actual display.
> >>>>
> >>>> The final display pipeline is effectively board specific, as it does
> >>>> depend on the display that is attached to it, and eventually on the
> >>>> sensors supported by the board (for example, Adaptive Ambient Light
> >>>> would need an Ambient Light Sensor, otherwise it's pointless!), othe=
r
> >>>> than the output type.
> >>>>
> >>>> Add support for OF graphs to most of the MediaTek DDP (display) bind=
ings
> >>>> to add flexibility to build custom hardware paths, hence enabling bo=
ard
> >>>> specific configuration of the display pipeline and allowing to final=
ly
> >>>> migrate away from using hardcoded paths.
> >>>>
> >>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >>>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> >>>> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
> >>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >>>> Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200
> >>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno=
@collabora.com>
> >>>> ---
> >>>>    .../display/mediatek/mediatek,aal.yaml        | 40 ++++++++++++++=
+++++
> >>>>    .../display/mediatek/mediatek,ccorr.yaml      | 21 ++++++++++
> >>>>    .../display/mediatek/mediatek,color.yaml      | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,dither.yaml     | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,dpi.yaml        | 25 +++++++++++-
> >>>>    .../display/mediatek/mediatek,dsc.yaml        | 24 +++++++++++
> >>>>    .../display/mediatek/mediatek,dsi.yaml        | 27 ++++++++++++-
> >>>>    .../display/mediatek/mediatek,ethdr.yaml      | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,gamma.yaml      | 19 +++++++++
> >>>>    .../display/mediatek/mediatek,merge.yaml      | 23 +++++++++++
> >>>>    .../display/mediatek/mediatek,od.yaml         | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,ovl-2l.yaml     | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,ovl.yaml        | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,postmask.yaml   | 21 ++++++++++
> >>>>    .../display/mediatek/mediatek,rdma.yaml       | 22 ++++++++++
> >>>>    .../display/mediatek/mediatek,ufoe.yaml       | 21 ++++++++++
> >>>>    16 files changed, 372 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,aal.yaml
> >>>> index cf24434854ff..47ddba5c41af 100644
> >>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aa=
l.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aa=
l.yaml
> >>>> @@ -62,6 +62,27 @@ properties:
> >>>>        $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>        maxItems: 1
> >>>>
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +    description:
> >>>> +      Input and output ports can have multiple endpoints, each of t=
hose
> >>>> +      connects to either the primary, secondary, etc, display pipel=
ine.
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: AAL input port
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description:
> >>>> +          AAL output to the next component's input, for example cou=
ld be one
> >>>> +          of many gamma, overdrive or other blocks.
> >>>> +
> >>>> +    required:
> >>>> +      - port@0
> >>>> +      - port@1
> >>>> +
> >>>>    required:
> >>>>      - compatible
> >>>>      - reg
> >>>> @@ -89,5 +110,24 @@ examples:
> >>>>               power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
> >>>>               clocks =3D <&mmsys CLK_MM_DISP_AAL>;
> >>>>               mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX 0x50=
00 0x1000>;
> >>>> +
> >>>> +           ports {
> >>>> +               #address-cells =3D <1>;
> >>>> +               #size-cells =3D <0>;
> >>>> +
> >>>> +               port@0 {
> >>>> +                   reg =3D <0>;
> >>>> +                   aal0_in: endpoint {
> >>>> +                       remote-endpoint =3D <&ccorr0_out>;
> >>>> +                   };
> >>>> +               };
> >>>> +
> >>>> +               port@1 {
> >>>> +                   reg =3D <1>;
> >>>> +                   aal0_out: endpoint {
> >>>> +                       remote-endpoint =3D <&gamma0_in>;
> >>>> +                   };
> >>>> +               };
> >>>> +           };
> >>>>           };
> >>>>        };
> >>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediat=
ek,ccorr.yaml
> >>>> index 9f8366763831..fca8e7bb0cbc 100644
> >>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cc=
orr.yaml
> >>>> @@ -57,6 +57,27 @@ properties:
> >>>>        $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>        maxItems: 1
> >>>>
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +    description:
> >>>> +      Input and output ports can have multiple endpoints, each of t=
hose
> >>>> +      connects to either the primary, secondary, etc, display pipel=
ine.
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: CCORR input port
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description:
> >>>> +          CCORR output to the input of the next desired component i=
n the
> >>>> +          display pipeline, usually only one of the available AAL b=
locks.
> >>>> +
> >>>> +    required:
> >>>> +      - port@0
> >>>> +      - port@1
> >>>> +
> >>>>    required:
> >>>>      - compatible
> >>>>      - reg
> >>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediat=
ek,color.yaml
> >>>> index 7df786bbad20..6160439ce4d7 100644
> >>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,co=
lor.yaml
> >>>> @@ -65,6 +65,28 @@ properties:
> >>>>        $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>        maxItems: 1
> >>>>
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +    description:
> >>>> +      Input and output ports can have multiple endpoints, each of t=
hose
> >>>> +      connects to either the primary, secondary, etc, display pipel=
ine.
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: COLOR input port
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description:
> >>>> +          COLOR output to the input of the next desired component i=
n the
> >>>> +          display pipeline, for example one of the available CCORR =
or AAL
> >>>> +          blocks.
> >>>> +
> >>>> +    required:
> >>>> +      - port@0
> >>>> +      - port@1
> >>>> +
> >>>>    required:
> >>>>      - compatible
> >>>>      - reg
> >>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/media=
tek,dither.yaml
> >>>> index 6fceb1f95d2a..abaf27916d13 100644
> >>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,di=
ther.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,di=
ther.yaml
> >>>> @@ -56,6 +56,28 @@ properties:
> >>>>        $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>        maxItems: 1
> >>>>
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +    description:
> >>>> +      Input and output ports can have multiple endpoints, each of t=
hose
> >>>> +      connects to either the primary, secondary, etc, display pipel=
ine.
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: DITHER input, usually from a POSTMASK or GAMMA=
 block.
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description:
> >>>> +          DITHER output to the input of the next desired component =
in the
> >>>> +          display pipeline, for example one of the available DSC co=
mpressors,
> >>>> +          DP_INTF, DSI, LVDS or others.
> >>>> +
> >>>> +    required:
> >>>> +      - port@0
> >>>> +      - port@1
> >>>> +
> >>>>    required:
> >>>>      - compatible
> >>>>      - reg
> >>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,dpi.yaml
> >>>> index 3a82aec9021c..b567e3d58aa1 100644
> >>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp=
i.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp=
i.yaml
> >>>> @@ -71,13 +71,34 @@ properties:
> >>>>          Output port node. This port should be connected to the inpu=
t port of an
> >>>>          attached HDMI, LVDS or DisplayPort encoder chip.
> >>>>
> >>>> +  ports:
> >>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>> +
> >>>> +    properties:
> >>>> +      port@0:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: DPI input port
> >>>> +
> >>>> +      port@1:
> >>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>> +        description: DPI output to an HDMI, LVDS or DisplayPort enc=
oder input
> >>>
> >>> This is wrong. The existing 'port' is the output. 'port' and 'port@0'
> >>> are treated as the same thing. Since you are adding an input port, th=
e
> >>> new port has to be 'port@1' (or any number but 0).
> >>>
> >>> I haven't looked at the driver code, but it should request port 0 and
> >>> always get the output port. And requesting port 1 will return an erro=
r
> >>> or the input port.
> >>
> >> Hello Rob,
> >>
> >> I want to remind you that in v2 of this series you said that it'd be w=
rong for
> >> port@0 to be an output, I replied that you misread that as I had model=
ed it indeed
> >> as an input, and then you gave me your Reviewed-by tag.
> >
> > I have not misread it. Then I guess I forgot about it and missed it the
> > next time on v3.
> >
>
> Okay, that was some misunderstanding then - it's fine, no problem.
>
> >> Anyway - I get your concern about the previous behavior of `port`, but=
 I chose to
> >> model this that way purely for consistency.
> >>
> >> First of all - the driver(s) will check if we're feeding a full graph,=
 as it will
> >> indeed first check if port@1 is present: if it is, then it follows thi=
s scheme with
> >> port@0 as INPUT and port@1 as OUTPUT.
> >> If the component in port@0 is an OUTPUT, the bridge attach will fail.
> >>
> >> Getting to bindings themselves, then... it would be a mistake to model=
 port@0 as an
> >> output and port@1 as an input, because that would be not only inconsis=
tent with the
> >> DRM Bridge bindings, but would be highly confusing when reading the de=
vicetree.
> >
> > Somewhat confusing, yes. Highly, no. Put a comment in the DT.
> >
>
> "Somewhat or highly" boils down to personal opinion, so I still go for "h=
ighly"
> but won't argue about that as wouldn't be productive and would bring us n=
owhere
> anyway, so, whatever :-)
>
> Putting a comment in DT is an option, yes, but that comment would need to=
 be put
> on all of the MediaTek SoC device trees - current and future - and IMO wo=
uld scream
> "inconsistency warning" (in different words, of course) all over, which h=
onestly
> doesn't really look clean... at least to my eyes...

What I find more confusing is my updated DT doesn't work with my
existing kernel...

> >> Please note that the bridge bindings are always declaring port@0 as an=
 INPUT and
> >> other ports as OUTPUT(s).
> >
> > There is no guarantee on that. Port numbering is local to the bridge an=
d
> > opaque to anything outside that bridge. That is why you have to documen=
t
> > what each port represents.
> >
>
> I know and I agree that there's no guarantee on the numbering. I can see =
that in
> other non-drm-bridge bindings, and that's fine.
>
> > Would we have followed that convention if all the ports were defined
> > from the start? Certainly. But that didn't happen and you are stuck wit=
h
> > the existing binding and ABI.
> >
>
> I thought about adding a new compatible for the new port scheme, but that=
 looked
> even worse to me as, after doing that (yeah, I actually went for it in th=
e first
> version that I have never sent upstream) during my own proof-read I start=
ed
> screaming "HACK! HACK! NOOO!" all over, and rewritten the entire thing.
>
> >> As an example, you can check display/bridge/analogix,anx7625.yaml or
> >> display/bridge/samsung,mipi-dsim.yaml (and others) for bridges, otherw=
ise
> >> display/st,stm32mp25-lvds.yaml or display/allwinner,sun4i-a10-display-=
frontend.yaml
> >> (and others) for display controllers, which do all conform to this log=
ic, where
> >> the input is always @0, and the output is @1.
> >>
> >> Of course, doing this required me to do extra changes to the MTK DRM d=
rivers to
> >> actually be retro-compatible with the old devicetrees as I explained b=
efore.
> >
> > You can't fix existing software...
> >
>
> That's true, but I don't see that as an "excuse" (grant me this term plea=
se) to
> "carelessly" keep it in a suboptimal state.
>
> This driver has been growing almost uncontrollably with (wrong, anyway!)
> board-specific component vectors - and writing a new one would just add u=
p
> more code duplication to the mix and/or worsen the maintainability of old=
er
> MediaTek SoCs (as the "old" driver will get forgotten and never updated a=
nymore).
>
> > If you want to break the ABI, then that's ultimately up to you and
> > Mediatek maintainers to decide0. This case is easy to avoid, why would
> > you knowingly break the ABI here.
>
> Because if we don't do this, we condemn (forever) this driver, or part of=
 it
> to have an inverted port scheme compared to either:
>   A. The other drm/mediatek components; or
>   B. The other bridge drivers (of which, some are used with MTK as well)
>
> ...and we also condemn (forever, again) all MediaTek device trees to scre=
am
> "port inconsistency warning: A for drm/mediatek components, B for every o=
ther
> thing", which would scream "drm/mediatek is somewhat broken", which can b=
e
> avoided.

Sure. The cost is just an ABI break to do that.

> > OTOH, this seems like a big enough
> > change I would imagine it is a matter of time before supporting a
> > missing OF graph for the components will be a problem.
> >
>
> Sorry I didn't understand this part, can you please-please-please reword?

I think keeping the kernel working with the old and new binding will
be a challenge. Partly because testing with the old binding won't
happen, but also if the binding and drivers continue to evolve. So
while maintaining old ABI might be possible with this change, it will
continue to be an issue with each change. BTW, did you actually test
backwards compatibility with this? I can see you fallback to the old
binding, but there's a lot of other changes in there I can't really
tell by looking at it.

What I haven't heard from you is "yes, we need to maintain the ABI" or
"no, we can break it". Decide that, then the path here is simple.

Rob
