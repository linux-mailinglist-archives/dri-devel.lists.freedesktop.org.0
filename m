Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H1mE9OdqmlLUgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:26:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D335321DE40
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEE510ECB5;
	Fri,  6 Mar 2026 09:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bxXPm8M+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9438D10ECB5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:26:38 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2ae46b9c70dso23106445ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 01:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772789197; x=1773393997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GASaaeIc7bq6+Q3h14hRV19dPYKwOXv/nhaVWKzPPQc=;
 b=bxXPm8M+KPW3IQVI+WoLh99GtIMT9Y9kLchj4LFfhx8nLPq4rXVWbQFweyk0AwGdKK
 j+itoUsKsZjaV/rJH8WNG/VtU0+IrHE9e5CP22dwksT7N5czIt2RmA/8soEceDKdyHs/
 MBo9WlLmcmcwZ85xgrpqw4jWLiQai2JlFXLFIp+r8L00BBgpzvBL2997gWbs4OXZ3yOF
 x5vMqFkfyGwh2alPQ1NrQorihrAfsJisYoQsF081xFZ24qL5dp3vsKhdjoglPH8lgIj+
 t8G09F249QRdZELA18usFoykX49JNQY9vDaAK4fOtydIapnVLg7kqX42NrpxHZ+i2+G+
 4Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789197; x=1773393997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GASaaeIc7bq6+Q3h14hRV19dPYKwOXv/nhaVWKzPPQc=;
 b=sP4yzRnSGB9gURbyZwnUkA/8LkkLy+I3/y5iWBSu+mqaAJhxo1d6TWewEm2DHBcxP8
 xeHcSslTULUDB/pVlrT2IJD/EdQCIyAUbS9vMv3ykhnYiddho6A06E78jgFotf5Rc5w6
 VDnjPsTJdVw42OZbgmQreIbrVI4vQlgyG8ignWB2iin/E/qRT6pPjM765jTj6paemgT+
 ZZ6TTFzNCVPs+OOXhTcNwkSP48nHzA6JoOhScnVVuv7xqDUETMaMnq5K6p9PHk7CMnqY
 +rs9P95RriWakgXU2Qvp+bCEeqSmbyx0XXbH2buF1I6MD3/mKfOEgDxdskNhvzihNFMZ
 uJXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB557Cft4QefMZB745Wig09hvHZjqbe4G0DM1MrqfbtaR/InqiG8e0SlSqlHCho+R4M7XX4utl34c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxjyn/GnJFvxkMS1hnAXNzlQF1h2wbjmeYV2hcNXKCE3pJU0g+f
 1nayWKhvQk74HMH/njXiDba6dMaJb43UoOeL4ZHmqaPPqDv8N4ekDYqM
X-Gm-Gg: ATEYQzzUWeilvIjHUz4ZYDU15ai0RUFedhpY6fwa4p2b6OtbR1sMoRgMalBDquduTca
 5FQv1jOVPiEA1O+6tO16pSu6GrmaBRKKrZeHbjSAjlpWcN6Z7nJKtkzpqUEPVcf/DzQIT6VU8pV
 t0O7Kr3zKWOFduqcze1S6Xt5eMvZkGks5tmxkeVMECeQ+RH0RLCAgIiB7SCgDXkm53IyfWNoAMz
 urEYrxKT0l3bWWsaVi7ZuQ4Mjz//SFnGBdiRn6b9Y5ksudBkFY3j3Mm4otFnhXMYGctZieoOYhZ
 ilUQG4t34QvMYtkS0HhCgZQ5Ttk5KMFj+eoBM77fCWO9y1O3dFklGvcrOqUGZkklu4DN2084wYr
 ecgYeZ3IY/Q6XD/SiX5Yks9PunJ1UP+HPdHt6qjqn0U5QZPG77rE1YAVaQwRiu+cTT4K5D+QHo1
 6UmoLN6ryBxfjZWvGAAw==
X-Received: by 2002:a17:902:d501:b0:2ae:6163:345d with SMTP id
 d9443c01a7336-2ae75b4e528mr47926475ad.12.1772789197338; 
 Fri, 06 Mar 2026 01:26:37 -0800 (PST)
Received: from nuvole ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83e57afesm13214405ad.6.2026.03.06.01.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 01:26:37 -0800 (PST)
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
Subject: [PATCH] drm/msm/dsi: setup RC model properly
Date: Fri,  6 Mar 2026 17:25:53 +0800
Message-ID: <20260306092553.37973-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: D335321DE40
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Using incorrect parameters does not seem to affect the display, but we
should use the correct in accordance with the DSC 1.1 or 1.2.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 31 +++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b60b26ddb0..276c63d2ac 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1843,10 +1843,35 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 	drm_dsc_set_const_params(dsc);
 	drm_dsc_set_rc_buf_thresh(dsc);
 
-	/* DPU supports only pre-SCR panels */
-	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
+	if (dsc->dsc_version_major != 1) {
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "Unsupported DSC version: %x.%x\n",
+			      dsc->dsc_version_major, dsc->dsc_version_minor);
+		return -EOPNOTSUPP;
+	}
+
+	switch (dsc->dsc_version_minor) {
+	case 1:
+		/*
+		 * For DSC1.1. the upstream lacks SCR parameters, the downstream
+		 * parameters are unverified here, we support pre-SCR only.
+		 */
+		ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
+		break;
+	case 2:
+		if (dsc->native_422)
+			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_422);
+		else if (dsc->native_420)
+			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_420);
+		else
+			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_444);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
 	if (ret) {
-		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters for DSC version: %x.%x\n",
+			      dsc->dsc_version_major, dsc->dsc_version_minor);
 		return ret;
 	}
 
-- 
2.53.0

