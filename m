Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE65293E3
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C92310E3F6;
	Mon, 16 May 2022 22:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F9E10E3F6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 22:56:38 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-f165bc447fso12278373fac.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 15:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9JpR0VbPHC9Ot9LMXLbulS3SOKAjNY3sH8Ig5/561d0=;
 b=5yv75YJNGd69IxobHkbMACmG8qEgHf2MD8cV8H4Fgm98h20tE4WeinrvVVuXlW50eT
 i9Q0IoqRpIN+59XJAh+Lr8hlQvP+9Kfa+wL8SoNMYlo1bocRxEaDAWNl4nmcpkJOy4QO
 VlZ8zsUxbVnP0ouEmA+TVNJy9OdIs2hvMqKj/ZfRb1k+Po7LcJmEHZLG9n55NozE6ral
 h/lB2Is2nAOp36dR3wzpDo5B6uviBKCG6w8L9wZc0Iu6RuqEIUtSleyBfY5u2zrP5mUp
 dc0hz3FaUYbBgMdCNQsrsilwWY4l1aB3jDX46SRH6T/p5FIhKHp5k+SOuMl+dVdyUTEZ
 Mfhg==
X-Gm-Message-State: AOAM531Ei6it/Io5bM+qbip1/8khea70G2zq1l8YafV4WGMqk09DKUdb
 Z0dxqzoUU61oVuLerZgx0Q==
X-Google-Smtp-Source: ABdhPJwxKQk9+/mRedofsllv+p9O0Iv9HVxFpCS4EiHKJmsKR/DTsoiZSjr53bOAe0CGl8MZjRB6uA==
X-Received: by 2002:a05:6870:469e:b0:f1:6a40:e7dd with SMTP id
 a30-20020a056870469e00b000f16a40e7ddmr8836756oap.260.1652741798040; 
 Mon, 16 May 2022 15:56:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y22-20020a4a6256000000b0035eb4e5a6cfsm4578810oog.37.2022.05.16.15.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:56:37 -0700 (PDT)
Received: (nullmailer pid 3474248 invoked by uid 1000);
 Mon, 16 May 2022 22:56:36 -0000
Date: Mon, 16 May 2022 17:56:36 -0500
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 11/12] dt-bindings: display: exynos: dsim: Add NXP
 i.MX8MM support
Message-ID: <20220516225636.GA3474191-robh@kernel.org>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
 <20220504114021.33265-12-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504114021.33265-12-jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 04 May 2022 17:10:20 +0530, Jagan Teki wrote:
> Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.
> 
> Add dt-bingings for it.
> 
> v2:
> * updated comments
> 
> v1:
> * new patch
> 
> Cc: devicetree@vger.kernel.org,
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Note:
> I will send separate series for updating to yaml as the existing binding
> is old that it has some properties need to fix.
> 
>  Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
