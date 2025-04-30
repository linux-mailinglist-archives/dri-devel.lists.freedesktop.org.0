Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C088AA5012
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 17:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B7510E0FD;
	Wed, 30 Apr 2025 15:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WN9tW1Yy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A059C10E0FD
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 15:22:11 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3d44cb27ef4so190115ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746026531; x=1746631331;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=93eCSnL7YqqbeGNknrrinPW0I2Te+1gugq/NSOoUJBI=;
 b=WN9tW1Yyl+WPOL+v4sWO9ruatYBSvJx+UNrwR2IbXLetc6Il9jTYywwvZiY4UUVOJK
 b1qGz2p552KmuRI9HBjkq2TrEhp864v+lBM/qT53NAGym9kAL5Gjea+tMysHILHxoyFF
 wCrK6h7KNFYehNbbFM57SqRl2KDz2TQRrqqVHZ3OvRyd1LhnXaf9CfrH3jU8f++pFlsY
 09z+QB+ZywlHOa/yPW4sHe+mOMBNtqJ3J7oub0GaZecHyte0otiTk0eAGo+gQUbCpWpo
 8X0l2Nvtc8GUZWUKuLnaWsiZ8iTrT7akQrVJw3nFv1rZt0pRxKwEjfRBUzNZV6j2r+U0
 y/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746026531; x=1746631331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93eCSnL7YqqbeGNknrrinPW0I2Te+1gugq/NSOoUJBI=;
 b=DK+nnWHCyF6nwOu0Gimxxo9gzo/Sh56RzIyAxQLkYhFnPNby34ZNpeHukdKCQG3Dy9
 JXmN6WTS67OMpfNzd9MM0EAr7UmUwe0ptWSiZzBBrOVGtg0O1oZHloFAN8abEpm357CB
 htZifS1Nkn3WT8Fosdh5fOZ0QkhB9kRje4RtPGALjd+69GHeX7eZElBN0V7bSUumgr8E
 sFVh/YPPlyZVy5pgQOVl/gH0b6dp7cUomjfSUCo3mxi2obQizaA4qh67V5m+jXPZBDB8
 rE/qKQR7G5l7RhvK1nG4EcrLcWlyid6AJbSpsUYzBlRK7ZIvodA4bILmmyMrxGuvGO+6
 9V9g==
X-Gm-Message-State: AOJu0YyWyPm9MQG1V1fFi8iD4xbAWv7d0ybczZnpLE9xh0Kc5G6taJiQ
 L37hA8FKWGDydyrUdsVtPDJpQELH0KeYLRsOvdZwAr3fE9jY30Mx0Un2AT7pWmqHUDEUy0R82bN
 KjehsZ+yNkaYr8noetHOTN+vycinK6Za6t93G
X-Gm-Gg: ASbGnctNa0RhPiLGsv+OJ+D7h2OzvACh68NurZa6DqW5s5XAvmqyaauecpZSSg5Xsgm
 r8rbc7hWSd8NNXxQsU8AkfCZDTMj3F/XpMQsc2k9k4vn4vDVU+pX+5RBIaZH+29Zc9xIBwLN7Lw
 R0/GgDGHVKQNlTe91CzoToI2m6T36xAM31g1zi94aRBNNiKwQFGPY=
X-Google-Smtp-Source: AGHT+IELFRtJscY2zbXLAgGomavWrz5X4sjvrTHzwB6yFqNo7j46RHB/wvbsUhzom5/2eGNsOqexGsnaS9kImIm15og=
X-Received: by 2002:a05:6e02:330b:b0:3d6:d147:3126 with SMTP id
 e9e14a558f8ab-3d967f2dc37mr3787365ab.5.1746026530498; Wed, 30 Apr 2025
 08:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250403202439.57791-1-irogers@google.com>
In-Reply-To: <20250403202439.57791-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 30 Apr 2025 08:21:59 -0700
X-Gm-Features: ATxdqUEX8IsJnW5m4DN3_VCxfO0u0ElVgGonJIShmJi7InKGbKOKF9LlxD3eVyM
Message-ID: <CAP-5=fXkayZ7pj+EctOtSBiTcGuyi6SHm9c5RZ3HyyPYcot9zA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for a DRM tool like PMU
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Kan Liang <kan.liang@linux.intel.com>, 
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>,
 Dominique Martinet <asmadeus@codewreck.org>, 
 Thomas Richter <tmricht@linux.ibm.com>, Junhao He <hejunhao3@huawei.com>, 
 Jean-Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Brendan Gregg <brendan@intel.com>, 
 gabriel.munoz@intel.com, matthew.olson@intel.com, 
 brandon.kammerdiener@intel.com
Cc: dri-devel@lists.freedesktop.org
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

On Thu, Apr 3, 2025 at 1:24=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> DRM clients expose information through usage stats as documented in
> Documentation/gpu/drm-usage-stats.rst (available online at
> https://docs.kernel.org/gpu/drm-usage-stats.html). Add a tool like
> PMU, similar to the hwmon PMU, that exposes DRM information.

I'm reminded by Brendan Gregg's new blog:
https://www.brendangregg.com/blog/2025-05-01/doom-gpu-flame-graphs.html
that this is still outstanding. The patches also reduce some directory
scanning for the hwmon "PMU", they are in Google's tree:
https://github.com/googleprodkernel/linux-perf/blob/google_tools_master/too=
ls/perf/util/drm_pmu.c

Thanks,
Ian

> v3: Minor tweak to the test so the skip (exit 2) doesn't trigger the
>     trap cleanup.
>
> v2: Add support to only scan hwmon and drm PMUs if the event or PMU
> wildcard can match. Add a test as requested by Namhyung. Add file
> comments.
>
> v1:
> https://lore.kernel.org/lkml/20250211071727.364389-1-irogers@google.com/
>
> Ian Rogers (4):
>   perf parse-events: Avoid scanning PMUs that can't contain events
>   perf parse-events: Avoid scanning PMUs that can't match a wildcard
>   perf drm_pmu: Add a tool like PMU to expose DRM information
>   perf tests: Add a DRM PMU test
>
>  tools/perf/tests/shell/drm_pmu.sh |  78 ++++
>  tools/perf/util/Build             |   1 +
>  tools/perf/util/drm_pmu.c         | 689 ++++++++++++++++++++++++++++++
>  tools/perf/util/drm_pmu.h         |  39 ++
>  tools/perf/util/evsel.c           |   9 +
>  tools/perf/util/parse-events.c    |  30 +-
>  tools/perf/util/pmu.c             |  15 +
>  tools/perf/util/pmu.h             |   4 +-
>  tools/perf/util/pmus.c            | 101 ++++-
>  tools/perf/util/pmus.h            |   2 +
>  10 files changed, 952 insertions(+), 16 deletions(-)
>  create mode 100755 tools/perf/tests/shell/drm_pmu.sh
>  create mode 100644 tools/perf/util/drm_pmu.c
>  create mode 100644 tools/perf/util/drm_pmu.h
>
> --
> 2.49.0.504.g3bcea36a83-goog
>
