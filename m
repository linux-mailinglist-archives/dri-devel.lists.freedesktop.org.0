Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CUhDFzBnmnsXAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 10:31:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917BC195044
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 10:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9DE10E20B;
	Wed, 25 Feb 2026 09:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VxfJUe1s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9E510E20B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 09:31:03 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so55493265e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 01:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772011862; x=1772616662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/Ov/cqlI4OUB7Uy41xTCeRXBczh2I6lWUkiHFS1M3HE=;
 b=VxfJUe1sKTjMhvt1ZqGW5/XBeh5pR+F1MjviFAsgY9EhCH1aEG2ieV8U9IDfSVD9F7
 O2w+N44GJNDE6+LYL1Y6CZRrz+gUrJqwTxMVUfdKxBhY8YhdiRA2mjqsrQfJqazDO9Jy
 iIAa8GCa85db4HOX3Z4iaNbDDUtg3pAOSOFy/QoOyLU5n5aurZPAqT74F8gpZ5Xt1gZX
 egZEc7CW1cD9rsx1UkEYgjimVmxFjQ2EmXSFDyczTe6j2olb+D/i1pnvVP54nGIDlrDz
 dqZcOnh/jRU+F9v36hDmGja6RKG0qR6GVfo5bNMPNJ5XQqIsTZXNBL/My3DGs5mM6MHx
 FSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772011862; x=1772616662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Ov/cqlI4OUB7Uy41xTCeRXBczh2I6lWUkiHFS1M3HE=;
 b=ZAGyyeLbDPOGX2W4q3Hqc+eJW82P56nmjtYo68VXFxZe1pz70UjPvBTPejZWkxpcGz
 dDZWTg7VjVmkigqKyv+sMnkM5UMjl5ZYwz1MoKqQifH3f58kDjcXcPyKEbtUslEd73zJ
 cXc6+kPrrwB5B7wa5jYFhAse06kyrKrgTYDs8uSVK0TKssep+b5B3+UocEEWT/1jF4wU
 ZwacerjL8uKY1I9iZZ7u5IzMyZT+8cn963ZkiKwPsIrxVkqfVh9gFlrGS0D7YOY54pS6
 WjUsHoJetD6JpmbP6GQSqZyu2roCCQdkBnvzWuuBQJghxCIbsmZgnddqysNcEsgfvYCy
 amuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaofgNDVRe4SK80waWIBlhXGECfjk8VlwwIcwZRCUweTnn6Q3y3fTEZaEagYkGEevnmJeepGLevts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSvFdq3SZnbAOlOU6dyAHEi7k3duRNHreDnc/dRJBZ1GaPznMy
 JI8Q/KPWPdz8OanzhJlYTNiFMTPSCyZ2UwkAY5PkB2HhMtWDsqvk6MOZ
X-Gm-Gg: ATEYQzxn5+CthpBl60NBZ1IAQbOFsYdP5oHjDvVWR6sQubFeWCZb8v+x7X/8tZ2OcPh
 Y27dWEOjri9ghnFAqdORdFaS5lrfQ+9XAwFkNWc5w0bhdHtsDLbaQLmGZImMQeJph37rZCKuYAV
 FnLLJ7uCuxZxeR8HnGQIRL2HYsXriChHCDO0J7lEkrThYECJMUnnOSHTX3ireWblSlbhgh6J/Bz
 ZzoAea4Umz1RNvfds48W9qE5dp6Uy1jre+ep7ZNO3XTOzCwE4ARKTmAL0t3Ok6zx0m3ZlFoiwNK
 vJcoloz8jCbnERRgyl8ET53k7qln7DXD6ViXcqcSKsS77685050Def1FYo93zB6z4b/n0/MVLBz
 9AVXfAxGxAAoRmKHPoILdFMxtr7rcND2Cf1cKXjK1WdKdiBC7sN2UZ8UBuK3+qUV0HNWSfEASvs
 sd2So2nowlMc7DfSbMWxzuxQA=
X-Received: by 2002:a05:600c:3f14:b0:483:7eea:b185 with SMTP id
 5b1f17b1804b1-483a95e1feamr292294115e9.16.1772011861865; 
 Wed, 25 Feb 2026 01:31:01 -0800 (PST)
Received: from karanja ([105.163.157.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfba9566sm11444855e9.3.2026.02.25.01.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 01:31:01 -0800 (PST)
From: Erick Karanja <karanja99erick@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liu Ying <victor.liu@nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Andy Yan <andy.yan@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH RFT] drm/bridge: dw-hdmi: Replace calls to deprecated
 HDMI/audio detection functions
Date: Wed, 25 Feb 2026 12:30:50 +0300
Message-ID: <20260225093051.12031-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.51.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:victor.liu@nxp.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luca.ceresoli@bootlin.com,m:shengjiu.wang@nxp.com,m:andy.yan@rock-chips.com,m:linux-kernel@vger.kernel.org,m:karanja99erick@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[karanja99erick@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,nxp.com,oss.qualcomm.com,bootlin.com,rock-chips.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.997];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[karanja99erick@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 917BC195044
X-Rspamd-Action: no action

Replace calls to the deprecated drm_detect_hdmi_monitor() and
drm_detect_monitor_audio() functions. Calling drm_edid_connector_update()
updates connector->display_info.is_hdmi and connector->display_info.has_audio.
The driver should read these fields from connector->display_info instead of
calling the deprecated functions directly.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 3b77e73ac0ea..ddc4ae40d94e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2472,7 +2472,6 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
 						struct drm_connector *connector)
 {
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 
 	if (!hdmi->ddc)
 		return NULL;
@@ -2482,19 +2481,9 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
 		dev_dbg(hdmi->dev, "failed to get edid\n");
 		return NULL;
 	}
-
-	/*
-	 * FIXME: This should use connector->display_info.is_hdmi and
-	 * connector->display_info.has_audio from a path that has read the EDID
-	 * and called drm_edid_connector_update().
-	 */
-	edid = drm_edid_raw(drm_edid);
-
-	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
-		edid->width_cm, edid->height_cm);
-
-	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
-	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
+	drm_edid_connector_update(connector, drm_edid);
+	hdmi->sink_is_hdmi = connector->display_info.is_hdmi;
+	hdmi->sink_has_audio = connector->display_info.has_audio;
 
 	return drm_edid;
 }
-- 
2.51.0

