Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EBC4012A
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 14:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EFA10EAC4;
	Fri,  7 Nov 2025 13:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Utrsb2Tw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249C210EAC2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 13:21:09 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d307N6kz7z9tGx;
 Fri,  7 Nov 2025 14:21:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762521665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wx+vZv28+HE6MSimwPiuQydOQKun8ZFnuH4lyJBNIpU=;
 b=Utrsb2Tw9ZLQ3r8Vb2EA+Xq+47eZ5XohMIgAjo9ut6h6voQqszZYotz00fVIF2CcLFp8lZ
 OiGbgXwQsC9cbY5hPE5sw0j8m5rOPPBbMW02566fTPR6deKdt9yQO5KhofOY3ehxdZu+VZ
 Q0T1OSPwPCB0gfjsdRaFfePuUg2NLd19v2Irv1YnzrmTyQuipe3sibBUfYn+XZXpxuoD7K
 sB7dIi5A9QbUsG8Zqv1gJ9pajt4x7kVw2AyU0Ej1asC5m0FZ4XmpdEzqMTDYmW4G/jRskT
 X9Ybwd3VONaPGSEbSsIJ2PZyz3DvAJJF3y0uo/B/zC8FRo76Z+FehBNJPU8cXw==
Message-ID: <30b5f19b-1ce9-4239-bf0a-d83d647608ce@mailbox.org>
Date: Fri, 7 Nov 2025 14:20:58 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/bridge: add support for lontium lt9211c bridge
To: Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, Yi Zhang <zhanyi@qti.qualcomm.com>,
 Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
References: <20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com>
 <20251107-add-lt9211c-bridge-v2-2-b0616e23407c@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251107-add-lt9211c-bridge-v2-2-b0616e23407c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: c023b755a867ac5c4c7
X-MBO-RS-META: kabyjstd7kknyaoc5reuyraju3n6868d
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

On 11/7/25 2:02 PM, Nilesh Laad wrote:
> From: Yi Zhang <zhanyi@qti.qualcomm.com>
> 
> LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
> Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
> Add support for DSI to LVDS bridge configuration.
How does this differ from existing 
drivers/gpu/drm/bridge/lontium-lt9211.c ? Can existing lt9211 driver be 
extended instead ? If not, why ? Details please ...
