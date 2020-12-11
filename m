Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C1D2D6E6C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 04:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9424A6E875;
	Fri, 11 Dec 2020 03:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB7B6E875
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 03:18:39 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id d8so7044574otq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 19:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CBoDlLHyHdiFhpGceXWDywNOt0L2TnBD6qDw3c+HJVM=;
 b=ugvnDFoQejSDj+CbGLU84wAuahJozZjayzzCvnxkwOkxbQ7EKJqgQPyh1NDpMxOd/Z
 reGERtPG7vGMqUW8AHmUtl8+ixysh8+MAwphjG4XoQuGV7pWhotPyF54jzb4+UbEitQR
 fbJY0jaIYQX+zQ5gsAnVbVWEzhSPivRcRwc+VLMzrAjZrxHAtPoeERHoekD1U4cTX8Tm
 uZh3V1+V7IEV69evI9t/I/VhcJcB9rk7dHsm/hiAtXUmgGJSOyvilxEOPaQsBU3V81Ra
 WF757uQwDSVftPr45lfrnXGa1yGgYCfqaeIAhIMXz+j+tVrVfhvWPgquQ70OeXrQT4ig
 XO6A==
X-Gm-Message-State: AOAM531YU41eqW2ABOAeKH4Dwbyz/E8/DwUbK31gGg0c0SxTtULJkJZk
 vxmwL6fHfFK27/w34C98iUVlJTmPGw==
X-Google-Smtp-Source: ABdhPJxTY09tIRosDM+jXE0CdMnaUgz5xWfvD40+3lqxBp9FHxQSOSy8st8000534RB+y/79qDojQg==
X-Received: by 2002:a05:6830:13d2:: with SMTP id
 e18mr3846932otq.366.1607656719303; 
 Thu, 10 Dec 2020 19:18:39 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 66sm1585851ooj.0.2020.12.10.19.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:18:38 -0800 (PST)
Received: (nullmailer pid 3564301 invoked by uid 1000);
 Fri, 11 Dec 2020 03:18:37 -0000
Date: Thu, 10 Dec 2020 21:18:37 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: Convert mixel, mipi-dsi-phy to
 json-schema
Message-ID: <20201211031837.GA3564257@robh.at.kernel.org>
References: <1607495069-10946-1-git-send-email-victor.liu@nxp.com>
 <1607495069-10946-4-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607495069-10946-4-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, martin.kepplinger@puri.sm,
 jernej.skrabec@siol.net, narmstrong@baylibre.com, airlied@linux.ie,
 agx@sigxcpu.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Dec 2020 14:24:26 +0800, Liu Ying wrote:
> This patch converts the mixel,mipi-dsi-phy binding to
> DT schema format using json-schema.
> =

> Comparing to the plain text version, the new binding adds
> the 'assigned-clocks', 'assigned-clock-parents' and
> 'assigned-clock-rates' properites, otherwise 'make dtbs_check'
> would complain that there are mis-matches.  Also, the new
> binding requires the 'power-domains' property since all potential
> SoCs that embed this PHY would provide a power domain for it.
> The example of the new binding takes reference to the latest
> dphy node in imx8mq.dtsi.
> =

> Cc: Guido G=FCnther <agx@sigxcpu.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Newly introduced in v2.  (Guido)
> =

>  .../devicetree/bindings/phy/mixel,mipi-dsi-phy.txt | 29 ---------
>  .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 73 ++++++++++++++++=
++++++
>  2 files changed, 73 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-=
phy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/mixel,mipi-dsi-=
phy.yaml
> =


Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
