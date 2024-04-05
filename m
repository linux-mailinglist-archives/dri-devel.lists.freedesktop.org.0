Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA39899E17
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 15:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE81110EA5A;
	Fri,  5 Apr 2024 13:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tx+q/GGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67A510EA4A;
 Fri,  5 Apr 2024 13:13:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1EF1D618FF;
 Fri,  5 Apr 2024 13:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925C9C433F1;
 Fri,  5 Apr 2024 13:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712322786;
 bh=VEyed/ecHyBqgaA8v+Xe6IFTwm1TtgE9SEoK//nPgEI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tx+q/GGZxrVngkwOS8gFgGmvPhKZBJty9/r0v9W6KxDR4q7LW2DKE/90/6iTg5Lpp
 khAQFoyq/950o5C66xexkrWnwTvP9ODsID+Ue1i2Kg+Mv1j9EcEGzJ0NUdcMlCC0h8
 o0QgSPnKlDtSyjET8kvChwpZfv+mgx7u5mwgGpTq5YV7IWNGuxzVR8RZhrM4WLEYNn
 48DvvijRxSE+RtmHTq4kDEZGuUhBuKTYG3ORkecEMwB9cUoVgjRDTMewTF6kagtQWR
 n2QLnkWlXXRJlMrflacttX1VbthH0jqld+PFv69b2R3OznwDng65dX6XH6yNARcGo7
 MfNIIZDZbJHzg==
From: Maxime Ripard <mripard@kernel.org>
To: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
Cc: 1054514@bugs.debian.org, airlied@redhat.com, carnil@debian.org, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, kraxel@redhat.com, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 regressions@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 timo.lindfors@iki.fi, tzimmermann@suse.de, 
 virtualization@lists.linux-foundation.org
In-Reply-To: <20240404181448.1643-2-dreaming.about.electric.sheep@gmail.com>
References: <20240327-cuddly-smooth-trogon-59c02d@houat>
 <20240404181448.1643-1-dreaming.about.electric.sheep@gmail.com>
 <20240404181448.1643-2-dreaming.about.electric.sheep@gmail.com>
Subject: Re: (subset) [PATCH v2 1/1] Revert "drm/qxl: simplify qxl_fence_wait"
Message-Id: <171232278434.15085.12649965715947984950.b4-ty@kernel.org>
Date: Fri, 05 Apr 2024 15:13:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Thu, 04 Apr 2024 19:14:48 +0100, Alex Constantino wrote:
> This reverts commit 5a838e5d5825c85556011478abde708251cc0776.
> 
> Changes from commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") would
> result in a '[TTM] Buffer eviction failed' exception whenever it reached a
> timeout.
> Due to a dependency to DMA_FENCE_WARN this also restores some code deleted
> by commit d72277b6c37d ("dma-buf: nuke DMA_FENCE_TRACE macros v2").
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime

