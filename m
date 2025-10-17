Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C5ABEAE15
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8B110EC9B;
	Fri, 17 Oct 2025 16:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ri3EMDsZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C69A10EC9A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:51:04 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nK2L1Jz9sSq;
 Fri, 17 Oct 2025 18:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760719861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJsJIIBmyS44r/Za6Ww7u8aRde5yPPmd2EJgiWuqZok=;
 b=ri3EMDsZEN4UnyNu0+7sYCnpRhI59tlwCE72BMClrJG5Z/9VF3E0TFTmdsWE93bSKc4gE7
 hhs2WbanfCytWk3dPq2JFhRQEvXftZxx1UYwFG60B/mLGbhhsMPKLkMeRKu/tqRZflxcxk
 8Hf2wvQ4HzRjc9duTrppLkVLAHgai6wntue296XwapLUXyZUSLeEQtOJBS5RMjRAzDqi0T
 cQXsbhNO03cUtPukXFA86VbXx2WuUpqDmoX1f3ltipWOY3Sd8NjQoKGJjOmcjXv1XaBzXc
 8ECMjKEBoEfQcSen58Q+dgonWGKRG+xvzEcbsFzqjErR0jqaNLLqlnMKeersDw==
Message-ID: <49a97a81-f5db-40c7-83ae-2e12b790a6ae@mailbox.org>
Date: Fri, 17 Oct 2025 17:18:16 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
To: Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
 <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
 <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
 <ae9d1289-c0f9-47b9-b6be-e39d170425a2@mailbox.org>
 <a9a9867c-2653-45f0-89a2-39132335aac9@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <a9a9867c-2653-45f0-89a2-39132335aac9@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 06fa1a62a3227d44521
X-MBO-RS-META: 4jmhrbazn39p7xypji99r43776hhwgqg
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

On 10/16/25 4:28 AM, Liu Ying wrote:

Hello Liu,

> Have you got i.MX95 DC IP spec?  If no, then it would be difficult for you to
> write DT bindings for all i.MX95 DC units.  Note that this is something
> necessary to do.

Nope, still waiting for those.

> And, a bit more information about display pipelines in i.MX95 display domain:
> 
> Dither -> pixel interleaver -> pixel link loopback -> camera domain
>                              -> pixel link -> MIPI DSI controller
>                              -> pixel mapper(LDB)
> 
> Note that NXP downstream kernel wrongly adds pixel link between pixel
> interleaver and pixel mapper due to ambiguous i.MX95 TRM.
Is my understanding correct, that the Dither Unit ~= Display Engine ?
