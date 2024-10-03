Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD198F3D7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261A010E8B0;
	Thu,  3 Oct 2024 16:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KCjipMac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C367E10E8C5;
 Thu,  3 Oct 2024 16:13:20 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a8d446adf6eso187269966b.2; 
 Thu, 03 Oct 2024 09:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971999; x=1728576799; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3fpNTS0q1Wya28e2Ddw3u+eLcNrzlMeAfttSM8CxcnU=;
 b=KCjipMacIDD/bIfaVXp6wTIFmC9+H7fKwqmNqMW2FyJcmzOTmmakFR7wPq/8XuxumQ
 TWLmcmM3wwSx/oZuEXubeUX/sFKOCekUMelbqPpXBoyHj/VoaW2CgZ7+hPOg2CcTWgVV
 Lpja/jA07726RpxY+oeSSQl02+VY6mIw6ZzHoOM/mShmBuo7Cl2KS1vTjWThy4JEavpK
 bMhg49AwjNuJB+5rF6WZ9igq77YaeoKOSSrSj3CcdahYS1u1O+NUiNUUebV7XxfCUni2
 YmLmrVa1feDbqdlFiqGsfToBVplxPcl4cJotuk36NAfkMGgk2wcYj5rK2LvqYiIGx+y/
 9f5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971999; x=1728576799;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3fpNTS0q1Wya28e2Ddw3u+eLcNrzlMeAfttSM8CxcnU=;
 b=dYKMK6uoTmN40n3CYCnB6YJSNQi9wNncS3f4NpgL6e/8t+UW8q2t7aDm79ICVZ16fv
 h1BRbLCJhvbp4Efxw+UvQwqDUpVtZKOpyGxouZSOBP++Wpsg5y0UveJqGrcq7yosYr7u
 yIDDN0332xQgjXjOYgYZ/r342G8blZSe3FejJ4GaBzgYeqeNrgCHsmN5abfv6LIpbBFO
 5L8TXjuU605ewPX/lHQgig39e7KW5QSBI35oaypx/jG9Ty/yY58xlcqr1cJZmW71MvhR
 SAwgokHt9xp+FEBViFNeCpjFIaBw7CLJAhwmcVMt8o79X7myktos3gsWpPzEwtxX6uf9
 x1Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1UQJrtCf/RW82kEXCO5qq097jCqd4hOhpr3RfWs+m743dZMlSFXabUdbUM6RkQ9EdxBPhI3iFP7W+@lists.freedesktop.org,
 AJvYcCXOMHaN7gcEDLZXgOliFLuu8g1jjW4p5AU/nZRFXB++k2BQ5RUX1hswyCur1awdizlZAhVRr1ElXwA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQZMaYxqh5XQLzbk0g29Pc/jX2Tkz7ZTjfP+yEizgXIvPMP31R
 JqTd6nGJIOxqXqdL8Rm/3kYXXtqT/IFEFOcWsCXOrREyuuiCGyr5
X-Google-Smtp-Source: AGHT+IH+z9eUo8QcUxhrDoJYH3nCVHawLxyeUByKeD9f7uhNjTIOXx5BsvoGTwPWw9epYlodqVNg5g==
X-Received: by 2002:a17:906:9c84:b0:a91:15dc:34e4 with SMTP id
 a640c23a62f3a-a98f838b3b9mr825508066b.59.1727971998826; 
 Thu, 03 Oct 2024 09:13:18 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:13:18 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:13:01 +0200
Subject: [PATCH v8 12/12] Documentation: document adreno preemption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-12-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=5027;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=Lqokp436hYQPQY3ahWAbbFwj5CouB7qIxKNoJs67APU=;
 b=Y0+gbMYo926SrfUYu3rTzPeHpFJC7sLUBp92IZwL/MosjFrr3cLUskF07F3sMVxjJFJpTPcOG
 gOApUuQ84zwDkVsFRRh+sxuDU5aagr8Devr8sF7RPuK3cahOsLtbI8D
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
index 0000000000000000000000000000000000000000..2f74f8b61935a4469168ec36e777320dd6f22df9
--- /dev/null
+++ b/Documentation/gpu/msm-preemption.rst
@@ -0,0 +1,99 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+:orphan:
+
+==============
+MSM Preemption
+==============
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

