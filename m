Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F2759B5F2
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 20:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7838FAA9;
	Sun, 21 Aug 2022 18:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E2A8FA9E;
 Sun, 21 Aug 2022 18:18:49 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id x15so7522774pfp.4;
 Sun, 21 Aug 2022 11:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=oSgkN+dTN7nRZb20JasKAqJ/0pKCu6M2zNDhcnKlGu0=;
 b=MkZHKAGKHan5H72D8tPjvl3t5B0A1ynHIQaPnJRJ5crpXL2QupZxn+K5xNrx16Jowe
 T8gGwT9SKtRepT3P1aZFte+0Fu4PCMbqwqf/I2pL5Oj7WdW2FWmJ1dafGEsMI46JAZed
 CjLfcNP1U+8SAIAe2NdElNpU/XaECGX77/aNshLSGmH3yo5QZUBVsbG55lCQkxSfBEmo
 ktbahVOVyTLG5IStMa+S3UEG0T3v6983R4ptNSKz1WlJkOIV4ieio6MMTZ9S6ZSvNLkx
 re5Sz1ZHevGLSNH80ua19vTRoQIC4NYZSAK4LPtqwOXPH02oMly8hfL8F0f225yicMtY
 CYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=oSgkN+dTN7nRZb20JasKAqJ/0pKCu6M2zNDhcnKlGu0=;
 b=QgaIxQDv1GRNuHkzBtcc7arAH+sxCXe7Tlu/JvxK/ryoSlACTME3y30H/9Twoxarnv
 fD/SjcwMpjN2fCR5TeDGqf0AHGYfRtSyghcNC1jMieYgB6bvVwyR5GZfBPMZz9iVzQMn
 Eybx4b10GdCK3qsnN1XFKH5bbs+syp5jpKkklvoyRPHlwTrUeGDBqd6ExQ+hkdvgtZ9n
 u4jrsij59p9SB7+n9ZellQveG/zRTym46YaZVA6rBhE1dsYeDhMGvVOe59FiCcfaB8TF
 kQ4uP4EpCBhDabbdN9sOo7NucwuKdrJNlkmpeiUCvsBgZWN2CADa9LGMkDkZkmuQpOOh
 ablw==
X-Gm-Message-State: ACgBeo3se1QFIgnsfhVe9f/kOYk560tDlK7VgpLq9CtQ5uJqEKDDbfga
 c5bv4ev4IjDU+TlFteXc9rp4EKalr9Q=
X-Google-Smtp-Source: AA6agR6WWMc3ZkdxZ/qB/4q1PzNtoY5Nih3Ar2rTZXIOvK3bglEb6Kp9bCIcl/7BDvowbchcx6VF7Q==
X-Received: by 2002:a63:5b4f:0:b0:426:9c52:a1f with SMTP id
 l15-20020a635b4f000000b004269c520a1fmr14188278pgm.511.1661105928539; 
 Sun, 21 Aug 2022 11:18:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 p27-20020aa79e9b000000b00535bed953e8sm7147739pfq.94.2022.08.21.11.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 11:18:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] iommu/arm-smmu-qcom: Fix indentation
Date: Sun, 21 Aug 2022 11:19:02 -0700
Message-Id: <20220821181917.1188021-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220821181917.1188021-1-robdclark@gmail.com>
References: <20220821181917.1188021-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Plus typo.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 include/linux/adreno-smmu-priv.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index c637e0997f6d..ac4c2c0ab724 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -37,7 +37,7 @@ struct adreno_smmu_fault_info {
 /**
  * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
  *
- * @cookie:        An opque token provided by adreno-smmu and passed
+ * @cookie:        An opaque token provided by adreno-smmu and passed
  *                 back into the callbacks
  * @get_ttbr1_cfg: Get the TTBR1 config for the GPUs context-bank
  * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
@@ -61,12 +61,12 @@ struct adreno_smmu_fault_info {
  * it's domain.
  */
 struct adreno_smmu_priv {
-    const void *cookie;
-    const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
-    int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
-    void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
-    void (*set_stall)(const void *cookie, bool enabled);
-    void (*resume_translation)(const void *cookie, bool terminate);
+	const void *cookie;
+	const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
+	int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
+	void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
+	void (*set_stall)(const void *cookie, bool enabled);
+	void (*resume_translation)(const void *cookie, bool terminate);
 };
 
 #endif /* __ADRENO_SMMU_PRIV_H */
-- 
2.37.2

