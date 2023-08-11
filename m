Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27328778FD6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 14:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA7D10E0A2;
	Fri, 11 Aug 2023 12:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A800910E0A2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 12:47:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E712764749;
 Fri, 11 Aug 2023 12:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6BBC433C7;
 Fri, 11 Aug 2023 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691758047;
 bh=GE7ZMP9v/gDUOwzKlfXTMDj+6ZkOrPLgpFbs/jrO4HQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JEiUHu10rdaKXu9a1csq8PosycxnnY1CC1EwVZ4R9Fn2K8Ae044Rk/yNt1WHhh03P
 c81mDwaFUdgg21jG+1q+12fo5VkbbWzEotn8+646VtzOXw8HvBvVJFjnPjgeYls4W0
 fZH/NV0V6yDrr87HG/gLtcxAn4KCzDNwtncpLW7AwnusqNtQaGrYj/HHU7dUwXFUAB
 V0A3K2os/9vo+2uc4Opjg+ZQKizvPo4CRulsbvNmK+UgIQKTC+6Ahsp8h7UzxMYnnl
 q+fkBoe6tjEETMohgAS5pOM2Zfb0sMlOEjV5B4A1fE6VROmrI3uMm367lWg76/ICSJ
 dVwKbtgnthFQw==
From: Robert Foss <rfoss@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: bridge: for GENERIC_PHY_MIPI_DPHY also select
 GENERIC_PHY
Date: Fri, 11 Aug 2023 14:47:12 +0200
Message-ID: <169175799304.286760.13826671365637873464.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804030140.21395-1-rdunlap@infradead.org>
References: <20230804030140.21395-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Aleksandr Nogikh <nogikh@google.com>,
 Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Chiras <robert.chiras@nxp.com>, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Aug 2023 20:01:37 -0700, Randy Dunlap wrote:
> Three DRM bridge drivers select GENERIC_PHY_MIPI_DPHY when GENERIC_PHY
> might not be set.  This causes Kconfig warnings and a build error.
> 
> WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
>   Depends on [n]: GENERIC_PHY [=n]
>   Selected by [y]:
>   - DRM_NWL_MIPI_DSI [=y] && DRM_BRIDGE [=y] && DRM [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]
>   - DRM_SAMSUNG_DSIM [=y] && DRM [=y] && DRM_BRIDGE [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]
> 
> [...]

Applied, thanks!

[1/1] drm: bridge: for GENERIC_PHY_MIPI_DPHY also select GENERIC_PHY
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=96413b355a49



Rob

