Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0767C7E75
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 09:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE7910E5D6;
	Fri, 13 Oct 2023 07:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE59C10E5BE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 07:17:14 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-405417465aaso19089705e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 00:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697181433; x=1697786233; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kWaFz4n8BLo1UJoI34jBeJHgdxXO/CE+i3BR2uQsDEA=;
 b=mexGIOP3yXqEjPuEKFJbb1ir4146HS+9GCUh02YmBx1eQJmCC/EM7d2W7pR2SN9xRH
 s4TM7Gk/i17bBFvVSaC5X/Q4ug0DNocnKUAiScrXkNylhNk2/B54oNb/pGUMrPB/2b3Y
 xWcOCcQCmXFQ7llpyYpQiTR5kAFVo0NWFwpcUat2B/RPBkXvfPwzf5/6J3GvknXpUj3N
 0+ZmDKLzZdIQ5WLdJOKMCk0nFmdudp5jGV2M9YRU/XBmoC6uwCmn2oPPTSXKgfmQdNJu
 I5IExFMIzU5aHeVg+zf4OCQzD/uTNXXhErwqgkykn1mzYgOsuhrUbk+4g0Zm3skdMFs5
 bj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697181433; x=1697786233;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kWaFz4n8BLo1UJoI34jBeJHgdxXO/CE+i3BR2uQsDEA=;
 b=a6R0uO9+LdX37v66xNg02XQ0B4vVYtR/KEWFUB+nVpWwa94GK1AHW0nxEt9GSurwV3
 FiEl1MwGP4Uk7gGK5RxkKYTXRaERt49RAb0ZiBjb6lB+SJQS/OXQkP6q5gP5J+/83sTU
 Q0EcUro9dBbzr6J6LWQzMzjcGL0MLyWMrDosgXkPjKJmScrAa7bTGc9X+DkzWUHxzq7Q
 mtO/gftB+iBOob+5oXV3cML+wir6EVjDnfe0WscOxU7TVtVPpwJ+XKiS+6beI5oNpO+Z
 IbShNtU1/ROz4tZh+AXm7Ncft3hxF4R7UNm+/Mq6IRPh/CvGYK0BR8sioLDZJ5faXF20
 sXrA==
X-Gm-Message-State: AOJu0Yx8f7vbyCatTgZp5lPV/OW3JSa6PDAxbdkx4HLve516oomggtYv
 xoz9XpMH5I2EgMuK7r3hIub0CQ==
X-Google-Smtp-Source: AGHT+IEMChUF1nF5n5VUZpjuNffyhQxqCtCzn921jYAb9ji1wXEYdUyTy8LrYKKnYNgqSRFV3TqNLg==
X-Received: by 2002:a1c:7c0a:0:b0:405:39c1:a98b with SMTP id
 x10-20020a1c7c0a000000b0040539c1a98bmr22624232wmc.20.1697181433171; 
 Fri, 13 Oct 2023 00:17:13 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 y11-20020a05600c20cb00b0040531f5c51asm1751016wmm.5.2023.10.13.00.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:17:12 -0700 (PDT)
Date: Fri, 13 Oct 2023 10:17:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm: remove unnecessary NULL check
Message-ID: <5de18b71-c3db-4820-b35e-262b4cac35fc@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: freedreno@lists.freedesktop.org, Su Hui <suhui@nfschina.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This NULL check was required when it was added, but we shuffled the code
around in commit 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation
to the _probe function") and now it's not.  The inconsistent NULL
checking triggers a Smatch warning:

    drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
    variable dereferenced before check 'mdp5_kms' (see line 782)

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 11d9fc2c6bf5..ec933d597e20 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -844,8 +844,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 
 	return 0;
 fail:
-	if (mdp5_kms)
-		mdp5_destroy(mdp5_kms);
+	mdp5_destroy(mdp5_kms);
 	return ret;
 }
 
-- 
2.39.2

