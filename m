Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170E785BBB2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 13:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0692010E23C;
	Tue, 20 Feb 2024 12:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T8su05pB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5982010E36D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 12:17:44 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-511976c126dso6541900e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 04:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708431462; x=1709036262; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8r2SYFf+wyFLMEw10XmrxaTrTxAIalvWxcbpOUr7Ibs=;
 b=T8su05pBcWVadXtxsol5BsaXkajAhJmaigZK/qRV/cyv3o4IIlnp52z0aNDBZ3RHRT
 EPp+P1ixAsFuVsMYMIinFT7nqozoZadvta0XlPBFqVYNsSCIUaMSg5eB+QKoHWBNRcqi
 TdHl0qQf1z9f2TZEp7W7+npsJ76Osipwg/dISgcPfokJLaH6m8QlDRHpvKwyrfRUlWV9
 0EsSf1rmjuHQLh1wro4WylhROsD5zDnYg4RMdYpwQfmB5Gpy6nPZMeHXAhC+iJ95R+Gf
 z4dkSj/nY2ugd8cLC0Z13JuZKDbtQgMr42cgzedrqKPbQdZ+A2yb0OXrcXFTQhMc07uV
 devA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708431462; x=1709036262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8r2SYFf+wyFLMEw10XmrxaTrTxAIalvWxcbpOUr7Ibs=;
 b=d8T8iew8vWatdL2fDFkKE9GW0gnxgJjd9P1p245U64tAUlERnxVqAUHTn9dO50550R
 4wTPx68ov97qTZK1S7bfyuUBuwnFsSxYdzv9AloMhqM2dXvfMr2nFxMpJfVDw9q5RdAY
 ly8xx3iYnysxq3k63MRXyHjHAKmRGzNE86MwqS1l9TvqIUAQVJJ56AnwoZXuH1JVTOS0
 U9qzc5oZ3x1WtXcptJtc9D194QID7pn+pBI3AMKTG+i/ffJvdZSRn3slRXQyCNSnEom4
 OopWYK4oTy43KrVWP7MFJNNbFHfFqQEPhyQX7FRpIizRxKUvT8dhNJwPORfU0XAYMydN
 VyOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrrOw52tRPeLyMvx3QUGGL0VoHSnWozk46bQauz44+zAvTfivLF5+39f+AcwSHerPSvzR0p7Px3ZqMEt7BT+SBrE28akivLL7v7pMxOg7A
X-Gm-Message-State: AOJu0YzYogm8vmkkydhQ88Gvjzx7kScoT+6UT5hk+wcB0sMj/kFrcw/L
 qpFoJENvmIwl5mgDDR4COBkj4pWjnPuzEfKVYLMTMkB4FAc8jQXaub7yN/3nYF4=
X-Google-Smtp-Source: AGHT+IGf8r51dCXj1+wK5mg75SPQ7glqZWJcKUnocWb0PTPPU8gyalRlsJFibifJcfeUhgcCDExbkQ==
X-Received: by 2002:ac2:4835:0:b0:512:b24d:d472 with SMTP id
 21-20020ac24835000000b00512b24dd472mr3390417lft.64.1708431462166; 
 Tue, 20 Feb 2024 04:17:42 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a19a404000000b005117c7159a0sm1251744lfc.169.2024.02.20.04.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 04:17:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm: ci: uprev IGT
Date: Tue, 20 Feb 2024 14:17:41 +0200
Message-Id: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Bump IGT revision to pick up Rob Clark's fixes for the msm driver:

- msm_submit@invalid-duplicate-bo-submit,Fail

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 8b82e6656924..47e567b4f7a7 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
+  IGT_VERSION: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
-- 
2.39.2

