Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338575625EA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 00:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1CC10F3C3;
	Thu, 30 Jun 2022 22:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C146610F39E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 22:15:59 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id y18so574101iof.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 15:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ak3+dnp61amEiQ9u+EY3cuHBMwvFNkOIcVD4cKlddrk=;
 b=VOSc+P7Q6V13bwM0OONJ9IKlFL7THY0LYLLuWGA93Q2Tg21c1tM4EMAuWJLyP94cWU
 0ipuyF1IwG/P0doouosdXtfrjFxRaM4rVrjvfRO8iXDVYwSf+Zbv2Bz1cDXD8dRMkD1o
 UQTyfj5l/iVTD9h+Mfj5gsVTUTHgP0/b8gqXRPUwWE2Mqa/BnnqVDv9i2ag5gB0AXHui
 2l6zxJqfN19P4zOSMYdW1JqvX3oCv7Bq60snUvdVv1cc25KJSIiItPkWtPfpHQiEMKXY
 fTZV75nXaHZY6YcrPsLjpI/7q0P/41hQNoy+c6W61+ZVFOTNzF7iHQHv6SJO/mKfmgVE
 zHmw==
X-Gm-Message-State: AJIora+2H3xiu6DTgebQO1raseds4nNWZfw9zWCouRmF2eTrE8zxZ+bL
 t2AncrHXczgYKx1nmWM8zg==
X-Google-Smtp-Source: AGRyM1vE/h3cXANQTxAFuDv4VQARTKgj8HZVod3l/44O5+NhZJF0h2bjCBppIfPdZR/32eQjnyvy7g==
X-Received: by 2002:a05:6602:13c8:b0:669:c3de:776f with SMTP id
 o8-20020a05660213c800b00669c3de776fmr5469069iov.124.1656627359098; 
 Thu, 30 Jun 2022 15:15:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a05660214c900b006762d8becd4sm139051iow.55.2022.06.30.15.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 15:15:58 -0700 (PDT)
Received: (nullmailer pid 3418639 invoked by uid 1000);
 Thu, 30 Jun 2022 22:15:56 -0000
Date: Thu, 30 Jun 2022 16:15:56 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v14 01/15] dt-bindings: mediatek,dpi: Add DP_INTF
 compatible
Message-ID: <20220630221556.GA3418578-robh@kernel.org>
References: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
 <20220624030946.14961-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624030946.14961-2-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Jun 2022 11:09:32 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DP_INTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DP_INTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
