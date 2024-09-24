Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853DD9844A5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 13:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE09910E886;
	Tue, 24 Sep 2024 11:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dI6Ev8cz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C9310E88B;
 Tue, 24 Sep 2024 11:30:59 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso225187266b.1; 
 Tue, 24 Sep 2024 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727177458; x=1727782258; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t1y38+8CPxsqSfGk+vokQebE6afY4tdr6oHCYyS40ak=;
 b=dI6Ev8cz4QqnhIdJ7N2iQF7DWO/KgsMqrf04oElnm8Xz/qnhr+m7yyQF7bWDuUMfR0
 5nnfh7GMJ7ofm1v8gtFpwWmwmdozHTgqGt5vtSRgviBda57L1nCt5HpW6vKDDW1y4THs
 Sk2v9v/lQfXzV7UGKZPdXW8+rkEy95kUzZfwSYwTMsdtvRmlWpWNIza57h/boev2b0YE
 0HxTVwGHqfYGMhwQLdvEGkCEWQU9Po0+v+4rZZgDTKWpvj2wg1Zp2bP37bZJ4kZ7bTBt
 uw7EbuULwV130b3ZwEn2m33TxPYdkthoPy5zv1gHT2D83S96K74fwBfaUwO7+Yc89s/b
 MPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727177458; x=1727782258;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1y38+8CPxsqSfGk+vokQebE6afY4tdr6oHCYyS40ak=;
 b=atuhIE07DB/J2DxFFqMYx+bUFnj4GrDVzTEd8ylMyVoU5mxhv5nlu3XHrNanCUCRZR
 vRKeGBIY0aZoBQgfSxPRI+HBUT3OHoMPhswKXgqU793HYCktJx9mNNcxqVZaFf7Zp8kg
 JHgXTmHDSoayZT3c70QHFyMmMZdvq/cWIuwCFSrxacHe0jO+MgGOwX+c3cmXBBxBQCcB
 bBLo/2k76wOa7zKZCKyX9iiXkhvvOo1Z32S+zcOB3nJB0NGVM94abs7xpbYVexwMqCuh
 ZU+68VDzMbWwgRtHQQFyuV/5/DbNMzv3jh7kIQlHB3BSv5n72ebRW0KCodOJsAn3t7vc
 hwAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfgihPTN0FX71QEzRQoeChNDQhOQUvdmBdUr2EaMcha51+V5NBqaPXUSF18q3NMyqMxFZ/gwS//ZY=@lists.freedesktop.org,
 AJvYcCXGcukRRaDavnZ1VI9jlCi/xTCcVV1V1xPY26oX/was3mgneeMUUorl2Fsuiro3jAyjI1sUm/W8M6nw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfLbLgb47B/FrCPQ092xJ9N2hHPvlQ/9lKn2pdoifrPNNS38H2
 n19Nk0MBHrUZBycAz1yxq8kr0REm1uPPvxp9SZ5+jmlatazJSefO
X-Google-Smtp-Source: AGHT+IEISR9dLxHLz87EmIuJIK9QGIXqeioaCOzkFZkYnK3EgrHJXeDRIPzWKUWlvSpSMxhF1AkwRA==
X-Received: by 2002:a17:906:dac6:b0:a72:7ede:4d12 with SMTP id
 a640c23a62f3a-a92c47f94c7mr381369066b.5.1727177457841; 
 Tue, 24 Sep 2024 04:30:57 -0700 (PDT)
Received: from [192.168.1.17] (host-87-7-171-42.retail.telecomitalia.it.
 [87.7.171.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cae0fsm72612766b.120.2024.09.24.04.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 04:30:57 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 24 Sep 2024 13:30:46 +0200
Subject: [PATCH v5 11/11] Documentation: document adreno preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240924-preemption-a750-t-v5-11-0be2bf81c187@gmail.com>
References: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
In-Reply-To: <20240924-preemption-a750-t-v5-0-0be2bf81c187@gmail.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727177437; l=5024;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=8km0caqw4X9w5WLWDqoPcdYkk+OV9Jah8JF02dHf5Ug=;
 b=gOQrYcb2klrgrDfkFVbEmFs8BClJ+yPGIugEYSqY3lJhHXAp6QKTwhZG0gjLyMoQeJgXt9LVi
 Hoy6fOd8W/TCz3TUEAyUTaLkat/5VqrFViffv0OG34XZDGQQcnYDo4l
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
 Documentation/gpu/msm-preemption.rst | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/Documentation/gpu/msm-preemption.rst b/Documentation/gpu/msm-preemption.rst
new file mode 100644
index 0000000000000000000000000000000000000000..e9b5d7bc7dc6c7740a0e8ba75d3a74e9ad267b90
--- /dev/null
+++ b/Documentation/gpu/msm-preemption.rst
@@ -0,0 +1,99 @@
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
+disables the saving and restoring of all registers except those relating to the
+operation of the SQE itself, reducing overhead. Saving and restoring is only
+skipped when using GMEM with Level 1 preemption. When enabling this userspace is
+expected to set the state that isn't preserved whenever preemption occurs which
+is done by specifying preamble and postambles. Those are IBs that are executed
+before and after preemption.
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
2.46.1

