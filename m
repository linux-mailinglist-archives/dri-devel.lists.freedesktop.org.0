Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AE7D178D6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFC810E48A;
	Tue, 13 Jan 2026 09:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cP8pqTgt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F0D10E48A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:15:27 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dr3Vz5gLqz9sbt;
 Tue, 13 Jan 2026 10:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768295723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQ7AtPjQ2Ronaqwmz5J5bM5bR7wWBP2yp8oCfP+eth0=;
 b=cP8pqTgtxZhtLZglYZrNCDjSY1DlxxBf8Nc39IYaS5vLeGZ1cXqNaQoSAj80RykGRkZZRx
 clLouFGJSJt5ib18IoC/Lqcp+fZ6N6BYpRVk6sbmfVKqzcQVveZ2Kl4JPsHAoIt6KFIoYy
 xrNxStCJdEM/niCTkMI003ySVC8b7tUc8nOdoRHs3TXLFF2gxmZZQRXSmY6tiIsApU0vAB
 q8JkCD69W979TVzpnPuaF6+9A3pDm9rr/ItBkmWbO1RN6FVVygyLgVIgximr7WIE/KpFjh
 GQV2zrnFkGw97l46Yo6DwRQ1OiUFlYofE5zM4OnS4VQi2BRUotV50vaUfKwZ4w==
Message-ID: <9c59661e-98e6-473e-9a5e-b6002048c51a@mailbox.org>
Date: Tue, 13 Jan 2026 10:15:16 +0100
MIME-Version: 1.0
Subject: Re: [EXT] [PATCH 2/2] drm/bridge: waveshare-dsi: Add support for 1..4
 DSI data lanes
To: Joseph Guo <qijian.guo@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260112234834.226128-1-marek.vasut+renesas@mailbox.org>
 <20260112234834.226128-2-marek.vasut+renesas@mailbox.org>
 <773b6e43-4f86-4b11-8e6b-a9f2561a75de@nxp.com>
 <65ccfeb6-4962-4964-be1d-cfb0ed41773e@mailbox.org>
 <409cdcf0-af9b-4084-845f-d863ad6303c5@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <409cdcf0-af9b-4084-845f-d863ad6303c5@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: zhhta6mtoru8d4m813ormdjwi7reu7uu
X-MBO-RS-ID: 0283d1e8558795067bf
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

On 1/13/26 9:15 AM, Joseph Guo wrote:
> On 1/13/2026 4:04 PM, Marek Vasut wrote:
>> [You don't often get email from marek.vasut@mailbox.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
>>
>>
>> On 1/13/26 7:41 AM, Joseph Guo wrote:
>>> On 1/13/2026 7:47 AM, Marek Vasut wrote:
>>>> [You don't often get email from marek.vasut+renesas@mailbox.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
>>>>
>>>>
>>>> Parse the data lane count out of DT. Limit the supported data lanes
>>>> to 1..4 which is the maximum available DSI pairs on the connector of
>>>> any known panels which may use this bridge. Internally, this bridge
>>>> is an ChipOne ICN6211 which loads its register configuration from a
>>>> dedicated storage and its I2C does not seem to be accessible. The
>>>> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>>>>
>>>> To avoid any breakage on old DTs where the parsing of data lanes from
>>>> DT may fail, fall back to the original hard-coded value of 2 lanes and
>>>> warn user.
>>>>
>>>> The lane configuration is preconfigured in the bridge for each of the
>>>> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
>>>> others seem to use 2-lane configuration. This is a hardware property,
>>>> so the actual count should come from DT.
>>>>
>>>>
>>> Hi Marek,
>>>
>>> I don't have 4 lanes waveshare panel on my hands. Have you tested with the 4-lane panel already?
>> Yes, the 13.3" DSI panel is 4-lane
>> https://www.waveshare.com/13.3inch-dsi-lcd.htm, I have it connected to
>> Retronix Sparrow Hawk board which has 4-lane port.
>>
>> See also this patch I submitted, that is the DT binding for it:
>>
>> [PATCH 2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare
>> Display 13.3"
> 
> OK, thank you.
> Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
Thank you too.
