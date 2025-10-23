Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C818C01C4E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 16:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE6010E906;
	Thu, 23 Oct 2025 14:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cEhlRY9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683DD10E906
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 14:30:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 11FA74AECE;
 Thu, 23 Oct 2025 14:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69BA5C4CEF7;
 Thu, 23 Oct 2025 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761229838;
 bh=8jWBZymH5QTt8c150L0evYjJSEI+8ji+eHa5bEcksMA=;
 h=From:To:Cc:Subject:Date:From;
 b=cEhlRY9W8CMoBk0eV/tNP9c2hNrAN096x+IHo5GrduYd6HotQae8LG1Hj/VeKVfoZ
 Fd09cm5dcFEk39eVzxRGWCcRwylvZdXHHbYBuRki1qK1GrLeqMvwJa1Gk1xabESEnM
 TeFd6DqMmPU4FTn5OFGDZGbdehdCAlFLGekTmld2f2vlofbjpa0mj1gwVh3LGXo1q0
 0B5dcpLsR0cTmuPr8NMXQvG8G7Fz19gKgO0DeXHusa28AKmJo1j/3k3Z7eSr5RZIj5
 oqmS4k6CY0HokqQrlNOZOnM3Yl+UwkpKxdi3f1QUHJPOEXXJ0oAB7wV1H2ReDigN+C
 CyZ6GYeAtL27Q==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 0/4] Add TODO list (+ small docu change)
Date: Thu, 23 Oct 2025 16:30:27 +0200
Message-ID: <20251023143031.149496-2-phasta@kernel.org>
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

drm_sched has so many problems that we should have our own TODO list for
contributors who might wanna help.

Changes in v2:
  - Add generic TODO list example that can stay in the file forever.

Philipp Stanner (4):
  drm/sched: Remove out of place resubmit docu
  drm/sched: Add a TODO list
  drm/sched: Add TODO entry for resubmitting jobs
  drm/sched: Add TODO entry for missing runqueue locks

 drivers/gpu/drm/scheduler/TODO | 51 ++++++++++++++++++++++++++++++++++
 include/drm/gpu_scheduler.h    | 10 -------
 2 files changed, 51 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/TODO

-- 
2.49.0

