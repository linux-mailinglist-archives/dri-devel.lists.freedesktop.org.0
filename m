Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C789C2935C
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 18:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDA710E1CE;
	Sun,  2 Nov 2025 17:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="v3olOY/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB3310E1D4
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 17:15:35 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d01ZD6v3Tz9slM;
 Sun,  2 Nov 2025 18:15:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762103733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yvcra83KqAtjzan9YfLxcRGbh7hLfnp0iWgeFUv/vLM=;
 b=v3olOY/+S43PgZ9sly6XeJ1t0BL0X1kTGqmKwACZXIjXTLKeL+5+kvcV/OEN4BCDEjlNvd
 XHY//vVJgwf3llsBggueCMWpJUdtplR1Jj9yn2y74Re6lwDIKMhmnMUr0sQSic67IT62yZ
 gTNdo9WnNf1/z6G7oA6OYK2e3n7ieAt6d1V3/uQlllhRbTflMMrB+c1oEQTHtloYE9UDmP
 pu4V6OHmWFLUAKVHqVKLXgGnfcg7nyrhMc/0xY0cXHo24xUPf+MGUXY+vaCUQ+1HcupTnn
 SW0jYPlVjgbRrbjfKpXMFDNP+VPFfE4meoaSfwXjX4fV+FEb1iNBqdp3Q+jQSA==
Message-ID: <55d44163-4f37-462f-b860-c862cb5ada5a@mailbox.org>
Date: Sun, 2 Nov 2025 17:59:48 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251017154029.105099-1-marek.vasut@mailbox.org>
 <dc4b1b65-542f-4bd2-bd91-af3fe4223b63@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <dc4b1b65-542f-4bd2-bd91-af3fe4223b63@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: owwnz8df3ensc6z3bmdy7xxp57c41417
X-MBO-RS-ID: 6daf2627d9b070bd268
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

On 10/20/25 8:21 AM, Liu Ying wrote:

Hello Liu,

>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>> @@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
>>   };
>>   
>>   struct fsl_ldb_devdata {
>> -	u32 ldb_ctrl;
>> -	u32 lvds_ctrl;
>>   	bool lvds_en_bit;
>>   	bool single_ctrl_reg;
> 
> single_ctrl_reg can be dropped then, as it can be expressed by failing to
> get the second register.
> 
> Furthermore, with this done, lvds_en_bit is the only member left and hence
> struct fsl_ldb_devdata can also be dropped, as IIRC there is no need to
> use a structure for device data with only a flag.
I plan to add more bits into the driver match data when adding the MX95, 
so I would like to retain these instead of removing them and the adding 
them back.

The rest is fixed in V2, thanks !
