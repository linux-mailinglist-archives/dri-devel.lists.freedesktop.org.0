Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B75B3B140
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 04:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EE710EB36;
	Fri, 29 Aug 2025 02:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sboCMoPh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2767E10EB40
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 02:56:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F8E043649;
 Fri, 29 Aug 2025 02:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4F0C4CEEB;
 Fri, 29 Aug 2025 02:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756436167;
 bh=1OlmWF/efJBsrmU8E3ikAwN539XMM1ZnxmoDQaXFvlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sboCMoPhfYLDk0qmPH1RlSFasQFAbmwalRsQNXfFwaIs8TC8VJXA8m2tyGC+8BLlA
 iW8Ivy3/57AXzHCuJzbBoucQ8l1GhnoDTLOnWDxOx/MM4CKQARfwJzNe2dV6ywBjzz
 G4RuJnhtgRZ2U50jFWyr66IsSnFMPJVdZpvRsBELdDaplV25xtc5Z7cFxktBm94788
 wBbPCpKfFFoYBXUU65BCZGHDfb8bbOg/rxHHg/FaIvcW/s+xCqjUf55iYYSCJV7cG8
 zzUTATtVfFk47jqV/NxkRAeXZe9joqnl3cYdfxAkHqap1v7j5pk3J2JimUVmlyJ137
 62kbIgMA3BnYA==
Date: Thu, 28 Aug 2025 19:55:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Pet Weng <pet.weng@ite.com.tw>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth Hung <kenneth.Hung@ite.com.tw>,
 Pin-yen Lin <treapking@google.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: Add ITE IT61620 MIPI DSI to HDMI
 bridge driver
Message-ID: <20250829025504.GA1341@sol>
References: <20250828-it61620-0714-v2-0-586f5934d5f8@ite.com.tw>
 <20250828-it61620-0714-v2-2-586f5934d5f8@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-it61620-0714-v2-2-586f5934d5f8@ite.com.tw>
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

On Thu, Aug 28, 2025 at 12:01:19PM +0800, Pet Weng wrote:
> +config DRM_ITE_IT61620
> +	tristate "ITE IT61620 DSI/HDMI bridge"
> +	depends on OF
> +	select DRM_DISPLAY_CONNECTOR
> +	select DRM_DISPLAY_HDMI_HELPER
> +	select DRM_DISPLAY_HDCP_HELPER
> +	select DRM_DISPLAY_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_KMS_HELPER
> +	select DRM_HDMI_HELPER
> +	select CRYPTO
> +	select CRYPTO_HASH

It needs to be CRYPTO_LIB_SHA1, instead of CRYPTO and CRYPTO_HASH.

- Eric
