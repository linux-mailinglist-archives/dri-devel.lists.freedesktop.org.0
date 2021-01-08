Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A0E2EEBAA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 04:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EEF6E5C6;
	Fri,  8 Jan 2021 03:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70346E5C6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 03:09:40 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id 14so7664110ilq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 19:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LgCpZ89bhPoAzu1QaTKGtMiYIqqk0qB0oUZoQsv4bL8=;
 b=Y/mXk53x2fuBKoSv0PC3UNcpV/KSp5pzuzO5hYR79yG4RGspEDjOub5r210OZE06z/
 YGmNg1TBkGAlZGyjOtFcCfNZ2bQQ7rR//YuR/r/rAr9hRLGntFhleLPb8JqxusIMayRo
 dIZflJxmefBIfO8Ro9uSYGUKTKJ5G4PqUrPloaWCLuW/j2dmr6aps2i7l+H1VrJdJ13H
 WqegFTastUYPFkiEi8h7Ml7Hl3MfuQI262kXALinWK8ueWBEenvLku8JiSruDmPY66vy
 bHVcf4yTzwyW/T3S5sWaubHVv1z0Hw9mo8hR5YRA+/aKp41ZDXaMpLA2QNNwL3ic0Gn4
 Fb9w==
X-Gm-Message-State: AOAM533mbptpNmTNDGx4FXTL2aG2CDb9sxFSpzOgci4UytDhZZ/bfLKH
 QY6/SkzcAqHVzT//Jp424A==
X-Google-Smtp-Source: ABdhPJyTo5xe6pis2HLmGkd2WeF1mOCMYefIn8WWRVKOqqhyq9PW9kuxdyo1JzxthAcVJl7U/Jigqw==
X-Received: by 2002:a05:6e02:1b8a:: with SMTP id
 h10mr1970185ili.141.1610075380095; 
 Thu, 07 Jan 2021 19:09:40 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x5sm5839653ilp.55.2021.01.07.19.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 19:09:38 -0800 (PST)
Received: (nullmailer pid 1805889 invoked by uid 1000);
 Fri, 08 Jan 2021 03:09:36 -0000
Date: Thu, 7 Jan 2021 20:09:36 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 10/11] dt-bindings: usb: convert mediatek, mtu3.txt to
 YAML schema
Message-ID: <20210108030936.GA1805818@robh.at.kernel.org>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
 <20201225075258.33352-10-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-10-chunfeng.yun@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Dec 2020 15:52:57 +0800, Chunfeng Yun wrote:
> Convert mediatek,mtu3.txt to YAML schema mediatek,mtu3.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v5: changes suggested by Rob
>   1. remove unnecessary maxItems
>   2. define all phys supported
> 
> v4:
>   1. refer to usb-drd.yaml insstead of usb/generic.txt
>   the following ones suggested by Rob:
>   2. add the number of phys supported
>   3. fix indentation of wakeup
>   4. add examples for port and connector
> 
> v3:
>   1. fix yamllint warning
>   2. remove pinctrl* properties
>   3. remove unnecessary '|'
>   4. drop unused labels in example
> 
> v2: new patch
> ---
>  .../devicetree/bindings/usb/mediatek,mtu3.txt | 108 -------
>  .../bindings/usb/mediatek,mtu3.yaml           | 287 ++++++++++++++++++
>  2 files changed, 287 insertions(+), 108 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
