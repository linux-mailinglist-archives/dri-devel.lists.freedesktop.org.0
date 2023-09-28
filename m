Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B77B1B32
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09CE10E622;
	Thu, 28 Sep 2023 11:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4E810E056
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:35:39 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50307759b65so20757483e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 04:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695900937; x=1696505737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+25IDQ76KUI1/7TueTvDQOk2w9Kir7V1RtvH4IZRvA0=;
 b=eUAQ7NPe5yz3/EYPEuAnVaimmLZ0BDy6wOik6fl1FOwvf1lbqaKwuPUtwcRnDQoQ5f
 xfW3JlnLMjIHKXNFtPYyZNLspb0tVWtPRQVz9d0LYZx7QT1cEkx/B52bFTAtXJfwvlTw
 twctI1Lz7v+8P3rnIjbnXdRwgAVN8PQZ/GUc7+H4ukDNQ750Ui5hS+oYbXi6XZ/AbyGT
 G+UebmJce8NA3nyFXag4hnWvbk1YLCx6q2AcgCNra7lZhqI0aaHW9aPOZ1I3uTToO2hu
 x/Bn617ufuSnEMH/VuGCUxqBQqSx5p5jZQba+GB/xBhVpibSo7hGz8502NUKnCjLgyus
 EcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695900937; x=1696505737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+25IDQ76KUI1/7TueTvDQOk2w9Kir7V1RtvH4IZRvA0=;
 b=HXNszdmmaffUAJClLc/sX+TS71SeKxCBSsnaA/IYfMshWipxZf3ZW02ob0/3km9ra7
 YHvRnFMI0kM8xkOx3ICUoBRPVkwPHtlDGqeXMDluV2nA5qW2Ra0MSXHDXpsY8Cly25LB
 g2LGsFPORXP5Ti/PLtux+Y69DtBYMvnzuzvuupGsz+nEgct738t0fRGXPCBFkWdoqW8u
 F8f8UuDUzqST/lNQgop+UvElHJUJofSVEkcVidyQdmWhx26fWitreypGanhulxybCqTj
 wjbVZymVlQt5bixvq8a/61/7tV/eM3nCD50WR+AOompelV+rZVJxotpadllZ6dPgfFvc
 N8Gw==
X-Gm-Message-State: AOJu0Yy02KGMojJDO+1O5+OPfE9VCo2+HgfQFOYAYlktoKRUERppbiRY
 v5vB/6btVah2HGHZOKkj8iigAA==
X-Google-Smtp-Source: AGHT+IF358+CPVuR9KqvfUAb9TMd2gvka7EXkUCLd+mlbdkUKYsBpovqFKKaWZK3Ok0fmpH0gsrUeg==
X-Received: by 2002:a05:6512:b8e:b0:503:5e1:9b6e with SMTP id
 b14-20020a0565120b8e00b0050305e19b6emr1083041lfv.10.1695900937660; 
 Thu, 28 Sep 2023 04:35:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:35:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 1/6] Linux 6.6-rc2
Date: Thu, 28 Sep 2023 14:35:30 +0300
Message-Id: <20230928113535.1217613-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Linus Torvalds <torvalds@linux-foundation.org>

---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ceb23eed4dce..57698d048e2c 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 6
 SUBLEVEL = 0
-EXTRAVERSION = -rc1
+EXTRAVERSION = -rc2
 NAME = Hurr durr I'ma ninja sloth
 
 # *DOCUMENTATION*
-- 
2.39.2

