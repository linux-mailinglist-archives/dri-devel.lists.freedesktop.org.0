Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD367AA0D7A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 15:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F222E10E451;
	Tue, 29 Apr 2025 13:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="ROw1RHi0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB0810E451
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 13:29:12 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745933344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4DytQf8/knSTl8uN0E/2GEj/HCfcYQColb3vJTlNtko=;
 b=ROw1RHi0HM04vTWcet5QsVpmmPhfbXa4hwH6n+xgsKwc32TKuztrJt44PvMGB5AL0YyL4a
 zoQOfN6SH0Nt23ov4l80WjBYo1jgFf90uj/2I55trX8KrCqO3ijmILGzu7hdWk7MAtSfuP
 qGPXenuw1BgxPHRVa9AQeyou0Uv3lrFSlaRrm4c2RuM74s1VpkTgu1rcuJ0nk/PDxpNF1W
 dvmgYpbo+Q3KOzWX9yFd9oxrzEgw3wxmobR2n340M8A9i8iImAwXErfSfFVhv4RpPVzEBA
 Ynyq3VtD+PaWFbAjOWA3VjyOVfrTxJqHn1/q4+5+FzGnF846uhJpgGKqFaOeSA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
 Janne Grunau <j@jannau.net>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
References: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
Subject: Re: [PATCH v2 0/4] Apple Display Pipe driver fixes
Message-Id: <174593334122.31053.18397299595093842185.b4-ty@rosenzweig.io>
Date: Tue, 29 Apr 2025 09:29:01 -0400
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


On Mon, 28 Apr 2025 13:37:12 +0200, Janne Grunau wrote:
> While looking at a suspend issue in the Asahi downstream kernel I
> noticed several issues in the the ADP driver. This series fixes those
> issue.
> 
> The root cause of the issue was that the device is unexpectedly powered
> down on suspend. The driver relies on initialization done by the boot
> loader and can not bring the device up from reset. The change in [1]
> annotates the power-domain used by ADP as always-on. This ensure the
> touchbar is useable when the adpdrm module is loaded after boot.
> 
> [...]

Applied, thanks!

[1/4] drm: adp: Use spin_lock_irqsave for drm device event_lock
      (no commit info)
[2/4] drm: adp: Handle drm_crtc_vblank_get() errors
      (no commit info)
[3/4] drm: adp: Enable vblank interrupts in crtc's .atomic_enable
      (no commit info)
[4/4] drm: adp: Remove pointless irq_lock spin lock
      (no commit info)

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

