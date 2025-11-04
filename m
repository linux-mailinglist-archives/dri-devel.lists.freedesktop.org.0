Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64462C3063F
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EE910E265;
	Tue,  4 Nov 2025 10:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="ROFGMuIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE5D10E265
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 10:00:46 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47754e9cc7fso4186245e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 02:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762250445; x=1762855245; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rgopYyeNgZsrt2Y79WHTxulNc0VQoVCMlZy03CyU8+g=;
 b=ROFGMuIo631MNaBsyQ2j7CUcezviKxN1BWtN6pnKGu6wIuqAdKwsd9dd+LSRWS7vta
 Jl7nTtCGsFp61UMYmFbxhERncXaMoVYmtwF+5dbRvgCPTtl/n+mZ4cEjSbqlUKa5oUdg
 9/G9xK9Of2UyEZPb8EXktbkpbUZ0ORdZ8hY4cx0I4wJrnJylyZumOpJLLr8L7SSLKkfJ
 6BJIun6J3wVQXGa/YhIO6hCiuPyGZ6ANXY7bgmCKEeEaLIgjoI/4FTmrpJ9ucx7ea3uz
 zJR+9/yhMywktFfqAj0RNgyYKPxxWLlYwu7mQtcr2QmY4tCRdW0/DGKrbWDfoS6JA6E9
 zVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762250445; x=1762855245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rgopYyeNgZsrt2Y79WHTxulNc0VQoVCMlZy03CyU8+g=;
 b=T68rFnXoSITEshV9h0EUuiQL6BfdV1AuKBWaYVQ0QDxjVKBlENYoBZ44xT0zLKDaLu
 WLePMYAU+Z23keFU5yXtrpZX4UAyCb+ETvUCPWmCS+09lEWxGug9wtnk6Ti/E2SwubyM
 HXKEzlN7/JsLDCBmM+pht55rAk4PAX0xeoXalXT3wGmmLdrgX7andk47E3hpVekCalwG
 tFqctcUdVlbx6i6dt72lsExebfqyeUug3OQGPJc6WXeu96zBNDzjJ8mGIlxgoMtB8cY/
 BOs5pzZElZXSycJYVQhPE/uVfo+T2NGIg9A4vyOVZhyT0EVw004UupnxoCCpn/YZtaxr
 BYdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIQ8Cf9H342z/lKe74Hw4ZhHnXPleRp1bDj6PN//aqDN3u35oEorLyx3HmODSkS8KEJfYoGXnWTkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm3lVDYgx1tciz65p3KLmNmM04KsR82Yj4ioovwfYr9QMnIuwy
 GfIVsZ7Do9b0AQwRFxTrkT+SzRYSs0Y2wtDz3XNsjNSlt6LYVZG5X7TkVR6f0w0YuWs=
X-Gm-Gg: ASbGnct1ZbQFYSB12XqwPbcWBquQS5pYiPswFPWB2b75aB16CkU0aCumYOt0Lx7SN2x
 R84sT/1KOzCtANTia06UcsGXckkBdU/OppemOJVs/fRLZWSzmxoEvGTk+R3el9sFm4doLeNc75k
 dTFulfRru/G2bLGue58QdaB+qUcl0GyHSdFv9KtxzBV3Yro8uwnYQ0DaizzpVYp+kbFENSINvaZ
 D1qircnzkp1uSjjarhAcgqfmYxrvzpe+D0lmD9fjG9NkDfU1ypMPBqW9klhRXpKoJ1F9+qtgA63
 vYbivUMrc1Moj95uNH7SfrauEvKu88J4W+GD8USgGfarh7ufKnRVkwd1fN1ClkBX7/gMNChI6MW
 2gYM5ofcUzRuS3cQzCs4MzIX+kG0bkf+m7S3dvMPOCWUiXxd+waxS0IdodEoGeqPwGF+M1qiLVk
 wlkQkEwgoeU4DyPOArRhBhjdv+uU3JxdAveMQ=
X-Google-Smtp-Source: AGHT+IGWKsEYeVin7D/5J78w8s6rqhDLVOG5AJCCtqrz5PPQJufaU8hvNyFs/6YjSt6T2WJtHCvGgQ==
X-Received: by 2002:a05:600c:5252:b0:471:b5d:2db7 with SMTP id
 5b1f17b1804b1-4773086e099mr128405005e9.24.1762250444571; 
 Tue, 04 Nov 2025 02:00:44 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47755942772sm14325865e9.5.2025.11.04.02.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 02:00:44 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH v3 0/3] replace old wq(s), add WQ_PERCPU to alloc_workqueue
Date: Tue,  4 Nov 2025 11:00:29 +0100
Message-ID: <20251104100032.61525-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi,

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an
isolated CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

=== Recent changes to the WQ API ===

The following, address the recent changes in the Workqueue API:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The old workqueues will be removed in a future release cycle.

=== Introduced Changes by this series ===

1) [P 1-2]  Replace uses of system_wq and system_unbound_wq

    system_wq is a per-CPU workqueue, but his name is not clear.
    system_unbound_wq is to be used when locality is not required.

    Because of that, system_wq has been replaced with system_percpu_wq, and
    system_unbound_wq has been replaced with system_dfl_wq.

2) [P 3] WQ_PERCPU added to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.


Thanks!

---
Changes in 3:
- Improved commit logs

Changes in v2:
- fix typo in patch subject (add instead of added).

- in every patch is also present the specific commit hash about the
  workqueue API change.

- fixed commit log of P1 (removed "Adding system_dfl_wq...").

- P2: subject changed reflecting the effective change.

- rebased to v6.18-rc4.


Marco Crivellari (3):
  drm/i915: replace use of system_unbound_wq with system_dfl_wq
  drm/i915: replace use of system_wq with system_percpu_wq in the
    documentation
  drm/i915: add WQ_PERCPU to alloc_workqueue users

 drivers/gpu/drm/i915/display/intel_display_driver.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_display_power.c  | 2 +-
 drivers/gpu/drm/i915/display/intel_tc.c             | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c        | 2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c              | 4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c           | 4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c   | 6 +++---
 drivers/gpu/drm/i915/i915_active.c                  | 2 +-
 drivers/gpu/drm/i915/i915_driver.c                  | 5 +++--
 drivers/gpu/drm/i915/i915_drv.h                     | 2 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.c           | 2 +-
 drivers/gpu/drm/i915/i915_vma_resource.c            | 2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c                | 2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c            | 2 +-
 drivers/gpu/drm/i915/selftests/i915_sw_fence.c      | 2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c    | 2 +-
 16 files changed, 24 insertions(+), 23 deletions(-)

-- 
2.51.1

