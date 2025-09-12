Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6844B56090
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 13:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A14A10E12F;
	Sat, 13 Sep 2025 11:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NUqBS4Ib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C6910E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 16:42:44 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3e7643b0ab4so1222102f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757695363; x=1758300163; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O2gnDI76Cg2pQY4d+7l+CRi3OFLEEk/WHj+p8hJRcSw=;
 b=NUqBS4IbDQTt6ZnaCEDLKjgafohCPDEDfnV2YkiRnUpxvnxn+vdvtYM3RzR8h2VEQa
 CmcHOOmR8OGEyPriyC0oxNBZjtzI5RkYJYcTdhX5qiW5UoDTdvnswcxqbA7pVOCwBhMS
 VD77+Sp54bDnblWEmP2hh2FIVPL0VcI1xil0gczAB9/CFURC0ul2OO5Z2JlFOm6dNoUa
 o2hAmu69H9CWi35pYCDQoZ7LnqYAwlP7awWhPqAzj0KOUBvR9Gh0Xb4FwkW677LhThC2
 6gBAHpfcAcIFJiL1ITqA+OMPmAga86Ln3QoSeMxF0j2PKnmqeKOQSZM23MZrNOMUXiAb
 PcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757695363; x=1758300163;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2gnDI76Cg2pQY4d+7l+CRi3OFLEEk/WHj+p8hJRcSw=;
 b=eWv/yijoO2T4MffjLn3FaYD5xcCY/mhrntY8mw8Cqxy7faXXJ3LxLHiht4Ataxd7+W
 F82Sffm1Kf6USsGSytsPSz/eTG3SWdAIezT4KwuqJbWeqmverfCsYolJTB/iVtnu8lb+
 cgTQqhgFoQU9QfcjIMPuGc7OBb/gPE71hnQnVpNgU6NhPPFeMwbN7oj8uZrUFMAwNVMP
 ehP2SKHA6pxBLO8vc10jW8BIFTz+8MzK3+taJohx1GC0L66+RBfREwpVXCFlOAsxtbtZ
 OgE796/Q4X6Uu70FDijzUHFivjGF7BPv0lxR556zmouWwydGNqV44uJaz3yRWnagyHtF
 wIAQ==
X-Gm-Message-State: AOJu0YzYLGdQper97w/WcZ//YVMAnGobAw7UsXk+J07K7DhgFItLDId6
 7oT3hCtC4ZPisKxzttkhXy5VCDNp9eKyv/AMFyF6d/FBfdIsLtlJla2f
X-Gm-Gg: ASbGnct0mbAgjyLNbLA4GkGg0WXrnP1k/dsseTw5NbCevNk7SgT8TYoAPgcK/evqreK
 WbB2zR53rL7TD7n4EO4i93DBBvomTBjtnEomkNe/IGnycOyTSIRpMlS8faDsMlqJZAxhUwBeHWx
 A1qmIMkvtCApOmcsVVkK00m27j55irBkJmqK2QF4bc/0nSUGU6B5mBq0hK0Or+OHhVvQ+CG74s+
 LoDdPhLSiPWnX6J2jfZrjpcB3XycCeIPnHRRi0OPTUF7BkX62MVaeOoARDeMmwDcdIJ2DJHCdJq
 VDEqiGdJmPOIZZVFKVJGMq/AwYgNpHMHTiwCKK33GVrXGMUmhiysZ192yW/Kj06H30ceh16mKpu
 QlYi33WdHZrf/kVWN4ak8EnE2Hw6qYe35uD9NRqe7N9pUnLxgVW9jRVQYX5EcORPHCmuboeJUM/
 c=
X-Google-Smtp-Source: AGHT+IE959gtwBhse6FsnHVMnHsBtmS240AL0UVQnNung5XxUIW4zcMVG/r4gPAUBC/WAXs7IQvx0g==
X-Received: by 2002:a05:6000:2584:b0:3e2:c41c:b2e2 with SMTP id
 ffacd0b85a97d-3e7659f3806mr4012838f8f.39.1757695363112; 
 Fri, 12 Sep 2025 09:42:43 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.138.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd415sm7086696f8f.30.2025.09.12.09.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 09:42:42 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 12 Sep 2025 18:42:10 +0200
Subject: [PATCH 2/5] drm/solomon: Use drm_WARN_ON_ONCE instead of WARN_ON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-improve-ssd130x-v1-2-bc9389ed299e@gmail.com>
References: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
In-Reply-To: <20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Sat, 13 Sep 2025 11:45:22 +0000
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

To prevent log spam, convert all instances to the DRM-specific
drm_WARN_ON_ONCE() macro. This ensures that a warning is emitted only
the first time the condition is met for a given device instance, which
is the desired behavior within the graphics subsystem.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 297593c7fd20a5a5da81f1e1fcfda9092b19cf90..c6939377ec4b5a42ce0f40d070ce60d544d8516d 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1390,7 +1390,7 @@ static void ssd130x_primary_plane_reset(struct drm_plane *plane)
 {
 	struct ssd130x_plane_state *ssd130x_state;
 
-	WARN_ON(plane->state);
+	drm_WARN_ON_ONCE(plane->dev, plane->state);
 
 	ssd130x_state = kzalloc(sizeof(*ssd130x_state), GFP_KERNEL);
 	if (!ssd130x_state)
@@ -1405,7 +1405,7 @@ static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(struct drm_
 	struct ssd130x_plane_state *old_ssd130x_state;
 	struct ssd130x_plane_state *ssd130x_state;
 
-	if (WARN_ON(!plane->state))
+	if (drm_WARN_ON_ONCE(plane->dev, !plane->state))
 		return NULL;
 
 	old_ssd130x_state = to_ssd130x_plane_state(plane->state);
@@ -1555,7 +1555,7 @@ static void ssd130x_crtc_reset(struct drm_crtc *crtc)
 {
 	struct ssd130x_crtc_state *ssd130x_state;
 
-	WARN_ON(crtc->state);
+	drm_WARN_ON_ONCE(crtc->dev, crtc->state);
 
 	ssd130x_state = kzalloc(sizeof(*ssd130x_state), GFP_KERNEL);
 	if (!ssd130x_state)
@@ -1569,7 +1569,7 @@ static struct drm_crtc_state *ssd130x_crtc_duplicate_state(struct drm_crtc *crtc
 	struct ssd130x_crtc_state *old_ssd130x_state;
 	struct ssd130x_crtc_state *ssd130x_state;
 
-	if (WARN_ON(!crtc->state))
+	if (drm_WARN_ON_ONCE(crtc->dev, !crtc->state))
 		return NULL;
 
 	old_ssd130x_state = to_ssd130x_crtc_state(crtc->state);

-- 
2.51.0

