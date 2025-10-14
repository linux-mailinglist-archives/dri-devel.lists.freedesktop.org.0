Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05CBD91BF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D5810E222;
	Tue, 14 Oct 2025 11:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="GkKchx0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D929510E222
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:50:57 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmCGQ5CZ8z9v76;
 Tue, 14 Oct 2025 13:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760442654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMNRHWzye4fEMo9V9I/sy/z7Qj73KleUZOXSTbXOCDY=;
 b=GkKchx0uTTywibaUYUiB+jQ38OtMwd5KzWk2aYmnsNgQA/Y4KpKEKjkdyjR4C3lrai8Wtk
 LvrLhKtNXi35a7GonWkGgufct3sKyf88x6VCa8crFg2ivGJ9Z5E3OvUSxH3dI22msLU5UK
 honVKVFvi3iHnyOwkJSZ7FWsgGE/v7Qp7KmSyjAa4wmB0Kd+DYRJvTD7fXNjYamZVRw3HP
 Ygmc+P/IVHWHWhNu/T6YV9ugjiUV+3Y6IyB7wMaQR1SPIGHS/3goO9svCA1JdxwDq3Yrok
 TivZmFIyTcSM9/Ojpd5d23gveoEx3oaiBnrW6t06pWdcu662FRUM/CghJRoJXA==
Message-ID: <932b3d3f-534e-4b9b-b85b-5886c3f59c22@mailbox.org>
Date: Tue, 14 Oct 2025 13:50:49 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 02/39] drm/imx: Add i.MX95 Display Controller DomainBlend
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
 <20251011170213.128907-3-marek.vasut@mailbox.org>
 <aO0rBBzI3cGWzO34@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO0rBBzI3cGWzO34@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 997ncizbotjz3d8tasincds5jn7nnqa3
X-MBO-RS-ID: f823ad7086e9524dd23
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

On 10/13/25 6:38 PM, Frank Li wrote:

Hello Frank,

>> +#define STATICCONTROL				0x8
>> +#define  SHDTOKSEL_MASK				GENMASK(6, 4)
>> +#define  SHDTOKSEL(x)				FIELD_PREP(SHDTOKSEL_MASK, (x))
>> +#define  SHDLDSEL_MASK				GENMASK(3, 1)
>> +#define  SHDLDSEL(x)				FIELD_PREP(SHDLDSEL_MASK, (x))
> 
> Can you keep bit fields as consistent order,  from 31..0 or 0..31.

I sent a separate fix for that, so it can go in before these patches:

[PATCH] drm/imx: dc: Sort bits and bitfields in descending order

[...]

>> +static const struct dc_subdev_info dc_db_info[] = {
>> +	{ .reg_start = 0x4b6a0000, .id = 0, },
>> +	{ .reg_start = 0x4b720000, .id = 1, },
>> +};
> 
> Not sure why need map register address to id? Does graphic link or use
> dt cells pass it as argument.

The display engine component (de) does use it to figure out which 
matching domainblend component (db) to access , since there are multiple 
instances of each.

Is there anything I should change ?

>> +static inline void dc_db_alphamaskmode_disable(struct dc_db *db)
>> +{
>> +	regmap_write_bits(db->reg_cfg, ALPHACONTROL, ALPHAMASKENABLE, 0);
>> +}
> 
> This helper function just write value to one register, not helper much
> at all.

I agree, but it also makes dc_db_init() a bit more readable, so I don't 
think inlining this is going to improve the driver much.

>> +static inline void dc_db_blendcontrol(struct dc_db *db)
>> +{
>> +	u32 val = PRIM_A_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
>> +		  SEC_A_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
>> +		  PRIM_C_BLD_FUNC(DC_DOMAINBLEND_BLEND_ZERO) |
>> +		  SEC_C_BLD_FUNC(DC_DOMAINBLEND_BLEND_ONE);
>> +
>> +	regmap_write(db->reg_cfg, BLENDCONTROL, val);
>> +}
>> +
>> +void dc_db_init(struct dc_db *db)
>> +{
>> +	dc_db_enable_shden(db);
>> +	dc_db_shdtoksel(db, SW);
>> +	dc_db_shdldsel(db, SW);
>> +	dc_db_mode(db, DB_PRIMARY);
>> +	dc_db_alphamaskmode_disable(db);
>> +	dc_db_blendcontrol(db);
>> +}
>> +
> ...
>>
>> +struct dc_db {
>> +	struct device *dev;
>> +	struct regmap *reg_cfg;
>> +	int id;
> 
> where actually use this id?
Please see dc_db_bind() .

I will be handling the rest of the feedback on this series piece by 
piece, thank you for your input.
