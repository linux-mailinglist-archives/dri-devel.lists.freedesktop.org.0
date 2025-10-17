Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69FBBEAE33
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBA610ECA1;
	Fri, 17 Oct 2025 16:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="F9oG5Aad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F9A10EC9E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:51:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nc4Zdtz9sSq;
 Fri, 17 Oct 2025 18:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760719876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnyRJyBxqqT6Z/vke/OGUHeBh7T7CM9FTOlPeQxkIbU=;
 b=F9oG5AadMHujS4rxilXnq9aHT15NPwRYd0bRa+jQjBORkZi2yiwZRFiq7dMLwqrbEgtGnF
 uVhQIpmLzP6MgJi2cdKVxACJC+lgTawa2grTfcPCTE74t1YJ3aC07XY1cLofvD7JL8HGlR
 nEP4xvjIqp+KSA1RKCDRBwm2tvHLT7AkpWoudVKprnU5DQOt4dNGoR/02HOKlT5vGX7whu
 5bYZetKhuYhZgGKCsGgQZzZLg6GR9J05mwTWHj7BK8Mw9Fi2xnkQ8B7UBiEy31GB+g55OL
 XxzpVRn74A3h2UUBT39eg38rQ1yrGrICQKFpBHU/PesyL2D7HzyJZo6KXDDN+A==
Message-ID: <85a35703-fc75-4fde-b9ca-a2ceb1214327@mailbox.org>
Date: Fri, 17 Oct 2025 17:54:41 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
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
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <2a22c45e-5de4-49ee-af3e-002941a7e2d0@nxp.com>
 <bf451620-c917-4d4a-999d-32148fbcf11b@mailbox.org>
 <182271f2-4986-4401-a4c5-ca379a02e69b@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <182271f2-4986-4401-a4c5-ca379a02e69b@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 21f322bb393c42677d5
X-MBO-RS-META: xow3qztriop681daecnza1kueomurrys
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

On 10/15/25 12:09 PM, Liu Ying wrote:

Hello Liu,

>>> This has conflicts with my in-flight patch series for adding i.MX8QXP DC
>>> prefetch engine support(though i.MX95 SoC doesn't embed any display controller
>>> prefetch engine).  You probably want to take a look at it, just a heads up.
>>>
>>> https://lore.kernel.org/all/20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com/
>>
>> Thank you for sharing that.
>>
>> Would it make sense to send 4 and 5 separately , so the fixes can land faster?
> 
> Maybe not, since there is no user(DT node is not enabled) so far.
> But I'd like to have more review/ack for that patch series(it's kind of
> hard to get sufficient review...).

I could test on the MX95 if we can somehow ... figure this out. Then I 
can provide RB/TB easily. I don't have MX8qxp device.

>> Also, could you please try and avoid the SCU dependency on patch 7 ,
>> and more in that direction , can the PRG be made a bit more optional, so the
> 
> Don't think there is any way to address them.
> 
>> iMX95 can still be supported by the DC driver ?
> 
> SCU dependency and PRG(even more other reasons) make me opt to separate
> modules for i.MX95/8qxp DCs.
SCU is only a register accessor, PRG is another block in the DC, I think 
those can be isolated. It seems the whole DC is a composition of 
multiple reusable blocks, so we can compose them for both MX8qxp and 
MX95 the right way and reuse most of the code, right ?
