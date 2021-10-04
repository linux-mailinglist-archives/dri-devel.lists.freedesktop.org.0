Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE7A4214AC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 19:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4306E1E9;
	Mon,  4 Oct 2021 17:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59646E1E9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 17:02:05 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so22431005otv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 10:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z8bpX5ohfnGv7NG36iJlZFsfoAswAuM/dfneaZYCWlc=;
 b=tDtNdazyn20xYmR9Rg5a0AjLYFSscs/HkI93sQmY2McxndQ32+manpiEoW/3enWOIY
 gv6mXs1G1DA5PDPfbxAp97aN1J/abfClAsaE5MgJ7CVqL75piD4kcxB2mhEKysiu37nq
 RoqtnI4eCBEuxWtS0hIWV6lGqpSbtU+ud/IwpSVZ/JHvzlvyN04fSubM877BKPacxWqK
 cDTEOxLhPM/fPuhz84LYKDMQNSyXg+yxekqoTV9QV2lTbWO1YeMGqzsvvWe/sj+4VkWE
 b5H4Ua5S3gz1luQnSxRGn8NMOTmRhektcQKcby0ZX8ouna9YJa6GjBqVBQ/55rnc2s8m
 m4KA==
X-Gm-Message-State: AOAM5323fwTtgWDRj9e+kf6ILMzS2sWHJM8hvQsGUhltBinoYhwe1CmW
 mUY1Cs29jI7JFqv7usHVEg==
X-Google-Smtp-Source: ABdhPJxJSYblX7JkA85U0CFTxkDI1xiwSypwDUBERIDrrr6PccL+U6MR2gBqou0mYj1RzK5yhsT2RQ==
X-Received: by 2002:a05:6830:4089:: with SMTP id
 x9mr10314313ott.223.1633366924827; 
 Mon, 04 Oct 2021 10:02:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f61sm2994889otf.73.2021.10.04.10.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:02:03 -0700 (PDT)
Received: (nullmailer pid 1477065 invoked by uid 1000);
 Mon, 04 Oct 2021 17:02:03 -0000
Date: Mon, 4 Oct 2021 12:02:03 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Sandeep Panda <spanda@codeaurora.org>
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix reg value
Message-ID: <YVszi+keVlkqSfYY@robh.at.kernel.org>
References: <08f73c2aa0d4e580303357dfae107d084d962835.1632486753.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08f73c2aa0d4e580303357dfae107d084d962835.1632486753.git.geert+renesas@glider.be>
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

On Fri, 24 Sep 2021 14:35:12 +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml: bridge@2c: reg:0:0: 45 was expected
> 
> According to the datasheet, the I2C address can be either 0x2c or 0x2d,
> depending on the ADDR control input.
> 
> Fixes: e3896e6dddf0b821 ("dt-bindings: drm/bridge: Document sn65dsi86 bridge bindings")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Also seen with the in-flight Falcon DSI display output patch:
> 
>     arch/arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml: sn65dsi86@2c: reg:0:0: 45 was expected
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
