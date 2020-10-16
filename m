Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419DE290A41
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 19:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B62F6EE37;
	Fri, 16 Oct 2020 17:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E491E6EE37
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 17:06:24 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n15so3020224otl.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qTk3r2ciTgh4me1BoYFyfE+JWDJPOXnD3hJCbfqxA5o=;
 b=BrB1es3c9JXvuM07zrPtEHeSzozRRYKPb/XJMJTCnLXa8VHRtQdHXiiQvPnhhJHKCx
 taGlZcCB40QKjKJbm48AhWijT5heCVFvare0lPi+ck85nSVfeN2I+V9RMpVf2WnLC3Id
 d6pnL1tGQOabuMbtzZzL28SjKIJ1RkzayrsD4/DO8mM/V5YUoldI+dWldxj7yDp9O7Wx
 23ku0vml+m4ukGtkrquZLyF5PFvfUBX4WIDVTzj1sXQcQDhWEupfSkIDEO6L8yZOKMIz
 qBdECDdGBk01XT6B2FNAdaFmsJGasf7o6M3b1MzBqFeb48mKhN9BCE5OvjOxDWAVVlHy
 wyyQ==
X-Gm-Message-State: AOAM532tET0VbfVJg6uYAPZ2LCQB694QzMTFHQO1zZklu0R0K+NSBJEs
 IksuQD7tfoAx/MqeTrnaAg==
X-Google-Smtp-Source: ABdhPJyyosGHhSz7fBWayeJxfdk3OWayQGywHW7RULyDMfKvzBSgTsUyFnhJAZmvoFSE0v5DxfFSug==
X-Received: by 2002:a9d:6b99:: with SMTP id b25mr3231621otq.60.1602867984017; 
 Fri, 16 Oct 2020 10:06:24 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k13sm1280277ooi.41.2020.10.16.10.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:06:23 -0700 (PDT)
Received: (nullmailer pid 1582215 invoked by uid 1000);
 Fri, 16 Oct 2020 17:06:22 -0000
Date: Fri, 16 Oct 2020 12:06:22 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: convert phy-mtk-ufs.txt to YAML
 schema
Message-ID: <20201016170622.GA1582169@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-3-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-3-chunfeng.yun@mediatek.com>
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

On Tue, 13 Oct 2020 16:52:02 +0800, Chunfeng Yun wrote:
> Convert phy-mtk-ufs.txt to YAML schema mediatek,ufs-phy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: fix binding check warning of reg in example
> ---
>  .../bindings/phy/mediatek,ufs-phy.yaml        | 64 +++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-ufs.txt   | 38 -----------
>  2 files changed, 64 insertions(+), 38 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
