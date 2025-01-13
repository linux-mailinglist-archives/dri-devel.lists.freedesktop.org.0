Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB95A0B851
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 14:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E3F10E691;
	Mon, 13 Jan 2025 13:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oL1faxh2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B1310E68F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 13:37:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 59B1F5C4C8C;
 Mon, 13 Jan 2025 13:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8046C4CED6;
 Mon, 13 Jan 2025 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736775434;
 bh=lELgVVZb/aNmH72dj1QI2MDg3lY+QkcKnIks+qVNCmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oL1faxh27U483scWPa82dvzfcB7nPievQ/2cqmZAX72B6L6xxWLJ5XFiftrOBEZNT
 1qGEIz+BysMyIiDe65PgvYW0Xzt8RFbTm9ivWWZCnCHPajeZrYtq98uyekQmJmfpd8
 9SiKQYYQrVJaCFbK1dD0jIpWocGI9P0+QbHRKRDcgbx0oPjAX+vwAkDtAKX/bkCCdO
 66DGsXOV0Mp1PLUCQMJNEUuTyzDdkBcjcsWD6RHQUzun2dW3nAZ5j7QCYBPL5PDVXO
 TRTsFT5oJ++osepNhNz7dZdvYewkkLmh/AZz0hypNYD3BAiaP414bd7aCZnYdt1zen
 OfljdjI4zh5CQ==
Date: Mon, 13 Jan 2025 07:37:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: francesco@dolcini.it, aisheng.dong@nxp.com, kishon@kernel.org,
 airlied@gmail.com, devicetree@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, kernel@pengutronix.de, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, tzimmermann@suse.de,
 festevam@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, shawnguo@kernel.org,
 agx@sigxcpu.org, frank.li@nxp.com, linux-kernel@vger.kernel.org,
 s.hauer@pengutronix.de, p.zabel@pengutronix.de,
 dmitry.baryshkov@linaro.org, simona@ffwll.ch, mripard@kernel.org,
 imx@lists.linux.dev, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v8 06/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller command sequencer
Message-ID: <173677543230.1686186.45544377121474108.robh@kernel.org>
References: <20241230021207.220144-1-victor.liu@nxp.com>
 <20241230021207.220144-7-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230021207.220144-7-victor.liu@nxp.com>
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


On Mon, 30 Dec 2024 10:11:54 +0800, Liu Ying wrote:
> i.MX8qxp Display Controller contains a command sequencer is designed to
> autonomously process command lists.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8:
> * No change.
> 
> v7:
> * No change.
> 
> v6:
> * No change.
> 
> v5:
> * No change.
> 
> v4:
> * Replace "fsl,iram" property with standard "sram" property. (Rob)
> 
> v3:
> * New patch. (Rob)
> 
>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

