Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737684AE7E2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 04:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDAB10E2BE;
	Wed,  9 Feb 2022 03:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E57810E2BE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 03:32:38 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id s185so1241432oie.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 19:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U3oOjIeVi1C82XPxQZmsfVaWQzE3dxNvbFyDd9qEgEE=;
 b=SZuZapd4gCSk02prLBYyJrZ2Dll7Gy4XmvX3VB1igPdn0TsI9xAsOxIZmuf4LTAhPQ
 68SywKUugjj/kN7IjmAheGyC2Awx+mneyswswTI6d17hUBCBFlV+4QUx2Lj1H4XGZZYE
 MAJL1INoeBn5rEhn6SEVFt7YLppCO3YSwcRU3w68zLT2aJIW8S0O6zy+g1vXKMmTvWuB
 +OkOvaiGTj/9zT5L3hxb+bjpV+xVQAW+14g2Mpno2D3L9Yy8UxOmJZeA5XOHJ9T0CccV
 0KLSQbFzhFLR4/hZ2JY9qH1jTH8c/ZcRmuIyeFBsUEU0QlIWJAwtQ0v5fv9Mg6MDZZ8O
 F5/Q==
X-Gm-Message-State: AOAM530xVw9W9fh79r5FLTxxPQarNoiPSJ6z0CLHZ0lPSjNf/GkKApB/
 i2XvtI0egxRD9q8eQnZSWg==
X-Google-Smtp-Source: ABdhPJyIZbDtFNyphezJ8O3TyklDXoGPLMe2pQ2ZQ03AXwwMSzMipIvWQeMcLWWnOU+Q1ItTth4NJQ==
X-Received: by 2002:a05:6808:9b3:: with SMTP id
 e19mr138998oig.90.1644377557610; 
 Tue, 08 Feb 2022 19:32:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bg34sm6438397oob.14.2022.02.08.19.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 19:32:36 -0800 (PST)
Received: (nullmailer pid 3586500 invoked by uid 1000);
 Wed, 09 Feb 2022 03:32:35 -0000
Date: Tue, 8 Feb 2022 21:32:35 -0600
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 20/27] arm64: dts: rockchip: rk356x: Add VOP2 nodes
Message-ID: <YgM100sUfmKALBD1@robh.at.kernel.org>
References: <20220126145549.617165-1-s.hauer@pengutronix.de>
 <20220126145549.617165-21-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126145549.617165-21-s.hauer@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Jan 2022 15:55:42 +0100, Sascha Hauer wrote:
> The VOP2 is the display output controller on the RK3568. Add the node
> for it to the dtsi file along with the required display-subsystem node
> and the iommu node.
> 
> changes since v3:
> - Bring back gamma_lut regs
> - Drop redundant _vop suffix from clock names
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk3566.dtsi |  4 ++
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi |  4 ++
>  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 51 ++++++++++++++++++++++++
>  include/dt-bindings/soc/rockchip,vop2.h  | 14 +++++++
>  4 files changed, 73 insertions(+)
>  create mode 100644 include/dt-bindings/soc/rockchip,vop2.h
> 

Acked-by: Rob Herring <robh@kernel.org>
