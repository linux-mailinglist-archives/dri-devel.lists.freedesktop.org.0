Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E405562DF34
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B4C10E621;
	Thu, 17 Nov 2022 15:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFE110E621
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:10:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2E24DCE1E4A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E763C433D6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668697804;
 bh=a8oMZAOc9h7O6TsnWfrrI7D4nYK+vWS6IWAXZdvkYzM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gQJMfegqtvoVKsBm4BszG7WjhanJAdAYNHPrq/Usfmqbi8YHGszC8MZytPxIQ+NL9
 vM+FuTirPUwyn1qzsbzmFwonAcMDPc4ZO/9adjNIOx22XCWAgvgAnLAFTASyzYhLEL
 DE18Lt4OF9xKgmaLfI8JidddDALtQJCj0Els3J0SZSESshOPptR9q1p569Re6pDNaX
 SzE9N+3pSyrtTH2upCYuZcUd/YeLvVHMjl4kG5j4rEv0XrmDKylKqzcnT7rPNKeiJT
 PoltCrGLvZI+LXNC0IyRFekN6rp2B/kijD1lTsAYp0p3qdz5SrK2N/dSf6w4cm+Dlt
 em6g5doSEVB8A==
Received: by mail-lj1-f178.google.com with SMTP id u11so3075681ljk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:10:04 -0800 (PST)
X-Gm-Message-State: ANoB5pmDTN1cZmKdI26vT7tNJeY7wh+QJOBmc2qqJI4ou64i1PSSWpH0
 Ox3DDOleniZa08wtYHVtPLFsWV3Ob4mZXSuYzg==
X-Google-Smtp-Source: AA0mqf6Lz40qWFVeozaj1msGanV43R9/mSdkVIGkUpBQAqbFtT5C7+OwGjSd4nDyemjdt6z0jrkrrad9ufaughNIcO0=
X-Received: by 2002:a05:651c:333:b0:275:1343:df71 with SMTP id
 b19-20020a05651c033300b002751343df71mr1231501ljp.215.1668697802340; Thu, 17
 Nov 2022 07:10:02 -0800 (PST)
MIME-Version: 1.0
References: <20221110094945.191100-1-u.kleine-koenig@pengutronix.de>
 <20221116174921.GA25509@pengutronix.de>
In-Reply-To: <20221116174921.GA25509@pengutronix.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 17 Nov 2022 09:09:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL-0G4p_V2+ZNbezbE5V25yvUfcerJAseDODNNP8YSdaA@mail.gmail.com>
Message-ID: <CAL_JsqL-0G4p_V2+ZNbezbE5V25yvUfcerJAseDODNNP8YSdaA@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: display: Convert fsl,
 imx-fb.txt to dt-schema
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 11:49 AM Philipp Zabel <p.zabel@pengutronix.de> wro=
te:
>
> On Thu, Nov 10, 2022 at 10:49:45AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> [...]
> > new file mode 100644
> > index 000000000000..c3cf6f92a766
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/imx/fsl,imx-lcdc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX LCD Controller, found on i.MX1, i.MX21, i.MX25 a=
nd i.MX27
> > +
> > +maintainers:
> > +  - Sascha Hauer <s.hauer@pengutronix.de>
> > +  - Pengutronix Kernel Team <kernel@pengutronix.de>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - fsl,imx1-fb
> > +              - fsl,imx21-fb
>
> Are the items/enum keywords superfluous here? Couldn't this just be two
>
>          - const: fsl,imx1-fb
>          - const: fsl,imx21-fb
>
> entries?

mx1 is backwards compatible with mx21? No.

Rob
