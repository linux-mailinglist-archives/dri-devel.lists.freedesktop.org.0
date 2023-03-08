Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745976B1190
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 20:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9101910E6E5;
	Wed,  8 Mar 2023 19:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F6810E6E5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 19:00:14 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id e21so12962824oie.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 11:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678302013;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNa/cVQhueG20Tof7moqLUCFmD+BmRjr+NvaKX3Ihsk=;
 b=6t5okxQrGTzrLPIZB2ORSfKm+3DHHAd1LuLSybrrjh5iGbrYzk1qgSEdo/NpUwXSQl
 xfpYqv47fGaKX2OeTIL6jAOJDcTgBhzdqxHi2PuJ8YSJBw7d2If9r/GeNRHIVCNXpzcq
 i+dTr8ntno9tZvzaIZi4h3/JIsAFiHbPfi8wwj/JsE0GeKW1ak5IobWgsQG/iOg1AZBo
 bwWvovcGsPJ3x7VvnaWEOjA5d+EHtrJp/T5SC1Vj0EqHRoqlI9JUZ5Z0Zyw/ZaxM73Eu
 zimbkrFlQqEqRTyCGCaM8DfM5+wIEE1xaGxs6gYnEdzp3b8inS5CYl1qUuvFiEkPa7IR
 iZAQ==
X-Gm-Message-State: AO0yUKVBftRwcocqHOUlfTUYDkVggOlhFbr2QQSQyc80Pv3EJJXqDqkq
 XperXsgY6YIHDoK9HEaBQg==
X-Google-Smtp-Source: AK7set+m69vr45bRObydhhWKNDty0kaMDB6eJGD8k3EItoKQM01NjxIxem4W68C07DwYBRVbhBjmmQ==
X-Received: by 2002:a05:6808:b14:b0:384:59df:189e with SMTP id
 s20-20020a0568080b1400b0038459df189emr8580664oij.55.1678302013673; 
 Wed, 08 Mar 2023 11:00:13 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bg23-20020a056808179700b0037832f60518sm6591779oib.14.2023.03.08.11.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 11:00:13 -0800 (PST)
Received: (nullmailer pid 3600642 invoked by uid 1000);
 Wed, 08 Mar 2023 19:00:12 -0000
Date: Wed, 8 Mar 2023 13:00:12 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 01/12] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
Message-ID: <167830201182.3600568.17557629958296302697.robh@kernel.org>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 28 Feb 2023 11:26:53 +0100, AngeloGioacchino Del Regno wrote:
> In preparation for adding new bindings for new MediaTek SoCs, split out
> the power-domains variation from the `else` in the current
> mediatek,mt8183-mali conditional.
> 
> The sram-supply part is left in place to be disallowed for anything
> that is not compatible with "mediatek,mt8183-mali" as this regulator
> is MediaTek-specific and it is, and will ever be, used only for this
> specific string due to the addition of the mediatek-regulator-coupler
> driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml        | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

