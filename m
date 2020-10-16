Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D99290A4C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 19:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55D26EE38;
	Fri, 16 Oct 2020 17:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606616EE38
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 17:08:55 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n61so3023248ota.10
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U1oGCHxCpJm+5c6m1olk8Wivcld4RJW5REIrPGu1ncw=;
 b=GLLx5JrKAeDIo2WsF/eI0t+QfgqPZ/MGaAHu1y63FG7uki1iCzMLWo7Buel9JX1hj6
 FSBumlcPgDGofoU03agCoGP8aaCcwYftosyQ2B7RymIbwOSGsw6pdhVqiXMwnISViKFG
 EJPmm4Az4Vzd7POW+tOKiXoMkFf7ZMdSbYnhnmJhKOzOa6cKeyJB+c+GI2/F3QKc2tyt
 6uby05x7R2xg0WO90y3uyEDzdz5RbjF/F39rgdGhWoNJueUJ4ZQRBpWqJlk+jmEpt3L9
 1o0SyEMhbSN5BFkUayahGer6oe40LenPlkc8YfzHmBDXK7rHIBXykMqHzSeQ2/PFBkhH
 Pobg==
X-Gm-Message-State: AOAM533uuAiPNcOKH8/JEYBbzAtWOmDZ5yueOgLr/zlmHnvSK8wtvKRv
 nuSp4Y0WWOgJFA7x/OnJHQ==
X-Google-Smtp-Source: ABdhPJx+aLbatJsSq+L6yfjjn87rPcGWBxhbJwGu/0E60QxhHUbgdcwHkFB0INfNENHq19He3zgWsA==
X-Received: by 2002:a9d:2c4:: with SMTP id 62mr3455382otl.224.1602868134734;
 Fri, 16 Oct 2020 10:08:54 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f124sm1214248oia.27.2020.10.16.10.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:08:54 -0700 (PDT)
Received: (nullmailer pid 1585783 invoked by uid 1000);
 Fri, 16 Oct 2020 17:08:53 -0000
Date: Fri, 16 Oct 2020 12:08:53 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: usb: convert mediatek, musb.txt to
 YAML schema
Message-ID: <20201016170853.GA1585729@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-5-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-5-chunfeng.yun@mediatek.com>
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
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Oct 2020 16:52:04 +0800, Chunfeng Yun wrote:
> Convert mediatek,musb.txt to YAML schema mediatek,musb.yaml
> 
> Cc: Min Guo <min.guo@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: new patch
> ---
>  .../devicetree/bindings/usb/mediatek,musb.txt |  57 ---------
>  .../bindings/usb/mediatek,musb.yaml           | 113 ++++++++++++++++++
>  2 files changed, 113 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
