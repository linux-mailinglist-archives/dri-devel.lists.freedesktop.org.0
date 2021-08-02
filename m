Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDD13DE1B5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 23:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2DF6E1B2;
	Mon,  2 Aug 2021 21:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C436E1B2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 21:33:42 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id i13so5880263ilm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 14:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wLC52aVmhVqOoSJPVdgHBVvoFp1F65OwU5dq/ORkoP8=;
 b=WrkQviOlSBfgaRL+1qGUNzYo+mF/1bqBW9kIJd8GzKWuUEFzl1XEAskY6kNLOTnjLZ
 t5klrlK5UPYIHozrxe04ntX1yliMw33halS4VBxgsx1+sYwRucVniYi57h34yAQwNTpo
 hWbtJXTknDSNfdirDlY10LcDMMPy+nktuKW4UYb7UTxa4/pjYmb+KZxSvt0Zk/EQA7fC
 hOhGON2Ug4zUsFwyFL4JctKaBbb541wNjj6/14lkqawHz0QgQEvkT3jaQyKJsT1oKJ5N
 HQsVToC0l7nhs1AR6rq/bEf6ipLK0E2zOCqBae62CfYSZze6mHCtd9o62Cd345YYVFc0
 Xezw==
X-Gm-Message-State: AOAM531NIEdsPU8VCvXaNVrXEqNqnLe/8g1+2UfPtyAO2qJGjOCVDLjT
 M9MGcB1+KE1ebVHKOK7JqQ==
X-Google-Smtp-Source: ABdhPJygm1FsYa2OLberNAFdX6BFy+261rfNgtOBH/qYn8FKixCDRx1Jt1immveovcKjithPmbWfnQ==
X-Received: by 2002:a05:6e02:1bc7:: with SMTP id
 x7mr1130854ilv.116.1627940021943; 
 Mon, 02 Aug 2021 14:33:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id v1sm1142730ilm.57.2021.08.02.14.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 14:33:41 -0700 (PDT)
Received: (nullmailer pid 1653417 invoked by uid 1000);
 Mon, 02 Aug 2021 21:33:39 -0000
Date: Mon, 2 Aug 2021 15:33:39 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 1/9] dt-bindings: phy: mediatek: tphy: support type
 switch by pericfg
Message-ID: <YQhks7ca6Gr5gAPC@robh.at.kernel.org>
References: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
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

On Wed, 28 Jul 2021 15:58:23 +0800, Chunfeng Yun wrote:
> Add support type switch by pericfg register between USB3, PCIe,
> SATA, SGMII, this is used to replace the way through efuse or
> jumper.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../devicetree/bindings/phy/mediatek,tphy.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
