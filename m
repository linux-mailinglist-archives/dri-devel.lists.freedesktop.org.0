Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B02EEBA8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 04:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635E46E5C5;
	Fri,  8 Jan 2021 03:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5E16E5C5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 03:07:03 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id 81so8340334ioc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 19:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8KcxnzAs3ni/01L1eWgKza5Z0B+3uDNHSn0G445YVHg=;
 b=GRc2m+vPFicFqrZwhvWnyRY+HRIEIAvmeQFJ5i7IUeg3UxA3DRYhQAdncC0xDuqTr/
 Kn22LTfxrLrMlHUEkiBQjxgXnZWOqoXCpwniZoCqiO5rGLyP7iaC0ZmiKeIQnTcFKhSv
 xgSWsxTgsaJ+y8Y9e7WFq0+9+KhIHaNuv0O+bnDyU+xrvb9uNhjsPtYMT7RSZVwy433X
 4k2F77JfAohXN34qBZrDyeCyYSMtAlof3NAhG/pMB8I4rabDmypV3TPwV+eKfUxHG85a
 rI66wHSldd7DjFDGrlNWRJlSxbGC+tthml/j8jeq0w3PT7JfXXmV9C3MYB6w4KOz+Mff
 6/pg==
X-Gm-Message-State: AOAM530VcdcA3zkBjQs5BnSjAjE9krd0KXG//X8xbI6jMbgivDM9uirv
 dT2Q+GciREwTqfyTAydEfw==
X-Google-Smtp-Source: ABdhPJxfKaoaAn2T5WBaPEv5PLxKzEgHV8iS3F793MOnICO4dRtjruSucVwbpui6WwUnMMVGHMmVLw==
X-Received: by 2002:a5d:9c91:: with SMTP id p17mr3801573iop.36.1610075222485; 
 Thu, 07 Jan 2021 19:07:02 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x5sm5939782ilm.22.2021.01.07.19.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 19:07:01 -0800 (PST)
Received: (nullmailer pid 1802363 invoked by uid 1000);
 Fri, 08 Jan 2021 03:06:57 -0000
Date: Thu, 7 Jan 2021 20:06:57 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 09/11] dt-bindings: usb: convert mediatek,
 mtk-xhci.txt to YAML schema
Message-ID: <20210108030657.GA1802097@robh.at.kernel.org>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
 <20201225075258.33352-9-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-9-chunfeng.yun@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Dec 2020 15:52:56 +0800, Chunfeng Yun wrote:
> Convert mediatek,mtk-xhci.txt to YAML schema mediatek,mtk-xhci.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v5: changes suggested by Rob
>   1. refer to usb-xhci.yaml instead of usb-hcd.yaml
>   2. remove unnecessary maxItems
>   3. add items for all phys may be supported
>   4. change pattern, and limit pattern length of patternProperties
> 
> v4: update it according to Rob's suggestion
>   1. modify dictionary of phys
>   2. fix endentation in "mediatek,syscon-wakeup" items
>   3. remove reference to usb-hcd.yaml
> 
> v3:
>   1. fix yamllint warning
>   2. remove pinctrl* properties supported by default suggested by Rob
>   3. drop unused labels
>   4. modify description of mediatek,syscon-wakeup
>   5. remove type of imod-interval-ns
> 
> v2: new patch
> ---
>  .../bindings/usb/mediatek,mtk-xhci.txt        | 121 ------------
>  .../bindings/usb/mediatek,mtk-xhci.yaml       | 178 ++++++++++++++++++
>  2 files changed, 178 insertions(+), 121 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
