Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B92C24E62
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 13:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB12710EB83;
	Fri, 31 Oct 2025 12:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QOKeUguv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E6F10EB4B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 12:00:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6867143252;
 Fri, 31 Oct 2025 12:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E889C4CEE7;
 Fri, 31 Oct 2025 12:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761912033;
 bh=EOSfn/bp0y1y5/7RCIQRJdv2XS7cd/rWRnzyFY77eJU=;
 h=From:To:Cc:Subject:Date:From;
 b=QOKeUguvlX70RZ0IM/YpAOHGdANG/qRS5Tx/ucGffpJ6CuiCu1SRQxVxggF2bWt8p
 0T/avhIHG26DQj+AaXUd8rLLSmLkWnz5MN8L4MsnjQFxsH7+fuPYX7avTIVlmuk3m5
 7K/G/pWREDP8ievO5o0HnqEyYHV6tFiIx2KBFAzfCosnxLwbwJFMVeABIhzOI2tJUI
 HpyTG/6rSOahwLUpE7oRtmgQBj/iUSXygjKBrc/IXnRRdigeDfSoUTkrCMu8FJjtFr
 HcP9zPtKpReJjUAc3qxn2E8nCfVTEdFVfu5IvqyVd2PuONYASLgrYL4bPBXGnf9Eme
 eOrtXqBTG5cgA==
From: Philipp Stanner <phasta@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 0/2] drm/todo: Add section for GPU Scheduler
Date: Fri, 31 Oct 2025 13:00:13 +0100
Message-ID: <20251031120014.248416-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

The GPU Scheduler has enough problems to be covered by the drm todo
list. Let's add an entry.

This series is the succesor of [1].

[1] https://lore.kernel.org/dri-devel/20251023143031.149496-2-phasta@kernel.org/

Philipp Stanner (2):
  drm/todo: Add section with task for GPU scheduler
  drm/todo: Add entry for unlocked drm/sched rq readers

 Documentation/gpu/todo.rst | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

-- 
2.49.0

