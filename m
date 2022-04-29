Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3351576D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 23:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6051E10FAC9;
	Fri, 29 Apr 2022 21:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68A910FAC9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 21:53:27 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 4so11957868ljw.11
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 14:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mx96GF5mK2X2Q9SZlgJmIqotjYYuzoJNpzCjKgQvXXc=;
 b=zQM1rexPb+PuCeQE3rGh8yDNn0rfbjhAYBLT/pCtmSftZ+l8negFH45+12uqdbCIq7
 f34QunA7P3tbi4Aj6F5SfdH+TkMNhRqgq8CdqyqgPFwl9hqHQZ7aDS74hCPXut+oQ+i3
 45IP3qxP5JBqEWQYkrdBjSgiB4DST48lDrtg5Th3IAc+pXs4CkrqjruPfX6ITKBkjQxa
 2ER8y2fZR3jsN/0pP7bw6uMwKxUrMSLPWZPM7xcYczbEw5DmzN/0fPvwkoGqX3Ce1qpK
 gwUO8OpBVBBZADCHddKhbknM5suUAADtHI4x/Jt6039iFbzxsJgAZwsJonAX9maOEcbq
 uvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mx96GF5mK2X2Q9SZlgJmIqotjYYuzoJNpzCjKgQvXXc=;
 b=mcH1fVVNnuPxna/ZvBkmIdVpvHG+Kljw/YE2VewqZZ/96Lm1Uun6yWIj3D4j3SmLdy
 dRHCnSUsLYcqV9dAOjosBoE27WJglGsPG5dSKI/ZYC5qtXjaM91c9xVjfL52TJ9Q8pmf
 4iin4k8ui0dmTdzbXp3YwsoX+y3XuFiecN3S6F8xmQKO0pznsTmyWtqi+kV2GTeDopkx
 4qSPe1dbCpwDvH4rPsVYw/14/Zu/2XvsgNmhdE7VgyvTaXQ/+IqlzZ+ssQj7pvVKtJU8
 z2GJk0ZXGotHhW7DW+3T3hLwce091vGBa5sS/9GkGucuTcGTOmla7p1GSaR2+tl52XZO
 KVBQ==
X-Gm-Message-State: AOAM533N22LmHVI8+L41rccw/HIOvy/d0qTwWGLB3P1m73sOcA1Jtv6g
 3J+ntLvQmDaeiUZww0QV7iG1QA==
X-Google-Smtp-Source: ABdhPJxTCMaDPQsKPWv6eVS+a/KAs7Y2FdPT/TsKt8CoWZ8/JPGV9PwjBnt3nTK4XNlR4U+ne07m7Q==
X-Received: by 2002:a2e:b8c3:0:b0:24f:3395:16e8 with SMTP id
 s3-20020a2eb8c3000000b0024f339516e8mr801971ljp.378.1651269206070; 
 Fri, 29 Apr 2022 14:53:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 11-20020ac2568b000000b0047255d21182sm32637lfr.177.2022.04.29.14.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 14:53:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer
Date: Sat, 30 Apr 2022 00:53:24 +0300
Message-Id: <20220429215324.3729441-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the past several releases I have been assisting Rob by writing,
collecting, testing and integrating patches for non-GPU and non-core
parts of MSM DRM driver, while Rob is more interested in improving the
GPU-related part. Let's note this in the MAINTAINERS file.

While we are at it, per Rob's suggestion let's also promote Abhinav
Kumar to M: (as he is actively working on the driver) and switch Sean
Paul to R: (since he isn't doing much on msm these days).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61d9f114c37f..782934f318d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6254,8 +6254,9 @@ F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 
 DRM DRIVER FOR MSM ADRENO GPU
 M:	Rob Clark <robdclark@gmail.com>
-M:	Sean Paul <sean@poorly.run>
-R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
+M:	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+R:	Sean Paul <sean@poorly.run>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	freedreno@lists.freedesktop.org
-- 
2.35.1

