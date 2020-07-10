Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5A21B065
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B1A6EB7B;
	Fri, 10 Jul 2020 07:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D1B6EB7B;
 Fri, 10 Jul 2020 07:42:19 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j18so4963577wmi.3;
 Fri, 10 Jul 2020 00:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CmGuoYcAtPZ/mwhFHqovUeVuw6/BJFRsIKd+l37OEGU=;
 b=VfyLfbWP1nT6ap53jH9hZ73gBJpfdAREdVk0UxjpRM7XM1HSVzVzMl0fSJIMDjiuwm
 p3Ywibmdl0v5HFxKnoa74FTxoD8IDl3S2RIoD95Oj0+oJxC86gAuQfCdVgbflFjepLr8
 eOxv42yK92L7KB38sSHljx7gIpyGD5/yY0ncgtJYZ7ynA/fYeiguTgE9g4rsI6gebkHh
 xqtKxp7AjDX/Nyh3AGZx3WpYlwziL5a7FIf0JEwrWyqwjjoMSB1bVnBgD4OayS0KZ0wQ
 JHtfpV0oide6/QfIkpDQyHVhG7C/nWzqKVBCdm2mG10xMbyWymTL6ZsQ4axOq0jaMzvY
 DkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CmGuoYcAtPZ/mwhFHqovUeVuw6/BJFRsIKd+l37OEGU=;
 b=O2UsKTS6SbooKINgsz0ZfcbxXzIp0V1FEqqCGltQZ3WYmM1VhTRAWaaW6jBRu6V8ku
 e9wddJj1Dj5MNnEEid7S2kNYwRQ5jRAGOFXJcw9SO0klRuqyEh31IYdJovgB78mugoEx
 ScJCFA7Uen5smFqume3pZwhzVRuWgtfWqHfqJ2bshN2+k31fjANRC0gLdez1wguNlCMa
 5qMbrVGMd5beREhXpNR+dgPfFnfiwwQippAgV46SOtkQD19mm5xpjy1WEqCLYuSSHQ0g
 pyjNbIRijMceJ/gs4GfKS2r5zFdL4Vtq9313dlmQICAhX9QAdfXcZCUmrOEr6dON6cKB
 Ih7w==
X-Gm-Message-State: AOAM530exVsqyt2JBwLwMp+zwCLWMUtEFirngq43PmxX3JIrvZ8uBWi1
 vWOkXrYGAFqSxQTRwOk+SPU=
X-Google-Smtp-Source: ABdhPJz0aa7Gl6MEMJnk8e6Nu68bbbEgkcDVJGuvuCl9kvQNPXYdfoPMqa28QnqeviP+yiB1gIV76Q==
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr3912062wmk.149.1594366937949; 
 Fri, 10 Jul 2020 00:42:17 -0700 (PDT)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id p17sm7951375wma.47.2020.07.10.00.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 00:42:17 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/etnaviv: export loadavg via perfmon
Date: Fri, 10 Jul 2020 09:41:27 +0200
Message-Id: <20200710074143.306787-5-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710074143.306787-1-christian.gmeiner@gmail.com>
References: <20200710074143.306787-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make it possible to access the sub-GPU component load value from
user space with the perfmon infrastructure.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 79 +++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index 75f9db8f7bec..614d86e2802d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -98,6 +98,19 @@ static u32 hi_total_idle_cycle_read(struct etnaviv_gpu *gpu,
 	return gpu_read(gpu, reg);
 }
 
+static u32 load_read(struct etnaviv_gpu *gpu,
+	const struct etnaviv_pm_domain *domain,
+	const struct etnaviv_pm_signal *signal)
+{
+	u32 load;
+
+	spin_lock_bh(&gpu->loadavg_spinlock);
+	load = gpu->loadavg_percentage[signal->data];
+	spin_unlock_bh(&gpu->loadavg_spinlock);
+
+	return load;
+}
+
 static const struct etnaviv_pm_domain doms_3d[] = {
 	{
 		.name = "HI",
@@ -387,6 +400,72 @@ static const struct etnaviv_pm_domain doms_3d[] = {
 				&perf_reg_read
 			}
 		}
+	},
+	{
+		.name = "LOAD",
+		.nr_signals = 12,
+		.signal = (const struct etnaviv_pm_signal[]) {
+			{
+				"FE",
+				0,
+				&load_read
+			},
+			{
+				"DE",
+				1,
+				&load_read
+			},
+			{
+				"PE",
+				2,
+				&load_read
+			},
+			{
+				"SH",
+				3,
+				&load_read
+			},
+			{
+				"PA",
+				4,
+				&load_read
+			},
+			{
+				"SE",
+				5,
+				&load_read
+			},
+			{
+				"RA",
+				6,
+				&load_read
+			},
+			{
+				"TX",
+				7,
+				&load_read
+			},
+			{
+				"VG",
+				8,
+				&load_read
+			},
+			{
+				"IM",
+				9,
+				&load_read
+			},
+			{
+				"FP",
+				10,
+				&load_read
+			},
+			{
+				"TS",
+				11,
+				&load_read
+			}
+		}
 	}
 };
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
