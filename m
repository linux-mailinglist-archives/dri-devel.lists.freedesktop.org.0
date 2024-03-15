Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8133E87C727
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 02:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057EE10FF15;
	Fri, 15 Mar 2024 01:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T5xgvakA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3805D10FDBE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 01:22:42 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-513cc23b93aso1983184e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 18:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710465760; x=1711070560; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
 b=T5xgvakAsMWv+8EjFg9WuomPd+RLgaLJGoQNDPCh2DEQOqAMUZl1hPacS4RbYAk2HI
 VY5kGcYItPHUnyUKURUhF/UfgA0WplvGg60Bc7EjOv26ojqLscCdNMT4TMBASH9YQ5Q0
 5s6b/tVkcEmi9dcIRz4UQH16EgRtpeq+VD8aZr9R5q+WbGnbaGihgPDqDoijO93j8O+v
 4O4hb96sGSrzVXk2VTTJrx5R0EYDERsXm4oN7BVIJdZCQD4m825whSM28kEZlTYXpuOk
 nRl/b8CtpsmFNP/tN/NqUDZ+ukXRSP0Jcd21YCcOU21ItQMX9HBHJlk1+rDUJjylc3+A
 4gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710465760; x=1711070560;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
 b=ulqzBT13o51VAV5CKxlQBUrJ5DHmvfOZyfcOunod0+NQFCi/rqIkHx6YwWxWGT/bqo
 51Drc0pe6AJyarHwJrlDjcTFNtBqshd5m5kEq9LHZb6/iTKIVdodS4sFMyshpHDol+Nb
 hYpH+GoT2EG7iGvliBEzBIOYUJ15hNvGl5Aru4L4d7FJG9htlls+oAVHW+URYgj0ZxnI
 dwtPG0KFx2OtXeVgNuW4WFIoddcKf0dSNM1McgeunI5XJ02P1koug6SVOnYGbZEs+pa3
 fZGqy08iPL8WF8FRJKh0vEO++gFfJ6EjdSWbJpphMguwkLt7yNbsO1plL2YsMVe5Ki40
 pjMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx3h61Dq6gAhz+XwpQ+Zc4DMpbQJ5PffHgTN+WiKuAQ4YXfl9jTnC/5qDI21aNt3qBeXonkpaHmHyi2e/pBd0G13Dp0g1BMFrhupiS2s2o
X-Gm-Message-State: AOJu0YxS98Bb2NAcZ04em/BECBO6DSPAcA6k3vjEVVrxqXDUsYkGsbq8
 pjNHlR99I6pUfyusoX22ZMyrSZpZGruzKAEqYXM+JaFN/XzK/KfnsbpSVejMSbs=
X-Google-Smtp-Source: AGHT+IFtneaGTAZC9+bjGCN7jkSWwII9+oxv6WIqAz4eTX6blLRQmZnKzzdrOySHPQhNFCrcWlptAw==
X-Received: by 2002:a19:6406:0:b0:513:d8e3:fe3d with SMTP id
 y6-20020a196406000000b00513d8e3fe3dmr348905lfb.26.1710465760216; 
 Thu, 14 Mar 2024 18:22:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 m11-20020a19434b000000b00513d6089dc7sm190559lfj.131.2024.03.14.18.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 18:22:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Mar 2024 03:22:34 +0200
Subject: [PATCH RFC v2 1/7] drm/msm/mdp5: add writeback block bases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240315-fd-xml-shipped-v2-1-7cd68ecc4320@linaro.org>
References: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
In-Reply-To: <20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl86Lbu1WTtWJjAFtiellueU8vs3B6gc89KBYKd
 LaVA8f413WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfOi2wAKCRCLPIo+Aiko
 1aQACACn5dtZSR/KdnryXxUSdBpOMw2qv1GtZtUr0sg5jAlDajqmZmzdzktPQ/MFBFJQLIkmD1q
 alPUSIj3GdZj+r453uYlh6P8Ll5SwIrzWgliE/IavUVtp5qvycdt9fYuAV9IaRrxOPTX+0+DCAV
 Q1nF5gXuVOYgo+Z+axf9MN8p8gCCWt94JfDpDY/PiBSYqejz5eufQYXyYEdRwYXf64IBoZK19z4
 b20L6okrQda2g273iDU00maq3RB37QDPkGClKNTYJRteyFH3qskcCOFfA0tm822FQV/AXVn1GDG
 zM/rJ8CGhK6l3KTbpOTK1EPB/SslyvZ9Qe5vwvPUgBdP7ED/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 26c5d8b4ab46..4b988e69fbfc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -69,6 +69,16 @@ struct mdp5_mdp_block {
 	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
 };
 
+struct mdp5_wb_instance {
+	int id;
+	int lm;
+};
+
+struct mdp5_wb_block {
+	MDP5_SUB_BLOCK_DEFINITION;
+	struct mdp5_wb_instance instances[MAX_BASES];
+};
+
 #define MDP5_INTF_NUM_MAX	5
 
 struct mdp5_intf_block {
@@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block pp;
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
+	struct mdp5_wb_block wb;
 	struct mdp5_intf_block intf;
 	struct mdp5_perf_block perf;
 

-- 
2.39.2

