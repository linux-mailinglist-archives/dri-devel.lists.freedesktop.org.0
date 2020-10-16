Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DCB290A45
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 19:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55616EE34;
	Fri, 16 Oct 2020 17:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721EC6EE34
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 17:07:33 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id d28so3068495ote.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VOnUBlYCol3UnYmGYrGOQTrAlxbpurYNGe8gXF8RHnk=;
 b=BTq9Y62janIJgc47nY7w6Er5VB+ES9jNupC0R+7idMZMEUTLk87HhpArCst2WU7jMk
 K/Q8QKSUJCHjH7IHgoNeUuPtU/10yzEvoa2R6+wtxFsDBbCcWPUJ/GMhDmS1I88xtppK
 JNwsA8uNhJgqBXPdgWk1t26nmZ43BPq40EG6zz4ZHmA4v5j8r9+v/hp/DAV37Q8ST54R
 Brt37Y7PqsKh1Tz50gSf/u9I7j8ZtGYSAjvGrjKegqeO1OJiawrhz9Nd0ZRfa9e9CaF+
 rknL+pTVpVlp0izqR0NpGfGw1rNlVS2K0odAkVF5fsIAm0kbhWVI5QvNe5nl58G5u/ZZ
 ucGQ==
X-Gm-Message-State: AOAM5327fHn2YYMs9gt+xmI8KE5Ocsf2aznDTb61M2aFuGxUTyRJe7Jr
 cvXGiXs3LrAZLGyOA0/T7A==
X-Google-Smtp-Source: ABdhPJwg/aSdvLT6liD1DFywqtQD2ulJ09DrXmWwEbznkeBnRsDigukv0B1qfRnTkjDHe2MLKQ2teA==
X-Received: by 2002:a9d:bee:: with SMTP id 101mr3169477oth.257.1602868052731; 
 Fri, 16 Oct 2020 10:07:32 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o14sm1149734ota.63.2020.10.16.10.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:07:32 -0700 (PDT)
Received: (nullmailer pid 1583848 invoked by uid 1000);
 Fri, 16 Oct 2020 17:07:30 -0000
Date: Fri, 16 Oct 2020 12:07:30 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: phy: convert HDMI PHY binding to
 YAML schema
Message-ID: <20201016170730.GA1583813@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-4-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-4-chunfeng.yun@mediatek.com>
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
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Oct 2020 16:52:03 +0800, Chunfeng Yun wrote:
> Convert HDMI PHY binding to YAML schema mediatek,ufs-phy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: fix binding check warning of reg in example
> ---
>  .../display/mediatek/mediatek,hdmi.txt        | 17 +---
>  .../bindings/phy/mediatek,hdmi-phy.yaml       | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
