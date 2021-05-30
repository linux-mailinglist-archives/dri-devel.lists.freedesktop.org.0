Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A933955FE
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 09:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84AD89C6C;
	Mon, 31 May 2021 07:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80FB6E098
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 19:21:56 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso9080093ote.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 12:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U6i3l5ymh47jdH2J2qYJiv7rR53s/93ZZsbV+XWqpSo=;
 b=XoycG1jHacMsQqspVKNs2va2TGfOft1Tw7OFF+4ej9AZ9YdsjxIHNffQUPT5cnfdLD
 BU1joh681rjWo401XJWKnWo2s5D60s+73C6rrZPMNOoDHy7lT/lIFPJQqDQzFsgcijB2
 i9dnVBf0w5NqQMkSAET038yCjEhVYbtD1kL9F93KIS28vbSDCyJh1KLLCsEPzxFbg0sx
 zfUB/Uv7n6FBoigwilaAanacKHPOSSn+eUTliIsG+2pCHGsC2LdHL6RWfUF2A1eOCMMy
 np1fHCLChS07dH3HOmJDsd6iKCaojT8clX494Gp+REdfzRBuNpKrSZmWwgFLshxPlfrT
 prug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6i3l5ymh47jdH2J2qYJiv7rR53s/93ZZsbV+XWqpSo=;
 b=meVa5gpf1HmXBlR4YPbm+Ci6bW2ChQ5qMw84B8eEs5NQXh5FaSfN7OY3ONGvBGyoTA
 9F64zv9dSSWahe6/oyGixlHnpFMfid2tMLVEANFOfkGNAJjJ9kU58+yA1oV4994i6w8E
 OXcWvrfMbtBKKk2/u+8dOzRaNh/7v3E3T+34ub9/rFkmEpA7wUcE66A8Hh5EMg/y8XlZ
 QTFtgAHzC7/Q9iPv5r9Y26LEkE6YK9WX7xtAydsIHW4Bnz1Fhv4HtCIplKyT2nZXVrU2
 TUfFgCD+dI9HFbGhkKslkzqhriSatREesNpLxGSwNqf9ltVHxXFygbHTgM8zemG7uNVp
 O6/A==
X-Gm-Message-State: AOAM531qAOx30yqnKYjdDk5K4fDGO8VFAgCRehaJulCW4Pro+nmqErao
 0bz66Thqx218FSymsqKs84Ag9eAJyDTvag==
X-Google-Smtp-Source: ABdhPJxyV6zev9JlbaNIpFcYH7n/qv3xt9+nsuryfBkypVuiHYB3WvfeiCw5HjrbHsNJKyYAkVCBgQ==
X-Received: by 2002:a05:6830:1f51:: with SMTP id
 u17mr14767092oth.25.1622402514840; 
 Sun, 30 May 2021 12:21:54 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a18sm2418076oiy.24.2021.05.30.12.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 12:21:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/4] drm: fixup comment spelling
Date: Sun, 30 May 2021 13:21:43 -0600
Message-Id: <20210530192146.393761-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210530192146.393761-1-jim.cromie@gmail.com>
References: <20210530192146.393761-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 May 2021 07:23:08 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/prink/printk/ - no functional changes

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a3c58c941bdc..9377a17d74f1 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -327,7 +327,7 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 /*
  * struct device based logging
  *
- * Prefer drm_device based logging over device or prink based logging.
+ * Prefer drm_device based logging over device or printk based logging.
  */
 
 __printf(3, 4)
-- 
2.31.1

