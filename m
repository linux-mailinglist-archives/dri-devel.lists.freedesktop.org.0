Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B231302D4B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 22:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C206E284;
	Mon, 25 Jan 2021 21:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6986E284
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 21:11:02 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id s2so12001820otp.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 13:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5rv/ynLKLcNOD8tStBWcOGrqLQK2Fpzkv048yHsc+gs=;
 b=syI9FzEETzpTY3Rhza1zRTd+Kj6nazPE8vO8H7S+st0jqEyxFsJn3agL2IODB9xhgG
 TlKnExYOt+ghVlwmR5Z7yGmvpjmT/xm6fFA0LiA7s8XBhmvtrO6/jp2zCL5gQdnI9vwA
 kZHmgEFcyhKN7YGVOfJfMkqTtBxltWym3E8fPrQElqraQb40zqFdslpUe/cbNFzYm376
 pQr+zbbhGHYP2l6CRWYvPM+oeu8ysMwNQQGQlXZNDVCvcAGsPFqc9G2jDc4g4aZ8XkHf
 MIzeqiToFonol6YtO0xL6VkJ7T7kgoQLuL7X9Vi+vLIzKCxVF+/R8hWQpHias5D1HunK
 VKYQ==
X-Gm-Message-State: AOAM530mOu+Qu/nhWRJU0k4D82nbFetvN7UYVOSyf0WYrPzdL2tGSNOf
 xipNxROhHDSea4JSMsO9SA==
X-Google-Smtp-Source: ABdhPJxDsaucQgVi892KMjm0PBvfYbJsVpa43ZGWtFR8jAosVF8CGYvu0R7Kmmjkkyqeme9P/SisrA==
X-Received: by 2002:a05:6830:1dc8:: with SMTP id
 a8mr1789278otj.26.1611609061509; 
 Mon, 25 Jan 2021 13:11:01 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l70sm3756988oih.56.2021.01.25.13.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 13:11:00 -0800 (PST)
Received: (nullmailer pid 999929 invoked by uid 1000);
 Mon, 25 Jan 2021 21:10:58 -0000
Date: Mon, 25 Jan 2021 15:10:58 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2 06/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 display pixel link binding
Message-ID: <20210125211058.GA999869@robh.at.kernel.org>
References: <1610616132-8220-1-git-send-email-victor.liu@nxp.com>
 <1610616132-8220-7-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610616132-8220-7-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
 airlied@linux.ie, linux-kernel@vger.kernel.org, s.hauer@pengutronix.de,
 narmstrong@baylibre.com, linux-imx@nxp.com, dri-devel@lists.freedesktop.org,
 kishon@ti.com, a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de, mchehab@kernel.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jan 2021 17:22:04 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp display pixel link.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Use graph schema. (Laurent)
> * Require all four pixel link output ports. (Laurent)
> * Mention pixel link is accessed via SCU firmware. (Rob)
> 
>  .../display/bridge/fsl,imx8qxp-pixel-link.yaml     | 106 +++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
