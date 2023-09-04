Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BBE7912A0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BE610E2C4;
	Mon,  4 Sep 2023 07:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0C610E2C4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:54:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D2A17612FE;
 Mon,  4 Sep 2023 07:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C73C433C8;
 Mon,  4 Sep 2023 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693814077;
 bh=aoARwb475Xx0f36uSzi/PQ1iNPIFcNtj+pZCdpdTHQE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=oeXdpOGAZ+tSpR3HMxTR43pxm6oJeRKEaYjHnAiUpKKUnXv8h0zhPDAp/MrAs63Cr
 cf+akUCDNS66dijjLR8jgKmwLBpDvA1Qc0qHICniQmlxs5K4kQ4P4dacMhCy6ZOTFH
 8+IaNMbPoR8iHdeG65Y9pzEsiEKgNbkYQ+IAfRHe4qwahERTnQmgqY+cCsYa0USZLi
 NgPRNM9StakARNHOeb6NOFb88stZv4+alRLfxr8hDdRiD+KQ53XHzzcLM2AuThwb7g
 m9mtfoZbMFEiRLNHr5eSQkPlS22qWr9kHR9LXrmbm7EkYwdtaz2RnE1Fr18fHWRPuZ
 FAGXGtWGZJtkA==
Message-ID: <95a50c7653a014d447072039f12144d5.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:54:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 10/15] drm/sprd: Call drm_atomic_helper_shutdown()
 at remove time
In-Reply-To: <20230901164111.RFT.10.I7a2dd349cb52bae53280d0a49e22cc27b923274b@changeid>
References: <20230901164111.RFT.10.I7a2dd349cb52bae53280d0a49e22cc27b923274b@changeid>
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
Cc: rfoss@kernel.org, tzimmermann@suse.de, sam@ravnborg.org,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, Baolin
 Wang <baolin.wang@linux.alibaba.com>, Maxime Ripard <mripard@kernel.org>,
 zhang.lyra@gmail.com, orsonzhai@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:21 -0700, Douglas Anderson wrote:
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at remove time. Let's
> add it.
> 
> The fact that we should call drm_atomic_helper_shutdown() in the case
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
