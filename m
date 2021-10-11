Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8663428E6F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 15:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A466689EAC;
	Mon, 11 Oct 2021 13:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3281489EAC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 13:44:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k7so56275539wrd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A7TD3sEyqxQ0X3DP82vXK523PsJpNS15uJqkN1lKgwU=;
 b=3zqPHeCtiwGU0NHoNjgSWw1LEyR7aqUxglAy8cIU+b094JEYM0sP3n7hHVL8CHf8nf
 HXC7RzLd5409ZeHqe4WfAkl8+ylkyCktx0NxqRi9D1QWKjuKmpQLm4NvCB/rTmW6VTww
 fZVqtW4tUfmosRfRn1aKa6Zwhdrejx1Kss9q66Z0cy861o1qtj3cxjjChvdPe6xt39D2
 ifqCf68cXpW8HZCB439PpsWeH1v6vjNauAHUACGGo2NF4fC00VStBvLj0M3BjEsyqOmN
 cWHAPcE3qAbe5n2yj9eESC8xYQfxjfNpFkUAEdC6Bco+cQ7XIhA5bqV9BpMDf4iTjsiX
 JkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A7TD3sEyqxQ0X3DP82vXK523PsJpNS15uJqkN1lKgwU=;
 b=mI6WB8HyjeYurz3B5kHsDzgwHd2mc4ijKgqNN16tw6Tu/ste9DP4iXrvGgZnPM5tdJ
 KC8Xa2jltx/amIUBuiQ+WNv8XyvBdzjlIgW83gfvuHcMTQAneaTPutqhGrio2IAxfDsy
 2edDSNFvKSj00VrVcI7iINoA2AEpU8iLQl5P3KQpx5+RREErp3aqz30PC2AuU+H5seLW
 Eqf4cVo9RxpY832xp9M/GNHd3tquZq+558PVEBSItIHK/meLmb1lgnxlA6N/AkriHPCy
 uRN/KFn0vJkT8p3ztnF6sugf3uRZ3Chq24J1sRnSXWlyCjsFYuZi0J1OG8xnrSC5Ot8h
 bmLQ==
X-Gm-Message-State: AOAM531kDhGHOs2WR2nDmxfIQMFA0I732yaXzUQ/ySFk2r5k44uXezrx
 ooJbVUUGiL2Di3vWmjsowHtsMQ==
X-Google-Smtp-Source: ABdhPJydwj7M4z6iZA4YhZBGnqu/rkJnC9o3iN/3pp6K1plBVfMpdwPh8RRzmYY7BkzkRRwnEu23eA==
X-Received: by 2002:adf:e292:: with SMTP id v18mr759164wri.369.1633959848748; 
 Mon, 11 Oct 2021 06:44:08 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id v23sm7653201wmj.4.2021.10.11.06.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:44:08 -0700 (PDT)
Date: Mon, 11 Oct 2021 15:44:07 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Message-ID: <20211011134407.t57ajlzrcequ2ln4@blmsp>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-3-msp@baylibre.com>
 <1633959378.253312.504945.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1633959378.253312.504945.nullmailer@robh.at.kernel.org>
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

Hi,

On Mon, Oct 11, 2021 at 08:36:18AM -0500, Rob Herring wrote:
> On Mon, 11 Oct 2021 11:46:19 +0200, Markus Schneider-Pargmann wrote:
> > This controller is present on several mediatek hardware. Currently
> > mt8195 and mt8395 have this controller without a functional difference,
> > so only one compatible field is added.
> > 
> > The controller can have two forms, as a normal display port and as an
> > embedded display port.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dts:20:18: fatal error: dt-bindings/power/mt8195-power.h: No such file or directory
>    20 |         #include <dt-bindings/power/mt8195-power.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1441: dt_binding_check] Error 2

Yes, mt8195-power.h is unfortunately not merged yet.

Thanks,
Markus

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1539195
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
