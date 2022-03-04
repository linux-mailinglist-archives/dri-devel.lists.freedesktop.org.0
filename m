Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C296F4CD80C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 16:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEE8112121;
	Fri,  4 Mar 2022 15:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE3D112122
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 15:37:36 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 u17-20020a056830231100b005ad13358af9so7711130ote.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 07:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r+7LdT2y9uXyeXQDCwlxps28MTYEq5fDPijsqcJwyto=;
 b=JsB7dM/XFsZE7jweY/kvHYtRG85dWGn8Ge2EwDb0fSM+VIJWZRmG5+WdQ2+1jHyC8R
 IgM/h3IRFDq2+y2tKOoGYO6CbtwlpNkc6yTt+tCaqzlWMrFzI/7YRImCzN3nI6J9iq4p
 MWpErMZvLRh7a8hTk9XGqWohLEn+FdOgeEjn3xjX66N9THSD8XCEQznoWxTVg7zV/JJC
 8Yg4DZpxksNlFkN7LipNeacpRmFjb5RJsb/2HCIZMXjt+SkpCrXI5N8JKO+AEOXuCBBS
 gpowuXnaApX5iLUCuVDoRZ3q+sUhxK5VTQhfDAse9iQrA3GRkOabkKSNmXb1rP8VjnPh
 jirw==
X-Gm-Message-State: AOAM5332EwjIeOLzRCzUwlh78+jsbfb0gzZJKaQagi5hcoSBiUUVpqtC
 HiTB6Tu+0d//oykdG46Ofw==
X-Google-Smtp-Source: ABdhPJyS8IcggXZIQLqNgBK43mnyO4KB0rLd++CNegRmXhAPHh2bGQ7UVv06ZazIdvDbkatuCV33kw==
X-Received: by 2002:a05:6830:33cf:b0:5af:4018:fc2a with SMTP id
 q15-20020a05683033cf00b005af4018fc2amr22847666ott.161.1646408255646; 
 Fri, 04 Mar 2022 07:37:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056830054d00b005a3cce351a1sm2577422otb.28.2022.03.04.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:37:34 -0800 (PST)
Received: (nullmailer pid 3984240 invoked by uid 1000);
 Fri, 04 Mar 2022 15:37:33 -0000
Date: Fri, 4 Mar 2022 09:37:33 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: mediatek,ovl: Fix 'iommu'
 required property typo
Message-ID: <YiIyPUGsH5bxapMS@robh.at.kernel.org>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
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
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, jason-jh.lin@mediatek.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Mar 2022 10:54:57 +0100, AngeloGioacchino Del Regno wrote:
> The property is called 'iommus' and not 'iommu'. Fix this typo.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
