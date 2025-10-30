Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C588EC21CE8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F14210EA04;
	Thu, 30 Oct 2025 18:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="dsCwq6ap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734D110E9FE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:10:22 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so11243125e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761840621; x=1762445421; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z8txnxFWEuSZEvyBpZsokJZwR4vlD1MJiynWZzM4iDc=;
 b=dsCwq6apHDetq70bZoTeHPanLm9d7vWBga3guhnM7KRLFgZQ6/MVPXeDimm56VteU0
 L7YCjEphSe5YLQDI0aLnIkDnY7T1DQUR/APYwugUm+CAzpTyHKpAn5vcDP/KAM8FGwVB
 Q75/Yki1IPLnOYyxf10xkaOBDt9Y+34KwBtVVRIZ3uv02NuWEUo+hSecHKeDhAm+7TZ/
 oP7kC72koX5P5Zrl6chLw2TUhS8DxAKOyeDNKIY9a5tJS6QEnN18Ja1krYNITRU5hN5l
 Mf9iwJ+QzwIPNsIHt3OMtBzPYUZDvi/jAWtmWWYe4pfcv6x/YJbmv04mJV6QfEf8wyI8
 Fd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761840621; x=1762445421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z8txnxFWEuSZEvyBpZsokJZwR4vlD1MJiynWZzM4iDc=;
 b=dyAG9Z4SK9/hXATKk5qeTGaHDSUCP/fw8OEpBzj7TY9RkmyccW/9zL8G34k/bgCnIn
 zojVbRXbk9mXEy/emjmTn2C8/G5yqpP1xJDnryWg0e4RBG44AHvE7UAUX/xm2T3mVlfu
 a24WBehrT+o7lOiVKM1QL3teF3xpyccS07+uZiDghz0H5fHyJZLIHrAgXAYVMQorKTYx
 3yA8q2D5DE8lBZ9H324oZWkREJLYd28cE8M0Rw1hKzHrMEiWLw1Xidie1CDigzNTVlzU
 5fjkiKfwLsxKB9aG5Of1mv9lZP0cgh0ARW48pL/ney1DMNGk6584mT7t1uaLYBv4X5AS
 LvHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQxeWm+3MtTsEuaYMYgNZUgY0wI5DnodID2zwWIeBu7v36apmLgAyDNrhk/QWSnXqTN2YP/0NVn2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCwN5z8r3YxLv92ddi1iW3XRjGvGY1UG8G7giCiGotd7qPUHre
 dnRkFh+lFYo8FaSkrudiOSoz6cDotE06aUdfl8KFzHnwGY/PombSYt6CRnVOT4X49W4=
X-Gm-Gg: ASbGnctN7iD3//lW0afaKPJ3PHe+Iyk1T4womTbmMyQc++MZxu+wCV5QvGsrnrHiEQi
 +LI69JNvj9diC4dqpJu2S/k61tsamBbDyfoF8qRKO/mulHbeicgTGmGyeLQ8eWyzCoQ2jRRcS9O
 TrHQaBj+EnLp4Og15yz0mzFK7tZP5BVxV6U3DN+4HbR1MZoBMJWYouzjXGSk50lsw8Bg9i1K5IJ
 zpikM7gxM7pHjXgl4QYksc8EV1Cg+gCuyvMG4Hzg1Vrqui7Hrqqk7qD4QG99+vDe6NgXvElyQtK
 6lmGhPhGtDNaaklHWh12p0U8l347xSHP8hhXpxv9btanvdeq0Goga7XNNoBmGv/a5RwxfY4rLn6
 DTlypQyWJ1FFOQLm8DTg4S445nDsY1kHibPt1xahRfYAdA/imUCtSPO0HHkqKIgNXEFQm0VUvc0
 cLe0cyXByelPqdHS4=
X-Google-Smtp-Source: AGHT+IFUABxe82sEBxNr7aGuyc63kqBiirRpp/f4wHw9QtuKLHHuTYMkkkGE04OiUmg1LArsF4Jd1A==
X-Received: by 2002:a05:600c:a345:b0:45d:dc85:c009 with SMTP id
 5b1f17b1804b1-477307c3595mr2031835e9.10.1761840620842; 
 Thu, 30 Oct 2025 09:10:20 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7a7csm33124857f8f.8.2025.10.30.09.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 09:10:20 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/4] replace old wq(s), added WQ_PERCPU to alloc_workqueue
Date: Thu, 30 Oct 2025 17:10:07 +0100
Message-ID: <20251030161011.282924-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Oct 2025 18:42:34 +0000
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

2) [P 3-4] WQ_PERCPU added to alloc_workqueue()

	This change adds a new WQ_PERCPU flag to explicitly request
    alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

Thanks!

Marco Crivellari (4):
  drm/amdgpu: replace use of system_unbound_wq with system_dfl_wq
  drm/amdgpu: replace use of system_wq with system_percpu_wq
  amd/amdkfd: WQ_PERCPU added to alloc_workqueue users
  drm/radeon: WQ_PERCPU added to alloc_workqueue users

 drivers/gpu/drm/amd/amdgpu/aldebaran.c     | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c   | 3 ++-
 drivers/gpu/drm/radeon/radeon_display.c    | 3 ++-
 5 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.51.0

