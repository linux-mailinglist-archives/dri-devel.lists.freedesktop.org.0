Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D5041F27C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 18:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9F36EE22;
	Fri,  1 Oct 2021 16:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2499F6E536
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 16:50:16 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id i25so41082184lfg.6
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OcDaHRV/tjWeyeiN9VlvL1Q2iTbW4zlPJr4vNhrwq8o=;
 b=FVF0sfSKYeZBR/hXFab/Kh6eEXZIYprLtC2+EqzHRgiYAkv/DZJJPFgXFtQgwdC8yc
 J0sY6n295P7Eckysy7o2iyUw/5MnFw4G114YXHGCoz3vBSAV+HXyreupsG3Y5m8L9Xlt
 xM+/n913FMmbY8+2LhyeG5YypVYqmv1w/nNh7k+nuqnpEwgPdz6MncJD9MGRoENJ6yor
 hh9nMV5WCu+ZeOvlYN6xozmMCkGKhq6Y6RpQG9G6jTgDTqjtHZ72m7JVWHgBAMTYadDU
 Cf48FqDjCyLhVbTByAXlfCluXqN2gM8Y4pQrr6AzgcCrNV9d715KAdLRgSMxyWefcMH8
 rn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OcDaHRV/tjWeyeiN9VlvL1Q2iTbW4zlPJr4vNhrwq8o=;
 b=lRza8h0hCSlcv53rmfTCs3gAnfB1aLCUCpKRXeJ5M8A+QAKTBzwjkWXd1rCSB1arGS
 6pjdwgj1UPxa9Y3vqLerzE2V6+L+t8gNLu/cNLDb2Sln3ER46L6nyiR03xyrVtr4zXa0
 XpuLSlwpc2P7JEVAgm4cN04Tzp81+wcp9v+tsKHsn/IjYhjYBM7MGsdaRKE5nILRbERE
 ooeI99Heq+AgG6zM0iAfQbR3nNKJ3g9azY5w1I/LB+zKZL8IN5lgZVVTNOjHmNDgvpzh
 EY8haiSg5vdjU5idPEFuIjxYGYN9qG/vSYH6OLMFS7Ye+b38CnuavYT9L+q39YMBUX5b
 VU9g==
X-Gm-Message-State: AOAM533ChoXpklqT1NEItcTkPy/yJO2TgdwLIbWJ/4+4nS3DETzxQqtx
 b4C0FHC2nUf2lpl5rb9L8vri2A==
X-Google-Smtp-Source: ABdhPJxoAiaTqyz2HiFJjIUaNIq+pbkkOYn+C0oxcnZQqalqK4MyOk6/7UkYb6cYNSF9FCUy4wBj4g==
X-Received: by 2002:a05:6512:3d05:: with SMTP id
 d5mr6467979lfv.78.1633107015147; 
 Fri, 01 Oct 2021 09:50:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n24sm787052lfq.294.2021.10.01.09.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 09:50:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/mdp5: drop eDP support
Date: Fri,  1 Oct 2021 19:50:09 +0300
Message-Id: <20211001165011.441945-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
References: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
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

Prepare for removing old eDP support present in 8x74/8x84 SoC families.
No devices present in mainline support eDP ports.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index b3b42672b2d4..21707fcd883d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -376,22 +376,7 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 
 	switch (intf->type) {
 	case INTF_eDP:
-		if (!priv->edp)
-			break;
-
-		ctl = mdp5_ctlm_request(ctlm, intf->num);
-		if (!ctl) {
-			ret = -EINVAL;
-			break;
-		}
-
-		encoder = construct_encoder(mdp5_kms, intf, ctl);
-		if (IS_ERR(encoder)) {
-			ret = PTR_ERR(encoder);
-			break;
-		}
-
-		ret = msm_edp_modeset_init(priv->edp, dev, encoder);
+		DRM_DEV_INFO(dev->dev, "Skipping eDP interface %d\n", intf->num);
 		break;
 	case INTF_HDMI:
 		if (!priv->hdmi)
-- 
2.33.0

