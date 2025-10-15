Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44652BDF9BF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E84310E858;
	Wed, 15 Oct 2025 16:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="V1Gj3UXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FC710E858
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:18:33 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmx8k3hfSz9spd;
 Wed, 15 Oct 2025 18:18:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760545110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RAcB1KnTu10/U/5AH7wLJv4yw422htNmPqwtIjsMk4=;
 b=V1Gj3UXlTfbAXXf5H8fENfL7wuosE2RSQoMBoCz53MsTllEkLuoeDDji6805ZHRW/Gw2o0
 Xu+HELzQrpUOJ4rxjwCf0hYN+hyML3uTegapcoIlXOoLI25GNkOeBr85BaF976a60WtRex
 aOjTyjwPhdras7ObxUNPbMgCA/y5MfJPz+G5148y3bXilFNgAZFtArFRjUA3aq0/Sw8eGq
 xoNLrI70eJJzv70Rxl8IVKoG2unPNxQZZWlxubfp++LOdQPT/f/Wz+9U6Zq7qJwowPxn9k
 DG2C8guxzonxJujbwt0iuMaFLr19G69W9/ZMo/0Q+roji0ksHOC2+vvHviKJww==
Message-ID: <e0507800-7e86-4fbb-95cb-e64d8cca1e49@mailbox.org>
Date: Wed, 15 Oct 2025 18:18:25 +0200
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
 <174ec43e-4cac-4452-a77b-e2e3b8413d05@nxp.com>
 <2c4a42eb-8c49-4ba3-baa3-921ec52f730d@mailbox.org>
 <92d928cc-d9df-4c9c-8571-da39001b91a7@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <92d928cc-d9df-4c9c-8571-da39001b91a7@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 03ff7b3109451a21313
X-MBO-RS-META: kx1epfwft5um1jo7qw14sxkpbgi5h5ht
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

On 10/15/25 12:00 PM, Liu Ying wrote:

Hi,

>> I wanted to put this whole thing on the list first, before I start splitting it up.
>>
>> For starters, I think I can send these separately:
> 
> Before discussing how to split, a bigger question is that is it fine to
> support both i.MX8qxp DC and i.MX95 DC in the same imx8_dc_drm module?
> Separate modules look more reasonable to me, considering the fact that
> there are quite a lot difference between the two DCs.

(maybe I do not quite understand your suggestion with "separate module", 
I assume this means entirely duplicate driver, is that correct? I 
operate with that assumption in the text below.)

This series indicates that the functional units in the DC are basically 
identical, with the majority of changes being register base addresses of 
the whole DC and an odd bit or register offset here and there. Most of 
the code can be reused, as can be seen in the first half of the series.

The addition of iMX95 into the iMX8QXP DC also does not seem to be 
making the driver in any way more complicated.

What would be the benefit of having duplicate driver for IP that is 
basically identical, for i.MX95 ?

[...]

>> - drm/imx: dc: Rename i.MX8QXP specific Link IDs
> 
> TBH, I'm not a big fan of adding LINK_ID_x_MXy to enum dc_link_id, since
> the members may have the same value and it's kind of a mess considering
> future SoCs.

I am open to a better suggestion which does not involve duplicate driver.

>> - drm/imx: Add more RGB swizzling options
> 
> This one seems ok.

I can send that one separately. Can you test that on MX8QXP ? I don't 
have a board with that SoC, sorry.

[...]

> I kind of opt to separate modules.  Maybe, to save some code, an additional
> module can be introduced to wrap common part as helpers, plus some callback
> magics, like fg->dc_fg_cfg_videomode().
Let me ask for clarification here -- by separate modules, do you mean 
two totally separate drivers ?
