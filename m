Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5283AB73AE
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F96A10E6F0;
	Wed, 14 May 2025 17:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="koFELRBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4606A10E6F9;
 Wed, 14 May 2025 17:57:31 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-73972a54919so150845b3a.3; 
 Wed, 14 May 2025 10:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245450; x=1747850250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/A/RGPDJpbD6ohkqzZy4WVuOmFQs5dwsGRntfJWp3M=;
 b=koFELRBeY2GRpBvqbb/pLk+cSDSH4+wPXy7A1GqEMnQXXyExr94W51uqOh46nDQh7L
 VdcaVCqIKoKgCpUw4vIXx07QaMyycAKjjBp1S/+L1btJi6jtTXnXXGy5Tbwp3Whneh1m
 Hb1+aTm19FLmBtabTma4ke1lkg3krUrHpeVxI8nXklBXmh+Cv2nsNg9eEV/d+Z2BQXZK
 obi1GNuYesK820Ttb/XFR3mbHAfDBR5eO4uCrc+eAmRjSFVI+9yQ73REgrVHLOfXzEkY
 oFiuyIhPHGgvq2bLHRi+UV2ILsEGDvMEJ9O+ClAzcTaQuZRdnu2M0ln7z3SSfm7yTJe+
 SFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245450; x=1747850250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y/A/RGPDJpbD6ohkqzZy4WVuOmFQs5dwsGRntfJWp3M=;
 b=S5HUXgwXKfsO4XR6aDQ/kPdnehvq1aq2OZ8/JRE9NH3OWkrQPSRNs4SuAHvc9/HSqc
 YCnCasOpYdKpdEBf0fF3KiowMJoCE9E0j1y/ZLu0YNuuYQ+bAnkGzLcgJeWqGADLihev
 t+38oqSZMO1TLZ2rlWMm38CFW2BVkMzyrJPAwbIdHhD92BJn3MHP48wjzKTDrBRjQnNP
 MQ+Ws1FmcITBbvDUS99Wu45sU7Fon2u7aSk1jPhrXM33ZtoRjI8PC0Lv4HHMVIFO8b0S
 qpp8G1BEfV5e+6SyEqVulyfg7BYYIsq5lQLhQ5e77fwVI/m0lbXAW9I5Sx3xF5QqM7j4
 dGxg==
X-Gm-Message-State: AOJu0YzNo/SzrtDUgb6CoKhcr6B4wbc+C4PQZ139f5zZ8niiVbY6AuW/
 /G6rKGRPq7erFu9SaCJRgnJ+CByutuYN0oViR4XsRdL/Pqzcj4HKH/r/Qg==
X-Gm-Gg: ASbGncuZ321yndpGbkNkog6lUuzV83huL5fZBdPOmbc7U18QItsmcVLmnqRkcusyoM4
 3pA9Qy88hryI9cVN6u1uzRVTAfXbK3kBh/4HdFm0CLP7DBLi/QDW+XjKLGvVr3lntKczM//9rh1
 rGIO/AS1Ymw9/ia978jV9sHLFOMAvI7GLIOgMD2QUFp82h3cme1u+Oo3aK2A6+0mEqp5HPPT4L4
 fxwc/KpA/rIShHA7MJ5hMMCZ40QRumB4vAF4AHSsMFRYJriTNgU8a88OrkED0k6pjGDZUzEQOoE
 be1Iz3m3qJto4mKK1QJFUe6b0jw9wqCkvXO3fe9fOGeyiU4E+pbIfF38qtmhAcsKwtLM0r8JpBe
 wNP+LriP42zUYkMRfaVx0RC5/Bg==
X-Google-Smtp-Source: AGHT+IEBPsN9kmTr0M4YA45nIruo5l44NuAsME11AdFzUP9aa2BDaGOzNiFa2hh63FW9eSi8T8YPkA==
X-Received: by 2002:a05:6a00:3022:b0:736:450c:fa54 with SMTP id
 d2e1a72fcca58-7428928d581mr6647749b3a.6.1747245450421; 
 Wed, 14 May 2025 10:57:30 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237a0cdd7sm10147820b3a.90.2025.05.14.10.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:57:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 39/40] drm/msm: use trylock for debugfs
Date: Wed, 14 May 2025 10:53:53 -0700
Message-ID: <20250514175527.42488-40-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

This resolves a potential deadlock vs msm_gem_vm_close().  Otherwise for
_NO_SHARE buffers msm_gem_describe() could be trying to acquire the
shared vm resv, while already holding priv->obj_lock.  But _vm_close()
might drop the last reference to a GEM obj while already holding the vm
resv, and msm_gem_free_object() needs to grab priv->obj_lock, a locking
inversion.

OTOH this is only for debugfs and it isn't critical if we undercount by
skipping a locked obj.  So just use trylock() and move along if we can't
get the lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index abf463d700b2..c8b72f68f807 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -922,7 +922,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1e9ef09741eb..733a458cea9e 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -280,6 +280,12 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	return dma_resv_trylock(obj->resv);
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-- 
2.49.0

