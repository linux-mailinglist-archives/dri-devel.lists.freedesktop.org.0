Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2050A69AF8C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 16:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB5410E13E;
	Fri, 17 Feb 2023 15:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EB810E13E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 15:32:00 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C876666021B3;
 Fri, 17 Feb 2023 15:31:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676647918;
 bh=z3neAe3zoYlZjaNu5/O4X7BlXl5dBIVOCRdEyu7SXI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nxh4xsmaUDncSMm3Xd4ZUNIVUVCFSZpnwyMMAk2yZk7jPmNwjl9AVlGUgoNWzKlQa
 di0Umh1TV7gB5sQTQMFJc/rYvKopRkQKCIf9ewVBqA4whnjzZ7KnLgPlS8TyXz3FXv
 1eKjOVMvbD/u6K1pPw/+6xgUVkeIbpwn3jU3/+yith2Y7Gn19e9LEe3hgj421tJF0x
 uT8ql0nhsVDl1O10zXEm4IGkS4xrpJZLJjCKe2Wb4/iOk3JEVNUORP9H1iO0Xamr/z
 WGlGxmhR0TSvn8drY0HIf3cZJ+QBa13Mdn2LrVl4QTgQT4V/O/WZsZ5ElmWvsZKuA1
 ISNwaECR5P4rg==
Date: Fri, 17 Feb 2023 10:31:50 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v11 6/9] drm/bridge: anx7625: Register Type C mode switches
Message-ID: <20230217153150.tl3zqywvpw6elyg5@notapiano>
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-7-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230204133040.1236799-7-treapking@chromium.org>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 04, 2023 at 09:30:37PM +0800, Pin-yen Lin wrote:
[..]
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
[..]
> +static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
> +					  enum typec_orientation orientation)
> +{
> +	if (orientation == TYPEC_ORIENTATION_NORMAL) {
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> +				  SW_SEL1_SSRX_RX1 | SW_SEL1_DPTX0_RX2);
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> +				  SW_SEL2_SSTX_TX1 | SW_SEL2_DPTX1_TX2);

This seems inverted compared to the binding. Binding says 

  0, 1, 2, 3 in "data-lanes" maps to SSRX1, SSTX1, SSRX2, SSTX2, respectively.

But in anx7625_register_typec_switches(), lanes 0-1 mean orientation normal,
then in this logic, you set RX2 and TX2 to carry the DP signals. So the driver
is mapping lanes 0-1 to SSRX2/SSTX2 and lanes 2-3 to SSRX1/SSTX1, the opposite
from the binding.

Thanks,
Nícolas

> +	} else if (orientation == TYPEC_ORIENTATION_REVERSE) {
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
> +				  SW_SEL1_SSRX_RX2 | SW_SEL1_DPTX0_RX1);
> +		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
> +				  SW_SEL2_SSTX_TX2 | SW_SEL2_DPTX1_TX1);
> +	}
> +}
> +
[..]
> +static int anx7625_register_typec_switches(struct device *dev, struct anx7625_data *ctx)
> +{
[..]
> +		ctx->port_data[i].orientation = (dp_lanes[0] / 2 == 0) ?
> +			TYPEC_ORIENTATION_NORMAL : TYPEC_ORIENTATION_REVERSE;
[..]
