Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673AAD172DD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966F910E467;
	Tue, 13 Jan 2026 08:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="DBF3yMEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C3010E467
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:04:31 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dr1x547kYz9tgD;
 Tue, 13 Jan 2026 09:04:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768291465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkIauvv0RSplXY/m2pwszJK6bmYJH/Xs+FM5mAF4Bo0=;
 b=DBF3yMEq4YspPN6urHOQmHeSj0DvBnNq3ZFqsK7kz6uawWnUr8kLqU5WP1Ibr9D7xHLIrz
 N2yXhqBrc+LjzSfzfNZnoAi6YhF18GJNpAvW434/3HOatO0f5iIY2u0FZ27DQsj8w7g7nF
 igvXSl0pOdFWJ0sN43QBUTSWHPAa/mlRugoxp8/YNelN7fsNkIAnlFRXSAxi7tzAjh7sSR
 w2CZmTWUApIMLoTQehHtwQUl6GHiFhjKtRkfgc7Z0CM3ta3bTUI/4BG877Pi8U+iG1hN0z
 0tJ4PPrfs+mKP8/nSclPeKxqSS535NYabfqb2CKdcTohN/eGOoNKjoSJLZQQnQ==
Message-ID: <65ccfeb6-4962-4964-be1d-cfb0ed41773e@mailbox.org>
Date: Tue, 13 Jan 2026 09:04:17 +0100
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <773b6e43-4f86-4b11-8e6b-a9f2561a75de@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: fa438034bf0a4b1c6ad
X-MBO-RS-META: gkcgcibyibgwe769u53joe6mewjg9ju6
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

On 1/13/26 7:41 AM, Joseph Guo wrote:
> On 1/13/2026 7:47 AM, Marek Vasut wrote:
>> [You don't often get email from marek.vasut+renesas@mailbox.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
>>
>>
>> Parse the data lane count out of DT. Limit the supported data lanes
>> to 1..4 which is the maximum available DSI pairs on the connector of
>> any known panels which may use this bridge. Internally, this bridge
>> is an ChipOne ICN6211 which loads its register configuration from a
>> dedicated storage and its I2C does not seem to be accessible. The
>> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>>
>> To avoid any breakage on old DTs where the parsing of data lanes from
>> DT may fail, fall back to the original hard-coded value of 2 lanes and
>> warn user.
>>
>> The lane configuration is preconfigured in the bridge for each of the
>> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
>> others seem to use 2-lane configuration. This is a hardware property,
>> so the actual count should come from DT.
>>
>>
> Hi Marek,
> 
> I don't have 4 lanes waveshare panel on my hands. Have you tested with the 4-lane panel already?
Yes, the 13.3" DSI panel is 4-lane 
https://www.waveshare.com/13.3inch-dsi-lcd.htm , I have it connected to 
Retronix Sparrow Hawk board which has 4-lane port.

See also this patch I submitted, that is the DT binding for it:

[PATCH 2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare 
Display 13.3"
