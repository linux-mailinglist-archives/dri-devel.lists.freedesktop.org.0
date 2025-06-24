Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FD7AE72F7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 01:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E818A10E011;
	Tue, 24 Jun 2025 23:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="y9N33UjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com
 [209.85.161.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3187610E62F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 23:19:05 +0000 (UTC)
Received: by mail-oo1-f74.google.com with SMTP id
 006d021491bc7-6114d2ae259so4779057eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 16:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750807144; x=1751411944;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=c3nTtbe0Tv/hCcFjA75rcndb1ZtC/Z05byf6Qgte1y0=;
 b=y9N33UjMwgGJtC6rX9GBd0xxWvV8NcEa5tbVV9tp8sy3xSxxNnP8c+H+8tkoR1p1yb
 LcVCFwciewU6jSONy8Ow6UaeeC20Af3RnR7Q2cNd9r8a9mlzSMmYo5bj+h80Y0wOkX92
 hKZDWIsesHjX5TRX8q8m+8VJjvN2vBtUm2JtcdpiC6dNLBT6MvC3UVp8gt7668vHLx8W
 LGQYb97PUaVvoA+qd/fNa8nl3YJ3mH8+Bz0O7DoBXVNwvQwou8JmluXPzC0hH+tENJKR
 ghOlnqb8QS+DJiKXn7NHMw3lnpgp60ZsUbKsDZZ76A1MnHWmpsmkxkSwcxjf9/zvCJl4
 wuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750807144; x=1751411944;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c3nTtbe0Tv/hCcFjA75rcndb1ZtC/Z05byf6Qgte1y0=;
 b=XK8klxczeoV+hIqD2v+yS+UBur0ZctG6nzeNNS5qqihBSCABZrteFgAS7+2j5fUwX7
 cCW9/nK6tWzgHOs3Zhcsv3kA1YEP/rDeojkkfpZ1m4Gf157z8onlQI4KwVq46CHHti5W
 yIQkiCudDHIMB08CekMVE8x+MqfZcvz6WR/L8D3u0cvb6PQgGFSWmle2i3xSNYGXCiyg
 6prGamURdH7qvAI++UcfzIn2AFdVmG8QB3Oyu8MTlZ3WAtKCGJTlG3tBKsiI/1cpAOkv
 EhV4CGL8TJYd3hQ016RBKktefuyS/ub17cItYs/ZvJabbrTtcw2fYYku7qXv4aZS6m9p
 9kTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFWGABset3SJPtpiLwf9iFitgSRJOAueepGXdoXyLJyJ/BTkzV75qQSUv4Q6wrpyFlo8+8jYnVsU4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMGsrPTF5z3YJfnn7IabiDBdQhmq4gU6pwyPF1LXBguE/YjOSO
 CvSfy5p/3K71qTWbr4htwP4EEJUWK6o3dblPn2P6XDgBxBsqnJ04Dkl0m0PS4aEAEtfWkFh7Ldh
 8usUUmEfEHg==
X-Google-Smtp-Source: AGHT+IFXWZZ1CRCWcrDta6qiLM+gayDxk+xFJqGOzfqYGuNTUXFKwCrv6FyBo0yt7uR6ntZsx4wgNnWjQYGt
X-Received: from oabtd5.prod.google.com ([2002:a05:6871:8785:b0:2d5:2492:cc14])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:6101:b0:2bc:7811:5bb8
 with SMTP id 586e51a60fabf-2efb2367241mr929848fac.18.1750807144437; Tue, 24
 Jun 2025 16:19:04 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:18:35 -0700
In-Reply-To: <20250624231837.179536-1-irogers@google.com>
Mime-Version: 1.0
References: <20250624231837.179536-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250624231837.179536-2-irogers@google.com>
Subject: [PATCH v4 1/3] perf parse-events: Avoid scanning PMUs that can't
 contain events
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

Add perf_pmus__scan_for_event that only reads sysfs for pmus that
could contain a given event.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 33 ++++++++-------
 tools/perf/util/pmus.c         | 77 ++++++++++++++++++++++++++++++++++
 tools/perf/util/pmus.h         |  2 +
 3 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index d1965a7b97ed..4cd64ffa4fcd 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -490,7 +490,7 @@ int parse_events_add_cache(struct list_head *list, int *idx, const char *name,
 	int ret = 0;
 	struct evsel *first_wildcard_match = NULL;
 
-	while ((pmu = perf_pmus__scan(pmu)) != NULL) {
+	while ((pmu = perf_pmus__scan_for_event(pmu, name)) != NULL) {
 		LIST_HEAD(config_terms);
 		struct perf_event_attr attr;
 
@@ -1681,7 +1681,8 @@ int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 
 	INIT_LIST_HEAD(list);
 
-	while ((pmu = perf_pmus__scan(pmu)) != NULL) {
+	while ((pmu = perf_pmus__scan_for_event(pmu, event_name)) != NULL) {
+
 		if (parse_events__filter_pmu(parse_state, pmu))
 			continue;
 
@@ -1760,19 +1761,21 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 
 	pmu = NULL;
 	/* Failed to add, try wildcard expansion of event_or_pmu as a PMU name. */
-	while ((pmu = perf_pmus__scan(pmu)) != NULL) {
-		if (!parse_events__filter_pmu(parse_state, pmu) &&
-		    perf_pmu__wildcard_match(pmu, event_or_pmu)) {
-			if (!parse_events_add_pmu(parse_state, *listp, pmu,
-						  const_parsed_terms,
-						  first_wildcard_match,
-						  /*alternate_hw_config=*/PERF_COUNT_HW_MAX)) {
-				ok++;
-				parse_state->wild_card_pmus = true;
-			}
-			if (first_wildcard_match == NULL)
-				first_wildcard_match =
-					container_of((*listp)->prev, struct evsel, core.node);
+	while ((pmu = perf_pmus__scan_matching_wildcard(pmu, event_or_pmu)) != NULL) {
+
+		if (parse_events__filter_pmu(parse_state, pmu))
+			continue;
+
+		if (!parse_events_add_pmu(parse_state, *listp, pmu,
+					  const_parsed_terms,
+					  first_wildcard_match,
+					  /*alternate_hw_config=*/PERF_COUNT_HW_MAX)) {
+			ok++;
+			parse_state->wild_card_pmus = true;
+		}
+		if (first_wildcard_match == NULL) {
+			first_wildcard_match =
+				container_of((*listp)->prev, struct evsel, core.node);
 		}
 	}
 	if (ok)
diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index 3bbd26fec78a..e0094f56b8e7 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -19,6 +19,7 @@
 #include "tool_pmu.h"
 #include "print-events.h"
 #include "strbuf.h"
+#include "string2.h"
 
 /*
  * core_pmus:  A PMU belongs to core_pmus if it's name is "cpu" or it's sysfs
@@ -350,6 +351,82 @@ struct perf_pmu *perf_pmus__scan_core(struct perf_pmu *pmu)
 	return NULL;
 }
 
+struct perf_pmu *perf_pmus__scan_for_event(struct perf_pmu *pmu, const char *event)
+{
+	bool use_core_pmus = !pmu || pmu->is_core;
+
+	if (!pmu) {
+		/* Hwmon filename values that aren't used. */
+		enum hwmon_type type;
+		int number;
+		/*
+		 * Core PMUs, other sysfs PMUs and tool PMU can take all event
+		 * types or aren't wother optimizing for.
+		 */
+		unsigned int to_read_pmus =  PERF_TOOL_PMU_TYPE_PE_CORE_MASK |
+			PERF_TOOL_PMU_TYPE_PE_OTHER_MASK |
+			PERF_TOOL_PMU_TYPE_TOOL_MASK;
+
+		/* Could the event be a hwmon event? */
+		if (parse_hwmon_filename(event, &type, &number, /*item=*/NULL, /*alarm=*/NULL))
+			to_read_pmus |= PERF_TOOL_PMU_TYPE_HWMON_MASK;
+
+		pmu_read_sysfs(to_read_pmus);
+		pmu = list_prepare_entry(pmu, &core_pmus, list);
+	}
+	if (use_core_pmus) {
+		list_for_each_entry_continue(pmu, &core_pmus, list)
+			return pmu;
+
+		pmu = NULL;
+		pmu = list_prepare_entry(pmu, &other_pmus, list);
+	}
+	list_for_each_entry_continue(pmu, &other_pmus, list)
+		return pmu;
+	return NULL;
+}
+
+struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const char *wildcard)
+{
+	bool use_core_pmus = !pmu || pmu->is_core;
+
+	if (!pmu) {
+		/*
+		 * Core PMUs, other sysfs PMUs and tool PMU can have any name or
+		 * aren't wother optimizing for.
+		 */
+		unsigned int to_read_pmus =  PERF_TOOL_PMU_TYPE_PE_CORE_MASK |
+			PERF_TOOL_PMU_TYPE_PE_OTHER_MASK |
+			PERF_TOOL_PMU_TYPE_TOOL_MASK;
+
+		/*
+		 * Hwmon PMUs have an alias from a sysfs name like hwmon0,
+		 * hwmon1, etc. or have a name of hwmon_<name>. They therefore
+		 * can only have a wildcard match if the wildcard begins with
+		 * "hwmon".
+		 */
+		if (strisglob(wildcard) ||
+		    (strlen(wildcard) >= 5 && strncmp("hwmon", wildcard, 5) == 0))
+			to_read_pmus |= PERF_TOOL_PMU_TYPE_HWMON_MASK;
+
+		pmu_read_sysfs(to_read_pmus);
+		pmu = list_prepare_entry(pmu, &core_pmus, list);
+	}
+	if (use_core_pmus) {
+		list_for_each_entry_continue(pmu, &core_pmus, list) {
+			if (perf_pmu__wildcard_match(pmu, wildcard))
+				return pmu;
+		}
+		pmu = NULL;
+		pmu = list_prepare_entry(pmu, &other_pmus, list);
+	}
+	list_for_each_entry_continue(pmu, &other_pmus, list) {
+		if (perf_pmu__wildcard_match(pmu, wildcard))
+			return pmu;
+	}
+	return NULL;
+}
+
 static struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmu *pmu)
 {
 	bool use_core_pmus = !pmu || pmu->is_core;
diff --git a/tools/perf/util/pmus.h b/tools/perf/util/pmus.h
index 8def20e615ad..2794d8c3a466 100644
--- a/tools/perf/util/pmus.h
+++ b/tools/perf/util/pmus.h
@@ -19,6 +19,8 @@ struct perf_pmu *perf_pmus__find_by_type(unsigned int type);
 
 struct perf_pmu *perf_pmus__scan(struct perf_pmu *pmu);
 struct perf_pmu *perf_pmus__scan_core(struct perf_pmu *pmu);
+struct perf_pmu *perf_pmus__scan_for_event(struct perf_pmu *pmu, const char *event);
+struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmu *pmu, const char *wildcard);
 
 const struct perf_pmu *perf_pmus__pmu_for_pmu_filter(const char *str);
 
-- 
2.50.0.727.gbf7dc18ff4-goog

