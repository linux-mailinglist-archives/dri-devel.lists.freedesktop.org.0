Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B3688CE4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 03:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFF410E705;
	Fri,  3 Feb 2023 02:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F28610E704
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 02:07:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so5076152wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 18:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=froggi.es; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CB7JgucKeJ6phjSQlRY4scMyhMMpSUS4Rmo8NmixujE=;
 b=SwNhqEGTUaH2kj+FonmmL52VueekCZG7f4+4SnI7zaknfCbI7h7AAvms4I6h2jMe9c
 rOvtqPIpRzalBu86lrlnDnNvPlGoaFnJYeHIWzuZOik3xYd/Mh3wV4WPgeAFWD+SO77/
 WbtRtNUp41tL3H/mCEvFDNDigf77ls+ySW6M+Lo2oTeIt0lDRywole8nLLdWncDRVGg8
 bifMQq3Hr5S4VJj4SbG0Jk7iGSmtL0bgJKtkCboWxQEIumy+maFH1SpyGMZqtQGMSeoA
 uuC3C4OyKUCtzl8vuTZeshhpwpWTZkNlrRirMvvoX2O71GAEXZMo+1ps93ffxnYhgwCJ
 Bnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CB7JgucKeJ6phjSQlRY4scMyhMMpSUS4Rmo8NmixujE=;
 b=xGiKBOuxt405kIUqcngem3xYYHlYCv7MN6ArBHQHWYVb5lESL3P+zPugqYLrfjtUU3
 eI7onko9Ky7Y8b7rTCRlp9lJxtpR/LrSqx9gLCxQ+z2z9Ztiz7VGZ2326RdYAQ4cU96X
 eBcW1KkXOYOksxmPssTJJ4DPLVRSV6WjXgroDhR4LuNQtrjzpdW1aVS6lofaUYtqrAPh
 X2jOLWyrm6gxNJoRit+S4zuu58tmm4NBjaCMfHcQnTetentnulXjVd+6WrFPdoK0l9Or
 XGErECNFQbHjYsHAv6m8xvqyYUMYAmgP3bpMhPMBRhxxWbaSsquDvth2sOP/nLUi3Qb+
 cxzQ==
X-Gm-Message-State: AO0yUKXfr94Ge9LTOrvEPGU2LHXyXkEqZkrkgflcZi2eRfVPZmXo8mzG
 t8n1NrhyO6QnwrNlx4joaIlwYRgefs58MXnB
X-Google-Smtp-Source: AK7set91M+xvFaOAFSsE0hJX+6hdQd0Y60s7w8Z/RJF1gp3q5Vs3/rNN+nEGEwKkjOg/5BXA0XzNbw==
X-Received: by 2002:a05:600c:3d0b:b0:3d0:7fee:8a70 with SMTP id
 bh11-20020a05600c3d0b00b003d07fee8a70mr9310429wmb.19.1675390076978; 
 Thu, 02 Feb 2023 18:07:56 -0800 (PST)
Received: from localhost.localdomain
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003de77597f16sm1297327wmo.21.2023.02.02.18.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 18:07:56 -0800 (PST)
From: Joshua Ashton <joshua@froggi.es>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/connector: Add enum documentation to drm_colorspace
Date: Fri,  3 Feb 2023 02:07:43 +0000
Message-Id: <20230203020744.30745-2-joshua@froggi.es>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203020744.30745-1-joshua@froggi.es>
References: <20230203020744.30745-1-joshua@froggi.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To match the other enums, and add more information about these values.

Signed-off-by: Joshua Ashton <joshua@froggi.es>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 include/drm/drm_connector.h | 41 +++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index edef65388c29..eb4cc9076e16 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -363,13 +363,50 @@ enum drm_privacy_screen_status {
 	PRIVACY_SCREEN_ENABLED_LOCKED,
 };
 
-/*
- * This is a consolidated colorimetry list supported by HDMI and
+/**
+ * enum drm_colorspace - color space
+ *
+ * This enum is a consolidated colorimetry list supported by HDMI and
  * DP protocol standard. The respective connectors will register
  * a property with the subset of this list (supported by that
  * respective protocol). Userspace will set the colorspace through
  * a colorspace property which will be created and exposed to
  * userspace.
+ *
+ * @DRM_MODE_COLORIMETRY_DEFAULT:
+ *   sRGB (IEC 61966-2-1) or
+ *   ITU-R BT.601 colorimetry format
+ * @DRM_MODE_COLORIMETRY_SMPTE_170M_YCC:
+ *   SMPTE ST 170M colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT709_YCC:
+ *   ITU-R BT.709 colorimetry format
+ * @DRM_MODE_COLORIMETRY_XVYCC_601:
+ *   xvYCC601 colorimetry format
+ * @DRM_MODE_COLORIMETRY_XVYCC_709:
+ *   xvYCC709 colorimetry format
+ * @DRM_MODE_COLORIMETRY_SYCC_601:
+ *   sYCC601 colorimetry format
+ * @DRM_MODE_COLORIMETRY_OPYCC_601:
+ *   opYCC601 colorimetry format
+ * @DRM_MODE_COLORIMETRY_OPRGB:
+ *   opRGB colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
+ *   ITU-R BT.2020 Y'c C'bc C'rc (linear) colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT2020_RGB:
+ *   ITU-R BT.2020 R' G' B' colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT2020_YCC:
+ *   ITU-R BT.2020 Y' C'b C'r colorimetry format
+ * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
+ *   DCI-P3 (SMPTE RP 431-2) colorimetry format
+ * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
+ *   DCI-P3 (SMPTE RP 431-2) colorimetry format
+ * @DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
+ *   RGB wide gamut fixed point colorimetry format
+ * @DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
+ *   RGB wide gamut floating point
+ *   (scRGB (IEC 61966-2-2)) colorimetry format
+ * @DRM_MODE_COLORIMETRY_BT601_YCC:
+ *   ITU-R BT.609 colorimetry format
  */
 enum drm_colorspace {
 	/* For Default case, driver will set the colorspace */
-- 
2.39.1

