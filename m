Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806ADAE72F8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 01:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1497D10E62F;
	Tue, 24 Jun 2025 23:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pIZl71yq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com
 [209.85.210.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5052510E011
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 23:19:02 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-748e4637739so156953b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 16:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750807142; x=1751411942;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pngvqSmCovapbXdYFYPO9SgyKEbtBPIrkfwlrt81RZ0=;
 b=pIZl71yq7A7Xz2vkciF/GRZ4Z6dtCo/IR1I4l7bJvjA5KG7cWVQriEAxj4ma5I6gJt
 4aaaATIphQJJF4wkxe850q1IDrG533/5vKrR9YphSvQrtyvkXa3VlNCCCKHI4wQnxC6L
 leVEqPVKDW5LE7kek2p1bCdBrjkBe7NVFHKxrWGEMLy5guIIq21oaWoYGJPknXkrtZNS
 m2sVZuEFR729na6u5YPweWJPiujLBSxYYv4srzgV57cBOjhO9IDFmbdBUiGilPvY54bM
 9v0er1CzhX2sUyKqUGBDcUAqaeJQCj3ErX7CiqS2k243G4Zth2kHmkuE5TIb+AbvbtuR
 9s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750807142; x=1751411942;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pngvqSmCovapbXdYFYPO9SgyKEbtBPIrkfwlrt81RZ0=;
 b=dDrBgsOEZXyVW26Euq+cuEdfMsaRhw1SE3ADap0mB56THzEh+Vfg1QjE1Gru9G9eVy
 EypvSmH8rDgtykvyv0atq4YzpOtZCuTodj0RygUzZmKuDC1+nnFvg5DIwnZN5rSNC6bC
 4yGUOlxOwwB06IHYWWilgevQJMD9ae4HqoVfwlz0xoXqLSEyTnmh1uEYPt/4nOBG+fjf
 GOH/0rSz6VeIXdFzlhMC70bpzKM+HGJio7VbGz5itEijrggevEJg1xzrhyZ8Tc4kpkwL
 v7xvXuDm9hEqfV01Sw7Y7KXl9nP1AnIUoM2c0lv+X+SEvUulcnO8BmFHsvQTyiCnRz02
 bHcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNphzVaaUoF4f2O6b+tr2FjPbDR4Pf0OComr3s/xYK22fYw+9AYWMPqgUDlE56PYx7iIQwuBSMmXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJMw6yfPIK41kvWOeX8iS251rh1koWlJi5zX/jmlgaFiKUdkzo
 qk1fi0fqLRZAiD77U0fgjeFmFhmSbIu4QQPyvhXFAvLS8qaRPJBX7enzyZbO2ZnK6+33dTucvo4
 TuOYjMfQ8xg==
X-Google-Smtp-Source: AGHT+IFV3B9OhuWzDeSllzGXDR7OZvOBgi6Pi0GJ0cqbrlPswzFv236wUfDx8y9GXBFd4lYwDCtu44HkGh5n
X-Received: from pfbki22.prod.google.com
 ([2002:a05:6a00:9496:b0:748:da37:7e37])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1891:b0:744:a240:fb1b
 with SMTP id d2e1a72fcca58-74ad4bf80dcmr1309549b3a.5.1750807142180; Tue, 24
 Jun 2025 16:19:02 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:18:34 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250624231837.179536-1-irogers@google.com>
Subject: [PATCH v4 0/3] Add support for a DRM tool like PMU
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>,
 Dominique Martinet <asmadeus@codewreck.org>, 
 Thomas Richter <tmricht@linux.ibm.com>, Junhao He <hejunhao3@huawei.com>, 
 Jean-Philippe Romain <jean-philippe.romain@foss.st.com>,
 matthew.olson@intel.com, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
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

DRM clients expose information through usage stats as documented in
Documentation/gpu/drm-usage-stats.rst (available online at
https://docs.kernel.org/gpu/drm-usage-stats.html). Add a tool like
PMU, similar to the hwmon PMU, that exposes DRM information.

v4: Rebase over changes like the auto merge stat to first wildcard PMU
    change and the clean up of tool PMU initialization.

v3: Minor tweak to the test so the skip (exit 2) doesn't trigger the
    trap cleanup.

v2: Add support to only scan hwmon and drm PMUs if the event or PMU
    wildcard can match. Add a test as requested by Namhyung. Add file
    comments.

v1:
https://lore.kernel.org/lkml/20250211071727.364389-1-irogers@google.com/

Ian Rogers (3):
  perf parse-events: Avoid scanning PMUs that can't contain events
  perf drm_pmu: Add a tool like PMU to expose DRM information
  perf tests: Add a DRM PMU test

 tools/perf/tests/shell/drm_pmu.sh |  78 ++++
 tools/perf/util/Build             |   1 +
 tools/perf/util/drm_pmu.c         | 686 ++++++++++++++++++++++++++++++
 tools/perf/util/drm_pmu.h         |  39 ++
 tools/perf/util/evsel.c           |   9 +
 tools/perf/util/parse-events.c    |  33 +-
 tools/perf/util/pmu.c             |  15 +
 tools/perf/util/pmu.h             |   4 +-
 tools/perf/util/pmus.c            | 101 ++++-
 tools/perf/util/pmus.h            |   2 +
 10 files changed, 951 insertions(+), 17 deletions(-)
 create mode 100755 tools/perf/tests/shell/drm_pmu.sh
 create mode 100644 tools/perf/util/drm_pmu.c
 create mode 100644 tools/perf/util/drm_pmu.h

-- 
2.50.0.727.gbf7dc18ff4-goog

