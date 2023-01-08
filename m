Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B71856613D2
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 08:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D726010E192;
	Sun,  8 Jan 2023 07:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B3010E192
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 07:02:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58BF0A25;
 Sun,  8 Jan 2023 08:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673161348;
 bh=QGE4Hw9aWxGM442kPdYqiBgORm6SRQZOxcp0UzdWwFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l1y2uzF4PqApHifao96ZpodLQiF41IlEJ3ykhi79Pz4/FDUK7VLkHOcflV38gXCeD
 OUDSmUG2C6yf8ujV8+Af/dh9h3/eVVxOi+uJD9cYGv6dO/BqFtnN7T7Q6uTzLnO3Ak
 9+puNMVgvreJ4DsJkLw3ckb2KLzWQ/1NEoliZmek=
Date: Sun, 8 Jan 2023 09:02:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: vendor-prefixes: Add microtips
Message-ID: <Y7pqgBgivE2TUbka@pendragon.ideasonboard.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-2-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230103064615.5311-2-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mark Brown <broonie@kernel.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Maxime Ripard <maxime@cerno.tech>, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aradhya,

Thank you for the patch.

On Tue, Jan 03, 2023 at 12:16:12PM +0530, Aradhya Bhatia wrote:
> Add document vendor prefix for Microtips Technology USA (microtips).
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 70ffb3780621..516134cbcb3c 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -821,6 +821,8 @@ patternProperties:
>      description: Microsoft Corporation
>    "^microsys,.*":
>      description: MicroSys Electronics GmbH
> +  "^microtips,.*":
> +    description: Microtips Technology USA
>    "^mikroe,.*":
>      description: MikroElektronika d.o.o.
>    "^mikrotik,.*":

-- 
Regards,

Laurent Pinchart
