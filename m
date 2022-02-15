Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B37C54B82DD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 09:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC9E10E73E;
	Wed, 16 Feb 2022 08:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF6610E539
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 19:50:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 52A861F44D43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644954632;
 bh=WaWP9B+un5FNgYWQUCXJJ7L6AqvP7oAE4hm3PmmoYiw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mIO/s3MoJtz1pHhjjGx2jxDwW8VPPhtT7dhTTqvxj8RdEjinbeHun6FDsSVL3U7pf
 Co32UM1N5zev3UtXgOnrOF8K9M7lCkqbJMmp5kooHK3/lebl3xAeyH77wIt1+b8tCN
 PGFpkJ5YWHsZyK8A9lsjynyYxH2oT8Xeu9nKRi5/G9DAZhCuwnv2tCihL4a+DbshyB
 jCkPnrPecjfVBn53/XRi18UVxDTF0zR2k2y4+jJNDv78mkEDVMtKJj7R8wEOyYJDW6
 wAKLD8ukNwunAaCQ8iixgNq8CNd5N9wLkybnpPo2kvp5cYR84NFGCMI2WUom6Q8SFt
 qmVUk6KPPwFNw==
Message-ID: <81997cce-bd63-7c95-0f5c-9b4c9bb7699a@collabora.com>
Date: Tue, 15 Feb 2022 22:50:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 10/23] drm/rockchip: dw_hdmi: Add support for hclk
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-11-s.hauer@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220209095350.2104049-11-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Feb 2022 08:23:45 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

09.02.2022 12:53, Sascha Hauer пишет:
> +	hdmi->hclk_clk = devm_clk_get(hdmi->dev, "hclk");
> +	if (PTR_ERR(hdmi->hclk_clk) == -ENOENT) {
> +		hdmi->hclk_clk = NULL;

devm_clk_get_optional()
