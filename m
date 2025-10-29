Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4352DC1939A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A3E10E76F;
	Wed, 29 Oct 2025 08:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WEV4PnwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D9910E76F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:54:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 02C5D611E0;
 Wed, 29 Oct 2025 08:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5F4C4CEF7;
 Wed, 29 Oct 2025 08:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761728094;
 bh=Dy4WiiEp2hDTLOfWgfOlVvW3TTdWJu7jpfAlJ8GtIl8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=WEV4PnwVugjI4eYTb5D3Xn5Z4SpWwhIIgtQ6bhBAO5Gg+jfKiUPa6QqTDBVz2RpRk
 kKbesQHYBsFKN3TodcNKNGbZ5TtT+qvKc/PDikJ6NLVp+eSB4YWfLPu5hei1tBbkVu
 KsiIYA2AbjSgTgwKdUo46yC63JIcaEfkHZSoDNnQQqyfbRxdjaAHDMBiX8IoUs83ln
 E/I8fAxI66UjB3g1xEz/e3+S921y55JmfwSU8n2lUjThdw95a/zd0XnjEKJ3PP5o2c
 Z6TuDl1jusd6p/YiCR9aqvNO3uLyvOcvAsmp/0t7vm9/A8WkM9plbb6odoVrl2bdoI
 QIcQLK4QqmxXQ==
Message-ID: <312c3226cd0581d00b39db8daea69417@kernel.org>
Date: Wed, 29 Oct 2025 08:54:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 3/7] drm/bridge: drm_bridge_attach: lock the encoder
 chain mutex during insertion
In-Reply-To: <20251009-drm-bridge-alloc-encoder-chain-mutex-v3-3-c90ed744efec@bootlin.com>
References: <20251009-drm-bridge-alloc-encoder-chain-mutex-v3-3-c90ed744efec@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Thu, 9 Oct 2025 13:38:58 +0200, Luca Ceresoli wrote:
> drm_bridge_attach() modifies the encoder bridge chain, so take a mutex
> around such operations to allow users of the chain to protect themselves
> from chain modifications while iterating.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
