Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61221AE72FB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 01:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E2C10E640;
	Tue, 24 Jun 2025 23:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="arKH8ltd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
 [209.85.214.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436AE10E63D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 23:19:07 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-237e6963f70so11960825ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750807146; x=1751411946;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=3nwFWZ0/+3dK9npxKNdbEfqlbp9HoGW45vCO3uch9Ac=;
 b=arKH8ltd97HSVrg5LTZNE700wtiD26Sov1Pkl57UWaYFA2G22AtF6aIbN7WgOwe8Mp
 tK1qiw18vQezBPzpdfYHVaze2dEJ2GvhlhiQfVaGOiwTGhQIZtDKi0CDTadVHfWmBKNp
 H5ENXQYYUI76l4qJ4NDsQRK5YgqIn+Jj3wE06D2AJituOOxC653l9dCg4ufi3AVC9yv6
 eP4oEAZNAdPaP3aJnV2hzn2ZxjoUnSyys1K3cwisOzsQDAkFLGZRuHauIAopaLqMQBd7
 Ux3cSCoNjk+AyelvtENY5ZeQDANqFHpV9KG9CycJlKJjijQtmQSwabK7yq0vfBZefwz2
 6D0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750807146; x=1751411946;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3nwFWZ0/+3dK9npxKNdbEfqlbp9HoGW45vCO3uch9Ac=;
 b=se0Ech4lEDA5bdxaBMVKb5o+84qfhxQLWU59hfvqiSIB9cToZ2aSZyXkmhKIP9Zzcm
 XxVv1E+EQjgdUasTU2bvzMNXZrSR1bffV/FhtJl5Jg41Wg1zeZ8Wv2jLfZm7E9VuzDRh
 EukMVQPmJxAw7CBIHcsvNOrNPtOb6yXuqLRdgJJVHHAk6ojx+Ck8acsktGBztXo1yasy
 xJTzTGDHceZgSmUA5fU8egzDyVv2S/B0pF8ATTrYtLnpKCLPr6f+JRVc2ErHEbthoAvt
 kE2VF8xurQYKh5LwRkjFU6mjWOsnGiUvTERA//ReO/wxfrfn91fgeeL2ONtq1EbpT1f2
 Hq3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt3WOmbVVPG2r/Upxn34qTDcuSsJYRbAbdPqCWkcRmP1hI6uWyhi8anJhFXOWzXxA3JosplM3DAho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMKcooxCoh5fFWrFcxtzETdj2YsUTp2GELO+SrdICh/ER7utQ9
 wKRv/2cz6IkdWGp6i2yv/R8znFBD9T3+kkDNUShLXkMf09DnoDo+6IvSvaY/1y+CYAfF+kTgm+l
 scky4KAod3Q==
X-Google-Smtp-Source: AGHT+IHWOwvLhYykzD+ZJA1i2ggSdf+07569Kz5g+DXPmhbrE5iJHUl3UItVNQ3G63046gvJDJHwRZWQYLcR
X-Received: from plbkg8.prod.google.com ([2002:a17:903:608:b0:223:5693:a4e9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f684:b0:234:c5c1:9b84
 with SMTP id d9443c01a7336-23824050c20mr15632015ad.37.1750807146517; Tue, 24
 Jun 2025 16:19:06 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:18:36 -0700
In-Reply-To: <20250624231837.179536-1-irogers@google.com>
Mime-Version: 1.0
References: <20250624231837.179536-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250624231837.179536-3-irogers@google.com>
Subject: [PATCH v4 2/3] perf drm_pmu: Add a tool like PMU to expose DRM
 information
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
Content-Transfer-Encoding: quoted-printable
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
PMU, similar to the hwmon PMU, that exposes DRM information. For
example on a tigerlake laptop:
```
$ perf list drm

List of pre-defined events (to be used in -e or -M):

drm:
  drm-active-stolen-system0
       [Total memory active in one or more engines. Unit: drm_i915]
  drm-active-system0
       [Total memory active in one or more engines. Unit: drm_i915]
  drm-engine-capacity-video
       [Engine capacity. Unit: drm_i915]
  drm-engine-copy
       [Utilization in ns. Unit: drm_i915]
  drm-engine-render
       [Utilization in ns. Unit: drm_i915]
  drm-engine-video
       [Utilization in ns. Unit: drm_i915]
  drm-engine-video-enhance
       [Utilization in ns. Unit: drm_i915]
  drm-purgeable-stolen-system0
       [Size of resident and purgeable memory bufers. Unit: drm_i915]
  drm-purgeable-system0
       [Size of resident and purgeable memory bufers. Unit: drm_i915]
  drm-resident-stolen-system0
       [Size of resident memory bufers. Unit: drm_i915]
  drm-resident-system0
       [Size of resident memory bufers. Unit: drm_i915]
  drm-shared-stolen-system0
       [Size of shared memory bufers. Unit: drm_i915]
  drm-shared-system0
       [Size of shared memory bufers. Unit: drm_i915]
  drm-total-stolen-system0
       [Size of shared and private memory. Unit: drm_i915]
  drm-total-system0
       [Size of shared and private memory. Unit: drm_i915]
```

System wide data can be gathered:
```
$ perf stat -x, -I 1000 -e drm-active-stolen-system0,drm-active-system0,drm=
-engine-capacity-video,drm-engine-copy,drm-engine-render,drm-engine-video,d=
rm-engine-video-enhance,drm-purgeable-stolen-system0,drm-purgeable-system0,=
drm-resident-stolen-system0,drm-resident-system0,drm-shared-stolen-system0,=
drm-shared-system0,drm-total-stolen-system0,drm-total-system0
1.000904910,0,bytes,drm-active-stolen-system0,1,100.00,,
1.000904910,0,bytes,drm-active-system0,1,100.00,,
1.000904910,36,capacity,drm-engine-capacity-video,1,100.00,,
1.000904910,0,ns,drm-engine-copy,1,100.00,,
1.000904910,1472970566175,ns,drm-engine-render,1,100.00,,
1.000904910,0,ns,drm-engine-video,1,100.00,,
1.000904910,0,ns,drm-engine-video-enhance,1,100.00,,
1.000904910,0,bytes,drm-purgeable-stolen-system0,1,100.00,,
1.000904910,38199296,bytes,drm-purgeable-system0,1,100.00,,
1.000904910,0,bytes,drm-resident-stolen-system0,1,100.00,,
1.000904910,4643196928,bytes,drm-resident-system0,1,100.00,,
1.000904910,0,bytes,drm-shared-stolen-system0,1,100.00,,
1.000904910,1886871552,bytes,drm-shared-system0,1,100.00,,
1.000904910,0,bytes,drm-total-stolen-system0,1,100.00,,
1.000904910,4643196928,bytes,drm-total-system0,1,100.00,,
2.264426839,0,bytes,drm-active-stolen-system0,1,100.00,,
```

Or for a particular process:
```
$ perf stat -x, -I 1000 -e drm-active-stolen-system0,drm-active-system0,drm=
-engine-capacity-video,drm-engine-copy,drm-engine-render,drm-engine-video,d=
rm-engine-video-enhance,drm-purgeable-stolen-system0,drm-purgeable-system0,=
drm-resident-stolen-system0,drm-resident-system0,drm-shared-stolen-system0,=
drm-shared-system0,drm-total-stolen-system0,drm-total-system0 -p 200027
1.001040274,0,bytes,drm-active-stolen-system0,6,100.00,,
1.001040274,0,bytes,drm-active-system0,6,100.00,,
1.001040274,12,capacity,drm-engine-capacity-video,6,100.00,,
1.001040274,0,ns,drm-engine-copy,6,100.00,,
1.001040274,1542300,ns,drm-engine-render,6,100.00,,
1.001040274,0,ns,drm-engine-video,6,100.00,,
1.001040274,0,ns,drm-engine-video-enhance,6,100.00,,
1.001040274,0,bytes,drm-purgeable-stolen-system0,6,100.00,,
1.001040274,13516800,bytes,drm-purgeable-system0,6,100.00,,
1.001040274,0,bytes,drm-resident-stolen-system0,6,100.00,,
1.001040274,27746304,bytes,drm-resident-system0,6,100.00,,
1.001040274,0,bytes,drm-shared-stolen-system0,6,100.00,,
1.001040274,0,bytes,drm-shared-system0,6,100.00,,
1.001040274,0,bytes,drm-total-stolen-system0,6,100.00,,
1.001040274,27746304,bytes,drm-total-system0,6,100.00,,
2.016629075,0,bytes,drm-active-stolen-system0,6,100.00,,
```

As with the hwmon PMU, high numbered PMU types are used to encode
multiple possible "DRM" PMUs. The appropriate fdinfo is found by
scanning /proc and filtering which fdinfos to read with stat. To avoid
some unneeding scanning, events not starting with "drm-" are
ignored. The patch builds on commit 57e13264dcea ("perf pmus:
Restructure pmu_read_sysfs to scan fewer PMUs") and later so that only
if full wild carding is being done, the PMU starts with "drm_" or the
event starts with "drm-" will /proc be scanned. That is there should
be little to no cost in this PMU unless DRM events are requested.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/Build     |   1 +
 tools/perf/util/drm_pmu.c | 686 ++++++++++++++++++++++++++++++++++++++
 tools/perf/util/drm_pmu.h |  39 +++
 tools/perf/util/evsel.c   |   9 +
 tools/perf/util/pmu.c     |  15 +
 tools/perf/util/pmu.h     |   4 +-
 tools/perf/util/pmus.c    |  30 +-
 7 files changed, 779 insertions(+), 5 deletions(-)
 create mode 100644 tools/perf/util/drm_pmu.c
 create mode 100644 tools/perf/util/drm_pmu.h

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 7910d908c814..8a23eb767fb2 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -84,6 +84,7 @@ perf-util-y +=3D pmu.o
 perf-util-y +=3D pmus.o
 perf-util-y +=3D pmu-flex.o
 perf-util-y +=3D pmu-bison.o
+perf-util-y +=3D drm_pmu.o
 perf-util-y +=3D hwmon_pmu.o
 perf-util-y +=3D tool_pmu.o
 perf-util-y +=3D svghelper.o
diff --git a/tools/perf/util/drm_pmu.c b/tools/perf/util/drm_pmu.c
new file mode 100644
index 000000000000..17385a10005b
--- /dev/null
+++ b/tools/perf/util/drm_pmu.c
@@ -0,0 +1,686 @@
+// SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
+#include "drm_pmu.h"
+#include "counts.h"
+#include "cpumap.h"
+#include "debug.h"
+#include "evsel.h"
+#include "pmu.h"
+#include <perf/threadmap.h>
+#include <api/fs/fs.h>
+#include <api/io.h>
+#include <ctype.h>
+#include <dirent.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <linux/unistd.h>
+#include <linux/kcmp.h>
+#include <linux/zalloc.h>
+#include <sys/stat.h>
+#include <sys/syscall.h>
+#include <sys/sysmacros.h>
+#include <sys/types.h>
+
+enum drm_pmu_unit {
+	DRM_PMU_UNIT_BYTES,
+	DRM_PMU_UNIT_CAPACITY,
+	DRM_PMU_UNIT_CYCLES,
+	DRM_PMU_UNIT_HZ,
+	DRM_PMU_UNIT_NS,
+
+	DRM_PMU_UNIT_MAX,
+};
+
+struct drm_pmu_event {
+	const char *name;
+	const char *desc;
+	enum drm_pmu_unit unit;
+};
+
+struct drm_pmu {
+	struct perf_pmu pmu;
+	struct drm_pmu_event *events;
+	int num_events;
+};
+
+static const char * const drm_pmu_unit_strs[DRM_PMU_UNIT_MAX] =3D {
+	"bytes",
+	"capacity",
+	"cycles",
+	"hz",
+	"ns",
+};
+
+static const char * const drm_pmu_scale_unit_strs[DRM_PMU_UNIT_MAX] =3D {
+	"1bytes",
+	"1capacity",
+	"1cycles",
+	"1hz",
+	"1ns",
+};
+
+bool perf_pmu__is_drm(const struct perf_pmu *pmu)
+{
+	return pmu && pmu->type >=3D PERF_PMU_TYPE_DRM_START &&
+		pmu->type <=3D PERF_PMU_TYPE_DRM_END;
+}
+
+bool evsel__is_drm(const struct evsel *evsel)
+{
+	return perf_pmu__is_drm(evsel->pmu);
+}
+
+static struct drm_pmu *add_drm_pmu(struct list_head *pmus, char *line, siz=
e_t line_len)
+{
+	struct drm_pmu *drm;
+	struct perf_pmu *pmu;
+	const char *name;
+	__u32 max_drm_pmu_type =3D 0, type;
+	int i =3D 12;
+
+	if (line[line_len - 1] =3D=3D '\n')
+		line[line_len - 1] =3D '\0';
+	while (isspace(line[i]))
+		i++;
+
+	line[--i] =3D '_';
+	line[--i] =3D 'm';
+	line[--i] =3D 'r';
+	line[--i] =3D 'd';
+	name =3D &line[i];
+
+	list_for_each_entry(pmu, pmus, list) {
+		if (!perf_pmu__is_drm(pmu))
+			continue;
+		if (pmu->type > max_drm_pmu_type)
+			max_drm_pmu_type =3D pmu->type;
+		if (!strcmp(pmu->name, name)) {
+			/* PMU already exists. */
+			return NULL;
+		}
+	}
+
+	if (max_drm_pmu_type !=3D 0)
+		type =3D max_drm_pmu_type + 1;
+	else
+		type =3D PERF_PMU_TYPE_DRM_START;
+
+	if (type > PERF_PMU_TYPE_DRM_END) {
+		zfree(&drm);
+		pr_err("Unable to encode DRM PMU type for %s\n", name);
+		return NULL;
+	}
+
+	drm =3D zalloc(sizeof(*drm));
+	if (!drm)
+		return NULL;
+
+	if (perf_pmu__init(&drm->pmu, type, name) !=3D 0) {
+		perf_pmu__delete(&drm->pmu);
+		return NULL;
+	}
+
+	drm->pmu.cpus =3D perf_cpu_map__new("0");
+	if (!drm->pmu.cpus) {
+		perf_pmu__delete(&drm->pmu);
+		return NULL;
+	}
+	return drm;
+}
+
+
+static bool starts_with(const char *str, const char *prefix)
+{
+	return !strncmp(prefix, str, strlen(prefix));
+}
+
+static int add_event(struct drm_pmu_event **events, int *num_events,
+		     const char *line, enum drm_pmu_unit unit, const char *desc)
+{
+	const char *colon =3D strchr(line, ':');
+	struct drm_pmu_event *tmp;
+
+	if (!colon)
+		return -EINVAL;
+
+	tmp =3D reallocarray(*events, *num_events + 1, sizeof(struct drm_pmu_even=
t));
+	if (!tmp)
+		return -ENOMEM;
+	tmp[*num_events].unit =3D unit;
+	tmp[*num_events].desc =3D desc;
+	tmp[*num_events].name =3D strndup(line, colon - line);
+	if (!tmp[*num_events].name)
+		return -ENOMEM;
+	(*num_events)++;
+	*events =3D tmp;
+	return 0;
+}
+
+static int read_drm_pmus_cb(void *args, int fdinfo_dir_fd, const char *fd_=
name)
+{
+	struct list_head *pmus =3D args;
+	char buf[640];
+	struct io io;
+	char *line =3D NULL;
+	size_t line_len;
+	struct drm_pmu *drm =3D NULL;
+	struct drm_pmu_event *events =3D NULL;
+	int num_events =3D 0;
+
+	io__init(&io, openat(fdinfo_dir_fd, fd_name, O_RDONLY), buf, sizeof(buf))=
;
+	if (io.fd =3D=3D -1) {
+		/* Failed to open file, ignore. */
+		return 0;
+	}
+
+	while (io__getline(&io, &line, &line_len) > 0) {
+		if (starts_with(line, "drm-driver:")) {
+			drm =3D add_drm_pmu(pmus, line, line_len);
+			if (!drm)
+				break;
+			continue;
+		}
+		/*
+		 * Note the string matching below is alphabetical, with more
+		 * specific matches appearing before less specific.
+		 */
+		if (starts_with(line, "drm-active-")) {
+			add_event(&events, &num_events, line, DRM_PMU_UNIT_BYTES,
+				  "Total memory active in one or more engines");
+			continue;
+		}
+		if (starts_with(line, "drm-cycles-")) {
+			add_event(&events, &num_events, line, DRM_PMU_UNIT_CYCLES,
+				"Busy cycles");
+			continue;
+		}
+		if (starts_with(line, "drm-engine-capacity-")) {
+			add_event(&events, &num_events, line, DRM_PMU_UNIT_CAPACITY,
+				"Engine capacity");
+			continue;
+		}
+		if (starts_with(line, "drm-engine-")) {
+			add_event(&events, &num_events, line, DRM_PMU_UNIT_NS,
+				  "Utilization in ns");
+			continue;
+		}
+		if (starts_with(line, "drm-maxfreq-")) {
+			add_event(&events, &num_events, line, DRM_PMU_UNIT_HZ,
+				  "Maximum frequency");
+			continue;
+		}
+		if (starts_with(line, "drm-purgeable-")) {
+			add_event(&events, &num_events, line, DRM_PMU_UNIT_BYTES,
+				  "Size of resident and purgeable memory bufers");
+			continue;
+		}
+		if (starts_with(line, "drm-resident-")) {
+			add_event(&events, &num_events, line, DRM_PMU_UNIT_BYTES,
+				  "Size of resident memory bufers");
+			continue;
+		}
+		if (starts_with(line, "drm-shared-")) {
+			add_event(&events, &num_events, line, DRM_PMU_UNIT_BYTES,
+				  "Size of shared memory bufers");
+			continue;
+		}
+		if (starts_with(line, "drm-total-cycles-")) {
+			add_event(&events, &num_events, line, DRM_PMU_UNIT_BYTES,
+				  "Total busy cycles");
+			continue;
+		}
+		if (starts_with(line, "drm-total-")) {
+			add_event(&events, &num_events, line, DRM_PMU_UNIT_BYTES,
+				  "Size of shared and private memory");
+			continue;
+		}
+		if (verbose > 1 && starts_with(line, "drm-") &&
+		    !starts_with(line, "drm-client-id:") &&
+		    !starts_with(line, "drm-pdev:"))
+			pr_debug("Unhandled DRM PMU fdinfo line match '%s'\n", line);
+	}
+	if (drm) {
+		drm->events =3D events;
+		drm->num_events =3D num_events;
+		list_add_tail(&drm->pmu.list, pmus);
+	}
+	free(line);
+	if (io.fd !=3D -1)
+		close(io.fd);
+	return 0;
+}
+
+void drm_pmu__exit(struct perf_pmu *pmu)
+{
+	struct drm_pmu *drm =3D container_of(pmu, struct drm_pmu, pmu);
+
+	free(drm->events);
+}
+
+bool drm_pmu__have_event(const struct perf_pmu *pmu, const char *name)
+{
+	struct drm_pmu *drm =3D container_of(pmu, struct drm_pmu, pmu);
+
+	if (!starts_with(name, "drm-"))
+		return false;
+
+	for (int i =3D 0; i < drm->num_events; i++) {
+		if (!strcasecmp(drm->events[i].name, name))
+			return true;
+	}
+	return false;
+}
+
+int drm_pmu__for_each_event(const struct perf_pmu *pmu, void *state, pmu_e=
vent_callback cb)
+{
+	struct drm_pmu *drm =3D container_of(pmu, struct drm_pmu, pmu);
+
+	for (int i =3D 0; i < drm->num_events; i++) {
+		char encoding_buf[128];
+		struct pmu_event_info info =3D {
+			.pmu =3D pmu,
+			.name =3D drm->events[i].name,
+			.alias =3D NULL,
+			.scale_unit =3D drm_pmu_scale_unit_strs[drm->events[i].unit],
+			.desc =3D drm->events[i].desc,
+			.long_desc =3D NULL,
+			.encoding_desc =3D encoding_buf,
+			.topic =3D "drm",
+			.pmu_name =3D pmu->name,
+			.event_type_desc =3D "DRM event",
+		};
+		int ret;
+
+		snprintf(encoding_buf, sizeof(encoding_buf), "%s/config=3D0x%x/", pmu->n=
ame, i);
+
+		ret =3D cb(state, &info);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+size_t drm_pmu__num_events(const struct perf_pmu *pmu)
+{
+	const struct drm_pmu *drm =3D container_of(pmu, struct drm_pmu, pmu);
+
+	return drm->num_events;
+}
+
+static int drm_pmu__index_for_event(const struct drm_pmu *drm, const char =
*name)
+{
+	for (int i =3D 0; i < drm->num_events; i++) {
+		if (!strcmp(drm->events[i].name, name))
+			return i;
+	}
+	return -1;
+}
+
+static int drm_pmu__config_term(const struct drm_pmu *drm,
+				  struct perf_event_attr *attr,
+				  struct parse_events_term *term,
+				  struct parse_events_error *err)
+{
+	if (term->type_term =3D=3D PARSE_EVENTS__TERM_TYPE_USER) {
+		int i =3D drm_pmu__index_for_event(drm, term->config);
+
+		if (i >=3D 0) {
+			attr->config =3D i;
+			return 0;
+		}
+	}
+	if (err) {
+		char *err_str;
+
+		parse_events_error__handle(err, term->err_val,
+					asprintf(&err_str,
+						"unexpected drm event term (%s) %s",
+						parse_events__term_type_str(term->type_term),
+						term->config) < 0
+					? strdup("unexpected drm event term")
+					: err_str,
+					NULL);
+	}
+	return -EINVAL;
+}
+
+int drm_pmu__config_terms(const struct perf_pmu *pmu,
+			    struct perf_event_attr *attr,
+			    struct parse_events_terms *terms,
+			    struct parse_events_error *err)
+{
+	struct drm_pmu *drm =3D container_of(pmu, struct drm_pmu, pmu);
+	struct parse_events_term *term;
+
+	list_for_each_entry(term, &terms->terms, list) {
+		if (drm_pmu__config_term(drm, attr, term, err))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+int drm_pmu__check_alias(const struct perf_pmu *pmu, struct parse_events_t=
erms *terms,
+			 struct perf_pmu_info *info, struct parse_events_error *err)
+{
+	struct drm_pmu *drm =3D container_of(pmu, struct drm_pmu, pmu);
+	struct parse_events_term *term =3D
+		list_first_entry(&terms->terms, struct parse_events_term, list);
+
+	if (term->type_term =3D=3D PARSE_EVENTS__TERM_TYPE_USER) {
+		int i =3D drm_pmu__index_for_event(drm, term->config);
+
+		if (i >=3D 0) {
+			info->unit =3D drm_pmu_unit_strs[drm->events[i].unit];
+			info->scale =3D 1;
+			return 0;
+		}
+	}
+	if (err) {
+		char *err_str;
+
+		parse_events_error__handle(err, term->err_val,
+					asprintf(&err_str,
+						"unexpected drm event term (%s) %s",
+						parse_events__term_type_str(term->type_term),
+						term->config) < 0
+					? strdup("unexpected drm event term")
+					: err_str,
+					NULL);
+	}
+	return -EINVAL;
+}
+
+struct minor_info {
+	unsigned int *minors;
+	int minors_num, minors_len;
+};
+
+static int for_each_drm_fdinfo_in_dir(int (*cb)(void *args, int fdinfo_dir=
_fd, const char *fd_name),
+				      void *args, int proc_dir, const char *pid_name,
+				      struct minor_info *minors)
+{
+	char buf[256];
+	DIR *fd_dir;
+	struct dirent *fd_entry;
+	int fd_dir_fd, fdinfo_dir_fd =3D -1;
+
+
+	scnprintf(buf, sizeof(buf), "%s/fd", pid_name);
+	fd_dir_fd =3D openat(proc_dir, buf, O_DIRECTORY);
+	if (fd_dir_fd =3D=3D -1)
+		return 0; /* Presumably lost race to open. */
+	fd_dir =3D fdopendir(fd_dir_fd);
+	if (!fd_dir) {
+		close(fd_dir_fd);
+		return -ENOMEM;
+	}
+	while ((fd_entry =3D readdir(fd_dir)) !=3D NULL) {
+		struct stat stat;
+		unsigned int minor;
+		bool is_dup =3D false;
+		int ret;
+
+		if (fd_entry->d_type !=3D DT_LNK)
+			continue;
+
+		if (fstatat(fd_dir_fd, fd_entry->d_name, &stat, 0) !=3D 0)
+			continue;
+
+		if ((stat.st_mode & S_IFMT) !=3D S_IFCHR || major(stat.st_rdev) !=3D 226=
)
+			continue;
+
+		minor =3D minor(stat.st_rdev);
+		for (int i =3D 0; i < minors->minors_num; i++) {
+			if (minor(stat.st_rdev) =3D=3D minors->minors[i]) {
+				is_dup =3D true;
+				break;
+			}
+		}
+		if (is_dup)
+			continue;
+
+		if (minors->minors_num =3D=3D minors->minors_len) {
+			unsigned int *tmp =3D reallocarray(minors->minors, minors->minors_len +=
 4,
+							 sizeof(unsigned int));
+
+			if (tmp) {
+				minors->minors =3D tmp;
+				minors->minors_len +=3D 4;
+			}
+		}
+		minors->minors[minors->minors_num++] =3D minor;
+		if (fdinfo_dir_fd =3D=3D -1) {
+			/* Open fdinfo dir if we have a DRM fd. */
+			scnprintf(buf, sizeof(buf), "%s/fdinfo", pid_name);
+			fdinfo_dir_fd =3D openat(proc_dir, buf, O_DIRECTORY);
+			if (fdinfo_dir_fd =3D=3D -1)
+				continue;
+		}
+		ret =3D cb(args, fdinfo_dir_fd, fd_entry->d_name);
+		if (ret)
+			return ret;
+	}
+	if (fdinfo_dir_fd !=3D -1)
+		close(fdinfo_dir_fd);
+	closedir(fd_dir);
+	return 0;
+}
+
+static int for_each_drm_fdinfo(bool skip_all_duplicates,
+			       int (*cb)(void *args, int fdinfo_dir_fd, const char *fd_name),
+			       void *args)
+{
+	DIR *proc_dir;
+	struct dirent *proc_entry;
+	int ret;
+	/*
+	 * minors maintains an array of DRM minor device numbers seen for a pid,
+	 * or for all pids if skip_all_duplicates is true, so that duplicates
+	 * are ignored.
+	 */
+	struct minor_info minors =3D {
+		.minors =3D NULL,
+		.minors_num =3D 0,
+		.minors_len =3D 0,
+	};
+
+	proc_dir =3D opendir(procfs__mountpoint());
+	if (!proc_dir)
+		return 0;
+
+	/* Walk through the /proc directory. */
+	while ((proc_entry =3D readdir(proc_dir)) !=3D NULL) {
+		if (proc_entry->d_type !=3D DT_DIR ||
+		    !isdigit(proc_entry->d_name[0]))
+			continue;
+		if (!skip_all_duplicates) {
+			/* Reset the seen minor numbers for each pid. */
+			minors.minors_num =3D 0;
+		}
+		ret =3D for_each_drm_fdinfo_in_dir(cb, args,
+						 dirfd(proc_dir), proc_entry->d_name,
+						 &minors);
+		if (ret)
+			break;
+	}
+	free(minors.minors);
+	closedir(proc_dir);
+	return ret;
+}
+
+int perf_pmus__read_drm_pmus(struct list_head *pmus)
+{
+	return for_each_drm_fdinfo(/*skip_all_duplicates=3D*/true, read_drm_pmus_=
cb, pmus);
+}
+
+int evsel__drm_pmu_open(struct evsel *evsel,
+			struct perf_thread_map *threads,
+			int start_cpu_map_idx, int end_cpu_map_idx)
+{
+	(void)evsel;
+	(void)threads;
+	(void)start_cpu_map_idx;
+	(void)end_cpu_map_idx;
+	return 0;
+}
+
+static uint64_t read_count_and_apply_unit(const char *count_and_unit, enum=
 drm_pmu_unit unit)
+{
+	char *unit_ptr =3D NULL;
+	uint64_t count =3D strtoul(count_and_unit, &unit_ptr, 10);
+
+	if (!unit_ptr)
+		return 0;
+
+	while (isblank(*unit_ptr))
+		unit_ptr++;
+
+	switch (unit) {
+	case DRM_PMU_UNIT_BYTES:
+		if (*unit_ptr =3D=3D '\0')
+			assert(count =3D=3D 0); /* Generally undocumented, happens for 0. */
+		else if (!strcmp(unit_ptr, "KiB"))
+			count *=3D 1024;
+		else if (!strcmp(unit_ptr, "MiB"))
+			count *=3D 1024 * 1024;
+		else
+			pr_err("Unexpected bytes unit '%s'\n", unit_ptr);
+		break;
+	case DRM_PMU_UNIT_CAPACITY:
+		/* No units expected. */
+		break;
+	case DRM_PMU_UNIT_CYCLES:
+		/* No units expected. */
+		break;
+	case DRM_PMU_UNIT_HZ:
+		if (!strcmp(unit_ptr, "Hz"))
+			count *=3D 1;
+		else if (!strcmp(unit_ptr, "KHz"))
+			count *=3D 1000;
+		else if (!strcmp(unit_ptr, "MHz"))
+			count *=3D 1000000;
+		else
+			pr_err("Unexpected hz unit '%s'\n", unit_ptr);
+		break;
+	case DRM_PMU_UNIT_NS:
+		/* Only unit ns expected. */
+		break;
+	case DRM_PMU_UNIT_MAX:
+	default:
+		break;
+	}
+	return count;
+}
+
+static uint64_t read_drm_event(int fdinfo_dir_fd, const char *fd_name,
+			       const char *match, enum drm_pmu_unit unit)
+{
+	char buf[640];
+	struct io io;
+	char *line =3D NULL;
+	size_t line_len;
+	uint64_t count =3D 0;
+
+	io__init(&io, openat(fdinfo_dir_fd, fd_name, O_RDONLY), buf, sizeof(buf))=
;
+	if (io.fd =3D=3D -1) {
+		/* Failed to open file, ignore. */
+		return 0;
+	}
+	while (io__getline(&io, &line, &line_len) > 0) {
+		size_t i =3D strlen(match);
+
+		if (strncmp(line, match, i))
+			continue;
+		if (line[i] !=3D ':')
+			continue;
+		while (isblank(line[++i]))
+			;
+		if (line[line_len - 1] =3D=3D '\n')
+			line[line_len - 1] =3D '\0';
+		count =3D read_count_and_apply_unit(&line[i], unit);
+		break;
+	}
+	free(line);
+	close(io.fd);
+	return count;
+}
+
+struct read_drm_event_cb_args {
+	const char *match;
+	uint64_t count;
+	enum drm_pmu_unit unit;
+};
+
+static int read_drm_event_cb(void *vargs, int fdinfo_dir_fd, const char *f=
d_name)
+{
+	struct read_drm_event_cb_args *args =3D vargs;
+
+	args->count +=3D read_drm_event(fdinfo_dir_fd, fd_name, args->match, args=
->unit);
+	return 0;
+}
+
+static uint64_t drm_pmu__read_system_wide(struct drm_pmu *drm, struct evse=
l *evsel)
+{
+	struct read_drm_event_cb_args args =3D {
+		.count =3D 0,
+		.match =3D drm->events[evsel->core.attr.config].name,
+		.unit =3D drm->events[evsel->core.attr.config].unit,
+	};
+
+	for_each_drm_fdinfo(/*skip_all_duplicates=3D*/false, read_drm_event_cb, &=
args);
+	return args.count;
+}
+
+static uint64_t drm_pmu__read_for_pid(struct drm_pmu *drm, struct evsel *e=
vsel, int pid)
+{
+	struct read_drm_event_cb_args args =3D {
+		.count =3D 0,
+		.match =3D drm->events[evsel->core.attr.config].name,
+		.unit =3D drm->events[evsel->core.attr.config].unit,
+	};
+	struct minor_info minors =3D {
+		.minors =3D NULL,
+		.minors_num =3D 0,
+		.minors_len =3D 0,
+	};
+	int proc_dir =3D open(procfs__mountpoint(), O_DIRECTORY);
+	char pid_name[12];
+	int ret;
+
+	if (proc_dir < 0)
+		return 0;
+
+	snprintf(pid_name, sizeof(pid_name), "%d", pid);
+	ret =3D for_each_drm_fdinfo_in_dir(read_drm_event_cb, &args, proc_dir, pi=
d_name, &minors);
+	free(minors.minors);
+	close(proc_dir);
+	return ret =3D=3D 0 ? args.count : 0;
+}
+
+int evsel__drm_pmu_read(struct evsel *evsel, int cpu_map_idx, int thread)
+{
+	struct drm_pmu *drm =3D container_of(evsel->pmu, struct drm_pmu, pmu);
+	struct perf_counts_values *count, *old_count =3D NULL;
+	int pid =3D perf_thread_map__pid(evsel->core.threads, thread);
+	uint64_t counter;
+
+	if (pid !=3D -1)
+		counter =3D drm_pmu__read_for_pid(drm, evsel, pid);
+	else
+		counter =3D drm_pmu__read_system_wide(drm, evsel);
+
+	if (evsel->prev_raw_counts)
+		old_count =3D perf_counts(evsel->prev_raw_counts, cpu_map_idx, thread);
+
+	count =3D perf_counts(evsel->counts, cpu_map_idx, thread);
+	if (old_count) {
+		count->val =3D old_count->val + counter;
+		count->run =3D old_count->run + 1;
+		count->ena =3D old_count->ena + 1;
+	} else {
+		count->val =3D counter;
+		count->run++;
+		count->ena++;
+	}
+	return 0;
+}
diff --git a/tools/perf/util/drm_pmu.h b/tools/perf/util/drm_pmu.h
new file mode 100644
index 000000000000..e7f366fca8a4
--- /dev/null
+++ b/tools/perf/util/drm_pmu.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause) */
+#ifndef __DRM_PMU_H
+#define __DRM_PMU_H
+/*
+ * Linux DRM clients expose information through usage stats as documented =
in
+ * Documentation/gpu/drm-usage-stats.rst (available online at
+ * https://docs.kernel.org/gpu/drm-usage-stats.html). This is a tool like =
PMU
+ * that exposes DRM information.
+ */
+
+#include "pmu.h"
+#include <stdbool.h>
+
+struct list_head;
+struct perf_thread_map;
+
+void drm_pmu__exit(struct perf_pmu *pmu);
+bool drm_pmu__have_event(const struct perf_pmu *pmu, const char *name);
+int drm_pmu__for_each_event(const struct perf_pmu *pmu, void *state, pmu_e=
vent_callback cb);
+size_t drm_pmu__num_events(const struct perf_pmu *pmu);
+int drm_pmu__config_terms(const struct perf_pmu *pmu,
+			  struct perf_event_attr *attr,
+			  struct parse_events_terms *terms,
+			  struct parse_events_error *err);
+int drm_pmu__check_alias(const struct perf_pmu *pmu, struct parse_events_t=
erms *terms,
+			 struct perf_pmu_info *info, struct parse_events_error *err);
+
+
+bool perf_pmu__is_drm(const struct perf_pmu *pmu);
+bool evsel__is_drm(const struct evsel *evsel);
+
+int perf_pmus__read_drm_pmus(struct list_head *pmus);
+
+int evsel__drm_pmu_open(struct evsel *evsel,
+			struct perf_thread_map *threads,
+			int start_cpu_map_idx, int end_cpu_map_idx);
+int evsel__drm_pmu_read(struct evsel *evsel, int cpu_map_idx, int thread);
+
+#endif /* __DRM_PMU_H */
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index d55482f094bf..9c50c3960487 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -56,6 +56,7 @@
 #include "off_cpu.h"
 #include "pmu.h"
 #include "pmus.h"
+#include "drm_pmu.h"
 #include "hwmon_pmu.h"
 #include "tool_pmu.h"
 #include "rlimit.h"
@@ -1889,6 +1890,9 @@ int evsel__read_counter(struct evsel *evsel, int cpu_=
map_idx, int thread)
 	if (evsel__is_hwmon(evsel))
 		return evsel__hwmon_pmu_read(evsel, cpu_map_idx, thread);
=20
+	if (evsel__is_drm(evsel))
+		return evsel__drm_pmu_read(evsel, cpu_map_idx, thread);
+
 	if (evsel__is_retire_lat(evsel))
 		return evsel__tpebs_read(evsel, cpu_map_idx, thread);
=20
@@ -2610,6 +2614,11 @@ static int evsel__open_cpu(struct evsel *evsel, stru=
ct perf_cpu_map *cpus,
 					     start_cpu_map_idx,
 					     end_cpu_map_idx);
 	}
+	if (evsel__is_drm(evsel)) {
+		return evsel__drm_pmu_open(evsel, threads,
+					   start_cpu_map_idx,
+					   end_cpu_map_idx);
+	}
=20
 	for (idx =3D start_cpu_map_idx; idx < end_cpu_map_idx; idx++) {
 		cpu =3D perf_cpu_map__cpu(cpus, idx);
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 609828513f6c..f795883c233f 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -20,6 +20,7 @@
 #include "debug.h"
 #include "evsel.h"
 #include "pmu.h"
+#include "drm_pmu.h"
 #include "hwmon_pmu.h"
 #include "pmus.h"
 #include "tool_pmu.h"
@@ -1627,6 +1628,8 @@ int perf_pmu__config_terms(const struct perf_pmu *pmu=
,
=20
 	if (perf_pmu__is_hwmon(pmu))
 		return hwmon_pmu__config_terms(pmu, attr, terms, err);
+	if (perf_pmu__is_drm(pmu))
+		return drm_pmu__config_terms(pmu, attr, terms, err);
=20
 	list_for_each_entry(term, &terms->terms, list) {
 		if (pmu_config_term(pmu, attr, term, terms, zero, apply_hardcoded, err))
@@ -1767,6 +1770,10 @@ int perf_pmu__check_alias(struct perf_pmu *pmu, stru=
ct parse_events_terms *head_
 		ret =3D hwmon_pmu__check_alias(head_terms, info, err);
 		goto out;
 	}
+	if (perf_pmu__is_drm(pmu)) {
+		ret =3D drm_pmu__check_alias(pmu, head_terms, info, err);
+		goto out;
+	}
=20
 	/* Fake PMU doesn't rewrite terms. */
 	if (perf_pmu__is_fake(pmu))
@@ -1949,6 +1956,8 @@ bool perf_pmu__have_event(struct perf_pmu *pmu, const=
 char *name)
 		return false;
 	if (perf_pmu__is_hwmon(pmu))
 		return hwmon_pmu__have_event(pmu, name);
+	if (perf_pmu__is_drm(pmu))
+		return drm_pmu__have_event(pmu, name);
 	if (perf_pmu__find_alias(pmu, name, /*load=3D*/ true) !=3D NULL)
 		return true;
 	if (pmu->cpu_aliases_added || !pmu->events_table)
@@ -1962,6 +1971,8 @@ size_t perf_pmu__num_events(struct perf_pmu *pmu)
=20
 	if (perf_pmu__is_hwmon(pmu))
 		return hwmon_pmu__num_events(pmu);
+	if (perf_pmu__is_drm(pmu))
+		return drm_pmu__num_events(pmu);
=20
 	pmu_aliases_parse(pmu);
 	nr =3D pmu->sysfs_aliases + pmu->sys_json_aliases;
@@ -2030,6 +2041,8 @@ int perf_pmu__for_each_event(struct perf_pmu *pmu, bo=
ol skip_duplicate_pmus,
=20
 	if (perf_pmu__is_hwmon(pmu))
 		return hwmon_pmu__for_each_event(pmu, state, cb);
+	if (perf_pmu__is_drm(pmu))
+		return drm_pmu__for_each_event(pmu, state, cb);
=20
 	strbuf_init(&sb, /*hint=3D*/ 0);
 	pmu_aliases_parse(pmu);
@@ -2511,6 +2524,8 @@ void perf_pmu__delete(struct perf_pmu *pmu)
=20
 	if (perf_pmu__is_hwmon(pmu))
 		hwmon_pmu__exit(pmu);
+	else if (perf_pmu__is_drm(pmu))
+		drm_pmu__exit(pmu);
=20
 	perf_pmu__del_formats(&pmu->format);
 	perf_pmu__del_aliases(pmu);
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 71b8636fd07d..a4a08192154c 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -39,7 +39,9 @@ struct perf_pmu_caps {
=20
 enum {
 	PERF_PMU_TYPE_PE_START    =3D 0,
-	PERF_PMU_TYPE_PE_END      =3D 0xFFFEFFFF,
+	PERF_PMU_TYPE_PE_END      =3D 0xFFFDFFFF,
+	PERF_PMU_TYPE_DRM_START   =3D 0xFFFE0000,
+	PERF_PMU_TYPE_DRM_END     =3D 0xFFFEFFFF,
 	PERF_PMU_TYPE_HWMON_START =3D 0xFFFF0000,
 	PERF_PMU_TYPE_HWMON_END   =3D 0xFFFFFFFD,
 	PERF_PMU_TYPE_TOOL =3D 0xFFFFFFFE,
diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index e0094f56b8e7..81c2ed689db2 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -12,6 +12,7 @@
 #include <unistd.h>
 #include "cpumap.h"
 #include "debug.h"
+#include "drm_pmu.h"
 #include "evsel.h"
 #include "pmus.h"
 #include "pmu.h"
@@ -43,16 +44,19 @@ enum perf_tool_pmu_type {
 	PERF_TOOL_PMU_TYPE_PE_OTHER,
 	PERF_TOOL_PMU_TYPE_TOOL,
 	PERF_TOOL_PMU_TYPE_HWMON,
+	PERF_TOOL_PMU_TYPE_DRM,
=20
 #define PERF_TOOL_PMU_TYPE_PE_CORE_MASK (1 << PERF_TOOL_PMU_TYPE_PE_CORE)
 #define PERF_TOOL_PMU_TYPE_PE_OTHER_MASK (1 << PERF_TOOL_PMU_TYPE_PE_OTHER=
)
 #define PERF_TOOL_PMU_TYPE_TOOL_MASK (1 << PERF_TOOL_PMU_TYPE_TOOL)
 #define PERF_TOOL_PMU_TYPE_HWMON_MASK (1 << PERF_TOOL_PMU_TYPE_HWMON)
+#define PERF_TOOL_PMU_TYPE_DRM_MASK (1 << PERF_TOOL_PMU_TYPE_DRM)
=20
 #define PERF_TOOL_PMU_TYPE_ALL_MASK (PERF_TOOL_PMU_TYPE_PE_CORE_MASK |	\
 					PERF_TOOL_PMU_TYPE_PE_OTHER_MASK | \
 					PERF_TOOL_PMU_TYPE_TOOL_MASK |	\
-					PERF_TOOL_PMU_TYPE_HWMON_MASK)
+					PERF_TOOL_PMU_TYPE_HWMON_MASK | \
+					PERF_TOOL_PMU_TYPE_DRM_MASK)
 };
 static unsigned int read_pmu_types;
=20
@@ -173,6 +177,8 @@ struct perf_pmu *perf_pmus__find(const char *name)
 	/* Looking up an individual perf event PMU failed, check if a tool PMU sh=
ould be read. */
 	if (!strncmp(name, "hwmon_", 6))
 		to_read_pmus |=3D PERF_TOOL_PMU_TYPE_HWMON_MASK;
+	else if (!strncmp(name, "drm_", 4))
+		to_read_pmus |=3D PERF_TOOL_PMU_TYPE_DRM_MASK;
 	else if (!strcmp(name, "tool"))
 		to_read_pmus |=3D PERF_TOOL_PMU_TYPE_TOOL_MASK;
=20
@@ -273,6 +279,10 @@ static void pmu_read_sysfs(unsigned int to_read_types)
 	    (read_pmu_types & PERF_TOOL_PMU_TYPE_HWMON_MASK) =3D=3D 0)
 		perf_pmus__read_hwmon_pmus(&other_pmus);
=20
+	if ((to_read_types & PERF_TOOL_PMU_TYPE_DRM_MASK) !=3D 0 &&
+	    (read_pmu_types & PERF_TOOL_PMU_TYPE_DRM_MASK) =3D=3D 0)
+		perf_pmus__read_drm_pmus(&other_pmus);
+
 	list_sort(NULL, &other_pmus, pmus_cmp);
=20
 	read_pmu_types |=3D to_read_types;
@@ -305,6 +315,8 @@ struct perf_pmu *perf_pmus__find_by_type(unsigned int t=
ype)
 	if (type >=3D PERF_PMU_TYPE_PE_START && type <=3D PERF_PMU_TYPE_PE_END) {
 		to_read_pmus =3D PERF_TOOL_PMU_TYPE_PE_CORE_MASK |
 			PERF_TOOL_PMU_TYPE_PE_OTHER_MASK;
+	} else if (type >=3D PERF_PMU_TYPE_DRM_START && type <=3D PERF_PMU_TYPE_D=
RM_END) {
+		to_read_pmus =3D PERF_TOOL_PMU_TYPE_DRM_MASK;
 	} else if (type >=3D PERF_PMU_TYPE_HWMON_START && type <=3D PERF_PMU_TYPE=
_HWMON_END) {
 		to_read_pmus =3D PERF_TOOL_PMU_TYPE_HWMON_MASK;
 	} else {
@@ -371,6 +383,10 @@ struct perf_pmu *perf_pmus__scan_for_event(struct perf=
_pmu *pmu, const char *eve
 		if (parse_hwmon_filename(event, &type, &number, /*item=3D*/NULL, /*alarm=
=3D*/NULL))
 			to_read_pmus |=3D PERF_TOOL_PMU_TYPE_HWMON_MASK;
=20
+		/* Could the event be a DRM event? */
+		if (strlen(event) > 4 && strncmp("drm-", event, 4) =3D=3D 0)
+			to_read_pmus |=3D PERF_TOOL_PMU_TYPE_DRM_MASK;
+
 		pmu_read_sysfs(to_read_pmus);
 		pmu =3D list_prepare_entry(pmu, &core_pmus, list);
 	}
@@ -403,11 +419,17 @@ struct perf_pmu *perf_pmus__scan_matching_wildcard(st=
ruct perf_pmu *pmu, const c
 		 * Hwmon PMUs have an alias from a sysfs name like hwmon0,
 		 * hwmon1, etc. or have a name of hwmon_<name>. They therefore
 		 * can only have a wildcard match if the wildcard begins with
-		 * "hwmon".
+		 * "hwmon". Similarly drm PMUs must start "drm_", avoid reading
+		 * such events unless the PMU could match.
 		 */
-		if (strisglob(wildcard) ||
-		    (strlen(wildcard) >=3D 5 && strncmp("hwmon", wildcard, 5) =3D=3D 0))
+		if (strisglob(wildcard)) {
+			to_read_pmus |=3D PERF_TOOL_PMU_TYPE_HWMON_MASK |
+				PERF_TOOL_PMU_TYPE_DRM_MASK;
+		} else if (strlen(wildcard) >=3D 4 && strncmp("drm_", wildcard, 4) =3D=
=3D 0) {
+			to_read_pmus |=3D PERF_TOOL_PMU_TYPE_DRM_MASK;
+		} else if (strlen(wildcard) >=3D 5 && strncmp("hwmon", wildcard, 5) =3D=
=3D 0) {
 			to_read_pmus |=3D PERF_TOOL_PMU_TYPE_HWMON_MASK;
+		}
=20
 		pmu_read_sysfs(to_read_pmus);
 		pmu =3D list_prepare_entry(pmu, &core_pmus, list);
--=20
2.50.0.727.gbf7dc18ff4-goog

