Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A3E97AF6B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 13:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED52A10E3F0;
	Tue, 17 Sep 2024 11:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SWphT+tm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECEA10E46C;
 Tue, 17 Sep 2024 11:14:35 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so567035266b.2; 
 Tue, 17 Sep 2024 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726571674; x=1727176474; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bo/Q+fVB0c2N2S+2tO3u0tNQvOs02ddpFS55PdIBqiM=;
 b=SWphT+tmXQPk+GEDTmiAzNDpuvmET8Z/te6Ucv7gyTmQOsUn1v3pwdlMErz0HUJK/7
 fO3z8sDhsc/u8uAUo+L/9/xqcdtCLrAJmp2GX+QpWw130jtZ2UyR975KQUCOluACNTw4
 dxpp0mKpZVzhyy8olkgsYSREUi96KLKkDGqspcbiQ1Lu6aadVyKvNDp5/Z09Iid0Bo0b
 z5U83Mr1lCgb/CI1PbyFJi4MNZ3LMx8ED2UbeHdAUqmFzBB0NpkDQLy/be8r3Y95qnee
 pnvVdXdu2Fb435zsy6HZGSYWgfKE/LaO/QngvKDxAGajPdUGa3xldJNAlqlv1ASF7Yfn
 q6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726571674; x=1727176474;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bo/Q+fVB0c2N2S+2tO3u0tNQvOs02ddpFS55PdIBqiM=;
 b=LQQ7jHZ985t8m/1/lGE9N7mNQJRZuaNUrIQgwXBrIuItkmQiH8G+UIaWvGBweM53Ul
 +Auaup5QR1Z5mRTEGvDrH0w5/vk/660YdDF92qELcp3wLw5N466XP3Mumsn6jQkwFQhx
 E8/lprFp1zl3H3ryyQ9kIaXxSDQ0bpoFuJWoyVnbotNiOwkaCl7TdsQzwj5xZuOCcS7g
 /MRldVpd6N+/2WA0gYK9fKiL4qmN8zHgZuuw8PnkhEW3KogNhiNyp+RYb5RDENAAXDTl
 p7YnumQT5GKyCWDKy5iiLtyrn7txgRXVdy79Yw2rmrYaW4uUW8FhGgWCIwYKGBWxBtZJ
 lcNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeoyfdw9MtvcaToGWuMGulgSqo6acC7UnzHMCYVBqma4xYHD1KJQ0HA66+JkKEdXUxQdNoQ/S3X8E=@lists.freedesktop.org,
 AJvYcCXA2iNWAwlHeJm6kIlCofqGW1LxEdgWZfv1TXMNFKHsmesC16Zqqnxz758Zik4oBD/CQKRdJ0SvCUFX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ/xAZiyV+vsLrZyYLm+0RwidlQtRQT5MLUtD9stEMBjNojd0q
 /YB6oPeWZZ2TvevdKutXow+kQslBfHbnM1JTgW3Nn6jEXoeF+RKD
X-Google-Smtp-Source: AGHT+IEo3KeisOhfYxWfOemIFnRDGajHBF3QYONL7b0c6BlfR/CJVVBqL7wK41v8Afv13g1KcnHV7A==
X-Received: by 2002:a17:907:7f23:b0:a86:700f:93c0 with SMTP id
 a640c23a62f3a-a9047d1ac6dmr1292392066b.35.1726571673826; 
 Tue, 17 Sep 2024 04:14:33 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it.
 [82.51.105.30]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 04:14:33 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:21 +0200
