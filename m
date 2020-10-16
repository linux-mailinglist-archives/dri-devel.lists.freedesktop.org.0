Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E94290A3B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 19:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362E36EE35;
	Fri, 16 Oct 2020 17:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7B26EE35
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 17:05:55 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id w141so3193622oia.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A/8zvBkLXoT4fEh9CsyvZyg2kP0as5ZRTpEA4cUQadM=;
 b=WAE4w6uXrP7wsDR/f64/jOU9QxzKyRgPBXgHOsfu1+a97tUViRb6zbM0U+2yu2I3kV
 sf0p9DV5t9SUv/ND5QmXYk/b/fpyafkj6SOY9z+cR74TzeHHSefjccUStf1pXx5rTW6K
 NNjFMHqfW3Dovl7YA/9gXfWHa+4/XXBwtxpep//FHK7R5kbtvV9Nvd6pXhfp1LYzOCG5
 jad14cY5sL7T7Xqy5v3nBWZ+MciKTAgmzV8SoFvu+vAh1OyUHsbigz8RolidAJOFJfc6
 2fwuy2C7mj85viLp5edDoSNXBr9uobQ9e7HfKf4hiU0GdfYmIZDErfOEaGQZifbbXVne
 ts8A==
X-Gm-Message-State: AOAM531YzbbkMqD1iB9VzrcM3031ipFN/wPE2gO0GOJJrTXEBRji4b3P
 2ab/kIKGb8tcwFmM4Abhhw==
X-Google-Smtp-Source: ABdhPJyjPngvK3jGAxGOuwhlIOYYS1zCLm3aD/Xx327eCGhbRFr2IuTXTaHPU5PXNKTwVIovqB2ljA==
X-Received: by 2002:aca:4a16:: with SMTP id x22mr3148253oia.61.1602867954905; 
 Fri, 16 Oct 2020 10:05:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p16sm1117563otl.17.2020.10.16.10.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:05:54 -0700 (PDT)
Received: (nullmailer pid 1581435 invoked by uid 1000);
 Fri, 16 Oct 2020 17:05:52 -0000
Date: Fri, 16 Oct 2020 12:05:52 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: convert phy-mtk-tphy.txt to
 YAML schema
Message-ID: <20201016170552.GA1580710@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-2-chunfeng.yun@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 04:52:01PM +0800, Chunfeng Yun wrote:
> Convert phy-mtk-tphy.txt to YAML schema mediatek,tphy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: modify description and compatible
> ---
>  .../bindings/phy/mediatek,tphy.yaml           | 263 ++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-tphy.txt  | 162 -----------
>  2 files changed, 263 insertions(+), 162 deletions(-)
>  create mode 100755 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml

Also, need to fix the mode.

>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
