Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DF551523E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 19:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2613910EEB9;
	Fri, 29 Apr 2022 17:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073E810EEAE
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 17:31:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x33so15306501lfu.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 10:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N0kkFtjr8AAODbzY6xXTEuPCKSjxOceWVMdgDTFE29s=;
 b=mgIC9mziFYsMyFAHOYErUONAUawV3Zg6+lF8pT/M6IY7fvSpudmNbt4xMfL1Vd2RZx
 GRbqYgrUPkpUb1qIgmFCl6xJfsXc+8QBV/bZoVyuCFU9lyvOvItgw59wlPOkLOyEx1eF
 NBBZ6U0kEq0EsOP1AclJls1dMXQKtiyFRh/C0aj18X2kqqSZfC5FI+dlQF6XC7Lnst0D
 GVthXsYt+FAc9t+OJroj/dn/jrsfrIz35QU/yHkVBuNOUt7r5YqIBqhYCUWp2leSjIGF
 AXZ0AZePI0Yg/9Yp6om1xQ5NmkFLw6YKQZQtDp/u5C92+dDSXqKCEwCSytQZPNLzqGNl
 2jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N0kkFtjr8AAODbzY6xXTEuPCKSjxOceWVMdgDTFE29s=;
 b=oGURKe0H2B/mRvmp1lnkko/+tBO3pb2+DQ6YSP48g7JU0sl6280TujqHQzcz7d5E7T
 PD6B3dZRyS8X4tI39lke9Ffom90Lqvk1Uww3nI4Uz5zhgJCFsa1T+MfrIlZOGAX/+OMn
 TkCerVuuWwh60MeWuMwS3QSDuDh3YLQAyL1dYqXhUOaZuP5axfaQFXzHAsqc5zWuHasg
 3hKylG8XdngPHLrhsu6ZiNnSNsxb+bbWE/GHV7Y4SYI4LgvXaHMmDgN4olkIidLVHUHR
 MgBTghPRFh5l4s4EYfnnf6FA7Du9WSb405GufcZGkDL+jMKWBs2zW1tI6JLc8+nvg5hc
 Er0g==
X-Gm-Message-State: AOAM533ySCjwuPuHfyirxvyVLQkK67E1Y4i285K3XDSiXcjjevcmatv3
 s/nMyximcUckokT7FEcNJo20WA==
X-Google-Smtp-Source: ABdhPJw8gix5aeuUfeN7PkSk0yv5kUFc9OzEkRCT9VAiDCM3AZPANunBQCFwT38GwbnX95LzdG/twg==
X-Received: by 2002:a05:6512:3052:b0:472:7f8:f344 with SMTP id
 b18-20020a056512305200b0047207f8f344mr222161lfb.380.1651253513254; 
 Fri, 29 Apr 2022 10:31:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h7-20020ac24d27000000b004720819b691sm284731lfk.130.2022.04.29.10.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 10:31:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer
Date: Fri, 29 Apr 2022 20:31:51 +0300
Message-Id: <20220429173151.3645415-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61d9f114c37f..3d7c7d6b0346 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6255,6 +6255,7 @@ F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 DRM DRIVER FOR MSM ADRENO GPU
 M:	Rob Clark <robdclark@gmail.com>
 M:	Sean Paul <sean@poorly.run>
+M:	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
-- 
2.35.1

