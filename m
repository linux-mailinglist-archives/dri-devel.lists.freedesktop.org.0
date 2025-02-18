Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6566DA394C1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 09:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CA910E62C;
	Tue, 18 Feb 2025 08:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AbO+c5W2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736AE10E62C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 08:14:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A0D235C5BC3;
 Tue, 18 Feb 2025 08:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50A1C4CEE2;
 Tue, 18 Feb 2025 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739866465;
 bh=sK8OvyySumMdynSgRGKgZrd8TTS4U8uKw9PAHIAk3Nk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AbO+c5W2a24zWrFd5vgoqYvGkVnewmOK06KO3xgUWlJxlgZ77vB+Qj40jFr+veER+
 EffIu3gs1hoykD6InX2z3Crz+23eojDl74vcfDijznofFjJzl4QXJ1qWOfuw++BL6X
 6CmFz5fY38hEmMljy/JpAxwgrdGU/wrRAq62/PEy0e1ppWLQUcIEX2U2fWPfarqC9U
 1MK0XSUkiffveOsH7LC85lGQG0YK6gGb4ydi5sZivqTI/pDmYDD9+cG91c5iLOeYNe
 baZzG0KBrQ9z3WpguqmAok9WkK7pK/cabMa4s6xWmOkQAVuRX/8CNcWrSjll/Km93Z
 8rASBGHGWRwdg==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, oushixiong1025@163.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Shixiong Ou <oushixiong@kylinos.cn>
In-Reply-To: <20250128065645.27140-1-oushixiong1025@163.com>
References: <20250128065645.27140-1-oushixiong1025@163.com>
Subject: Re: [PATCH] drm/bridge: analogix_dp: Use
 devm_platform_ioremap_resource()
Message-Id: <173986645947.826953.17434979178193947426.b4-ty@kernel.org>
Date: Tue, 18 Feb 2025 09:14:19 +0100
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

On Tue, 28 Jan 2025 14:56:45 +0800, oushixiong1025@163.com wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource().
> 
> 

Applied, thanks!

[1/1] drm/bridge: analogix_dp: Use devm_platform_ioremap_resource()
      (no commit info)



Rob


