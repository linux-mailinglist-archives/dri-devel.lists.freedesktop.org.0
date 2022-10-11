Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171055FADDB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 09:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FA710E7D9;
	Tue, 11 Oct 2022 07:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC87C10E7E7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 07:55:28 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 a2-20020a5b0ec2000000b006c108ecf390so4087728ybs.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 00:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=r9hdE1ma60AvuVxA5HLJSW2/ZKfSQyXvLxIYq7eW4LQ=;
 b=GK1Ld7Snxtw6fTjzpXViebq+kfUfdvfDmnwHCV5VQCaew+nzUmYh31FH71I8LuTTuP
 Ar2ugsAB59c4cj7rlU/8GrExj0cdhTRc31UiXK4i3ARDbvJ2XxaNCJGOTlgjmRo0I5e4
 plBAm5AeIQL/jC5xlZwm/uzXx87VsSj0UdEi73uOcA4UHFI+fcWuz8Dc2/i+UjLruvj2
 c2RWRKjiZEKfCqoUjV34QpqZXerwEJiqbPAGubElw8f7KjQfdR0zx8O2p/dWNsQiVeYY
 vm8M7uapP7F9yZq9w9TcPebfB8LjQ4aXFX2nvuE3XbTDdhA3GttZaGwrfHQR2Wvu3WaU
 dg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r9hdE1ma60AvuVxA5HLJSW2/ZKfSQyXvLxIYq7eW4LQ=;
 b=uVopJm2GQT7ZemxCJ5x7Hb4eJ02t5ZuxS0q6IMUs+XqexFrKDPEGn9BmN4Q1qSYokK
 Ks7v+nnpBwyqSlGywvNymvjJ0tgcR3GNy1CCGAcK/sw6FKSNSMq5FztueNjhIp9Pme5f
 Csi29xGGbz4WSuc5MbE/bxfNE5T2J9RJKRLgHQ+/zg/PrmxYOfY+Ar6B+3+9dloRMHYF
 Ha928D0vd0/S9QZzmW4J44Y0TAWrtA/WF1be1jEL7fVJNxNdNCi+l/doTA03tbpjXVbQ
 DoY4O7GV7gTEaaPXlkGbrO6RI5Yr2VuRWTXdmEZEDf3KdbT97x+kgJr4gTqbiF1gvnnX
 Q38A==
X-Gm-Message-State: ACrzQf0m793ZHRBIa7LKHm1AVIzI7YmRZS5MdBABV6BPL3MYXvOCeQkV
 LCm3HQGxF7A041vFPO634b15QUH6oSDr
X-Google-Smtp-Source: AMsMyM4AquAT123mEtwqvuKxEJ9kf71pBi3ilDdgVY1MCVJH189FexuumcZnRxDHTRKsb2XAtqTTjkL0eCt4
X-Received: from ezekiel.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:108e])
 (user=shraash job=sendgmr) by 2002:a0d:e581:0:b0:356:cd48:a936 with SMTP id
 o123-20020a0de581000000b00356cd48a936mr20553028ywe.397.1665474927474; Tue, 11
 Oct 2022 00:55:27 -0700 (PDT)
Date: Tue, 11 Oct 2022 13:25:19 +0530
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc2.412.g84df46c1b4-goog
Message-ID: <20221011075519.3111928-1-shraash@google.com>
Subject: [PATCH] drm/msm: Remove redundant check for 'submit'
From: Aashish Sharma <shraash@google.com>
To: Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sean Paul <sean@poorly.run>, Aashish Sharma <shraash@google.com>,
 kernel test robot <lkp@intel.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rectify the below smatch warning:
drivers/gpu/drm/msm/msm_gem_submit.c:963 msm_ioctl_gem_submit() warn:
variable dereferenced before check 'submit'

'submit' is normally error pointer or valid, so remove its NULL
initializer as it's confusing and also remove a redundant check for it's
value.

Signed-off-by: Aashish Sharma <shraash@google.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5599d93ec0d2..74fe1c56cd65 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -706,7 +706,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
 	struct msm_file_private *ctx = file->driver_priv;
-	struct msm_gem_submit *submit = NULL;
+	struct msm_gem_submit *submit;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
@@ -946,8 +946,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		put_unused_fd(out_fence_fd);
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	if (submit)
-		msm_gem_submit_put(submit);
+	msm_gem_submit_put(submit);
 	if (!IS_ERR_OR_NULL(post_deps)) {
 		for (i = 0; i < args->nr_out_syncobjs; ++i) {
 			kfree(post_deps[i].chain);
-- 
2.38.0.rc2.412.g84df46c1b4-goog

