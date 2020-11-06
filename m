Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840542A9170
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046256EA76;
	Fri,  6 Nov 2020 08:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127A46E08A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 07:05:19 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 10so469108pfp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 23:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+vlFfwXaQyT67tNUyi81s2s5dR5xJEgy0PknD0rbz4=;
 b=x7tyrPdaqh682SqGflCsojgjTQx+BXzkcw1rNmmcDJ4f1/CcNFqWsU2TeslilqRYW6
 zc5/q2J7DYA6GaZpIl9YJEuw5A+2BygaKtcNZGbiJXmhxkSHLYjjXBFUVrm/3kU2FfxF
 HOpl09BHz7pxQM1vSb758PMQEHgdQo7a0vFwzSK04ezcCvy5z2tN77zFwQKb0oCEVS7Z
 5Wf5xaSLDOcwVEQi6x3vCm1v9HcJ36wHsCS7oCefyqpWqoytt13+6MJpeHbxPKWMFUZ8
 7D71Y1LBl2lTl2Ui7t2WW7/HoEOYoPNzVDuHeqlnp7Y7cKSpCWRT/VBoOVOVT9t0JXT2
 P84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+vlFfwXaQyT67tNUyi81s2s5dR5xJEgy0PknD0rbz4=;
 b=U7kcqtuvolDRvMwIJ+MheZVceMTVywww+mIwwbV9jXurrUdOHLkn+5kJIfVm8bj+UL
 a8J1FawQQbUbxkktDZKs/SzPT3hRkPNcHFSlG364JtZdFExXx7a0uJzBBjx32n4xhIU/
 tCKmUzveWg7oY4z93yA+MspMai7USo/WOwjv10CBXzjiO4fzs7LrHqj4PgiLKqAzkb+I
 BWhII+uSwoUtv7xW1eYZKSTPgw0kS/hkr1pm+Cj76e1RmwYxzdY4kY3x7mT9PsG3yMl6
 4JYcQZhyBMnXwBbf5401HvtzlEAVHnhciakVU1FqU7RkIHrZ0zAjRz+NKgmGvWTNODw7
 e95A==
X-Gm-Message-State: AOAM533D28kJkM7hziChzFrJUL6Vt7QfxowQ5nr/71i2nwv8zuCoO/vh
 HYGTGogfktk9SXu5N+vGYE0l5Q==
X-Google-Smtp-Source: ABdhPJwjHQpNsy+GXHXCwxvkwHWtDNd475+Vq8i4kMmtZzheVVRcd/hAft+93Mx61nTSrMPFd3mZ/Q==
X-Received: by 2002:a17:90a:af89:: with SMTP id w9mr989921pjq.72.1604646318621; 
 Thu, 05 Nov 2020 23:05:18 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id r3sm1023098pjl.23.2020.11.05.23.05.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 23:05:17 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Ilia Lin <ilia.lin@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>,
 Qiang Yu <yuq825@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rob Herring <robh@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Steven Price <steven.price@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 0/7] opp: Allow dev_pm_opp_put_*() APIs to accept NULL
 opp_table
Date: Fri,  6 Nov 2020 12:33:20 +0530
Message-Id: <cover.1604646059.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: linux-samsung-soc@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 digetx@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patchset updates the dev_pm_opp_put_*() helpers to accept a NULL
pointer for the OPP table, in order to allow the callers to drop the
unnecessary checks they had to carry.

All these must get merged upstream through the OPP tree as there is a
hard dependency on the first patch here. Thanks.

Viresh Kumar (7):
  opp: Allow dev_pm_opp_put_*() APIs to accept NULL opp_table
  cpufreq: dt: dev_pm_opp_put_regulators() accepts NULL argument
  cpufreq: qcom-cpufreq-nvmem: dev_pm_opp_put_*() accepts NULL argument
  devfreq: exynos: dev_pm_opp_put_*() accepts NULL argument
  drm/lima: dev_pm_opp_put_*() accepts NULL argument
  drm/panfrost: dev_pm_opp_put_*() accepts NULL argument
  media: venus: dev_pm_opp_put_*() accepts NULL argument

 drivers/cpufreq/cpufreq-dt.c                   |  6 ++----
 drivers/cpufreq/qcom-cpufreq-nvmem.c           | 15 ++++++---------
 drivers/devfreq/exynos-bus.c                   | 12 ++++--------
 drivers/gpu/drm/lima/lima_devfreq.c            | 13 ++++---------
 drivers/gpu/drm/panfrost/panfrost_devfreq.c    |  6 ++----
 drivers/media/platform/qcom/venus/pm_helpers.c |  3 +--
 drivers/opp/core.c                             | 18 ++++++++++++++++++
 7 files changed, 37 insertions(+), 36 deletions(-)

-- 
2.25.0.rc1.19.g042ed3e048af

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
