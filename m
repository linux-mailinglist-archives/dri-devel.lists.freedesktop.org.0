Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8218D56257E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 23:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1284912B41B;
	Thu, 30 Jun 2022 21:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F81912B41A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 21:43:41 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id a39so293820ljq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 14:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m2lAzkI1kyUA6X4SSjR8xwr1vZy0wQogLl8c1xpaHQU=;
 b=lrWda6wWNqrPSJmZGSOm1ISr7wKduLFWi1rtfL/yScVS9rHmDVD4N/9zCj+VSJ1+Oa
 FO9NZKuJMIQLUjdIYTiAb8HTBGYm+o9Ez2NIlum6kfuR5+fovJBM/7p+CV2LxVlJ3E6G
 KbNf1TNhzph7T0TL/sDQ4Hw8iQagGqS9jY2lgDmk2pKIsLr0eEUC7CM3K/ir9SVbBuVr
 mnIbczJybBGXfmK7KjkwqGLjfxGX15NKjz6h67HEK5siEgqdufHy9gcSjXVGAN/0WIOu
 yx7sM7I+pjTlcSePBegIfy7IPhw66UH8cQ9c4cOTJEpeHnzk0zgK/utetinXxDnU/V10
 Rp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m2lAzkI1kyUA6X4SSjR8xwr1vZy0wQogLl8c1xpaHQU=;
 b=GkRukzSeI5pc1QyNNIKGdoVqPQ87Bx2F38lYZ2beih8DzQMZSCKAtHJ5azPSQwKR6j
 ATzEDIMW3IuBYZnBVEE3heGQ3iVIjKEeCMYPwGtCix2YDh28bP4f9+cx7ipbv5xT31Vz
 h+HaRTsQIR817M7LSqWKDMD/YU5K7fd7NAeJvXeq2/BO++sjpoz4qU7oh+dUG9yjQUcc
 qeVo4/diOJaiWdwce+v+yLuinid7hGOEqbbjEKXI0bjdkAvMSvDCgWQVfg8/uH9xDBPl
 CKZlCttH9RCYwdQavDIAUTCcpqZkKyCOaeYNLrph1J/mT/SFj/fiXXo+FtqSEl37/av0
 aaeQ==
X-Gm-Message-State: AJIora9H/KOGGJ3ZoJrcliCzJtoAuXAxEFL2xQoCr2TVFZJKlGJIzvZp
 z6A9RuLPdw51r8NyuXWbRFI=
X-Google-Smtp-Source: AGRyM1tiXOSoDewIDtJQjZ6heJh2v6Etx9okcGhLJIyxUHhTxknHodjEWzqlCQs2mLldDoYhOHP8Ow==
X-Received: by 2002:a2e:a793:0:b0:25a:74f4:b377 with SMTP id
 c19-20020a2ea793000000b0025a74f4b377mr6429372ljf.177.1656625419868; 
 Thu, 30 Jun 2022 14:43:39 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 v22-20020ac258f6000000b00478f739f1fdsm3296894lfo.103.2022.06.30.14.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 14:43:39 -0700 (PDT)
Date: Fri, 1 Jul 2022 00:43:36 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 04/15] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width
Message-ID: <20220630214336.tyhll4ldrgdibnjv@mobilestation>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <20220629184343.3438856-5-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629184343.3438856-5-mail@conchuod.ie>
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, dmaengine@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 07:43:33PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Most users of dw-apb-ssi use spi-{r,t}x-bus-width of 1, however the
> Canaan k210 is wired up for a width of 4.
> Quoting Serge:
> The modern DW APB SSI controllers of v.4.* and newer also support the
> enhanced SPI Modes too (Dual, Quad and Octal). Since the IP-core
> version is auto-detected at run-time there is no way to create a
> DT-schema correctly constraining the Rx/Tx SPI bus widths.
> /endquote
> 
> As such, drop the restriction on only supporting a bus width of 1.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> Link: https://lore.kernel.org/all/20220620205654.g7fyipwytbww5757@mobilestation/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index e25d44c218f2..0a43d6e0ef91 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -143,12 +143,6 @@ patternProperties:
>          minimum: 0
>          maximum: 3
>  
> -      spi-rx-bus-width:
> -        const: 1
> -
> -      spi-tx-bus-width:
> -        const: 1
> -
>  unevaluatedProperties: false
>  
>  required:
> -- 
> 2.36.1
> 
