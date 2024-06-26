Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26ED918294
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 15:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAB610E8AF;
	Wed, 26 Jun 2024 13:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qvk8jt5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC3510E8B2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 13:35:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D2C2C61A1D;
 Wed, 26 Jun 2024 13:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D2DC4AF10;
 Wed, 26 Jun 2024 13:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719408920;
 bh=AIlpDGCONnWhxQyQ02FM69zXP8cQkr1yPRCkzWt917c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qvk8jt5lGmK2V8+IkXOm1g+XqpFdsSqfEAjxigSx8sQjb89osGtu+PoFrOWCVlM/p
 gbDIEPLVvA0ppH0gp1+4FrfDcQMizf6y+pXinjzv2tfNOfgaNvkheC6h26ogmW+6m6
 6JeqifBP5l+sTbQVRTtJGbAew/kJI3nCBrSWuoTjTfjRy2/ixEF2wcmwqsNvItHn/b
 YwN8377YlJAYGViz8HsBBmuOLlFawR+Qrl8QvgMfhIZ4q7PKyOtBfZLk3Qikq2RqNL
 cJ6Hy1Tm4IUyFExc2y0/IRFWuxIpftdhO606aR+w6pMFc2dpEVuGdTCCq36oB2E9u8
 aywMeyyqCQMbA==
From: Maxime Ripard <mripard@kernel.org>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>
Subject: Re: (subset) [PATCH v2 2/2] MAINTAINERS: drm: vc4: Drop Emma's tree
Date: Wed, 26 Jun 2024 15:35:11 +0200
Message-ID: <171940890753.2204713.4133860106720254064.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621131926.3133484-2-dave.stevenson@raspberrypi.com>
References: <20240621131926.3133484-1-dave.stevenson@raspberrypi.com>
 <20240621131926.3133484-2-dave.stevenson@raspberrypi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jun 2024 14:19:26 +0100, Dave Stevenson wrote:
> Emma stepped back from VC4 maintenance a while ago, and
> all patches are now merged through drm-misc.
> 
> Drop Emma's tree from MAINTAINERS.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
