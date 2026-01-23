Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHOcJFS2c2liyAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:56:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B607942C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284DB10EB78;
	Fri, 23 Jan 2026 17:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J85Xk17s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76C810EB5F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:37:45 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-81dab89f286so1260756b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 08:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769186265; x=1769791065; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CIf/jUCjzdJFezTzX6UtWeIusC7XBhWXZ9HJ+kURBZI=;
 b=J85Xk17suUgcIthFdEf0le2+rkfYJU3OV7FPGIyz3e90Hk740/DUFFFPY3AVuBaRn7
 d5QNzf1Xzy8aaQKH/VTTDbVzgfSpZkcTsLvbOYj0eWWVGM2u+BKRTTkZNibWKOrM/XoW
 T5DOAEddBWfjsOJNM6zpVjIm5kE0I8omcYaoLup8pxqJVLcedLyAg3DPKuie/YYBrmth
 y6KaITaEQ/3k3/wtP7bg4kbLBmEwe8WwJ/sR2lYamHUC/GUe4631WKZi6y5ZrtQcNSTA
 ozMShXz42afpOW1Ep5DiqPIorjgzCXhN4+e+NMMwwmaYEHzzbHdHpudfKUBvXhPDIJnX
 fl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769186265; x=1769791065;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CIf/jUCjzdJFezTzX6UtWeIusC7XBhWXZ9HJ+kURBZI=;
 b=cRP0ktuYqqaGkrjETtNwC3awOLB/FDYOzynUmj3jH0kbp4dg27r6DQNr+XXRauumQv
 BCM9b8P0XUwApUGk8NJZdrZDFzAExH3uSbuTcu6sTlUoMATCuidc0srERhsCVyWjg/Fl
 eaFqWbNrEWJXeJ/hOBT+Crs9TM9dvRyW4fd0LYWGP7AiVjn/BfzBcK1TblK242fxzphw
 lQvGm+W6YZTUPsSAptxSjWji/CqKE0+oc0NwQ2Mee9+ktxOXJmZE5cBoNXyuB96D22h+
 kummXQQYTqsVuto2vc6+TI+cYlOkkvZhRz/wbjgdbkkCwyBjLw1q5J3GU0atg7P0Jv7o
 2t+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzc3YTHAAwJETwRJjnvfNkD9gSsCe7caqeEFTC8LC2SGaiCRY+nV3AFyKNdoph9aXFBjzQH6qnAK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydqbm6Vqmmd1JGZVgGBhkrtFBCpd/ANypGW4VCsAjX9opNeDBk
 IbmMHqL/OPO3iCNQhfNO69V8SK0X7xG+LuGEfFVt6o4/TLkIMRlldYXG
X-Gm-Gg: AZuq6aI5XxE2RuLyw/jpMuu3JhSQs8mKNtMWzGLf8meEkwpsqgEVFixKMZc3rd1iscr
 XnHYm7O89e/yzGiEPabpUE6fD2JmbV+EeTuSZqUHR9jN25E78hzhcTV1Oa44U9W//pnDCdNzsYR
 3FJoXlmebGx2t9RcfQdfJg0WRrHwPuqoFftvBCAGIyucNz202KPN9mboRBCydijI0NQGTnOWjCw
 XaOlsLHBO3A2KU4kc/SD9z4SM6NME8t/1opV1920+vNzagQE+Y57PGhp8ImBjdjuwF1MbyNOv53
 uLP24/XYZV1Nun3Hy6WE1VFDUBzKOd1h3guKHen9SlTI36TT2q+tB+d4ThdJVCkAlDKKVIspip4
 GMTzGBjpk+yH0jbHXeE77TVi2PA4pUHE+Hpd9R1LDY7TRwRObh8L2j+I5MRip/9LphlbU5JNBFB
 6z7Uf8xHw8+xcYvylUdvyReMC8aOFGRkxzvg==
X-Received: by 2002:a17:90b:3a4f:b0:32e:3829:a71c with SMTP id
 98e67ed59e1d1-35367603595mr3147765a91.16.1769186265087; 
 Fri, 23 Jan 2026 08:37:45 -0800 (PST)
Received: from junjungu-PC.localdomain ([223.166.246.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3536dc506d0sm2491488a91.13.2026.01.23.08.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 08:37:44 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 00:37:38 +0800
Subject: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
X-B4-Tracking: v=1; b=H4sIANGjc2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNj3USzior49IJS3eSkZANL05SkVBMjYyWg8oKi1LTMCrBR0bG1tQA
 maabFWgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769186260; l=2013;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=XfgJbaJiD7FxrM45vwdfh7MDrURrJgbbrXbkXomT15U=;
 b=1+ZDVPOWVZlNST7+6jBAwaq3yRNaG1fjeNiRT/YcLb0Up78CXWFfBx8flp4p8vEci2TmwVfJO
 XI5Grri2JkUDp+6hfSBPACgFGrn8F9tDYJCXBa1wH/o+/Vu5zKokf3w
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Mailman-Approved-At: Fri, 23 Jan 2026 17:56:31 +0000
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.963];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D7B607942C
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..0bc518d9fd65 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	struct device_node *node;
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->registers = NULL;
 
 	/* Check if there is a GMU phandle and set it up */
-	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
+	struct device_node *node __free(device_node) =
+		of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
 	/* FIXME: How do we gracefully handle this? */
 	BUG_ON(!node);
 
@@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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

