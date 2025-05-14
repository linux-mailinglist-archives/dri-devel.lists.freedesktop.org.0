Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A25DAB738E
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7371B10E6E4;
	Wed, 14 May 2025 17:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i959XSJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D08510E6ED;
 Wed, 14 May 2025 17:57:06 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b0b2d1f2845so4891278a12.3; 
 Wed, 14 May 2025 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747245426; x=1747850226; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HkF3rncj/rkQO6FWsPGasU3HuIPXC7SuBq50xwp/TTg=;
 b=i959XSJcOsrk/J5+QrP1kMMtqpp6Xmes8ONuoW45wGgxo80Jf+VdsXaLhzEvBofhuN
 t7/YL0nKr95Ou26S1v9oGPoKNu/K9/UwIJjdzMPRqtdfTt67Cp+pTCF6iFWzgvSNojUR
 eJ19rMckNIYOYOLW1FBH+v9kBrlfr0Xs9wpJ5oq3RoEWHTEY1iIhDagVy/gz1GMmUfuM
 vroA9lFKGSMBvlm+59nOELn4uip8AjOIfoYZrEpkcRACGj5ipA/uVg3vmhNz6d6Bc3Vo
 qAx+nGlsZ7hSgGtIYs385CtxMbrhApihm5DcaNi+Rv3wD3qz7bNAHRwz2ZvnwuQiCBWu
 Rq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747245426; x=1747850226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HkF3rncj/rkQO6FWsPGasU3HuIPXC7SuBq50xwp/TTg=;
 b=A3wPrxY+Ri+9cO+v30ouUf4UljuwF+3pxNkU6CnVJrpmrq5ZJZAsZGsM32K2tYCUP8
 B5EMB/ngcMGZCL2KJklVpzbtAoQPg9bOmEUmbWq86oe7N/cIUiN9doK6mPU2+Akh/ITp
 3Z03UVA8pfQxvSdXuC3fJL3OGVkbKXTXtsvPuV7YrKzG0KXZ0YeSInB+FGs7iYv80PE9
 M35b/lDw+rskBlOZZh/KUQZ3cFAS7l4fzLMVrXWV00LRcpne7zocm34PuRuUP/JB5Sgz
 NEnyProEPjO2hzdyfHs7mW7qDW/hr7kB302U1+eZ8mFRYdXm/7Er1o6c5HHbi9jo6Pht
 Wp2A==
X-Gm-Message-State: AOJu0YwEwAYFnB2FMNWNLmaQe4Cm54V5E7UzF+H3JxTLGAwJM3svYOtj
 AVQjnLn6p+WPLmrIaeghae/WKU7zl1wWIHA0TMlNxaEoe1FcOhtenUpt7w==
X-Gm-Gg: ASbGncsagZmS4niOWGyCr33lmxVSRQzknTc+9E1n4NWGlYAR8VgTtYQv6OI76p1ti3G
 GtYDefjBAT9BtQMjKyJK6lbJFjLLSL3400GqwLSydxaAxia3uAc4NuN+AesD5nXQLdg7xHMST8T
 kErEu5FDAkmixZphUTHBK1BA5GiBE+W+hVWWVhAXfo739wvuEZ0urwv0tkNgjysTSBb+S7t/2dF
 L+ENeMeWSMARj5HTjK6kIREaiq1g9nLpJDjITpQFR2um2Hx/KpJvMBolp/3L0sKOSu6XgcF5La1
 t+VZgpj1DF/k7UwYCfCJpivBaRE1tkDjNhmsBzam19W2HPWuAaCiS13liyxjRfja8Af7ZJaH626
 ZQcLrxXNvsK6Dbv+r/nbVDL5+yg==
X-Google-Smtp-Source: AGHT+IFFnPpCKvP0NgWNjE1vrV9fJbyMFV4zUdMUBDCgVbDmqc6bNLHoWsuKiYFLjFpINHpDBAMlDg==
X-Received: by 2002:a17:90b:3b43:b0:2f6:d266:f462 with SMTP id
 98e67ed59e1d1-30e2e68a300mr6252605a91.35.1747245425559; 
 Wed, 14 May 2025 10:57:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e33460e5asm1884882a91.29.2025.05.14.10.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 10:57:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 23/40] drm/msm: Mark VM as unusable on GPU hangs
Date: Wed, 14 May 2025 10:53:37 -0700
Message-ID: <20250514175527.42488-24-robdclark@gmail.com>
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

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index da8f92911b7b..67f845213810 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,23 @@ struct msm_gem_vm {
 
 	/** @managed: is this a kernel managed VM? */
 	bool managed;
+
+	/**
+	 * @unusable: True if the VM has turned unusable because something
+	 * bad happened during an asynchronous request.
+	 *
+	 * We don't try to recover from such failures, because this implies
+	 * informing userspace about the specific operation that failed, and
+	 * hoping the userspace driver can replay things from there. This all
+	 * sounds very complicated for little gain.
+	 *
+	 * Instead, we should just flag the VM as unusable, and fail any
+	 * further request targeting this VM.
+	 *
+	 * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
+	 * situation, where the logical device needs to be re-created.
+	 */
+	bool unusable;
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 7a9bd20363dd..f282d691087f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -676,6 +676,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0314e15d04c2..6503ce655b10 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm)
-		to_msm_vm(submit->vm)->faults++;
+	if (submit->vm) {
+		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+		vm->faults++;
+
+		/*
+		 * If userspace has opted-in to VM_BIND (and therefore userspace
+		 * management of the VM), faults mark the VM as unusuable.  This
+		 * matches vulkan expectations (vulkan is the main target for
+		 * VM_BIND)
+		 */
+		if (!vm->managed)
+			vm->unusable = true;
+	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
-- 
2.49.0

