Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943F6500234
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 01:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339BE10E444;
	Wed, 13 Apr 2022 23:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AC210E444
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 23:02:31 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so3577474fac.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 16:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YGabHpljtiGxZkQuZz7c7j1W08I1Hvt5N3od6t4IJJo=;
 b=ZjF8bdcpUi5aY3t9qxK5k8JnWYMpbCwVRUZyPBHRJ+v1qG+GhKj6bdeZmAovQf2pM5
 fOpXMMPoB8ffhRPem4lFajQ1zZjIIVn50hFI+LhExtNBH+9g80onXC8xN/0ozOzXUEEq
 S1TYWTiCX/ebLQdhAbLebm5PUENMlJP1Z1IKJMKz/XIS/1608yclpfSXcLbHMHJ7dpTY
 3lwrxQlDpf//WR118tUtFYPWmqCPRRguu1gsqYnneirXJ8x+BeMFdBRPLJ8mrPzMMulJ
 HsSaQGQ6VRB5x2joELTi5gyAByl8YJjFBiz5P0qLUeuMnrvuaYmi9XruJkWa99Nu3arx
 E/ZA==
X-Gm-Message-State: AOAM530Mpe4nGo4Pvw1eP9frWXLU0APD179O3HmkpO1je11h9gG28PHr
 ydeQZHW0RkDeNlrevkzgIA==
X-Google-Smtp-Source: ABdhPJwINphfy50/Q8dN2oFmoDIYgUuh67h7+uBixXRlKaqQgwaNIyYXpCeE6RDA7FisUjBBzeJDPw==
X-Received: by 2002:a05:6870:40c9:b0:e2:d1bb:f4e1 with SMTP id
 l9-20020a05687040c900b000e2d1bbf4e1mr185356oal.243.1649890950111; 
 Wed, 13 Apr 2022 16:02:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x24-20020a056870a79800b000e2e53716fbsm173721oao.31.2022.04.13.16.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 16:02:29 -0700 (PDT)
Received: (nullmailer pid 4100836 invoked by uid 1000);
 Wed, 13 Apr 2022 23:02:28 -0000
Date: Wed, 13 Apr 2022 18:02:28 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH V2 1/3] dt-bindings: display: mediatek: Update disp_aal
 binding for MT8183
Message-ID: <YldWhNA6SwNBGXa8@robh.at.kernel.org>
References: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
 <20220411035843.19847-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411035843.19847-2-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, allen-kh.cheng@mediatek.com,
 chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, matthias.bgg@gmail.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022 11:58:41 +0800, Rex-BC Chen wrote:
> The driver data of MT8183 and MT8173 are different.
> 
> For MT8173, the gamma module is inside disp_aal. When we need to adjust
> gamma value, we need to use "has_gamma" to control gamma function
> inside disp_aal to adjust the gamma value.
> 
> For successors like MT8183, disp_gamma is separated from disp_aal. We
> just need to control disp_gamma directly and don't need to control gamma
> function inside disp_aal.
> 
> With this modification, the driver doesn't require any functional changes.
> We only update the dt-binding and DTS node to make it clear.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
