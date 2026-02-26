Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGplCFE3oGkqgwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:06:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E69D1A58EF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9F810E8EB;
	Thu, 26 Feb 2026 12:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bTppoO6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A8D10E8EB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 12:06:36 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso10648905e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 04:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772107595; x=1772712395; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aL6uPMzsVEWXG5ks1J1+KYkn14nsDELRxOy3Sa9zWSQ=;
 b=bTppoO6TEj9sqn6X0AN8y6fAAdRGoJHZu78yfkBwXTKWEkhZJrjNjtSFV1+fYTjFVU
 kRb4Ian8fK/r3jfE9q1xYN34+q8wg11mxS+qxzZ52dvviYpOmK7bRy9rl+FMSdf4xLpm
 3qKtxAPGN6tsnrJcyqzLn0d0psF8iaVeJ2BbZfAXVdaR5JtqSTCPyjVlezqDt1YGTNsP
 DIAB5ol2+IEUimyDv16e2wUsh8cx2Kof+ShBFj/GkwKsDAfLkBybqg3tWLiHzM3y8qrw
 QTZnSch0cMG15Kk3uKkvUPOObvj/j1oqBU97tZ5UsThJrCTLvcMaaFED2CTqJcAVHIrz
 rQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772107595; x=1772712395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aL6uPMzsVEWXG5ks1J1+KYkn14nsDELRxOy3Sa9zWSQ=;
 b=XYIEJ9ExwcuXeD8hXY2YzKD1qzqcDAd5h5eKJvDLc5Ns3wlJy1lpqliiYHsFL6I7ks
 c0qwU7WfRe93pf9G/zNrgad4bqZAmPfAU4FqCi7p7OdZs+DIqv3eqVfBfYnrOo7+Lo1D
 0VxvK8S/V/iERII/tvMmjWL64uF84bq+QqVdKkaZkoNDN9R0qshvKtFOCIOE0kHBzhqE
 k1PlMs795DZFGZgqoHGCOUBYZxkhEftObGPqZ68Pow2YeWT6gaP8+5QH0Bx8hRYMoWuz
 C/j4KqZLDIi5+IQZEg3egWNuE/LcbVkzwhw57Vuuuw/VoAT5ZyIsWhD7d6x4YJC4N7oH
 sPPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULMhPKF8xkT8v34Rb9UbvKsnQY20HJZ/sUI4dEwI+U+zcxA+SzyUhH39n1n9ncriEe19xofd74p0I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAOV0kIGWvXzAXIMvQLNsG1faJwI2ArqziQkK5If+I89u1pB1C
 4yQvQIEtFQfZk77X+47SL1Al81mw9iUpbkOgqKoFTamj+ANEzxqnj+dd
X-Gm-Gg: ATEYQzz8AHdHFAkXJiwLXztKg2FWMZmQb13IrSg/KMabhGOLBE0n5n4X6TIcM83OsRq
 5k741kOANW23DMxhw6ibHEZuuhnowCRDMObLoC701EGLOKk/QxVkLDokcxLiemw3XvgNGMFiOhz
 CEotf3TlX01BXkAigExo5vC+7jc18hY4rqxI/g/7X/YhP5z30rcAZisNEx9aLWdCIUoK6zdZdJh
 fDBmqJUEwl9r2rxWCpVQWkzxn3TlUkD0MDW8F6iFDQKVxTQdQLJlwbvh0OlDaHIKLB1puXoPIZm
 yuQcPP9Koo36KSlHbPhwXgC00/uYdH7q/9QWLorU+klU+ofGYR2Wd82/OtTvO1p3gBPH8aLJc0F
 4j+131rk3kwTrdb6eeEbl1pBUXuqtHOOcjBOkrdqyQELyJXPnMxv5MK0piMA3U8ES5oquUtdU6i
 UvRMFkxZbcGw3vhdU3wkGBmZJBlQ==
X-Received: by 2002:a05:600c:474d:b0:483:8e67:e696 with SMTP id
 5b1f17b1804b1-483c3db8fcfmr34881945e9.15.1772107594946; 
 Thu, 26 Feb 2026 04:06:34 -0800 (PST)
Received: from karanja ([105.163.157.182]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd75df90sm145387835e9.14.2026.02.26.04.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 04:06:33 -0800 (PST)
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
Subject: [PATCH v2] drm/bridge: dw-hdmi: Replace calls to deprecated
 HDMI/audio detection functions
Date: Thu, 26 Feb 2026 15:06:26 +0300
Message-ID: <20260226120626.108378-1-karanja99erick@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:victor.liu@nxp.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luca.ceresoli@bootlin.com,m:shengjiu.wang@nxp.com,m:andy.yan@rock-chips.com,m:linux-kernel@vger.kernel.org,m:karanja99erick@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[karanja99erick@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6E69D1A58EF
X-Rspamd-Action: no action

Replace calls to the deprecated drm_detect_hdmi_monitor() and
drm_detect_monitor_audio() functions. Calling drm_edid_connector_update()
updates connector->display_info.is_hdmi and connector->display_info.has_audio.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
Changes since v1:
	- Get rid of sink_is_hdmi and sink_has_audio as a
	  later call to drm_edid_connector_update() updates
	  connector display info.

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 3b77e73ac0ea..ba88120de1b8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2472,7 +2472,6 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
 						struct drm_connector *connector)
 {
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 
 	if (!hdmi->ddc)
 		return NULL;
@@ -2483,19 +2482,6 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
 		return NULL;
 	}
 
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
-
 	return drm_edid;
 }
 
-- 
2.51.0

