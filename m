Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F507A2ECD2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 13:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6682910E51B;
	Mon, 10 Feb 2025 12:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BayaZx5j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5251710E51B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 12:48:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2BB0B5C5601;
 Mon, 10 Feb 2025 12:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2513FC4CEDF;
 Mon, 10 Feb 2025 12:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739191700;
 bh=UuOxa3/8YwZ78k9m3M65j3xGXFN7L5EHG19EDz75sHU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BayaZx5jHk0RZCLgwWPGoagU4uTRa21H89Q59uSPhLo6bS8l7C9MXFqI48Ro17nwg
 yDPQSiALavRSLLd3UBaQR9X42TxQRtbBbrnFG9mUU6SI7S4EZGTFi+XOxTUrr/ShKj
 AbEE8rxOq76rhhuI1o+LAtoFJ+jMVOpwy2RtFFzAnsL0pPlA8JkdLRIs1M0JOaOSX9
 m7pBSPB5xblxpfB5XRoj7kiNNmg+VLWxT3pmQS1bI4Rcp76TAcn1zv7HsNrZiZNPNF
 5FZ1x0Uf53TUrNzHgy70dnct15WPRyc2PFEajdSknbqH6GRSpDdoeWIJMtbtY40/x8
 SOMSIbNL9xqZA==
From: Robert Foss <rfoss@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, 
 oushixiong1025@163.com
Cc: Dharma Balasubiramani <dharma.b@microchip.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Shixiong Ou <oushixiong@kylinos.cn>
In-Reply-To: <20250206071713.180471-1-oushixiong1025@163.com>
References: <20250206071713.180471-1-oushixiong1025@163.com>
Subject: Re: [PATCH] drm/bridge: convert to use
 devm_platform_ioremap_resource()
Message-Id: <173919169685.3912267.6367298600066886391.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 13:48:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 06 Feb 2025 15:17:13 +0800, oushixiong1025@163.com wrote:
> convert to use devm_platform_ioremap_resource().
> 
> 

Applied, thanks!

[1/1] drm/bridge: convert to use devm_platform_ioremap_resource()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/aaad45cfaa1b



Rob


