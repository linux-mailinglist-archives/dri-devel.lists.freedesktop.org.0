Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90858C408CE
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 16:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C2410EAEE;
	Fri,  7 Nov 2025 15:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cJZE8GZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401DE10EAEE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 15:11:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d32Zg6GRGz9tNR;
 Fri,  7 Nov 2025 16:11:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762528284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vy+NNLP394OwYxNRijQPvvDO7IMwiwg8RBHcds0M8FQ=;
 b=cJZE8GZg+N198UtZfYrAVmdKAtJBrrVVkioaD4ZOc9/TDy1z63PTOeAv6j+SNs8/bPzYC9
 JOs9bWu2tpIO6uuFgG6AKrXOPYr5cteqWw+aGCwS2s2/qWM3CU7j1k1wkKJXuRv2yIGHhU
 DK4p0zb8zrtlKhxpafKd6RV9/K4EEpYV/ahYx5idiMrpFIddLaL+V5Q3V+Cc1RhUz4jGl/
 E/AaRx5C1kIUJU1pS9Nn8HcZujIGvbsObt1nkRrcFHviOZLerSOkKniqitprQbzSq/oEDb
 uS0DAVnEXSiH0xp/lumQsu6fIDy2GC3b8MMUDf+FwXsA4/0CnqCC1cLaUd6dbg==
Message-ID: <d2c9cac9-17cc-4bc6-8322-bc43edbf45d1@mailbox.org>
Date: Fri, 7 Nov 2025 16:11:15 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/bridge: add support for lontium lt9211c bridge
To: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, Yi Zhang <zhanyi@qti.qualcomm.com>,
 Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
References: <20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com>
 <20251107-add-lt9211c-bridge-v2-2-b0616e23407c@oss.qualcomm.com>
 <30b5f19b-1ce9-4239-bf0a-d83d647608ce@mailbox.org>
 <aQ35tvwp90qm57Cl@hu-nlaad-hyd.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aQ35tvwp90qm57Cl@hu-nlaad-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: f902cdf5302f7a21187
X-MBO-RS-META: ii1978emft34czfyu9hytrgg97y7df3e
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

On 11/7/25 2:52 PM, Nilesh Laad wrote:
> On Fri, Nov 07, 2025 at 02:20:58PM +0100, Marek Vasut wrote:
>> On 11/7/25 2:02 PM, Nilesh Laad wrote:
>>> From: Yi Zhang <zhanyi@qti.qualcomm.com>
>>>
>>> LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
>>> Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
>>> Add support for DSI to LVDS bridge configuration.
>> How does this differ from existing drivers/gpu/drm/bridge/lontium-lt9211.c ?
>> Can existing lt9211 driver be extended instead ? If not, why ? Details
>> please ...
> LT9211 and LT9211C differ completely in register programming sequences.
> Even lontium mentioned that register configuration are different for lt9211 and lt9211c.

Lontium seems to often suggest, that users should use their provided 
register patches without thinking about the content at all.

Do you have access to the register documentation, and can you compare 
LT9211 and LT9211C register layout? Are they identical or do they differ?

> Nearly every function would require duplicated logic with if (chip_type) branching,
> as register sequence are completely different.
> Having both sequences in single file is not looking good, hence want to merge as separate driver.

Can we somehow use regmap_register_patch() and register patches in 
driver data to avoid duplication ?

-- 
Best regards,
Marek Vasut
