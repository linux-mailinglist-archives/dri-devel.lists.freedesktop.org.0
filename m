Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA3253B98E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 15:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F9810F284;
	Thu,  2 Jun 2022 13:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7D010F284
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 13:20:28 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-f2e0a41009so6694618fac.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 06:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bTbwu+Mz+i2T1fupPqwAFML/HPc02MWUuXZGeQCvXZ8=;
 b=o9b1UiL7bEl3bAMQuYFsZRrO/jJTYciIVpn7FEHwdbqLUzvtbGwa2z6T8Nz1cKZn8a
 jgj55TNskGt0LixRW9D6SBp6+A/oIZ+885yfM+8eLG+kvrLYLaAlw+YTLBoa3PLSAN8S
 GD1A8ZBeZ+H3xgIER3WXnwlAJe0xsJ8mWtheuFi0HswXFbFhddgoy34fc6vNH20I4OgW
 I0XikyR53bM5pNXHkGzeGL1NyhdRbnit1iZ/+d9zdNxZ9ixIwj+60TlLxVf6rcA1wJpG
 dDXrmKvKlC4Lx7VipIEW5wvnb+GjpINRBPLc6U/CKi++i4bqXy/TA493CxQXwmYeRY1P
 e7RQ==
X-Gm-Message-State: AOAM530uc+xeXY4qzpJ8/quYEEDw7RHDMRs9ZsWMLTLo9ToopGKQg/LD
 Lo76HHZplT0lOwC3uSN2IQ==
X-Google-Smtp-Source: ABdhPJx8+7c641wEUgu8STii4oQje/7ttveo4f3P9XPnuvNlZ3Xg+IQx39aBP3kiPfMlhnetHIGGwg==
X-Received: by 2002:a05:6870:3456:b0:e9:23d3:e701 with SMTP id
 i22-20020a056870345600b000e923d3e701mr2756689oah.11.1654176027237; 
 Thu, 02 Jun 2022 06:20:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w2-20020a9d5a82000000b0060603221240sm2220019oth.16.2022.06.02.06.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 06:20:26 -0700 (PDT)
Received: (nullmailer pid 2133915 invoked by uid 1000);
 Thu, 02 Jun 2022 13:20:25 -0000
Date: Thu, 2 Jun 2022 08:20:25 -0500
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v10 02/21] dt-bindings: mediatek,dp: Add Display Port
 binding
Message-ID: <20220602132025.GA2110588-robh@kernel.org>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-3-granquet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523104758.29531-3-granquet@baylibre.com>
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Helge Deller <deller@gmx.de>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 23, 2022 at 12:47:35PM +0200, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

The example has warnings. Run 'make dt_binding_check' before submitting.
