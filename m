Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DFA2EEB9D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 04:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F396E5C1;
	Fri,  8 Jan 2021 03:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224C16E5C1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 03:05:27 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id n9so8969762ili.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 19:05:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=arkq3vtpRQtU5z3eGsmG2DhJUAWYG7qKz2FVaRgjOOo=;
 b=p3ed5m8IQEyzrbHT0l2FWwUYqPyDJhdAwuDhnaAH5cRLqQmHkgK6MVu5xIJ7pEPngZ
 7qBnsR4HL6cGzeRO7nDMm7CWx9jCY4vPutHHptAFnIYRgKxhmLPfJKrCdELDrfnJMnrB
 Xn6YLAk3W3DodbAr1P9ujx/3U+Ha1ofxrFf8WDmrWibq5m62SFFToWQS+ud22XxBvW3f
 qPkaSlB0yQv0vRbw41bOTebS45MRFKXourLzNakP1hV0BuSE4i7DKnL7713LapcajMaF
 /jeNjvFDn+lOKzfDSKNPQQYJnGsssCY6fL6hudKA2qLAlkZqLWBJApKRzYrfVE9eR3JF
 AWhg==
X-Gm-Message-State: AOAM532nGl87ZyRk2lFlvdZIFCy3HHKbzJ++blQDvdXRyuT5cM8kL6Q8
 KXFD5E6uE3awV/KbZ7dMIw==
X-Google-Smtp-Source: ABdhPJyKWrLxcGC66HT5wGIZ8PKEuzgHS2mskcXZJtvK358qOBYcpO8cr50U2hVSdiPnd8PJiw10gA==
X-Received: by 2002:a92:cdac:: with SMTP id g12mr1885522ild.145.1610075126513; 
 Thu, 07 Jan 2021 19:05:26 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id o195sm6066850ila.38.2021.01.07.19.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 19:05:25 -0800 (PST)
Received: (nullmailer pid 1800216 invoked by uid 1000);
 Fri, 08 Jan 2021 03:05:23 -0000
Date: Thu, 7 Jan 2021 20:05:23 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 01/11] dt-bindings: usb: convert usb-device.txt to
 YAML schema
Message-ID: <20210108030523.GA1800134@robh.at.kernel.org>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
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

On Fri, 25 Dec 2020 15:52:48 +0800, Chunfeng Yun wrote:
> Convert usb-device.txt to YAML schema usb-device.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v5: changes suggested by Rob:
>   1. limit the pattern length
>   2. remove properties description for hard wired USB devices in usb-hcd.yaml
> 
>     depends on series:
>     https://patchwork.kernel.org/project/linux-usb/list/?series=399561
>     [v6,00/19] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema
> 
> v4: no changes, update dependent series:
>     https://patchwork.kernel.org/project/linux-usb/list/?series=399561
>     [v6,00/19] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema
> 
> v3:
>   1. remove $nodenmae and items key word for compatilbe;
>   2. add additionalProperties;
> 
>   The followings are suggested by Rob:
>   3. merge the following patch
>     [v2,1/4] dt-bindings: usb: convert usb-device.txt to YAML schema
>     [v2,2/4] dt-bindings: usb: add properties for hard wired devices
>   4. define the unit-address for hard-wired device in usb-hcd.yaml,
>      also define its 'reg' and 'compatible';
>   5. This series is base on Serge's series:
>     https://patchwork.kernel.org/project/linux-usb/cover/20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru/
>     [v4,00/18] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema
> 
> v2 changes suggested by Rob:
>   1. modify pattern to support any USB class
>   2. convert usb-device.txt into usb-device.yaml
> ---
>  .../devicetree/bindings/usb/usb-device.txt    | 102 --------------
>  .../devicetree/bindings/usb/usb-device.yaml   | 124 ++++++++++++++++++
>  .../devicetree/bindings/usb/usb-hcd.yaml      |  19 +++
>  3 files changed, 143 insertions(+), 102 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb-device.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-device.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
