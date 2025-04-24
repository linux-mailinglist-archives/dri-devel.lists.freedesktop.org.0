Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E87A9AE3E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A18710E7EB;
	Thu, 24 Apr 2025 13:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gK/tu3QV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220C0886A4;
 Thu, 24 Apr 2025 13:03:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D6EC5C63BE;
 Thu, 24 Apr 2025 13:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE42C4CEE3;
 Thu, 24 Apr 2025 13:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745499783;
 bh=Jv152d6DpmPq+yu7DURcrVQPxWP449+mWWjGAEmRg0o=;
 h=From:To:Cc:Subject:Date:From;
 b=gK/tu3QVpGdNPadYesZICKORjzztkjuHbQbaySlcqCWvPU5OxijS2SEGYClIDuLaV
 R901q8ITSPqjS9lQxaW20mXT7mfRRAYrV1Wc04DGT1FtX2gmQ17lJVqmUWjql72MY+
 C8CpbEKZBhrpTsqPxHeu3pdGwa542YH/vZKeIAPrYKY9RN5hZb2x77XqIbuCj6BBcb
 2ZMw7WT1gO5ZXJMb+zE7nT+FjZZHJ/DNEZNPFyoKtk6mDBBnyndiiPpqtgQBeockw5
 +cpuNEi+lh2oINAt0JtiDLhp3a1kMCEDQ9Ajo2TSfjsar1D3vNHFAXrAPjKwd0B8yk
 dEVZlGpuwIcPA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 0/4] drm/nouveau: Simplify nouveau_fence.c
Date: Thu, 24 Apr 2025 15:02:50 +0200
Message-ID: <20250424130254.42046-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
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

Just some minor attempts at improving the readability of
nouveau_fence.c

This series is based on this partially merged series: [1]

Feel free to drop single patches if they are not deemed worth the
effort.

P.

[1] https://lore.kernel.org/dri-devel/20250415121900.55719-3-phasta@kernel.org/

Philipp Stanner (4):
  drm/nouveau: nouveau_fence: Standardize list iterations
  drm/nouveau: Simplify calls to nvif_event_block()
  drm/nouveau: Simplify nouveau_fence_done()
  drm/nouveau: Check dma_fence in canonical way

 drivers/gpu/drm/nouveau/nouveau_fence.c | 72 +++++++++++--------------
 1 file changed, 30 insertions(+), 42 deletions(-)

-- 
2.48.1

