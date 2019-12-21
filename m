Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E8412886A
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 10:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1196E43A;
	Sat, 21 Dec 2019 09:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC486E437
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 09:56:13 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id o13so1078500ljg.4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 01:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vxp75EnGkSNIF0JYpEC2skGbIkHaQW/WtoO50nbShD8=;
 b=QMXdFfo/cHM3xsnJVr3/Gas/HfObj8PfF0dIVm+iWPNJOB/FLcUhrMXnI+cRoGASk/
 G+f7HlFStdNsCrpa2SQIeXg4NFgWlvy56mrx2jwzkDWHiEI5m3ybUOfGmdlDiYcL4ibI
 O8T/zoo+NXAdW2NYLQfVFVnPvLTLPsoIg4v8tWb/mI7RTH4kcQXbJoffORW9extqVfO3
 M6aOrK/B6oeWu6kzuluWhPk/v2HkA5pZ2et9JnpUCYiYiCqE9m/H8NHzd0hUHHFGDl9N
 xSduM8lNGkWaSkNjH2XFjww35RQrD3ZHTMf5Um4+otqd2kNf8g8TsKEuiYh8XISzgj79
 6hjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vxp75EnGkSNIF0JYpEC2skGbIkHaQW/WtoO50nbShD8=;
 b=mZNcw54wZ5q4x6GbygFezo39UVgjEQfsaiOzGyl0IGkOpBRm13YcRCejSR+dCKdApd
 qEvGQYkMFU5kl01u9wXXk2gi/RO37xgDXdSwwObifsfJhoxhUWLW3wIUAIQnHYJ/rySW
 wig+MVwEO9yhHSbD+Gf9x5JJCzE6mU2nCIm0bLc1pOkye344PkQaWiCmCtTxQ0xoLOiB
 RubEs4KJbS0GJCM3qmrsRGkQrlEUjGTVvVi4g/lULhp+Du5sTYnmEV0GGmvRBO/fTmuz
 VJhhjzWWe9valI/u1VgAKvqUjAE/LJhU+amdf/THNKuY9ll8zAfaXhhOCk9nURfexg8s
 7R4Q==
X-Gm-Message-State: APjAAAX+ti+i0FcdWlozNVAdB4F6wOM/DtZozqqKbBNMuE4d9/JQ3uDi
 ht5TGHSTHCf/Ys8Km0/Dx01i1ePeQyw=
X-Google-Smtp-Source: APXvYqyFWOZuMwyGOeAvs/2Ndizp2K2nI1I/QmJ7KC7Kd9Ht5v5d8xPlLoP8k8/NhHy8bbvXRmtNNg==
X-Received: by 2002:a2e:580c:: with SMTP id m12mr12514671ljb.150.1576922172059; 
 Sat, 21 Dec 2019 01:56:12 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n23sm5187263lfa.41.2019.12.21.01.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 01:56:11 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 4/8] drm/print: add kernel-doc for drm_debug_enabled
Date: Sat, 21 Dec 2019 10:55:49 +0100
Message-Id: <20191221095553.13332-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191221095553.13332-1-sam@ravnborg.org>
References: <20191221095553.13332-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_print.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index c1d333bb7534..c9fa06b517cc 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -392,6 +392,21 @@ enum drm_debug_category {
 	DRM_UT_DP		= 0x100,
 };
 
+/**
+ * drm_debug_enabled - check if debug logging is enabled for the
+ * specified category
+ * @category: the category that is checked
+ *
+ * The category specified can be either one &drm_debug_category value or several
+ * &drm_debug_category values ORed together.
+ * drm_debug_enabled() can be used to avoid expensive logging functionality
+ * when logging is not enabled.
+ * Use with care.
+ *
+ * RETURNS:
+ * true if debug logging for the specified category is enabled.
+ * false otherwise
+ */
 static inline bool drm_debug_enabled(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & category);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
