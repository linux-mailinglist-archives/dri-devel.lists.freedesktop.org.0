Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E638C580807
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C9410E73C;
	Mon, 25 Jul 2022 23:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964D110E73C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:14:08 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-10d8880d055so16697389fac.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 16:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IT9a0wSsGnU4XfNa0zlbA+WkW9Dbub1UMbz6KfLI6MY=;
 b=Y28VOTRGhSHRPILkmFXwpJL7MxeMvCpxpnJcJUiLrqRYMrKKloo8rRRWtRNPPzOuiV
 8mSuvH5E6dwytCmuk0Tmm/UfFYCHKX7tW5in4D42Ldu3ZT8jWHicariS/+ULdOOP+cbZ
 EqysaOwKIjpFP0b97o9c2JHSJs2FN4rostId1GUZ85o2NRgYmcNA/vT1Fk91CRA3zEt8
 sFmXpCS/rlsj7CnBHjmkcCecM9jN2Mw3aL5FGiZTTioqr5CRI3XH4UzDMqtr95ZJ7KnU
 5cmdr8fXUn6UxlZVQH2vgV/JcJ8gX3ryEAtqKBeHEKXPj532zNzLsg35zpoUrt4IhgW2
 stMg==
X-Gm-Message-State: AJIora8bmqHgyBIOmgui4n1o991f339km58HuqPAXWvp4HJaapupymiK
 Q3EnDNzVtaeDOCeEUwvalw==
X-Google-Smtp-Source: AGRyM1sOEaENPiaKZi6zm2YQdCZcWqFgTUzFmo56Scl3zxQjWiAN/UML1fly4p3EtWEnkVWhfcKP5g==
X-Received: by 2002:a05:6870:9a1d:b0:10d:c9c5:e16a with SMTP id
 fo29-20020a0568709a1d00b0010dc9c5e16amr7700750oab.135.1658790847779; 
 Mon, 25 Jul 2022 16:14:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 62-20020a4a1541000000b0041b49c19a00sm5359166oon.18.2022.07.25.16.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 16:14:07 -0700 (PDT)
Received: (nullmailer pid 2932291 invoked by uid 1000);
 Mon, 25 Jul 2022 23:14:05 -0000
Date: Mon, 25 Jul 2022 17:14:05 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/1] spi/panel: dt-bindings: drop CPHA and CPOL from
 common properties
Message-ID: <20220725231405.GA2931469-robh@kernel.org>
References: <20220722191539.90641-1-krzysztof.kozlowski@linaro.org>
 <20220722191539.90641-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722191539.90641-2-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Marek Belisko <marek@goldelico.com>, Sam Ravnborg <sam@ravnborg.org>,
 Pratyush Yadav <p.yadav@ti.com>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Jul 2022 21:15:39 +0200, Krzysztof Kozlowski wrote:
> The spi-cpha and spi-cpol properties are device specific and should be
> accepted only if device really needs them.  Drop them from common
> spi-peripheral-props.yaml schema, mention in few panel drivers which use
> them and include instead in the SPI controller bindings.  The controller
> bindings will provide CPHA/CPOL type validation and one place for
> description.  Each device schema must list the properties if they are
> applicable.
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/panel/lgphilips,lb035q02.yaml    |  3 +++
>  .../bindings/display/panel/samsung,ld9040.yaml        |  3 +++
>  .../bindings/display/panel/sitronix,st7789v.yaml      |  3 +++
>  .../devicetree/bindings/display/panel/tpo,td.yaml     |  3 +++
>  .../devicetree/bindings/spi/spi-controller.yaml       | 11 +++++++++++
>  .../devicetree/bindings/spi/spi-peripheral-props.yaml | 10 ----------
>  6 files changed, 23 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

Unless Mark doesn't want to pick this up.
