Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C1143A723
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DD26E2EF;
	Mon, 25 Oct 2021 22:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591796E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:45:56 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id 65so10796344ljf.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oh6QUonw7MrnLiKi5GFBt9OmRLKhM/HqDNHd5NkKg7U=;
 b=H4yS17PN5Cgk1BXso+3bxFRI0wBy/fkFXrQTKEVEJijpwkbP8KcVwgHeMBmqtHOllF
 R43m4cp/ynQXaE46LwzuFfYuDICAE37ygglKadDvb6x6d6y/b+mAGjOZaACKLnqefn9+
 tg1+NZ7lJLXMogbITe6PYetLSvCo/QF9KBJ0Zg3sv5ZkrVQfnYVxmAAv9APoT1K3mPck
 m5Mj2ugGv0R5ZvLRvcNihMxRUt3CQqOKX0W2sg9TFg3XhHpI7s5JKsyViVJFuwO8B0fX
 COOqOvYHPVI7+XMUNhDF3Bv7tT9d2r+E0rgmTMRA2WGZF68Xs5UIuKHsJVzfpsFhd8Zd
 5RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oh6QUonw7MrnLiKi5GFBt9OmRLKhM/HqDNHd5NkKg7U=;
 b=t0TqaHt7GFGhLAOINpJtsltfUonTOIP4PxpXGVnb+sFEl8DneGa2AgHbgnCrMVsLuW
 vpqzD3RaznIYEPd6P8/aUY0skJfmEfXzgJkXHGd24VSepxZV8JZTMmWgoxdR7wzvCjW9
 CCISlbL22c+kHU/c2BTt+4ZyuUSZvsuA6Sh7lKVTwsjPflyOyAfJBYM76KNUJ0dCfWdL
 GcWsNwTzUfpHJ8ZhJioVelOb8uO72Xel+8FP4673aaWonYcksmQErb3DYlWASHawsiD9
 nxxAmhLhVcOr0yGemn2mjtfwcdHOHO6h1ESpUDhDOPzC/EaoPw/L53YGSinwhtBiFOef
 /wbw==
X-Gm-Message-State: AOAM5325VjpQs6MMUWU4Emhrp/o1wxbO6t1SJb+F7E24sqHI7EZHItvB
 KyZUmuoDad/yg01B/fENDBk=
X-Google-Smtp-Source: ABdhPJzVeBW0ULeUzX0Z+QXHWEUyioyNdKvLX6gJxOy97gBQF6t5bmJO0k845nDWU5dj5X/YKuURIg==
X-Received: by 2002:a05:651c:1544:: with SMTP id
 y4mr21214556ljp.470.1635201954745; 
 Mon, 25 Oct 2021 15:45:54 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:45:54 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 09/39] gpu: host1x: Add host1x_channel_stop()
Date: Tue, 26 Oct 2021 01:40:02 +0300
Message-Id: <20211025224032.21012-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
MIME-Version: 1.0
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

Add host1x_channel_stop() which waits till channel becomes idle and then
stops the channel hardware. This is needed for supporting suspend/resume
by host1x drivers since the hardware state is lost after power-gating,
thus the channel needs to be stopped before client enters into suspend.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/channel.c | 8 ++++++++
 include/linux/host1x.h       | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
index 4cd212bb570d..2a9a3a8d5931 100644
--- a/drivers/gpu/host1x/channel.c
+++ b/drivers/gpu/host1x/channel.c
@@ -75,6 +75,14 @@ struct host1x_channel *host1x_channel_get_index(struct host1x *host,
 	return ch;
 }
 
+void host1x_channel_stop(struct host1x_channel *channel)
+{
+	struct host1x *host = dev_get_drvdata(channel->dev->parent);
+
+	host1x_hw_cdma_stop(host, &channel->cdma);
+}
+EXPORT_SYMBOL(host1x_channel_stop);
+
 static void release_channel(struct kref *kref)
 {
 	struct host1x_channel *channel =
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 2ca53d7ed7ca..e8dc5bc41f79 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -226,6 +226,7 @@ struct host1x_job;
 
 struct host1x_channel *host1x_channel_request(struct host1x_client *client);
 struct host1x_channel *host1x_channel_get(struct host1x_channel *channel);
+void host1x_channel_stop(struct host1x_channel *channel);
 void host1x_channel_put(struct host1x_channel *channel);
 int host1x_job_submit(struct host1x_job *job);
 
-- 
2.33.1

