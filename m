Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ED279239C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 16:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD0D10E198;
	Tue,  5 Sep 2023 14:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C50E10E198
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 14:45:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80688603F3;
 Tue,  5 Sep 2023 14:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC4BC433C8;
 Tue,  5 Sep 2023 14:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693925139;
 bh=u5an2J/LxUD2OI55rxZZehNpr5yCUsPpbC08EcVzH54=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gyTFF/ylLhrdlt41XanKC7fHVhJ/u8mz8U9ZGeLDO3FaNWWGXKP2YscbsZw4Idwgl
 rdL5DYbVvJByrna7KHIYjGo49YRmYpctpcdPLSYZod+u6jHI9ilat58HAqGNecoGE9
 SNTdQG6XMLdiS7oQA4ryNJaSgGWu8p//HTgBPTWDTT5yMupgqpWnd7TUcfHwRWBgSS
 oYlyPvDJfC4OwlekjHQrq8jY7oHDIma7FicGNRa4lap/V4BMiAG/A+0hR3kzqGGyPq
 HCdehC9ixYpG1DN+YjKBPxcdqLJaP193Rcd3bW01bQZsSoCyTwTqAV/S/5F7wO/mSc
 aw1rWJOEdBH1Q==
From: Robert Foss <rfoss@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH 0/4] drm/bridge: lt8912b: Init & remove related fixes
Date: Tue,  5 Sep 2023 16:45:31 +0200
Message-ID: <169392507968.1016167.9152438724091665305.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
References: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
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
Cc: Robert Foss <rfoss@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Aug 2023 13:48:09 +0300, Tomi Valkeinen wrote:
> Fix various issues in lt8912b driver.
> 
>  Tomi
> 
> 

Fixed the mentioned commit message typos, and an incorrect has
for a "Fixes" tag.

Applied, thanks!

[1/4] drm/bridge: lt8912b: Fix bridge_detach
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=941882a0e96d
[2/4] drm/bridge: lt8912b: Fix crash on bridge detach
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=44283993144a
[3/4] drm/bridge: lt8912b: Manually disable HPD only if it was enabled
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6985c5efc405
[4/4] drm/bridge: lt8912b: Add missing drm_bridge_attach call
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=f45acf7acf75



Rob

