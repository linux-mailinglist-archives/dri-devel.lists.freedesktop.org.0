Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB8BEAE18
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEFE10EC9D;
	Fri, 17 Oct 2025 16:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="h6Hy5gZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B9510EC9A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:51:13 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cp9nV4j7Lz9t6b;
 Fri, 17 Oct 2025 18:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760719870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57/rHfSQPuGwkuIFvhj50SlUVj/zuEPrhMXR5tNz9rU=;
 b=h6Hy5gZc8o6DNgD1mXzAXa2gc2pWO2hO2Rc0XEtEFWXvNfYFYVGsGNYrMVgeAm9wxZqzhZ
 0ZlA5yB7iVwNsDtXUspThbhJAfTlY3+CwCGBv867qgg89/8MReSrTcO5lShKBwXZ+LtVG2
 gwnEB86TTxV2lXHG6K+wess5+yaqMT1RSfOMfVO0Bxyx3nenlX3oCTH2wdXJnBbq0K10aT
 Ql4nGGu3ZapgUemyfKQv2gZXZgiCZcKBZsthE5mtQJr2BdwNKDdxnN6ozlJ72oLVPnjLBp
 NNEZQ6sLxAOnXTMcCpgaeOa7SMq37N3Zfr0CgO47yMHGwbZwC3sFSoZdZWUz3g==
Message-ID: <809b7867-502b-4c3f-b7c6-f6f7a1226a08@mailbox.org>
Date: Fri, 17 Oct 2025 17:39:14 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 35/39] drm/bridge: fsl-ldb: Parse register offsets from DT
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
 <20251011170213.128907-36-marek.vasut@mailbox.org>
 <aO1RnY4CcKZWqh3s@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1RnY4CcKZWqh3s@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e77f929ddf541b74f01
X-MBO-RS-META: q54r3z8wrx1c3jsp977s3wj1c6ik6snj
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

On 10/13/25 9:23 PM, Frank Li wrote:

Hello Frank,

>> @@ -296,7 +290,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>   	struct device_node *remote1, *remote2;
>>   	struct drm_panel *panel;
>>   	struct fsl_ldb *fsl_ldb;
>> -	int dual_link;
>> +	int dual_link, idx, ret;
>>
>>   	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
>>   	if (IS_ERR(fsl_ldb))
>> @@ -309,6 +303,22 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>   	fsl_ldb->dev = &pdev->dev;
>>   	fsl_ldb->bridge.of_node = dev->of_node;
>>
>> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
>> +	if (idx < 0)
>> +		return idx;
> 
> Does this broken compatiblity? If yes, need mention at commit message
Nope, it actually does not, because the binding document used for 
validation was correct and required these entries. So we can now safely 
parse them.
