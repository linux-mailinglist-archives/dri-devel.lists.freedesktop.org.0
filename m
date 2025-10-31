Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68B0C245BD
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1908D10EAEA;
	Fri, 31 Oct 2025 10:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="TD8sLM9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D7810EAF3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:09:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so17509435e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761905377; x=1762510177; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5gLsyclWIg1Hbk8GCNQzeqbJp579/jQeUbknnNQhnaI=;
 b=TD8sLM9W/eIes+VwvHuLM8vAwm593tjNRLFSgDCSY8dKzi0P1YnDrf0vxUlO92IIwp
 uGxnO7g3kSTdJG3JWPgplML0oV6p1UVK4M89TlzG/LqERYd2R5h7CWp/np/TOwuj5g5l
 jE+g7J2qIKyg76rE09oDCEHPtoL8VY+aw9JsRDkaRKpB4l84pW/onbnWsKZyrZ2VHjP8
 knEqM0RC2DIPfRte8JGTEJgUIETKbXIisJPq58vEc7AnLPqdzoSq7jVAhZ3w858kf5/D
 msZ3fVHZN2TQZ1wAqT68TfRYY8DvxldGGgT3MNoHowfoZVmvE5TrnzT/18xt3aYwoiE+
 3X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761905377; x=1762510177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5gLsyclWIg1Hbk8GCNQzeqbJp579/jQeUbknnNQhnaI=;
 b=EOjX4l+n9LiUcoG8vsEz+uxm2cmpDID4OFalbk0YK7+k0aNv4+ytSVZmECWvXNtCz/
 ZsifISSw4+hnMzDV6Ev6ld42ECw/DAqOeI43Gd7gbFpNHj1a3MDZPcuqdV369ZqJ3IhU
 1hr/wAwYdO7E//I156pyfNNSQV201vXCuo2vHjJSEPGMaAgJ3gHk+tKsl7MHFZIQ/cuQ
 LqYU//5hxIhOGGLS/v0WEXkS9xT5Z972IlrRNZgW33bcwhj2QwUU2UGPK4oc53GmrQiB
 tIDHDqSwhlPVXdid47K8iLMEHx9Z8sZog3Lf7Xw72B0lkaXnCgM3sqnr2l8B89hcbeSU
 S2Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9+WUvq25RcyNCBRElNf0ZYNI7Y0JlfExdI5TmnbTnfWT/bpDGV5NnIqnx8opexmcUOvPTPlvwpGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLNuGWbuA7mio/4ptr2vRvUdT1yK86Je/bBFVniRJI62WKoaSH
 jm1McM+6PgFonKl+9WICwUbfKY4r7dl2oe/QbEZOCGoTv2I7KPZjnadRO4dGfcsWANw=
X-Gm-Gg: ASbGncte4+ZuEqCT0ykikMfTwLzgYjzKqWp/UBEFunFaqcUCBS2gFzbyYIbGCNBspw5
 +n0vWU1+xYi1Wi0SRHV9UvsiUDoCjE/aOWzmRb094lXHTw/bIxXbCklUadixW3CMpiqNmQnxTbp
 Obnf2bT+zDZpy0Lffw83sgaI+1mO1dg+6ooLcsnzFn3+FONagnyaJ9183eqmUYiNsGKAdGJVqe3
 DWOKDS6IvJpIHuF+lAzVRh0nYb0pEQV7Ehp/3r/6zOptxcojYFnnHC6JwaNXIRzDI5SJqKAz8ez
 RlbBqGV0inhy2IQRKIJvD/QgB/Pebe3PI/CIPcG8WJYeVrqVist4wEZdnGWLqguVPKakXHs6zvP
 PpAjFhd+2ots8gllpbr10jlTTDSuPiQnoOaDGiXkX26yLIIxx00DT2hcUSJwm17yLV8AjgbqXp0
 /rvxyUfYfwFo+pj4ndo3FGxE0mdfr+2YdP0g8=
X-Google-Smtp-Source: AGHT+IFHb0AaSWW+DTXGcxSx3IxdrfeDMO0RYX9+22XPN4yMZ4YQ/BGd2RRqAhlylqD2wBta80eN9A==
X-Received: by 2002:a05:600c:a08e:b0:46e:49fb:4776 with SMTP id
 5b1f17b1804b1-477307c2ad7mr21989415e9.11.1761905376895; 
 Fri, 31 Oct 2025 03:09:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13e1c9esm2839171f8f.22.2025.10.31.03.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:09:36 -0700 (PDT)
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
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/3] replace old wq(s), added WQ_PERCPU to alloc_workqueue
Date: Fri, 31 Oct 2025 11:09:20 +0100
Message-ID: <20251031100923.85721-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
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


Marco Crivellari (3):
  drm/i915: replace use of system_unbound_wq with system_dfl_wq
  drm/i915: replace use of system_wq with system_percpu_wq
  drm/i915: WQ_PERCPU added to alloc_workqueue users

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
2.51.0

