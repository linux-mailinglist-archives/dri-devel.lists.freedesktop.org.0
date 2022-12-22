Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80F66546BA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 20:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AB810E10F;
	Thu, 22 Dec 2022 19:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773F310E143
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 19:34:07 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 r2-20020a9d7cc2000000b006718a7f7fbaso1663824otn.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 11:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWNJdOIyPtnMcBMmOCjYRTOB2Nr98MKKR7cn2xvEWSg=;
 b=0t4vWwOJgEdYbnukKqGCGXq3bB05ZyRb06NcPy8lIbWhpN+BE+V2qhK3xX/lj16qXF
 HcvTqnvJfDjA1tSgQzpX3wixo8APprVgSjrbK82sx6odaz88NASvZG54o+sSVlkNRASy
 jP4a/dz4o6OsuwAoa+NABgspCdXuIJI2wNCy/zNZj5oqWZceGT6urGYtsBPxSrVNRoB2
 Jbmfp6ajrkuL43Rro43+GtXS1Z2DMIorTYwK4IPQmczndPACaYLiKkq/EKMg28/vkcU7
 lNi7hWakOdYdjq1k2WiR5MW4vfc2J0tmP4EG0tp9KRLsfPz3nSFPCLvZ19OroO32wPkm
 bLyg==
X-Gm-Message-State: AFqh2koL9fGUk5nQZVsOeDryYsaR1ft92QaaxV8kBsi/TSW38Psh9de8
 5aswh+bg63zUKCt2DLotfg==
X-Google-Smtp-Source: AMrXdXtxaghkOVQHe3AHMVz+5/vqZ37iknCqFjTCKG0OidUpJkMAaQRBm426028lPeiYNZzv8rdcFQ==
X-Received: by 2002:a9d:196:0:b0:66e:98f2:edd with SMTP id
 e22-20020a9d0196000000b0066e98f20eddmr3738313ote.6.1671737647018; 
 Thu, 22 Dec 2022 11:34:07 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a16-20020a0568300b9000b00670763270fcsm699449otv.71.2022.12.22.11.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 11:34:06 -0800 (PST)
Received: (nullmailer pid 1949007 invoked by uid 1000);
 Thu, 22 Dec 2022 19:34:05 -0000
Date: Thu, 22 Dec 2022 13:34:05 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v6 05/17] dt-bindings: display: rockchip: convert
 dw_mipi_dsi_rockchip.txt to yaml
Message-ID: <167173764506.1948954.2963463914057934898.robh@kernel.org>
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
 <d6dc8453-4807-0a5d-15bf-6dcf80dcd0fe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6dc8453-4807-0a5d-15bf-6dcf80dcd0fe@gmail.com>
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 22 Dec 2022 15:26:28 +0100, Johan Jonker wrote:
> Convert dw_mipi_dsi_rockchip.txt to yaml.
> 
> Changed:
>   file name
>   requirements
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V6:
>   Remove clock-master property
>   Fix $ref
> ---
>  .../display/rockchip/dw_mipi_dsi_rockchip.txt |  94 ----------
>  .../rockchip/rockchip,dw-mipi-dsi.yaml        | 166 ++++++++++++++++++
>  2 files changed, 166 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
