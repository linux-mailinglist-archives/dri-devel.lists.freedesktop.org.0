Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEC196DC7D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 16:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A863410E8F1;
	Thu,  5 Sep 2024 14:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QOQRhS03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE3710E8EC;
 Thu,  5 Sep 2024 14:51:44 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f50966c469so10252841fa.3; 
 Thu, 05 Sep 2024 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725547903; x=1726152703; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bo/Q+fVB0c2N2S+2tO3u0tNQvOs02ddpFS55PdIBqiM=;
 b=QOQRhS03oAR5grUny2A491cxWb7USn9nzIJqOdhvJJNjA5SOTOyQ3H+kcpw/g2c6SL
 reqdvEWWIZyYyXJ2+B/KWIKeDpJ/1zWNpCNRIx7do4bSJ/wvB2whB6BKVBPQRrgDlgDo
 UAm7hIAXdADm6QBRQS1Lkfubs3G8hdvH73h8wCl0PCmLklzr+/fpBa7wO1GYywRop5HO
 dhRMwZ5z3IdubUp3b/FCK4r3uy69mLcRvcXM8fG1YK8GSKFpz1H7//FsQ8CJzqubKT02
 7uZkLT9UHROQwmAxNwLsKkrDxe+9Wat4YaH4GY19PyDMxtZkbo/64GmRunyvtvtxCULs
 fyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725547903; x=1726152703;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bo/Q+fVB0c2N2S+2tO3u0tNQvOs02ddpFS55PdIBqiM=;
 b=Mn/AVemr4TXrxnUpEiO1vWO5Nno9iSeC9tRM8I77St5KdtAjF17JJZS3vXbKs+bAJZ
 IfLAMy1OiGAE81cufxFMdx323JDO+z3WL1k2LxQKcy3esWsKdmeLeZSY3Kd/3eaqYkZI
 QEaUrI6bxIEmlZBf/ZfBWjNTvNRzN/cmAm+UrL5Mh7GEepIUNssEmWXeW4BNzIFtcqIw
 86BmD/ILGz/e4YJ1ljn77NGf1X4B8P9UyBuhVKA0NF07IOuachgJEWQgw+4piQrrQWdU
 f2j4vOu8ca0m+C7KakQBYTR007YMioeq2wJtrecdxuXebOHgDSq0dQnaNnwCySMvrAkn
 Vi3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIr8igGiQWGIp1U/8jb2+ZXJCJoWIxhsy7KC+zJ1BSeY2mrzPoIs3GjWoiaaSkHRrOg652qfrTL0E=@lists.freedesktop.org,
 AJvYcCXf7Fq5DyxOm01drafvJNfXKdhYi67+D5BgBB3qzcuypO82MxaMmkqCa2KYajPjSZJzdzEMD9ODPx97@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHpCkj8x95dzjzd7UzwQODoZwDSTCgNfoHhBidRMCr4EY77o+l
 vSkhl6YnTQ147wWtfCOJrZinwbOARJauUdKlTCLgVe01qF+LdxjW
X-Google-Smtp-Source: AGHT+IGuPSaDOOzl5M61bxO8FKoqKEAItniyjvNvH62n6EZFEByJgMRdkOBGNp3EvBqMEAena5Btxw==
X-Received: by 2002:a05:651c:2110:b0:2ec:568e:336e with SMTP id
 38308e7fff4ca-2f62902e09dmr128043041fa.1.1725547902821; 
 Thu, 05 Sep 2024 07:51:42 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it.
 [87.16.167.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:51:42 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:28 +0200
Subject: [PATCH v3 10/10] Documentation: document adreno preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-10-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=4842;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=roRdoUA06OSktfkT3cuEuaM2HtScD0650/8+GaZZFy4=;
 b=QW4juILS2+hUj7OzGRCDv+2zILYSjdYY4WOupFWtFfsuGztTwEVdeQ6Lc1jvJLggSOMn8wLFJ
 TECzDyaNCakCB6Xq8gOJRDKWYLSg2l4XfHWzsG/983yxs/1AVuccCJV
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

