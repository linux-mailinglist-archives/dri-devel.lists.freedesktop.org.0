Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647545FFC75
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 00:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0862510E5AD;
	Sat, 15 Oct 2022 22:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0986E10E5AD
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 22:01:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3170184D45;
 Sun, 16 Oct 2022 00:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665871305;
 bh=5RizyXD0uBD/KJYAOrgaaQ82URsfpCiastxnkITJOzc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q8/gE9DdVNOn7S1q84SZIwimPE7gVl5387Gmc8rz7i7heCVnFQhD+lj2iQVqv/fab
 +ulNW3vS+3OED/AKBYHMDgaPv51HuDlHaYTjp+SEzDFR9uhXEB1M+BCiEmsnV+agdb
 3dsPWxLwJHJXJSYHgXIDAEgjvn1V6gn2pGKba5LQgUTPN3yZ8RHNbO7hbvcNsnIqWT
 k4omQKCIbK41540a1p5qAxXx0E+tSGc1DNvVs0kjE6U4yU2/I3Yy9s3QDcrDsvybRj
 CVlbBPwHtZkRy12GwfBrdTIFtN1uB548sN9LGPBFeOVq9e3eLWn/T9g4+FMWS5BGwL
 J4iJjXrNsMqpQ==
Message-ID: <d837f6e3-d869-6543-2361-a7843c00ed8a@denx.de>
Date: Sun, 16 Oct 2022 00:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 07/10] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-8-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221005151309.7278-8-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/5/22 17:13, Jagan Teki wrote:

[...]

> @@ -1321,6 +1322,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>   	pm_runtime_put_sync(dsi->dev);
>   }
>   
> +#define MAX_INPUT_SEL_FORMATS	1
> +
> +static u32 *
> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state,
> +				       u32 output_fmt,
> +				       unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	/* This is the DSI-end bus format */
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	*num_input_fmts = 1;

Is this the only supported format ? NXP AN13573 lists the following:

i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
3.7.4 Pixel formats
Table 14. DSI pixel packing formats

Loosely Packed Pixel Stream, 20-bit YCbCr, 4:2:2
Packed Pixel Stream, 24-bit YCbCr, 4:2:2
Packed Pixel Stream, 16-bit YCbCr, 4:2:2
Packed Pixel Stream, 30-bit RGB, 10-10-10
Packed Pixel Stream, 36-bit RGB, 12-12-12
Packed Pixel Stream, 12-bit YCbCr, 4:2:0
Packed Pixel Stream, 16-bit RGB, 5-6-5
Packed Pixel Stream, 18-bit RGB, 6-6-6
Loosely Packed Pixel Stream, 18-bit RGB, 6-6-6
Packed Pixel Stream, 24-bit RGB, 8-8-8 Format

The MX8MM/MN LCDIF can generate all of those RGB formats , the MX8MP 
LCDIFv3 can also generate the 16bit YCbCr .

It seems there should be more formats here.
