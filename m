Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8802B715F3F
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 14:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF5910E037;
	Tue, 30 May 2023 12:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1371F10E037
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 12:27:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-973f8dbcc02so440270766b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449660; x=1688041660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Mlnk799/MfyB54DQ8/eLtl8DYJIH7QAdWviYq7D2W+E=;
 b=yabZWQjhxV76ieZOcwL1QgqGXFdbyAPcvg4gA6AvveAl2Iz8NAKMYmReuySiJmc1Cg
 tE0SupZtraraFkF2PWWdUNgvLks4oInKExm0cvA3IZ4I026dgvWUKK4VfvqYB3Xq0al1
 YaWqyGUpOXyHXL/gAFpld4uzzD8RPMllYPjgO3JKnvEAKr9ENX218gDzbIm5rfcWfLvC
 owmyR6u/rHAZn1MAg8F6nq6wD7ZnR0nWIE+BUCNrHaHRpPUpLaPeMB1NV7SgKxm5xfaZ
 aYJcg6CnwtfvmjcnEt4ZC2xAL47yxCWJwpltUMT7TuHqkPy0TRpN4Xm18NsWllBZzzQK
 99bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449660; x=1688041660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mlnk799/MfyB54DQ8/eLtl8DYJIH7QAdWviYq7D2W+E=;
 b=hwqgIFichLEEyOdgz0D7t3VgYsoIRQlDRaFVqQ2N018CgKUty6ZXMl8aRMjakr//xN
 ExnF6K8am7TarM5uyXzUpOrnVnFQfEjH+kVWFo/L90o2Tl0xRp5FnhWyuXezRrQYjcr+
 oiDi5aUv/DsJXgCklwVBxIgOGRPSMDYe3A82W+kpA6JXQ6woMCI8CxUrbUL9XIxxOyz5
 J2lTC7Hh+8ROSayzXrKM2dt0xbYusxw2F0sY+9bZNsmQMZ2SRO5n/EdPK2JpIy2Y/Vj2
 ELXY97CQ0v6CaldrHMCrh07hdHDQRE0YdA7OgKcTrNz2+qzXYfiulkiLeewx26m5FLCR
 0+0Q==
X-Gm-Message-State: AC+VfDyj38K5a4WahsTZK4rGetRBeW2PFHpia3HlqqPts6i1d0dAXoq9
 YIz8+ityNusCgik+mc3H3b6CMQ==
X-Google-Smtp-Source: ACHHUZ4FRtZtGdub5NQDntPy9nGyeS/bwj7mFnRDmzYb5VuO1PJh2E+P8gVT3nDseQEkWbZm/MnbqQ==
X-Received: by 2002:a17:907:318d:b0:961:69a2:c8d6 with SMTP id
 xe13-20020a170907318d00b0096169a2c8d6mr2552988ejb.69.1685449660040; 
 Tue, 30 May 2023 05:27:40 -0700 (PDT)
Received: from krzk-bin ([178.197.199.204]) by smtp.gmail.com with ESMTPSA id
 f18-20020a170906049200b009661484e84esm7356444eja.191.2023.05.30.05.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 05:27:39 -0700 (PDT)
Date: Tue, 30 May 2023 14:27:36 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: display: st,stm32-dsi: Remove
 unnecessary fields
Message-ID: <20230530122736.tflfu5cugbd7ooup@krzk-bin>
References: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
 <20230529091359.71987-3-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230529091359.71987-3-raphael.gallais-pou@foss.st.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 kernel@dh-electronics.com, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 May 2023 11:13:57 +0200, Raphael Gallais-Pou wrote:
> "#address-cells" and "#size-cells" are two properties that are not
> mandatory. For instance, the DSI could refer to a bridge outside the scope
> of the node rather than include a 'panel@0' subnode. By doing so, address
> and size fields become then unnecessary, creating a warning at build time.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-dsi.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1787034


dsi@40016c00: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)
	arch/arm/boot/dts/stm32f469-disco.dtb

dsi@5a000000: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)
	arch/arm/boot/dts/stm32mp157c-ev1.dtb
	arch/arm/boot/dts/stm32mp157c-ev1-scmi.dtb
