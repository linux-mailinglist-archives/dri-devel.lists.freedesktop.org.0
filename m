Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D10753504
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 10:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2038910E836;
	Fri, 14 Jul 2023 08:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7214510E833
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 08:31:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 54FF75BAE8;
 Fri, 14 Jul 2023 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1689322895;
 bh=7LaE8gDQp5a1iynAfRg1d1jsyri669yUm6LM+c+fXeg=;
 h=From:Subject:Date:To:Cc;
 b=UgOOMtT/nFZfrWhhlW4xZ6o892ww1exUx7uhNua+wOM7l2SsLPE45su02/Pcb3cb9
 TcPsvZNiq/deby8jTeEfspKikZb38fHEesCMAviL+VmU0M8SRKWz+q1OvLW69Z2edg
 VxrvEzRY9bC8mWF8oUWHhl85vPey7GBAHQMYt3umax2JHUuQoGidLi4d4wREWFJwpL
 zlGHJYxeRn2dy/DcQNPrNtduqdKgo4mV3e9D/ZXlF3VbCXL5nN2eUJJAbI9hFAy78G
 ZaF8hjd+ZvMVI5iBCHQsgkL8vA/7bbdL9RoAe60Ymb0ISMgtqnfm5sqgUkKK407BNq
 lETcX3BQOtscQ==
From: Asahi Lina <lina@asahilina.net>
Subject: [PATCH 0/3] DRM scheduler documentation & bug fixes
Date: Fri, 14 Jul 2023 17:21:28 +0900
Message-Id: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIgFsWQC/x3LSwqAMAxF0a1IxgaqFkS3Ig6sfdoM/NCACKV7t
 zg8XG4iRRQojVWiiEdUrrOgqStaw3LuYPHF1Jq2M31j2ceDdQ3wvMkL5cE6LMZ2zqGnct0Rfyj
 TNOf8AZODU3hhAAAA
To: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689322891; l=3816;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=7LaE8gDQp5a1iynAfRg1d1jsyri669yUm6LM+c+fXeg=;
 b=RD6jS9hPk9Ng458Wf9vj0cVu5zbGFCK8e/BYOvUyQkZPw0JH1LoJWPboPFvY9KDwoZf+/M19K
 iQDoGu52PTvAZj6WsJE645nIhkFQbMejqFfOjJ1Fwbn2ZCrNHAmCjiy
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on the previous discussion while I was writing the Rust
abstractions for the DRM scheduler, it looks like we're overdue for some
documentation.

This series first attempts to document what I've learned about the
scheduler and what I believe should be the *intended* lifetime
semantics, and then fixes a few bugs that result from that:

1. The DRM scheduler fences cannot be required to be outlived by the
   scheduler. This is non-negotiable. The whole point of these fences is
   to decouple the underlying hardware/driver from consumers, such as
   dma-bufs with an attached fence. If this requirement were not met,
   then we'd have to somehow keep the scheduler and all the driver
   components associated with it alive as long as a dma-buf with an
   attached drm_sched fence is alive, which could be indefinitely even
   after the hardware that produced that dma-buf is long gone. Consider,
   for example, using a hot-pluggable GPU to write to a dma-buf in main
   memory, which gets presented on an integrated display controller, and
   then the GPU is unplugged. That buffer could potentially live
   forever, we can't block GPU driver cleanup on that.

2. Make the DRM scheduler properly clean up jobs on shutdown, such that
   we can support the use case of tearing down the scheduler with
   in-flight jobs. This is important to cleanly support the firmware
   scheduling use case, where the DRM scheduler is attached to a file
   (which we want to be able to tear down quickly when userspace closes
   it) while firmware could continue to (attempt to) run in-flight jobs
   after that point. The major missing codepath to make this work is
   detaching jobs from their HW fences on scheduler shutdown, so
   implement that. This also makes writing a safe Rust abstraction
   plausible, since otherwise we'd have to add a huge pile of complexity
   to that side in order to enforce the invariant that the scheduler
   outlives its jobs (including setting up a workqueue to handle
   scheduler teardown and other craziness, which is an unacceptable
   level of complexity for what should be a lightweight abstraction).

I believe there *may* still be at least one UAF-type bug related to case
2 above, but it's very hard to trigger and I wasn't able to figure out
what causes it the one time I saw it recently. Other than that, things
look quite robust on the Asahi driver with these patches, even when
trying to break things by killing GPU consumers in a tight loop and
things like that. If we agree this is a good way forward, I think this
is a good start even if there's still a bug lurking somewhere.

Aside (but related to the previous discussion): the can_run_job thing
is gone, I'm using fences returned from prepare() now and that works
well (and actually fixes one corner case related to wait contexts I'd
missed), so hopefully that's OK with everyone ^^

Changes from the previous version of patch #2: explicitly signal
detached job fences with an error. I'd missed that and I think it's what
was causing us some rare lockups due to fences never getting signaled.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
Asahi Lina (3):
      drm/scheduler: Add more documentation
      drm/scheduler: Fix UAF in drm_sched_fence_get_timeline_name
      drm/scheduler: Clean up jobs when the scheduler is torn down.
 drivers/gpu/drm/scheduler/sched_entity.c |  7 ++-
 drivers/gpu/drm/scheduler/sched_fence.c  |  4 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 90 ++++++++++++++++++++++++++++++--
 include/drm/gpu_scheduler.h              |  5 ++
 4 files changed, 99 insertions(+), 7 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230714-drm-sched-fixes-94bea043bbe7

Thank you,
~~ Lina

