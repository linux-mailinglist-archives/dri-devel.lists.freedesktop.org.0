Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BE749E8B6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 18:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3719B10E4CD;
	Thu, 27 Jan 2022 17:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 342 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jan 2022 17:19:14 UTC
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAE510E491
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 17:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KxEYri5oxsJhl9DNS0NIWwchrHaXWpicdkFLyCADmFs=; b=Zub1virVx9GXOwoV49tKWji/zd
 R90QnCzqDdyHLlIunNSem9P2TV+3E5wTAebD574Y0TnU3F/krhQ+x+x1wvQHV83Ckm0gdH+ZdvpTw
 rFm9cN+x4xxpUcIDGOpTjAsWLUSwwfwWDwcDutX3ov6NFvUmQ++4WSTfRYISD1PJ3P0mvN8uqGYbP
 E02s+txWdISR2KPMsaMDa6g6tUJav1KqDgq5IKibFTL1aYmMp02qTcFjcnLB91+9eymDZgZOUf87H
 E4UpS1V2P4jfntMdPSF7/ng5piNcVyCdUy46cvxt5YDcViN58VPUwu8MYFt7VjlXmqbiXGPdxh6NZ
 aUKEsGPw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:51980 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1nD8QI-0000IE-2V; Thu, 27 Jan 2022 12:19:12 -0500
Subject: Re: [PATCH v2 3/3] drm/panel: Add MIPI DBI compatible SPI driver
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, robh+dt@kernel.org, 
 thierry.reding@gmail.com
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-4-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <2ee03a80-fddb-e28c-1c29-cd88759ed849@lechnology.com>
Date: Thu, 27 Jan 2022 11:19:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220125175700.37408-4-noralf@tronnes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, maxime@cerno.tech,
 dri-devel@lists.freedesktop.org, dave.stevenson@raspberrypi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/25/22 11:57 AM, Noralf Trønnes wrote:
> Add a driver that will work with most MIPI DBI compatible SPI panels.
> This avoids adding a driver for every new MIPI DBI compatible controller
> that is to be used by Linux. The 'compatible' Device Tree property with
> a '.bin' suffix will be used to load a firmware file that contains the
> controller configuration.
> 
> Example (driver will load sainsmart18.bin):
> 
> display@0 {
> 	compatible = "sainsmart18", "panel-mipi-dbi-spi";
> 	reg = <0>;
> 	reset-gpios = <&gpio 25 0>;
> 	dc-gpios = <&gpio 24 0>;
> };
> 

...

> +static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct drm_display_mode mode;
> +	struct mipi_dbi_dev *dbidev;
> +	const struct firmware *fw;
> +	const char *compatible;
> +	struct drm_device *drm;
> +	struct property *prop;
> +	bool fw_found = false;
> +	struct mipi_dbi *dbi;
> +	struct gpio_desc *dc;
> +	char fw_name[40];
> +	int ret;
> +
> +	dbidev = devm_drm_dev_alloc(dev, &panel_mipi_dbi_driver, struct mipi_dbi_dev, drm);
> +	if (IS_ERR(dbidev))
> +		return PTR_ERR(dbidev);
> +
> +	dbi = &dbidev->dbi;
> +	drm = &dbidev->drm;
> +
> +	of_property_for_each_string(dev->of_node, "compatible", prop, compatible) {
> +		snprintf(fw_name, sizeof(fw_name), "%s.bin", compatible);
> +
> +		ret = firmware_request_nowarn(&fw, fw_name, dev);
> +		if (ret) {
> +			drm_dbg(drm, "No config file found for compatible: '%s' (error=%d)\n",
> +				compatible, ret);
> +			continue;
> +		}
> +

Should we add a directory prefix to the firmware file name to avoid the possibility of
file name clashes with unrelated firmwares?
