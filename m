Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602016ADF61
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 13:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D75B10E123;
	Tue,  7 Mar 2023 12:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-1.mta1.migadu.com (out-1.mta1.migadu.com
 [IPv6:2001:41d0:203:375::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9355910E123
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 12:59:22 +0000 (UTC)
Date: Tue, 7 Mar 2023 13:59:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1678193960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r2adqBZzwVPrCWJ6KktdI0n6miVbkRpo6iawIZ0KFHY=;
 b=YSetbgjdENqh52gc2j1SdW5FOWVXeqFP3e6iC4uQ0EBVKCpscI2IqWRrRRSYvI6voEzJlG
 d2ez8eIaUhJNO7IbarCwApo+8lm+hcaHpGjJpRkPHsM5qBNV8zdePAHzP/tRh1KbELIoFZ
 Pc0xQNx265GrUAmH4k+zbENYW8FWX18=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 2/4] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI
Message-ID: <20230307125916.GB722857@g0hl1n.net>
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
 <20221216210742.3233382-2-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216210742.3233382-2-l.stach@pengutronix.de>
X-Migadu-Flow: FLOW_OUT
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Fri, Dec 16, 2022 at 10:07:40PM +0100, Lucas Stach wrote:
> Add a simple wrapper driver for the DWC HDMI bridge driver that
> implements the few bits that are necessary to abstract the i.MX8MP
> SoC integration.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Marek Vasut <marex@denx.de>

I've successfully tested this patch on our custom i.MX8MP board. The
test case was basically "cat /dev/urandom > /dev/fb1" with a 800x480
HDMI display.

Therefore please feel free to add:

Tested-by: Richard Leitner <richard.leitner@skidata.com>

> ---
>  drivers/gpu/drm/bridge/imx/Kconfig       |   9 ++
>  drivers/gpu/drm/bridge/imx/Makefile      |   2 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c | 140 +++++++++++++++++++++++
>  3 files changed, 151 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi.c
