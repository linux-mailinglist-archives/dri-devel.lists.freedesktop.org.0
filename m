Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B653A65A03
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41C110E1ED;
	Mon, 17 Mar 2025 17:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="UcYTHaxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792F810E18A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:13:35 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so17963005e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1742231614; x=1742836414;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7fMIytW0SxfPTGP9LvPWkChZq/hvsCkhhTHxMZ6OSLw=;
 b=UcYTHaxYd5ul4VdGWhWAKQETPR3NlD4MqLAK0RbOSGDJMzIiWh0CRSSpX/7wfvcO7A
 30rznrlvP4E/lc8n6H4ChRxcZPRIRbbqNoybmpY0jogWlFzB+dZdwJEmgCIT89QBEVRn
 yk5jNl8FgVket/DBJrji39iL9hTkcpPtkFWF893xeGMTRzE/BCVzN5h4IknUA8QUv8j+
 l8soeqenBPawr9f34mhrYoPWk8PzpTas8X4ptWlmH5ZdlpkbSqoCrtqJf5k8c7NxOmRc
 CAtC8i0y00K15BkiSVHoMNfZNsIqaFQgjchgXBxVh9a7PO+E/M+RZzcoD8CF1kxiwhoS
 YWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742231614; x=1742836414;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7fMIytW0SxfPTGP9LvPWkChZq/hvsCkhhTHxMZ6OSLw=;
 b=Wm+X4D2FcnE/m8WLX9uNBKXkwqQOCGxWHHV7W0+exXn6oBdIdZswHPlEluOsYko1LA
 aNw+cWCmh4EPNuV4rz7s82S+ht94iFK/dme5Dldy4JlV4D15ssDKTmZbRERwbdU1Od2V
 PDMM3RQYdU+7I68N8H0bLtUQAVDTLSNam2MCmP9bukvbL3jDkm+IcHZ3apDjmRcelqf6
 BHoNd/Y8tANxu2k2iiC1NB3KhsM/NW6Ge0KqFrwSETd8d2IRX92GWlEbmB/YyN90p2Ea
 vcVANUXsjSdEP7kj9jQbmvURrfTAdmANYtk/ammcCaBPnuMDuVwDblcPlyFUxLrjZC1h
 p75A==
X-Gm-Message-State: AOJu0YzuCeIovX084aRuz55DQqU4TmqNCoGo+3pHCC2wWDJeC/zHcMbH
 qUXrsX2/voen5QONNtUwGt1MluVEE9zzhhqSmvKvkFuk9X18csSCKUA3R43iRZw=
X-Gm-Gg: ASbGncsoA3z8yqRJOp1xkQaav13utcqXyMSB8uc/vnWhBSJf8QteHlpovI1hXMfGSZX
 KiO4liW8k9bCh5u6quBQ1OErc/hK+Ybbtt+sbsr4EUM86YKmxJXKjrgw8Ak/3bO2WMxFA3ff24d
 ust+q/SVxUvOMOvlS3x0k/pMf9TsyNhx9OGlNUVeDIHbQTIHTh3SagEVEInRaSfMzmTDrMriyTH
 VxrE8SKW6t1XwlMxo/+5MW8vVDc6poOvwiGFskdkjQFINYHgjGSOJi7ceKWkdh+FI7+A0eC3Ryq
 AB4BndzahPyyvGE73heBLJj6kyFheooZrQ==
X-Google-Smtp-Source: AGHT+IGkP+dmpLKkzo04mu9JfjO/ZA5KdaifD/QSaC1iHJgfbvWe2OU5XBzjuXxpITQViZF/cOe/8Q==
X-Received: by 2002:adf:9b89:0:b0:391:3fa7:bf66 with SMTP id
 ffacd0b85a97d-3996b46892bmr399853f8f.31.1742231613968; 
 Mon, 17 Mar 2025 10:13:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdda15dsm112003365e9.3.2025.03.17.10.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:13:32 -0700 (PDT)
From: David Turner <david.turner@raspberrypi.com>
Date: Mon, 17 Mar 2025 17:12:23 +0000
Subject: [PATCH v4 2/3] drm/vc4: hdmi: Call HDMI hotplug helper on disconnect
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-vc4_hotplug-v4-2-2af625629186@raspberrypi.com>
References: <20250317-vc4_hotplug-v4-0-2af625629186@raspberrypi.com>
In-Reply-To: <20250317-vc4_hotplug-v4-0-2af625629186@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Turner <david.turner@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>
X-Mailer: b4 0.14.2
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

From: Stefan Wahren <wahrenst@gmx.net>

drm_atomic_helper_connector_hdmi_hotplug() must be called
regardless of the connection status, otherwise the HDMI audio
disconnect event won't be notified.

Fixes: 2ea9ec5d2c20 ("drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug()")
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: David Turner <david.turner@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 37238a12baa58a06a5d6f40d1ab64abc7fac60d7..37a7d45695f236d3ab281d9a8676921fd434955c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -372,13 +372,13 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	 * the lock for now.
 	 */
 
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+
 	if (status == connector_status_disconnected) {
 		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 		return;
 	}
 
-	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
-
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 

-- 
2.34.1

