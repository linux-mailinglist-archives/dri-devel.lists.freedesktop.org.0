Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC565258A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 18:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BFC10E0DB;
	Tue, 20 Dec 2022 17:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FD910E0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 17:26:34 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso16132734fac.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4M2G5tAP96aHEIkyll33q5MFWXKDDZiGpZ9U6HjjopI=;
 b=wKLeQsLpwRx1gkgHRCv2jZKPLDzrWZbW4b5GChoYXA4YkEXgBC1mF/3bgfd6V1Z23h
 0unF0G8+h0O4HdCZwCKvf3DYLG3rKBheTfLJvqSFCJjORwrVHFlkuQKr2S3cDI/YYxX+
 CEvrVRgoz+xUAbuhKWhk8DNvXAEavQJiMSscjmUQp8k7JwCa/UTfG+x7kXYB/i7RcWx+
 JZahbgkQMAp2R5w4nuQHGY2kw6q8eCCT1COYbA+V3w14z0gqZoJylc+TiLlVeY3dKy7I
 TnTtVziyKBZiEWbtS2hs1paXHfY1fUqV7vJ9xLjzL9Lcf/O4+IjWwbWAF3zMlaOPs+DC
 caBg==
X-Gm-Message-State: ANoB5pk8RsMcQO12l2gREazncc9Y3QfTJ43zvZN4yixUkJbS6x0jUbBr
 XeOPb3sKfPOf1JhlgFM9PA==
X-Google-Smtp-Source: AA0mqf6PMqjVBcS2KbfPfigLZKoFqm3zbK1aNyc6aBW3vGD43BaZGHI5hNI7IiHtjf4xgVp56uF32A==
X-Received: by 2002:a05:6870:44d1:b0:144:d3f9:ff14 with SMTP id
 t17-20020a05687044d100b00144d3f9ff14mr21897111oai.14.1671557194070; 
 Tue, 20 Dec 2022 09:26:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 be13-20020a056870588d00b00142fa439ee5sm6222204oab.39.2022.12.20.09.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 09:26:32 -0800 (PST)
Received: (nullmailer pid 778943 invoked by uid 1000);
 Tue, 20 Dec 2022 17:26:31 -0000
Date: Tue, 20 Dec 2022 11:26:31 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v10 17/18] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8M Plus support
Message-ID: <167155719100.778885.10539247780206262698.robh@kernel.org>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <20221214125907.376148-18-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214125907.376148-18-jagan@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 14 Dec 2022 18:29:06 +0530, Jagan Teki wrote:
> Samsung MIPI DSIM bridge can also be found in i.MX8M Plus SoC.
> 
> Add dt-bingings for it.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v10, v9:
> - none
> 
>  Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
