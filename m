Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E398FA82452
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 14:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB8210E864;
	Wed,  9 Apr 2025 12:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GhqxgiUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B85610E86A;
 Wed,  9 Apr 2025 12:07:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DDEDD615EB;
 Wed,  9 Apr 2025 12:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DACC4CEE7;
 Wed,  9 Apr 2025 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744200464;
 bh=FdUb0DPDYi+ttgoinI37K88fuRyaVge7JDVXiVilF7E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GhqxgiUktLqE62NnlGbCozLGAOy1ebYKCfRTbO1C2V8isrEUvyivtHWOlIWWY3iNe
 lT7qBhQi0YUXEHd/a3nybBs+okp72WCBqbBHa/gUT5qc5stTjpZBUhmQIEvTFikt5z
 3QEX/nurLaDWBdA3+xqEX+t36u0MD+4s/DDnE947U63BOSLACxJE4ATzBnB7162kEM
 uJVlOhBR6ng/gxrCkIJmx2DVTmwcGtpsyRWe122qGV/9UBAusoKc1mqJjzRiizRz4e
 qqynMSOHuqVH/gL+pm4QM8yBcDL9Jr5dx5FDs1H6jkyRMDbX2Cuq8465NG5c4c31Ao
 m0BWGZ8ZfmD1w==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Yang Wang <kevinyang.wang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>,
 Tim Huang <tim.huang@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, Eric Huang <jinhuieric.huang@amd.com>,
 Asad Kamal <asad.kamal@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Friedrich Vock <friedrich.vock@gmx.de>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] dma-fence: Improve docu for dma_fence_check_and_signal()
Date: Wed,  9 Apr 2025 14:06:38 +0200
Message-ID: <20250409120640.106408-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250409120640.106408-2-phasta@kernel.org>
References: <20250409120640.106408-2-phasta@kernel.org>
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

The documentation of the return value of dma_fence_check_and_signal()
and dma_fence_check_and_signal_locked() reads as if the returned boolean
only describes whether dma_fence_signal() (or similar) has been called
before this function call already. That's not the case, since
dma_fence_ops.signaled() usually just checks through the sequence number
whether the hardware is finished with a fence. That doesn't mean a
signaling function has been called already.

Make the documentation clearer.

Move the Return: documentation to the end, since that's the officially
recommended docu style.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/linux/dma-fence.h | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index dc2ad171458b..3df370b2cc7c 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -385,14 +385,21 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
  * dma_fence_check_and_signal_locked - Checks a fence and signals it if necessary
  * @fence: the fence to check
  *
- * Returns true if the fence was already signaled, false if not. Since this
- * function doesn't enable signaling, it is not guaranteed to ever return
- * true if dma_fence_add_callback(), dma_fence_wait() or
+ * Checks whether the fence was already signaled, and, if not, whether
+ * &struct dma_fence_ops.signaled indicates that it should be signaled. If so,
+ * the fence gets signaled here.
+ *
+ * Since this function doesn't enable signaling, it is not guaranteed to ever
+ * return true if dma_fence_add_callback(), dma_fence_wait() or
  * dma_fence_enable_sw_signaling() haven't been called before.
  *
  * This function requires &dma_fence.lock to be held.
  *
  * See also dma_fence_check_and_signal().
+ *
+ * Return: true if the fence was already signaled, or if
+ * &struct dma_fence_ops.signaled is implemented and indicates that this fence
+ * can be treated as signaled; false otherwise.
  */
 static inline bool
 dma_fence_check_and_signal_locked(struct dma_fence *fence)
@@ -412,9 +419,12 @@ dma_fence_check_and_signal_locked(struct dma_fence *fence)
  * dma_fence_check_and_signal - Checks a fence and signals it if necessary
  * @fence: the fence to check
  *
- * Returns true if the fence was already signaled, false if not. Since this
- * function doesn't enable signaling, it is not guaranteed to ever return
- * true if dma_fence_add_callback(), dma_fence_wait() or
+ * Checks whether the fence was already signaled, and, if not, whether
+ * &struct dma_fence_ops.signaled indicates that it should be signaled. If so,
+ * the fence gets signaled here.
+ *
+ * Since this function doesn't enable signaling, it is not guaranteed to ever
+ * return true if dma_fence_add_callback(), dma_fence_wait() or
  * dma_fence_enable_sw_signaling() haven't been called before.
  *
  * It's recommended for seqno fences to call dma_fence_signal when the
@@ -423,6 +433,10 @@ dma_fence_check_and_signal_locked(struct dma_fence *fence)
  * value of this function before calling hardware-specific wait instructions.
  *
  * See also dma_fence_check_and_signal_locked().
+ *
+ * Return: true if the fence was already signaled, or if
+ * &struct dma_fence_ops.signaled is implemented and indicates that this fence
+ * can be treated as signaled; false otherwise.
  */
 static inline bool
 dma_fence_check_and_signal(struct dma_fence *fence)
-- 
2.48.1

