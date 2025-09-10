Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504BAB513B5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 12:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C5410E8B3;
	Wed, 10 Sep 2025 10:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Uq7JbDI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6215310E8B3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 10:18:52 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cMGqr0z6Rz9tvy;
 Wed, 10 Sep 2025 12:18:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757499528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d3DfTTe4dUU7JEgX+YGY1qShcMAdyIkpmMhLNWRyQYo=;
 b=Uq7JbDI0bKNyQICkGQU8D46MR9OqRcHti2JdFmhz37MJVgYJOL8hT551xIL5u15m9nbd3F
 K4zjT60aKKJ4TK2avAjHCKf0vnQer1jrjOS4vnTR33dg1Xnyc757ySko6Pn6QuP2sXsVqt
 ZY+6qFNJnYMAvNtrLgF9mWGwDaSHm7sC6FJzUH8vkGan3S+BxDGDT+1I52rvTslzuPZh4Q
 64Rry5+Yw4QETLGWd2ybTMr1Tke8u8jZJ8wwb6ii+wjumoqDyFwIQM5TaFxC1kWWzNhHgw
 JZwsUYrp44ahHdARo/R4CWHMXLTvd02RUT+3iwUgdzGRBw7Xsz3bs96+SD6Oaw==
Message-ID: <df3067e4-5597-4557-b61f-26afb7d731d2@mailbox.org>
Date: Wed, 10 Sep 2025 12:18:41 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: bridge: lt9211c: Add bindings
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
 jessica.zhang@oss.qualcomm.com, Yi Zhang <zhanyi@qti.qualcomm.com>
References: <20250910-add-lt9211c-bridge-v1-1-4f23740fe101@oss.qualcomm.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250910-add-lt9211c-bridge-v1-1-4f23740fe101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: b9zx9d1nxxuk6tzn1ubrzj7i4wm6bzsh
X-MBO-RS-ID: 9ea7b904f0daaed315c
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

On 9/10/25 9:37 AM, Nilesh Laad wrote:
> From: Yi Zhang <zhanyi@qti.qualcomm.com>
> 
> Add bindings for lt9211c.
> 
> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> ---
>   .../bindings/display/bridge/lontium,lt9211c.yaml   | 113 +++++++++++++++++++++
>   1 file changed, 113 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211c.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211c.yaml
Can you extend 
Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml 
instead ?

How does this chip differ from lt9211 ?
