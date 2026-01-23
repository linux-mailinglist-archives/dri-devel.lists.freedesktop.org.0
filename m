Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BtonHb/qc2llzgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:40:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF817AF3A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 22:40:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A25E10EBDD;
	Fri, 23 Jan 2026 21:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pzu4ZNdw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9485A10EBDD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 21:40:10 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-5f526c39718so2699432137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 13:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769204409; x=1769809209; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xOKBsrYlyb9CGTosX89C67uibLCQdicC5e/4vrZsIig=;
 b=Pzu4ZNdwSaELNK9CUHaiH5ZDNcqBdtFEFsDpIwlGwtYQLsGBP6Hu8M27k9U0JUf3zz
 wu/sdENRZtGqV96uBoQDC2Nh5YqWRmrZ5EVkbfGl66ouOQDltSn6nTQfr6J/9dHJ2kjC
 bX5NmbVGIt+Rtu+O+7LA5+IrpS3vsusRYPA5L2JB5awa4bpI7jwfhWsy3kuf5+FWhhyx
 57m2uj6QE6GS09IISzH0dRQbP6jRGh8W2IoFxBZe6qQnlLg963Y5WErRJrZfTmY5vt9X
 MmZdbfgn2HRz7GDG/Cm9Y+GuxePySZvQFZY8eOAerlKo1H8vOw/WSlZgUdRJqi0DJbyL
 35vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769204409; x=1769809209;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOKBsrYlyb9CGTosX89C67uibLCQdicC5e/4vrZsIig=;
 b=S7Fhp4ysOGrxIgYq+CEhWUVLF1BqlO/rZA5K7GUQzZzaNrwt1YZJhraTx9QqbKfKmL
 QUio6dn/QbjCiKR9UXIQoKjw4G/AoZYqReEj8iWyOZ9MOq74xzgBed+8yzolkFC0RIg9
 BJiAiiMRR1ngSxOf4vPHfS1BU5v4mp8yDi8zhqQUcb5NNESo6LWcKDjFs4IsvrH2g4H2
 bSs+3tnEHsp3vSRw1aHQAGzanU6PpP+hYuPpyhb2NtZmf76MEncYtq5kvhDo+zSEXy8U
 99kUz3ZtskpqHq6NV2HJl5PKC+8ApgLDhWuE4uZs2Y8I2j1/g7X+VvFpwcXZZE5heroL
 Vzfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhDxrWw/GwCvb/o90feHDaybz5NcirdeRzKCo6LMGiAbFmmjxkvKQToiY3v5cxyBi0cpp80dNN7Mw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuN3luIOO4D9VUMJj1woWKWZnnlsOHQQfGAE9ier+KDZzhtaLU
 yC/BTaMN5jNCLH9+Qbao9PMUx4mQTwddp+796PJJrBxXsDD9lxjEnGygRtckoMCh51g=
X-Gm-Gg: AZuq6aIlncQoatwMdxcM96uQadGrMCrvw9f4r6MMYgUrBYWX3D7/M93MFAvl6tIPjrU
 j78fXC2JsLZOuoNEMzYLc18eVH2YWq4kw+0+7/YH1Y/QuMZW2kZmZ6zGTif1oF6PhjvyZtXb3Zf
 w7bP6VZXDOV4ssXuJL++zGPzUaAdKmh8gV2A20B+xvTy8aE0WH4gw6IWhH+mMhK93p/dOeuRIWO
 dxONpuRpvMSMImfxg2sqpEXaat64SpuOxkm3kE7xgP9nBYpq3zpuQU7g+fvQGLqqSGwflvKOiKR
 HWBynqOhnpqH1dcYBX+zcQ9MK5TTaLCLn8q+KATQnJ3Ev6PbkxTqoSxAqIB9hQHOCEAY9oxgXii
 ChQA0V9f6HhOYFhAjo32gOsLzcqfB/g516OiZAPgxI38c7x7heF9MrhruTWnCTM85paQy2KPCbN
 PAVPSccRHYJjQCnFUus16WwduX
X-Received: by 2002:a17:90b:6c3:b0:34c:3cbc:db8e with SMTP id
 98e67ed59e1d1-35368b45324mr3047519a91.25.1769196870985; 
 Fri, 23 Jan 2026 11:34:30 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3536d8b8f7bsm2731215a91.6.2026.01.23.11.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 11:34:30 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 03:34:23 +0800
Subject: [PATCH v2] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD7Nc2kC/0XMSwrCMBSF4a2UOzaSpLWoo+5DiuTdC7YpiYZIy
 d6NBXH4Hw7fBtEENBGuzQbBJIzolxr80ICaxOIMQV0bOOU9Zbwlos/57tYXUVLRy0lL0/EW6n0
 NxmLeqdtYe8L49OG9y4l91x/S/ZHECCNWUHWWXCsr2eBmgY+j8jOMpZQPzZC/r6AAAAA=
X-Change-ID: 20260123-a6xx_gpu-cbc095dbe423
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769196866; l=2364;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=yrXNODIr7BomkmwbFTfdc1dmWE/M85IjDSwFYcpA9YY=;
 b=JgU/mPDrjPcXojazLX4qDQiHBhnqfv8QLohkDcjKBfaKWjkBRHhGiwsK40juItBCsPTUMbGsj
 /xEXYoqT0yDCiLEQMLR3tJNMRtRSyCbYJcmWJmFa90fSMpi9ncOKNJb
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.971];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CCF817AF3A
X-Rspamd-Action: no action

In a6xx_gpu_init(), node is obtained via of_parse_phandle().
While there was a manual of_node_put() at the end of the
common path, several early error returns would bypass this call,
resulting in a reference leak.
Fix this by using the __free(device_node) cleanup handler to
release the reference when the variable goes out of scope.

Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Explicitly add header file.
- Link to v1: https://lore.kernel.org/r/20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..604b0f861d27 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -9,6 +9,7 @@
 #include "a6xx_gmu.xml.h"
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/devfreq.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_domain.h>
@@ -2640,7 +2641,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	struct device_node *node;
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -2660,7 +2660,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->registers = NULL;
 
 	/* Check if there is a GMU phandle and set it up */
-	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
+	struct device_node *node __free(device_node) =
+		of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
 	/* FIXME: How do we gracefully handle this? */
 	BUG_ON(!node);
 
@@ -2702,7 +2703,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
 	else
 		ret = a6xx_gmu_init(a6xx_gpu, node);
-	of_node_put(node);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);

---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260123-a6xx_gpu-cbc095dbe423

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

