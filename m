Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8276E2D6E6D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 04:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60FA6E87D;
	Fri, 11 Dec 2020 03:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B4D6E87D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 03:19:32 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id q25so8311681oij.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 19:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s3P83P57LBssVizfzonJVX27ZJaiiEw3vUl+G1G8C2A=;
 b=rDQV7k+da0cokfOuR01Hjs5jR+cJItypft8WmX8V8pnPCcpNLiukaBbsNHFqw5+l7w
 1REmrhWdWpHpuNUvnKQcJ/JcPlGG1CcZ+iqDuD13PWyAVaHVzRzIPs/W9peIhU/7UdXb
 l/r/YoeYxMKZwPSrdwlDfpbVaD2uqkKStfKkWEKfTzXc1yaccHqHN9cHc4IpxVsSWhCN
 Qe1aqNP89YVKRs7Zfk64EuShYdFVnewGUPGsuLFAKAyltjRZXkvuJ1gIBWa0EaKQimhY
 jqnVU9vbRR5I79cI4XZWmzcfKPYLwpy5binVa+CWmyoYy8BqgYbsH5nkRv3XPRypQ85Z
 xsqg==
X-Gm-Message-State: AOAM5314QltvkvSNWCtxYkQnz8SXjMNe4GcVeLPs8A2lbmqVHeWEoVWy
 aXh5+5tGaA9OloUPCVMsyg==
X-Google-Smtp-Source: ABdhPJy7f9jT4f0a9VTi2ZrxM64YP9Ebor8koJwFtxTzBR9yGdaLztovQe5yrb0aUfaCQieDDpJ3yQ==
X-Received: by 2002:aca:b1c3:: with SMTP id a186mr7847675oif.8.1607656771855; 
 Thu, 10 Dec 2020 19:19:31 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o21sm1572676otj.1.2020.12.10.19.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:19:31 -0800 (PST)
Received: (nullmailer pid 3565556 invoked by uid 1000);
 Fri, 11 Dec 2020 03:19:29 -0000
Date: Thu, 10 Dec 2020 21:19:29 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel
 combo PHY support for i.MX8qxp
Message-ID: <20201211031929.GA3565526@robh.at.kernel.org>
References: <1607495069-10946-1-git-send-email-victor.liu@nxp.com>
 <1607495069-10946-5-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607495069-10946-5-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, martin.kepplinger@puri.sm,
 agx@sigxcpu.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Dec 2020 14:24:27 +0800, Liu Ying wrote:
> Add support for Mixel MIPI DPHY + LVDS PHY combo IP
> as found on Freescale i.MX8qxp SoC.
> =

> Cc: Guido G=FCnther <agx@sigxcpu.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Add the binding for i.MX8qxp Mixel combo PHY based on the converted bin=
ding.
>   (Guido)
> =

>  .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 41 ++++++++++++++++=
++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)
> =


Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
