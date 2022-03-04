Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED6D4CD81A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 16:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD09D10F9DF;
	Fri,  4 Mar 2022 15:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AF710F526
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 15:39:41 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 n5-20020a4a9545000000b0031d45a442feso9757166ooi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 07:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IO1zrbMJCIdW27ZYcLkomHz9MZD/3xTBxiCCeGbY4nY=;
 b=UmHSJMSTMEUDV/M+8NMOYlPVo4ipmz10LZt9zmpofoRz8UhmwPT2dGpKZrk/BfmitZ
 be6pwwDjzbBUurGLnOdwjFoaKTLnfLICWmqMvl6VD2M2+S9XPru2HskLnc0IYRJ96iMD
 oDYXRC2sCTHoNdgVVtdbaqyxfEW0iUYHKvdMqJ87FOBYq/zuFgbrzuO0TvtGFhhbWNOM
 ssI5pcgQ+Zep0DF5P8jZoQ/fK+sA3Seg5wP+B3U0uZJIEJtVfJZIO2UzVvcJT7LQ1dcR
 j/zo5clazktXOWuI8whPs2i6AdKbZc54qWCEDfyQpVRFBrPg/Dq9Apf1MRXZaHoTc1a8
 W8Pg==
X-Gm-Message-State: AOAM531oAb4Rcnnw0ixWGg3JdYvfF7lV3PbtjC7ZZqYYyKS9JCnjWbT8
 fFLUPZfd6ZWX8VK4H9cDAg==
X-Google-Smtp-Source: ABdhPJzV3nnvTE6V/swPLdnnc8Rt2egbCzhY1OPkkrIIw8e54gAgN9Xe2bv5Gl3lRvSRncaFjcChng==
X-Received: by 2002:a05:6870:248c:b0:d7:19f3:a52c with SMTP id
 s12-20020a056870248c00b000d719f3a52cmr8397016oaq.149.1646408380509; 
 Fri, 04 Mar 2022 07:39:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 35-20020a9d0026000000b005ad363440a2sm2376353ota.64.2022.03.04.07.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:39:39 -0800 (PST)
Received: (nullmailer pid 3987557 invoked by uid 1000);
 Fri, 04 Mar 2022 15:39:38 -0000
Date: Fri, 4 Mar 2022 09:39:38 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Fix examples on new
 bindings
Message-ID: <YiIyupjEgdiaj0Dv@robh.at.kernel.org>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alexandre.torgue@foss.st.com, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Mar 2022 10:54:58 +0100, AngeloGioacchino Del Regno wrote:
> To avoid failure of dt_binding_check perform a slight refactoring
> of the examples: the main block is kept, but that required fixing
> the address and size cells, plus the inclusion of missing dt-bindings
> headers, required to parse some of the values assigned to various
> properties.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        | 24 +++--
>  .../display/mediatek/mediatek,ccorr.yaml      | 23 +++--
>  .../display/mediatek/mediatek,color.yaml      | 23 +++--
>  .../display/mediatek/mediatek,dither.yaml     | 23 +++--
>  .../display/mediatek/mediatek,dpi.yaml        |  3 +-
>  .../display/mediatek/mediatek,dsc.yaml        | 23 +++--
>  .../display/mediatek/mediatek,ethdr.yaml      | 99 ++++++++++---------
>  .../display/mediatek/mediatek,gamma.yaml      | 23 +++--
>  .../display/mediatek/mediatek,merge.yaml      | 49 +++++----
>  .../display/mediatek/mediatek,mutex.yaml      | 25 +++--
>  .../display/mediatek/mediatek,od.yaml         | 14 ++-
>  .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++--
>  .../display/mediatek/mediatek,ovl.yaml        | 26 +++--
>  .../display/mediatek/mediatek,postmask.yaml   | 23 +++--
>  .../display/mediatek/mediatek,rdma.yaml       | 28 ++++--
>  .../display/mediatek/mediatek,split.yaml      | 17 +++-
>  .../display/mediatek/mediatek,ufoe.yaml       | 19 ++--
>  .../display/mediatek/mediatek,wdma.yaml       | 26 +++--
>  18 files changed, 316 insertions(+), 178 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
