Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1ED43A72D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB05F6E30C;
	Mon, 25 Oct 2021 22:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCE66E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:46:02 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id p16so15801850lfa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gJarTkNTEoMlksCf38GHnHNmMaOZo5rLjpR2+6rp6ac=;
 b=DuNY3RgV6b5E0HRk5wiok3CV4aymhY8nc62i3OPlTGYABwzcbBbjHC+wFjs2xZ/01z
 Dli6udhMR5bcSIRDbfm+x79bwSNWkSPP0Cuuo5mu7fZha48ucJUZStvuuWg1N41f2SyQ
 H4A3f0M3HvGKRD7W0x1eIFeYXZM12DTibMOkgW5BhBqo81qSEdC56haL/jKaaT7uNQFA
 Kfln32k686TIRae5eUqsReXHCbUGt1FmsbEN3/4l152M6nWwjOJym7jvgrl/Hpb4KDE8
 k4z5ubUmeKNIvQSKbmdfqrVEMXpFlgKDaLcFJNlCYucP9w6kQmFnmgH0LHCbpNAPF6wH
 Lalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gJarTkNTEoMlksCf38GHnHNmMaOZo5rLjpR2+6rp6ac=;
 b=smm8nvmWftTuXsdfUaxIyzWFjyW20jTAXcCGNk7Pmo3p61KgKWItY2vMPiINThZkx3
 oAJvRu2ptnuzIE8d8UBpaHPeNWHYpMC3Rzt3dWx6NU6sQyrwL3nIbAxK8s8O20w5pgMz
 ZZpHSvIVCaOnNfDYt0MjRyiOiRb3SfJ7LdBAia2knW9M7AR+mldp56aswGN6pP/FH3vW
 OMLHcEcyoqByruLrGVKpnDHfU0SOD9S2GN47HMG60U2zLquUENUV8oYUcroZzVsjVR+z
 zWO75S+j3xKiwQbs1zDfikcDT+AR1y8Q037rPOEbdxgPpyl2M8aI22TPcqKAKER9KWvH
 XJ+w==
X-Gm-Message-State: AOAM532xx3S88BTkqhT2c94Kprl82YTRFy/FNYR5JxVhy7tFVIQ/7F6i
 y7tmvyboGMVAhfYiVfGMlcw=
X-Google-Smtp-Source: ABdhPJzCMRNjjko6GLKt0sLL7ix8/6D4t6ztVcc38PF5qU5R381WDWrVETaFqH/0HiPEphfr6UnV6Q==
X-Received: by 2002:ac2:5968:: with SMTP id h8mr6720554lfp.24.1635201961138;
 Mon, 25 Oct 2021 15:46:01 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:46:00 -0700 (PDT)
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
Subject: [PATCH v14 16/39] drm/tegra: submit: Remove pm_runtime_enabled()
 checks
Date: Tue, 26 Oct 2021 01:40:09 +0300
Message-Id: <20211025224032.21012-17-digetx@gmail.com>
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

Runtime PM is now universally available, make it mandatory by removing
the pm_runtime_enabled() checks.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/submit.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index c32698404e36..3bbd8de5711c 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -504,8 +504,7 @@ static void release_job(struct host1x_job *job)
 	kfree(job_data->used_mappings);
 	kfree(job_data);
 
-	if (pm_runtime_enabled(client->base.dev))
-		pm_runtime_put_autosuspend(client->base.dev);
+	pm_runtime_put_autosuspend(client->base.dev);
 }
 
 int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
@@ -589,12 +588,10 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 	}
 
 	/* Boot engine. */
-	if (pm_runtime_enabled(context->client->base.dev)) {
-		err = pm_runtime_resume_and_get(context->client->base.dev);
-		if (err < 0) {
-			SUBMIT_ERR(context, "could not power up engine: %d", err);
-			goto unpin_job;
-		}
+	err = pm_runtime_resume_and_get(context->client->base.dev);
+	if (err < 0) {
+		SUBMIT_ERR(context, "could not power up engine: %d", err);
+		goto unpin_job;
 	}
 
 	job->user_data = job_data;
-- 
2.33.1

