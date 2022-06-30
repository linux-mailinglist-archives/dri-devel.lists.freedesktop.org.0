Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5085625ED
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 00:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E17112CD9;
	Thu, 30 Jun 2022 22:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D91112C99
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 22:16:13 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id i17so273774ils.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 15:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bwQzM8Z8cc5RUevl243HXV9krJjNefuoRXCjNrL2NnE=;
 b=Z+26HmYEU5flC4m28QBnS7UwP+TtocOQZT+bd4BR0FSmqxSUtQMV5KeZQeYlx676qd
 hw762XVBpZTDuY8jU39I0bNeEHIw6ev3LwIiY+UFtyvjPKvksLq/u3DDV1hJNnA8nnbk
 /PH/0H5e/mAxQw8gGtFpM6UvzxZP1QU+cZR/KWbQc849QJV+Q3oBzZAOx5AbZUB36Oqu
 1vj4QITttkmcvqYNBdsIlvoWhRsuMnZidnjM3hKKZwu+Ltz4cJ1IpFerY1zF9XpDMuDq
 HDjsiZjVvB6J/AZvnZQxuLYBEtr+YkYZm5vJh/sO8FZ8pY1NkMuIf21RZOwuAORvvnj2
 YwMQ==
X-Gm-Message-State: AJIora/Swn48nPx5sLCGCcUVL3k1WDQrLXUNOk87O571DnUucw3fHP5v
 7Uf6blem+/CebNLpMGor/A==
X-Google-Smtp-Source: AGRyM1vIk+ofmEwR6kuswgAQlqMcwDrBTvWp70c3wJfdkA9jj0wzSMn+FzZ4UshCMr+WX2wnrh8qjQ==
X-Received: by 2002:a05:6e02:1b84:b0:2da:656a:ce11 with SMTP id
 h4-20020a056e021b8400b002da656ace11mr6680248ili.261.1656627372649; 
 Thu, 30 Jun 2022 15:16:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a056638026800b00339c46a5e95sm8947669jaq.89.2022.06.30.15.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 15:16:12 -0700 (PDT)
Received: (nullmailer pid 3419102 invoked by uid 1000);
 Thu, 30 Jun 2022 22:16:09 -0000
Date: Thu, 30 Jun 2022 16:16:09 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v14 02/15] dt-bindings: mediatek,dpi: Revise mediatek
 strings to correct format
Message-ID: <20220630221609.GA3419045-robh@kernel.org>
References: <20220624030946.14961-1-rex-bc.chen@mediatek.com>
 <20220624030946.14961-3-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624030946.14961-3-rex-bc.chen@mediatek.com>
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
 chunkuang.hu@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Jun 2022 11:09:33 +0800, Bo-Chen Chen wrote:
> Strings replacement:
> - s/mediatek/MediaTek/ in title.
> - s/Mediatek/MediaTek/ in description.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
