Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE32643808C
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 01:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94BA6EDDC;
	Fri, 22 Oct 2021 23:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9166EDDC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 23:19:15 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 y15-20020a9d460f000000b0055337e17a55so6195007ote.10
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 16:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/k2usNEoGshbBmL0WitRf7k2ydrC5pjOBlb8rwsXyiA=;
 b=thbWTzNoE6SaqNKmtOBHEdTm92XRj0/MVh8SfupP0poUmibgfMb4IrrY6w2G12+E21
 WkJw9RIoOQAP++dG3APUBfEsJMLT219FzgzxsNttHHX8qKTuZN0XfdB0UrZV9D+RYIqN
 2ddXj3P8eEy52tqciprDioP3MSli1SQ8gNcjo+ssLg7Rdz7om/UTYcT9Sq00zyqE6x2q
 RXxWTqRIr0GUnkYYsQ3Iri1fotKtUOLR25LEyQd6EONw1ZyS4vGT+n+ZmzGMRqSAWwk9
 ZSf0R0Yjypb/QRQzLoDX+eAbAZhIMnQm8yLvFKvv+W1sSNTj8NiIZLHbfLXtnCkjkg75
 ZGUQ==
X-Gm-Message-State: AOAM53279XFD5cEscpJFjdixF5l1tNiDpn1T5SYHf2oLOGeYqpeLPsq+
 1D5dj4wRdUZ551eZlX66nQ==
X-Google-Smtp-Source: ABdhPJyKjGOiqfYmevfk5jD8qcStva/zOLrdn+2YW5JzaLYiTmEg7mycrFTUR15qr1MLkOFVBbrjdg==
X-Received: by 2002:a9d:2235:: with SMTP id o50mr2178779ota.245.1634944754830; 
 Fri, 22 Oct 2021 16:19:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 187sm2056997oig.19.2021.10.22.16.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 16:19:14 -0700 (PDT)
Received: (nullmailer pid 3356287 invoked by uid 1000);
 Fri, 22 Oct 2021 23:19:13 -0000
Date: Fri, 22 Oct 2021 18:19:13 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: mediatek, dp: Add Display Port binding
Message-ID: <YXNG8Qy5jAPdWbHY@robh.at.kernel.org>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-3-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021092707.3562523-3-msp@baylibre.com>
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

On Thu, 21 Oct 2021 11:27:02 +0200, Markus Schneider-Pargmann wrote:
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v4 -> v5:
>     - Removed "status" in the example
>     - Remove edp_tx compatible.
>     - Rename dp_tx compatible to dp-tx.
> 
>  .../display/mediatek/mediatek,dp.yaml         | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

But can't be applied without the dependent header (or remove the 
dependency).
