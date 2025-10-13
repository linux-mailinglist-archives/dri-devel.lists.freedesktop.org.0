Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D2FBD2306
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 11:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5475310E40F;
	Mon, 13 Oct 2025 09:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ltTFxs4l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE25910E40A;
 Mon, 13 Oct 2025 09:01:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1932760214;
 Mon, 13 Oct 2025 09:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66412C116B1;
 Mon, 13 Oct 2025 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760346087;
 bh=PUVPVKDMQ8AW8ONm8isXy8IF8Y+8DpKbP240A2K/4Bg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ltTFxs4lX2XDLPKqfuaxKXZ7Tn8xJ4K4cHvljXIen2nNL51d7uSuKIOpP9AXnWB3Z
 lb8Mhvko8dTdtcPqJ0FVbEUroZFci84ozP+qsc2KHdPlBaqBAE8KASVt8LhA2+z3yd
 8Paxm8LPWdldlYipY61zmeh/QTQ06QVOUHU+HDU50j3lR0uPfsDZyplYyCVnjxJsNu
 vAhfoeqxfcD0AWdxl/4SdSdyYaxBTV5fbPnub09MiKaPBgJ1Bo6HF0/6JeBLkEUqLC
 toTejyL65+tqBJZOk+yosJ+609dZOK877Baf+A+nGFm+d1O+/tf6ltpKUFLLlEV6wh
 u3OOI0unDbFsA==
From: Maxime Ripard <mripard@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/atomic: Change state pointers to a more meaningful
 name
Date: Mon, 13 Oct 2025 11:01:21 +0200
Message-ID: <176034607170.51549.15195045845360719384.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008-drm-rename-state-v2-1-49b490b2676a@kernel.org>
References: <20251008-drm-rename-state-v2-1-49b490b2676a@kernel.org>
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

On Wed, 08 Oct 2025 15:11:42 +0200, Maxime Ripard wrote:
> The state pointer found in the struct drm_atomic_state internals for
> most object is a bit ambiguous, and confusing when those internals also
> have old state and new state.
> 
> After the recent cleanups, the state pointer only use is to point to the
> state we need to free when destroying the atomic state.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