Subject: [PATCH v4 11/11] Documentation: document adreno preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-11-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=4842;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=roRdoUA06OSktfkT3cuEuaM2HtScD0650/8+GaZZFy4=;
 b=DNGawWdMty8okiDt/7j6ItVwD17WNPGrPDbSn6xIln3BXwF6VZLrsXi+qTJkgXjZ0nc1r6J1j
 nOxyBYuU/5SB91rFRyxpLOw6+WqT369DmPmh3TVRpAnUPU2sdutlD24
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Add documentation about the preemption feature supported by the msm
driver.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 Documentation/gpu/msm-preemption.rst | 98 ++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/gpu/msm-preemption.rst b/Documentation/gpu/msm-preemption.rst
new file mode 100644
index 000000000000..c1203524da2e
--- /dev/null
+++ b/Documentation/gpu/msm-preemption.rst
@@ -0,0 +1,98 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:orphan:
+
+=============
+MSM Preemtion
+=============
+
+Preemption allows Adreno GPUs to switch to an higher priority ring when work is
+pushed to it, reducing latency for high priority submissions.
+
+When preemption is enabled 4 rings are initialized, corresponding to different
+priority levels. Having multiple rings is purely a software concept as the GPU
+only has registers to keep track of one graphics ring.
+The kernel is able to switch which ring is currently being processed by
+requesting preemption. When certain conditions are met, depending on the
+priority level, the GPU will save its current state in a series of buffers,
+then restores state from a similar set of buffers specified by the kernel. It
+then resumes execution and fires an IRQ to let the kernel know the context
+switch has completed.
+
+This mechanism can be used by the kernel to switch between rings. Whenever a
+submission occurs the kernel finds the highest priority ring which isn't empty
+and preempts to it if said ring is not the one being currently executed. This is
+also done whenever a submission completes to make sure execution resumes on a
+lower priority ring when a higher priority ring is done.
+
+Preemption levels
+-----------------
+
+Preemption can only occur at certain boundaries. The exact conditions can be
+configured by changing the preemption level, this allows to compromise between
+latency (ie. the time that passes between when the kernel requests preemption
+and when the SQE begins saving state) and overhead (the amount of state that
+needs to be saved).
+
+The GPU offers 3 levels:
+
+Level 0
+  Preemption only occurs at the submission level. This requires the least amount
+  of state to be saved as the execution of userspace submitted IBs is never
+  interrupted, however it offers very little benefit compared to not enabling
+  preemption of any kind.
+
+Level 1
+  Preemption occurs at either bin level, if using GMEM rendering, or draw level
+  in the sysmem rendering case.
+
+Level 2
+  Preemption occurs at draw level.
+
+Level 1 is the mode that is used by the msm driver.
+
+Additionally the GPU allows to specify a `skip_save_restore` option. This
+disables the saving and restoring of certain registers which lowers the
+overhead. When enabling this userspace is expected to set the state that isn't
+preserved whenever preemption occurs which is done by specifying preamble and
+postambles. Those are IBs that are executed before and after
+preemption.
+
+Preemption buffers
+------------------
+
+A series of buffers are necessary to store the state of rings while they are not
+being executed. There are different kinds of preemption records and most of
+those require one buffer per ring. This is because preemption never occurs
+between submissions on the same ring, which always run in sequence when the ring
+is active. This means that only one context per ring is effectively active.
+
+SMMU_INFO
+  This buffer contains info about the current SMMU configuration such as the
+  ttbr0 register. The SQE firmware isn't actually able to save this record.
+  As a result SMMU info must be saved manually from the CP to a buffer and the
+  SMMU record updated with info from said buffer before triggering
+  preemption.
+
+NON_SECURE
+  This is the main preemption record where most state is saved. It is mostly
+  opaque to the kernel except for the first few words that must be initialized
+  by the kernel.
+
+SECURE
+  This saves state related to the GPU's secure mode.
+
+NON_PRIV
+  The intended purpose of this record is unknown. The SQE firmware actually
+  ignores it and therefore msm doesn't handle it.
+
+COUNTER
+  This record is used to save and restore performance counters.
+
+Handling the permissions of those buffers is critical for security. All but the
+NON_PRIV records need to be inaccessible from userspace, so they must be mapped
+in the kernel address space with the MSM_BO_MAP_PRIV flag.
+For example, making the NON_SECURE record accessible from userspace would allow
+any process to manipulate a saved ring's RPTR which can be used to skip the
+execution of some packets in a ring and execute user commands with higher
+privileges.

-- 
2.46.0

