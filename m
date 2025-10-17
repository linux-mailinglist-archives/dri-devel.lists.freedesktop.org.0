Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6FABEAE0F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC1A10EC9A;
	Fri, 17 Oct 2025 16:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Z5SQVXJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C0410EC99
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:51:07 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cp9nN3gTMz9v6q;
 Fri, 17 Oct 2025 18:51:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760719864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JXd+1w5cvwDxWg/MvxbTe/pIUcBohLvdeQLeTekfpD0=;
 b=Z5SQVXJJxX/EEhr2Yrl3G2wPxuyeOIAaC5S7VeWMSq+9BrA8hFz0xgCDOjHD3p7irIA+Pg
 WJhXsRV/SyXA81YMwMVVqJb8VDkpPaGNqLiZ51wR4oSYlDDeR9rlV08jwg3vGg61mn1s9j
 HkAn8Jau6nDkA4stJSPc0tt9bA98b/xMDrDJr72dBjwkG2LsrEGS9WC9D8IjqtDpeTqn+7
 K6ViFHp010x0zKcsw9IrDn7xoGsiuO5JWQJsq/WIudbCezApPwjosSDjWG9N+zWCRAPDNd
 Gqom6rppjAC8KSYmHK5itXGihAMqcgDPPY8F6rBpau8bWO6ymqsRn8p+vsKnLg==
Message-ID: <5a725651-8f6a-4e4c-aa11-c68e1f1cb87a@mailbox.org>
Date: Fri, 17 Oct 2025 17:20:18 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 20/39] drm/imx: dc: Configure display CSR clock feed select
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-21-marek.vasut@mailbox.org>
 <aO1JmAuSWn6BN6hs@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1JmAuSWn6BN6hs@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 3c5b4d362fc513602ca
X-MBO-RS-META: ju5ym6h4jbph7no9ndbcreg74e6gbgoc
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

On 10/13/25 8:48 PM, Frank Li wrote:

Hello Frank,

>> @@ -119,6 +127,17 @@ static int dc_drm_bind(struct device *dev)
>>   	if (ret)
>>   		return ret;
>>
>> +	if (priv->regmap) {
>> +		regmap_write_bits(priv->regmap, DISPLAY_ENGINES_CLOCK_CONTROL,
>> +				  DISP_CLK0_SEL | DISP_CLK1_SEL,
>> +				  FIELD_PREP(DISP_CLK0_SEL,
>> +				             ((dc_drm->encoder[0].encoder_type == DRM_MODE_ENCODER_DSI) ?
>> +					     DISP_CLK_SEL_CCM : DISP_CLK_SEL_LVDS)) |
>> +				  FIELD_PREP(DISP_CLK1_SEL,
>> +				             ((dc_drm->encoder[1].encoder_type == DRM_MODE_ENCODER_DSI) ?
>> +					     DISP_CLK_SEL_CCM : DISP_CLK_SEL_LVDS)));
>> +	}
>> +
> 
> why not export as clock providor and use clk API to do that?
I don't think there are any clock operations 
(enable/disable/set_rate/...) besides controlling this selector/mux 
(set_parent), so using the clock API would have massive overhead for 
little gain.
