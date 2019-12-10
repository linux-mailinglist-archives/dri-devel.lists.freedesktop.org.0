Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF285119F1E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 00:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC556E15C;
	Tue, 10 Dec 2019 23:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DB76E15C;
 Tue, 10 Dec 2019 23:12:02 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id b79so9347108vsd.9;
 Tue, 10 Dec 2019 15:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gaG7NzmAUWMeK+pPbhmsiioZEJ7ynwhRDyo6afhSaL0=;
 b=SXY0dPujgj/4oXoCSUm/ID+Rm0gNCbCmkX47U2Z65Bz8dF6iFHcYFMflsfqy9/XMCa
 VPF0nCN6m/sJNpM6Nm8T4dOWQPHdqCj9c225PTl7tRbA0gBTxP3xDnwnFmQqqBK4nLos
 rgbJgnSgrL6nxNQi2cgjX4RUKGcCMkpPtcJOg0TBSN+C2A1zllRdg5GNot690AOYpk+Z
 3Hgi3wzctjryWa71MH5UOBc2SqBJqh+wHJodxDeton9gHw65+t84JTA1/7wy21UkmUf6
 CAmH3rcDLMUtqVBVx0QpVA0hVPTq6x6KASKA5FHWdqir1vW7T5pKVHlyVsptvRLIMfbS
 FZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gaG7NzmAUWMeK+pPbhmsiioZEJ7ynwhRDyo6afhSaL0=;
 b=p00Tz+xptVIwWGcLmLflb41EGnchi9heL0UG6kBWyC+FTL95XtqoN9qSISwGS+bzst
 D+aVITqHXgUARLNQ7MWSFdEW9B8IebDCFPcUbxT0+7+PBpwfCqEEioS/EAssc2ba3U0O
 +WCfjOH/qjEASREzTNtKoX23hZPlQRLL2YLxu4CE/pZP3XPsM0pKEeXgNYXOXQR3lx9o
 or6AzEYmA3kiU3zlKvYs51dOyls24gYtfqOG8iWqLK4m14wiBAXiDITXryxxqhcdXa8B
 JBqJQldMrbjrJmsr/Pzqa3Oy7E82v+neqWAowmrKeqx0yEV9/poejpYLelOiLgzVoz17
 FTrg==
X-Gm-Message-State: APjAAAWd+ZfConEVKPuN9VR87TuWrWknZkPNcES6/Qn57vqi9Ypeckmr
 eYCyAaRUTwkoW8Lw+sfXmEM=
X-Google-Smtp-Source: APXvYqySIhE1d01pjdaN+sP20E10EZaXTP2I3SUSuAL1Tot/xLHhDni6mv7dS0dxnpAhWUQJXjCdtA==
X-Received: by 2002:a05:6102:3d5:: with SMTP id
 n21mr151558vsq.26.1576019521116; 
 Tue, 10 Dec 2019 15:12:01 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([2804:14c:482:5bb::1])
 by smtp.gmail.com with ESMTPSA id 41sm171892uaf.8.2019.12.10.15.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 15:12:00 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH RESEND] drm/msm/adreno: Do not print error on "qcom,
 gpu-pwrlevels" absence
Date: Tue, 10 Dec 2019 20:11:45 -0300
Message-Id: <20191210231145.24838-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: jonathan@marek.ca, jeffrey.l.hugo@gmail.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Booting the adreno driver on a imx53 board leads to the following
error message:

adreno 30000000.gpu: [drm:adreno_gpu_init] *ERROR* Could not find the GPU powerlevels

As the "qcom,gpu-pwrlevels" property is optional and never present on
i.MX5, turn the message into debug level instead.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
Trying once again :-)

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0783e4b5486a..5d7bdb4c83cc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -826,7 +826,7 @@ static int adreno_get_legacy_pwrlevels(struct device *dev)
 
 	node = of_get_compatible_child(dev->of_node, "qcom,gpu-pwrlevels");
 	if (!node) {
-		DRM_DEV_ERROR(dev, "Could not find the GPU powerlevels\n");
+		DRM_DEV_DEBUG(dev, "Could not find the GPU powerlevels\n");
 		return -ENXIO;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
