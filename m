Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33495C2D58D
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD2510E1FE;
	Mon,  3 Nov 2025 17:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="WmQOWdc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4526210E1FE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:06:17 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-477549b3082so1026145e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762189576; x=1762794376; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=db/7hGwufLFvyVtkkwX69hd9DmSDiSZf9aITV2l4aKU=;
 b=WmQOWdc8ryvgsvI3UHXfKnBFs0o75MVF2NMWfAz9NGTX/u8vtC6R5jsGQL2VPQM3hh
 rNpscAX+PYqDu8xCK2OK9+OAVLQ4wZlokK7CwN0GLwQq601Fj+wJQ2nFHawhNEvlBwSj
 S1R9Ow9bmuGIfS1p91GaSXIHlmZfxq3YGySPDTyg7kU1LXFvboRXvZjBi4BBkXKlooxh
 68qdaKfAFKlDtBSDrL9J2Kyzh+QJk/xr7R0Z4k+R2pUqdFdS4l3qmABci2ak3hsBQ9+U
 uvuDZd5u+YAbVSRbpjYTj5DSKAMGMr0MvfXtU6Oj09+m1BfOwlvd9kafJXUfjR189jbF
 7yQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762189576; x=1762794376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=db/7hGwufLFvyVtkkwX69hd9DmSDiSZf9aITV2l4aKU=;
 b=Y9Qufze2EpjdI3UwQ4u+vjcTSUGwad0OTxSAGjSu5RRMWpJ0eZmEktOlcALsph5fo7
 aLBu1OJkV94zCO8k2oo7wb634Ejlf8tPnjgRUJiIfOZhfzATn8oAcrfAG5Fh2Y4wzFrw
 u0kFg1+J5CAXkC7Sl0uNauZVaEePwDCWfKOMd9vu3HZk15LKG64YtIMU89d+y2naZQDd
 xqqwh3s2fpvNV24ZHnNxgTsL7KfBf+NDk9Nm1yNf0B5L6WqbJljN7AFwM6JqY4PCO1vr
 4wo6h/TrNfV9sOIbHXP7GhplMVhfKzlZCynvAD0YUtc8w+ZhKgydXi1ldNOAYCodmsiu
 8G0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL7P2wAsozUPhkVqbEv+o5CQTUWAKvao9SZT6xLrkjL89qgrslfGvY5Ww/c+sGzOzGfyfYEhAkEos=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylxMV/fStkFJ06ol+eFNf3sD1JDxOEI4zDf6jkJbyO/2AVnSf5
 jJfMNuOrDXwJQTsAajQ3tSnO4U6L2eBqldmnpu+MiHetYrwDoz6LS3U6BGK9/5v+/y4=
X-Gm-Gg: ASbGncuCXEoUOGkT2NckEpSwyYu4QVmD1W2tfYtvLw06T9MJpaeCzzbwrh+cyHJp6Me
 m8MenSuObzR051Nsa26nmEnCQyBzdL7pPBXIrv0rAGn2d0lVZ3O2AET3/LRMtdE9m/m8bnIh2VB
 FFUF98M97VMQl2He7tgCIns6eiqiMJghJmIq7OM7QkANxBPhaJjKTqIkIRPKCyBKg9yAV6518Qv
 e6GScoba+Tc4W4N7r8es4C58z6wCpzX3EkZTd0Q91n+I06holpmeln2afapbqE5oxp5aywNyDPX
 uI8kPy5vBWh9kIcZ18dQ/0EFJjqSJIsdwbo+lmqUoGqex6LmogYtJAiquEm0GEB6zcTlD8cLSh7
 ibLmw7mU5wN50XywfRYGC7BE57s5HipaS3X3uwqkIKctF1laehYBlTSo1BJWX5gajuXpw2pZ8Bk
 8O0QaI81lpkLiiS9nRqP/FyFUibYyOHVaXBkg=
X-Google-Smtp-Source: AGHT+IE951GkqsPPwEMA5npQFHvSg+BMrpL+lZBjzW9UnWXAvu8Mr7+YniOEEhVFUQcXVS31YOTVgw==
X-Received: by 2002:a05:600c:530f:b0:475:d8b3:a9d5 with SMTP id
 5b1f17b1804b1-477307e3d3cmr111815725e9.10.1762189574115; 
 Mon, 03 Nov 2025 09:06:14 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fc524ddsm89799895e9.7.2025.11.03.09.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 09:06:12 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/2] replace system_unbound_wq,
 add WQ_PERCPU to alloc_workqueue
Date: Mon,  3 Nov 2025 18:06:02 +0100
Message-ID: <20251103170604.310895-1-marco.crivellari@suse.com>
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

1) [P 1]  Replace uses of system_unbound_wq

    system_unbound_wq is to be used when locality is not required.

    Because of that, system_unbound_wq has been replaced with
	system_dfl_wq, to make sure this would be the default choice
	when locality is not important.

	system_dfl_wq behave like system_unbound_wq.

2) [P 2] add WQ_PERCPU to alloc_workqueue()

    This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

	The behavior is the same.

Thanks!


---
Changes in v2:
- rebased on v6.18-rc4.

- commit logs integrated with the appropriate workqueue API commit hash.


Marco Crivellari (2):
  drm/xe: replace use of system_unbound_wq with system_dfl_wq
  drm/xe: add WQ_PERCPU to alloc_workqueue users

 drivers/gpu/drm/xe/xe_devcoredump.c     | 2 +-
 drivers/gpu/drm/xe/xe_device.c          | 4 ++--
 drivers/gpu/drm/xe/xe_execlist.c        | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c            | 2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c          | 4 ++--
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 ++-
 drivers/gpu/drm/xe/xe_oa.c              | 2 +-
 drivers/gpu/drm/xe/xe_sriov.c           | 2 +-
 drivers/gpu/drm/xe/xe_vm.c              | 4 ++--
 9 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.51.1

