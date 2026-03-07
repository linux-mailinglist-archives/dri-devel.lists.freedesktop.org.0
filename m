Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7MAzAGAIrGkajQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:13:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B21222B5EA
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 12:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A766910E064;
	Sat,  7 Mar 2026 11:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JfIhcCzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6B010E064
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 11:13:30 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2aae146b604so75182015ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Mar 2026 03:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772882010; x=1773486810; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/gabd+hFXfCNsaU4VsDDssNuV3/DePYzj6ege99XJmg=;
 b=JfIhcCzdtriZbQF9KRz4IXnWCE1FGXEs1YY3vQ5TIkiN5Wje5LuwMihvaMa7hMsCTk
 FxZIDNG8RhrvX01lL+ntcy5+FN33frvd5H87RLWwBmSs8j3bE4PHtBhyaP4gjXIHsV/w
 I1Iskulic6Xj/O0WzbqFxaEtzTPlICwb8clf/TOayaQlG1iXWEdZ9LvLrVYG97239SjD
 wUWHaSFxaS5HJ3T5UCDV4py2RTsKMv/fxfAzcOODRQVApBDmVHl7B9iFhsVdRYl3SAUF
 8JXUnXWY7L+C6D7F5e4jQVDuFkWfXc2A4AMECEonI7gVsZajWoOFbH/STJtiqwjf/oA9
 KZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772882010; x=1773486810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/gabd+hFXfCNsaU4VsDDssNuV3/DePYzj6ege99XJmg=;
 b=swjnJ1dTskVU9CNK8rCgB9B97GwMobRdRfhpXhxoZVvpDTWVcOWr9Yay+m8i6R/X2L
 NZATN1FnfwLYTNjEOYKmsVUOF71lDuu2FNNAv7HGDebmNNvqRC4HtmPYq1sFt2zkeLU8
 hi27MFYqtoNb50Bt8AiWntDenCMbcDbHLVm9Pf0ahvwfSH9AdNi+yvKkFsIHZs+Vq45p
 Ie8w2yCMrEugxgzZr7/zSn0dno69KcXZrDjrKrchglSsvxPzJ0haZDD/wn4bXAXuhmbN
 UUtQ0St35SsEYTYXBEgxGa47RZk8Ynh3xVM+SRSAS5Cf1wfFpFIkxkqlQzyGu/c9yliF
 aoDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJb3qZ8yd1sF4nKXeIXygY5Mpg8f/pBJ8DYvfsSys3XQj+29P58zy7BTWWFVGq2Wk2vCO4Q6FO+oA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKUJasrNJt467vne79Vqwxp0vUrOipYZc5FDX49eR9hfgpFgDe
 s/VNKTWzEOaZs6Q3Duy2n22Z+Rq7BaCOgkm7FiOKI3O+uS+Q1noowHPA
X-Gm-Gg: ATEYQzzZIjs9onpMAQEclt7cxY/XDlhF/SEme7fTg8RmOyj0MCvpocvEjMwWtV6dOel
 mNYVz1R8d4GeIX4Y++d4RvrG1EohhBxYwMh+crdeiqu0ClYGBQUMHEn7ySHIP5Drb1Ku9DqMequ
 mRpIz/eF07XJZFGJKw1wexsV60WOdpdJr1F9ZAezT3v55vvVGOjOW1eMNYdwR13BZHE3nsw8HSF
 nTMUzkVgILGsQuwC1jGSUsOM+zxxYxl8wGAnQOf024NGHkxMvZZDKyCc5msqP70wL4U/nl2bGNb
 4VLy1bq8U+jd5wTtIJpnH2rwFx74EwPHMrxDQo1HKp6Mo3Lfqjji9DQEpmA1QHqrKxjGqhPFHtV
 +y4REE94ucv858JPq8W1mBMKGczEMz4sWLSW8gaDtaAK4pjTn5oj/7s0fSshhfTAMBlOdBqD5cc
 ET5/fGxUHru4NhBAH89Q==
X-Received: by 2002:a17:902:ea11:b0:2ae:54ad:6057 with SMTP id
 d9443c01a7336-2ae82476956mr55642665ad.44.1772882010239; 
 Sat, 07 Mar 2026 03:13:30 -0800 (PST)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f74e7bsm47350265ad.46.2026.03.07.03.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:13:29 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/msm/dsi: fix bits_per_pclk
Date: Sat,  7 Mar 2026 19:12:48 +0800
Message-ID: <20260307111250.105772-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Queue-Id: 4B21222B5EA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

mipi_dsi_pixel_format_to_bpp return dst bpp not src bpp, dst bpp may
not be the uncompressed data size. use src bpc * 3 to get src bpp,
this aligns with pclk rate calculation.

Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e8e83ee61e..7c16216e8b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1030,7 +1030,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 */
 		h_total -= hdisplay;
 		if (wide_bus_enabled)
-			bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);
+			bits_per_pclk = dsc->bits_per_component * 3;
 		else
 			bits_per_pclk = 24;
 
-- 
2.53.0

