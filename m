Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5FA547AFB
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 18:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB329112608;
	Sun, 12 Jun 2022 16:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86A7112608
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 16:13:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v14so4413194wra.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 09:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6LL9w+d+H88J/0VBgbeKOwTbMY4B/jVYAAXA85+Hav4=;
 b=gl5639X+UtUz4/8ZKGB9pGoMNC/i69RQhkFXX4sV2KPNty/Uj+gZYC8+yAvfPMVjQ4
 flVMMv+wYJbeaU7Sucs4xH8SmGJRWX0lF6xMBjkdVbS5yqJn7s/sMYsbfglp/lMlsz8D
 iTSE1qWoCj8OwrfSvDiEIVikBaPyfgc1DrTe19Tsw01bK9szh4Y2w95yBh5FMQUUOMDS
 RgmFC8+X3mA1VuNAzM2LOyEU+r13r8GMEdzdexYcFcREk/5tjrVhzsznJqAVgQpbiuyA
 6P74+Xzhlx1dpmYB/9ewkmxFOu9uUepV6KNlfCgjqVLMpzYGgKZmteKKMT8HEQjDkI0A
 dTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6LL9w+d+H88J/0VBgbeKOwTbMY4B/jVYAAXA85+Hav4=;
 b=RVTCE32ZxbT3sgMIhP58mHk+KeEITxf09MD76tmD75v9djizmE2pw4qSHhigu7eywC
 3aAH8jTU8FcvXYXuLuG02PrRzkJSLs5Ghd25uwyfSZUoDdjqWNeg0TY82j3Dxa9EZXQz
 UKbLq2fsP8BN3Af/LnbjIRtXfcWJT8gV4Gt33bEsnW7mIsTFzMmZTa6rmOZc/LAf3cDy
 QfhKcw66Yej45R+1eiBX0yiJzHNPA7OErloPlFLtF1aqRt9ExXMX3L1txBhV+AcdzGvo
 JYlz5xySWNUg6uX9cuZsrYxJGQLAPPE2u2wp1YlotYL+N93s1YK/Q8RkcGoUWLEQeblb
 rQLg==
X-Gm-Message-State: AOAM531zUJjMOJAXxU+fRMIeR3zGcYx6ZaJNp7uYm76s7vDnUIh8yJ39
 YuC60FHe4gSSDvNAGdgVKeo=
X-Google-Smtp-Source: ABdhPJz8VDALPE+dJoYWOkkCRUN5A2vLLKhXWgjuHeDFcnN/MUxG/0o2y8ajRYh1LNazs9hIj5r++Q==
X-Received: by 2002:a5d:5903:0:b0:210:316f:7f40 with SMTP id
 v3-20020a5d5903000000b00210316f7f40mr53339486wrd.624.1655050379282; 
 Sun, 12 Jun 2022 09:12:59 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a5d6208000000b0020d0f111241sm6015925wru.24.2022.06.12.09.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 09:12:59 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v2 1/3] drm/rect: Add DRM_RECT_INIT() macro
Date: Sun, 12 Jun 2022 18:12:46 +0200
Message-Id: <20220612161248.271590-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612161248.271590-1-jose.exposito89@gmail.com>
References: <20220612161248.271590-1-jose.exposito89@gmail.com>
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
Cc: davidgow@google.com, airlied@linux.ie, dlatypov@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper macro to initialize a rectangle from x, y, width and
height information.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 include/drm/drm_rect.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
index 6f6e19bd4dac..945696323c69 100644
--- a/include/drm/drm_rect.h
+++ b/include/drm/drm_rect.h
@@ -47,6 +47,18 @@ struct drm_rect {
 	int x1, y1, x2, y2;
 };
 
+/**
+ * DRM_RECT_INIT - initialize a rectangle from x/y/w/h
+ * @x: x coordinate
+ * @y: y coordinate
+ * @w: width
+ * @h: height
+ *
+ * RETURNS:
+ * A new rectangle of the specified size.
+ */
+#define DRM_RECT_INIT(x, y, w, h) { (x), (y), (x) + (w), (y) + (h) }
+
 /**
  * DRM_RECT_FMT - printf string for &struct drm_rect
  */
-- 
2.25.1

