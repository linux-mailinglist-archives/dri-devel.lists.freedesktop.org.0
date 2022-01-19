Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C283493D1D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246A810E33D;
	Wed, 19 Jan 2022 15:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F389C10E357
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:29:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACAA961509
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7107C340E8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642606163;
 bh=eiP3xCZsCy88f8i33Qm5tHFJtlYCUAmvYn1cMS/h6LE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UdsEhsM5nH5E4BybYjnqQX7IU0BsZWZqIBVWz6afQhrqg39tF1cRs6hprujjFYS4z
 28AbJH5CC8FTjKeCxIF8TCTw/fZN9E3aUBeAfGcRwsetjTrzuAFAwOg7xPwIP8wHFN
 asQlcoGQclaGvVGRZTujhEDY4k6AfJlL9EbpU5tGwZyxMncX3803dpDUIJrKorqwB7
 7Ipwrh7Sk0wcGPOBPk5AUcOWVLZflZaE86LBRnRgQqsCKcwye8tWvSRWZO8siYcb8S
 Qb+2ck0stfRq9nUDwUUCizUKKm9W3YZzm+zyIO32APEloELRck5glsCyiHUXMQX2Mk
 jT0te0yzMkRjg==
Received: by mail-ed1-f47.google.com with SMTP id j2so13722362edj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:29:23 -0800 (PST)
X-Gm-Message-State: AOAM530pUaOyJzoKDzWhXpMUc1ywBOxvoAJf0gsQ/oiGOYGsFdPGuK/G
 uzNTj0pyQluc/f5fkZJz7XcbCxj9kQqTDNJaTw==
X-Google-Smtp-Source: ABdhPJyIYkyo1vqpmGZeQ86/fG6wkTZGxnD2kYhf8PsblQjCHqdJn557iPYrUwhbvXoPPN23Wd86PLfRtc/FtNJz2Yw=
X-Received: by 2002:a17:906:7801:: with SMTP id
 u1mr8098133ejm.82.1642606151522; 
 Wed, 19 Jan 2022 07:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20220119015038.2433585-1-robh@kernel.org>
 <20220119103542.el3yuqds6ihpkthn@skbuf>
In-Reply-To: <20220119103542.el3yuqds6ihpkthn@skbuf>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Jan 2022 09:28:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKeTmew8ZaNsXqVsXCrkW9zb1V2JcANRVPXyEHqZnVWzA@mail.gmail.com>
Message-ID: <CAL_JsqKeTmew8ZaNsXqVsXCrkW9zb1V2JcANRVPXyEHqZnVWzA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
To: Vladimir Oltean <olteanv@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sre@kernel.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 netdev <netdev@vger.kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-usb@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Kalle Valo <kvalo@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Georgi Djakov <djakov@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Joerg Roedel <joro@8bytes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 4:35 AM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> On Tue, Jan 18, 2022 at 07:50:38PM -0600, Rob Herring wrote:
> > The 'phandle-array' type is a bit ambiguous. It can be either just an
> > array of phandles or an array of phandles plus args. Many schemas for
> > phandle-array properties aren't clear in the schema which case applies
> > though the description usually describes it.
> >
> > The array of phandles case boils down to needing:
> >
> > items:
> >   maxItems: 1
> >
> > The phandle plus args cases should typically take this form:
> >
> > items:
> >   - items:
> >       - description: A phandle
> >       - description: 1st arg cell
> >       - description: 2nd arg cell
> >
> > With this change, some examples need updating so that the bracketing of
> > property values matches the schema.
> > ---
> (...)
> > diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> > index 702df848a71d..c504feeec6db 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
> > @@ -34,6 +34,8 @@ properties:
> >        full routing information must be given, not just the one hop
> >        routes to neighbouring switches
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      maxItems: 1
> >
> >    ethernet:
> >      description:
>
> For better or worse, the mainline cases of this property all take the
> form of:
>
> arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
>                                 link = <&switch1port9 &switch2port9>;
>                                 link = <&switch1port10 &switch0port10>;
> arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
>                                                 link = <&switch1port6
>                                                         &switch2port9>;
>                                                 link = <&switch1port5
>                                                         &switch0port5>;
> arch/arm/boot/dts/vf610-zii-scu4-aib.dts
>                                                 link = <&switch1port10
>                                                         &switch3port10
>                                                         &switch2port10>;
>                                                 link = <&switch3port10
>                                                         &switch2port10>;
>                                                 link = <&switch1port9
>                                                         &switch0port10>;
>
> So not really an array of phandles.

Either form is an array. The DT yaml encoding maintains the
bracketing, so how the schema is defined matters. To some extent the
tools will process the schema to support both forms of bracketing, but
this has turned out to be fragile and just doesn't work for phandle
arrays. I'm working on further changes that will get rid of the yaml
encoded DT format and validate DTB files directly. These obviously
have no bracketing and needing the DTS source files to change goes
away. However, to be able to construct the internal format for
validation, I do need the schemas to have more information on what
exactly the phandle-array contains.

Rob
