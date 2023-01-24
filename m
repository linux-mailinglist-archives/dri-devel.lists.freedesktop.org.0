Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5890167A42B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 21:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2248D10E220;
	Tue, 24 Jan 2023 20:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9999C10E220
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 20:45:23 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B03D6817FB;
 Tue, 24 Jan 2023 21:45:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674593120;
 bh=5NTBROYdPWn9AnfsKxRDsXDu4LyTMFtmByE17bfoomM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wnhN7fesBIQye2m7qlmLA7eLXLnVxafGZ6Ub8c6rm+iFyJcEd2tV7oHbc6tcOojLi
 X3dIruMINR8OVdNeEmDnMr7RFKA3+/77+ufrgsj2Vet/qgLN04y0zhKBHo5yzqSBD2
 i+lyLCQ9xcn0ak35czLoQz6QCH9ZBoRWOZ5n+MHrCRaRLy2rHSIsP8ukm1ozKjeL8S
 h/BpM/nKhxdZgTX7KLDGG0782Z6XXJ6gQt0HRVfbEGuqRPSmRcqqLZCTJk3snQQMkL
 Moc1hYtu+lD4J1uH8Wyhs3REXsjz7mvI1QvBL/kHklnSGXFZ51MLUNKc6dZeWpAZkr
 TNZ4W7Zg63tpA==
Message-ID: <75b01e4c-5994-5931-7030-ab86705d67b3@denx.de>
Date: Tue, 24 Jan 2023 21:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v11 11/18] drm: exynos: dsi: Add
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
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-12-jagan@amarulasolutions.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230123151212.269082-12-jagan@amarulasolutions.com>
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

On 1/23/23 16:12, Jagan Teki wrote:

[...]

> +static bool exynos_dsi_pixel_output_fmt_supported(u32 fmt)
> +{
> +	int i;

if (fmt == MEDIA_BUS_FMT_FIXED)
  return false;

> +	for (i = 0; i < ARRAY_SIZE(exynos_dsi_pixel_output_fmts); i++) {
> +		if (exynos_dsi_pixel_output_fmts[i] == fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +exynos_dsi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state,
> +				     u32 output_fmt,
> +				     unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	if (!exynos_dsi_pixel_output_fmt_supported(output_fmt))
> +		/*
> +		 * Some bridge/display drivers are still not able to pass the
> +		 * correct format, so handle those pipelines by falling back
> +		 * to the default format till the supported formats finalized.
> +		 */
> +		output_fmt = MEDIA_BUS_FMT_RGB888_1X24;

You can move this ^ past the kmalloc() call, so in unlikely case the 
kmalloc() fails, it would fail first.

> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;

Delete from here ...

> +	switch (output_fmt) {
> +	case MEDIA_BUS_FMT_FIXED:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	default:
> +		input_fmts[0] = output_fmt;
> +		break;
> +	}

... until here, and do simple:

input_fmts[0] = output_fmt;

The effect should be the same, the code should be simpler and faster.

> +	*num_input_fmts = 1;

[...]
