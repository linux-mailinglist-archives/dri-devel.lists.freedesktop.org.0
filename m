Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F10AA0D7C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 15:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0136110E484;
	Tue, 29 Apr 2025 13:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="nMjKPaSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5A710E484
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 13:29:12 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745933345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0t4N43kcq+EG1O2tabi3Z0JaJWUv3qgGXlKWPJrpiSI=;
 b=nMjKPaSHK33LAZsqSyqODSyU7VXu92qKWBV9TzlQhDIFdf6IEz43mR9xXfTwrelImsxcl6
 SYT+/WdHvLFejBzuMS6qt0W4yBVaeGx878tRa71g34jmQCTTq0qZxjajTKCV4gxb1viYyq
 WMogfNGpWlxIgfkoYMf+1dPURYzQwF4Nfc9sIciI3PoB9kA94XCNPeqK+AexW5tUrp+B6n
 iboa+eSraBWHHF4a9P2ABr0Itw5NRbQ0W2scEws3bupxTJQjOpxog2HKf9VizF7gA8VuYv
 kBdzV+DVCC/itIPJBgbv2hJk23ZrGq8ylsmtG9S7foeG1WpDDEzXJFS/rv+uAA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Lyude Paul <lyude@redhat.com>, Janne Grunau <j@jannau.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250304-drm_debug_dp_mst_topo_kconfig-v1-1-e16fd152f258@jannau.net>
References: <20250304-drm_debug_dp_mst_topo_kconfig-v1-1-e16fd152f258@jannau.net>
Subject: Re: [PATCH] drm: Select DRM_KMS_HELPER from
 DRM_DEBUG_DP_MST_TOPOLOGY_REFS
Message-Id: <174593334421.31053.2925170432781781609.b4-ty@rosenzweig.io>
Date: Tue, 29 Apr 2025 09:29:04 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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


On Tue, 04 Mar 2025 20:12:14 +0100, Janne Grunau wrote:
> Using "depends on" and "select" for the same Kconfig symbol is known to
> cause circular dependencies (cmp. "Kconfig recursive dependency
> limitations" in Documentation/kbuild/kconfig-language.rst.
> DRM drivers are selecting drm helpers so do the same for
> DRM_DEBUG_DP_MST_TOPOLOGY_REFS.
> Fixes following circular dependency reported on x86 for the downstream
> Asahi Linux tree:
> 
> [...]

Applied, thanks!

[1/1] drm: Select DRM_KMS_HELPER from DRM_DEBUG_DP_MST_TOPOLOGY_REFS
      (no commit info)

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

