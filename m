Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF002523583
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 16:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC01110EE3F;
	Wed, 11 May 2022 14:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A9710EE3F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 14:30:56 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-e5e433d66dso3022300fac.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 07:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mp6dTbokvQGCqhdm89KjWBFi8stC9bHFTBWdjBNBqBw=;
 b=PhLNZXrSZqVIbMwQMn2qDBUJZwagw3/eANEet/PuUNpF1cPv2bibQEy5ZnIJqOdC/Y
 B5KHRmIXxb7eC+KrUKPpV+5ijz+vBUa3gDTZdEJrK321sNLOnayfmAHyr/g5QceH+UwI
 LGqzrFnrdrcCUOpFU3q0KUAb5Ug8rxeRlSMlAAjwqPd1BoqWuPbt1Y7Jh9frGcXmuTtt
 J15lPnVE3eW0ewO8kNVkTcOuuP77fgLPYETiFT06Rb5ecs+jeIrUTvGTpTwZsTJnErQi
 oDnOBWhT35/ee8GnmJs4DE0GVOH4kMynQPf/PDoOUM+xaO11GSBtoipjTclU01y/Sgcs
 E9ow==
X-Gm-Message-State: AOAM530upCP/WvghHxwuBg9yiEWJdIRTjgQkHPzy2EBabkDaFyJgnQKR
 XvF44qsut7XxVKnDMHqHaQ==
X-Google-Smtp-Source: ABdhPJzrzFc0fZ7+LrYKUTYDibPYbzEg//RObkHsFf1tLCR7BDw2r72XuTFEFO0zWdV4Qjlt6iDktg==
X-Received: by 2002:a05:6870:2e06:b0:ee:e90:7e65 with SMTP id
 oi6-20020a0568702e0600b000ee0e907e65mr2780364oab.49.1652279456231; 
 Wed, 11 May 2022 07:30:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 22-20020aca2116000000b00325cda1ff8esm803219oiz.13.2022.05.11.07.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:30:55 -0700 (PDT)
Received: (nullmailer pid 263258 invoked by uid 1000);
 Wed, 11 May 2022 14:30:54 -0000
Date: Wed, 11 May 2022 09:30:54 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
Message-ID: <20220511143054.GA263204-robh@kernel.org>
References: <20220504091923.2219-1-rex-bc.chen@mediatek.com>
 <20220504091923.2219-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504091923.2219-2-rex-bc.chen@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, xinlei.lee@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 04 May 2022 17:19:20 +0800, Rex-BC Chen wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dsi.txt         |  62 ----------
>  .../display/mediatek/mediatek,dsi.yaml        | 115 ++++++++++++++++++
>  2 files changed, 115 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
