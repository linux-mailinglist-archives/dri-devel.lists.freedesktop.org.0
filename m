Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5733E313B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 23:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66766E118;
	Fri,  6 Aug 2021 21:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328C36E118
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 21:39:05 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id a13so14162349iol.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 14:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7de5tolBWZq18Zw+L/U81d1pEQY7EMCoZVERp/FRCDI=;
 b=pSK4Q8iLMDWURh5GufTEmKdovJkBozWEmvfbV7JKkm8GUIi/UFRU+vazVRTrZ434zb
 pt/6FbmfaT7QaYvyHnCQzRmBc5x1uRnlyTTMpCFWvEKT3ZwHnm7sGHh8abzX5OiWS97D
 V2D/zWjNaTUdXb6XkHshTSy0K6d9NAlPH/QwKIkAlweZ4eljxjycR1z9SVlfqjJM6Np/
 pVDvRPeoSXy1ejz2C/IcqUmLT0YKc8/xueNiGOJQaPvUs/r5fYjnlhH/hHHxctoh3Oif
 818d1b7jfecCEaKmRgGYf3cTaR+7TJtHCLlNvyv0PMYf3uK2RHZ3zLzCZPSC3rK69cg4
 VAEA==
X-Gm-Message-State: AOAM533CYEPxQE4u6fdzlNpR1QkcYpkYZDw6yT7CnrA3U0IVqiwS2ISU
 zZt4bc9tovB5proDCJqU8A==
X-Google-Smtp-Source: ABdhPJxTLbGslSUzO7Jkq47TbQYUHxhicw/Ad6Gy5IXySA7I7XS1Ra9f5bmquX4igCtvfeuiJxghCw==
X-Received: by 2002:a02:9082:: with SMTP id x2mr8076067jaf.44.1628285944257;
 Fri, 06 Aug 2021 14:39:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id k13sm4911260ilv.18.2021.08.06.14.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:39:03 -0700 (PDT)
Received: (nullmailer pid 1848297 invoked by uid 1000);
 Fri, 06 Aug 2021 21:39:01 -0000
Date: Fri, 6 Aug 2021 15:39:01 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, ck.hu@mediatek.com, stonea168@163.com,
 huijuan.xie@mediatek.com, rex-bc.chen@mediatek.com, shuijing.li@mediatek.com,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: drm/bridge: anx7625: add
 force_dsi_end_without_null
Message-ID: <YQ2r9ZJHLdiN5/BZ@robh.at.kernel.org>
References: <20210802010711.169080-1-jitao.shi@mediatek.com>
 <20210802010711.169080-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802010711.169080-2-jitao.shi@mediatek.com>
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

On Mon, Aug 02, 2021 at 09:07:10AM +0800, Jitao Shi wrote:
> The force_dsi_end_without_null requires the dsi host ent at
> the same time in line.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../bindings/display/bridge/analogix,anx7625.yaml           | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index ab48ab2f4240..8b868a6a3d60 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -43,6 +43,11 @@ properties:
>    vdd33-supply:
>      description: Regulator that provides the supply 3.3V power.
>  
> +  force_dsi_end_without_null:
> +    description: |
> +      Requires the dsi host send the dsi packets on all lanes aligned
> +      at the end.

Can't this be implied from the compatible string if it is a property of 
this chip? 

