Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D3B3DC858
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 23:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D786E8C7;
	Sat, 31 Jul 2021 21:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471646E833;
 Sat, 31 Jul 2021 21:42:26 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id a1so1160575ioa.12;
 Sat, 31 Jul 2021 14:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kmHsDnFQwSbOnRKSJ1vga0OhlV8P3CEw6FanKWDIy40=;
 b=U9BvI1glpc+yDSbM/DPm8s6F7ztnI0CJPlfd/CvD4PiMnHYiqRFdaAPiOIaj3wy9a5
 UBEUc1TXEMS6bFRQRXOsMekQ68EdjCQaKc1Mqogn1UN2W7+7XMdiMJ8AV4fH8sbcUjQm
 TdlL4IbV9HumLEKzoFkUwYDDZqQwBIhy4Iqwu6aG4l4Fqr+8NEGK5cfzaRd5VM4kHqA+
 /gmJNe4dJcAwy8rTTd2WHR5Rej9fhrpZ58dQzRMV///Mmj2uOm/zwHCn+E1CXjtXOvpr
 OGEBpaj0ipVFD35gduXa+vjXyJfLpFZdhimrND3VFeciLZywwIzpFhe2nqgYqRvnWEAu
 FqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmHsDnFQwSbOnRKSJ1vga0OhlV8P3CEw6FanKWDIy40=;
 b=Uxv6bTdavg9Er322BQ/ba8PmgKkQ3+m47DWeqRy2zeRhALsjl9gDQHEiamlY9cYpBa
 hNBuaMvTIImuf4O07mHX/T+RVRG9KpTXygA+YZqpgxOw42oT4dwQbNYUQeSknss3e1Xn
 u37ZBWQzR3dCIBBYyYYFZCUndfRi4yo6u+AiwpacKSGMEE+rXprqTlSJWytMPIqq94Hb
 0PQH+qb3K/NUzb6Vepeq/8H6JtzJoP6/fnPWQ837sKFdRrTJwjgNOYRfWjUEvhZSjGcD
 5WyZlg/M1U4Bj6coI7/+kvHBg7oK+E++3VIIWCvBxOa23XwesGnQ7iACJby+NroANYyL
 wzeg==
X-Gm-Message-State: AOAM533ayuvFk2wNXCocf29nH1V3WlbGSD+TuD/eeRKLzdxiO3zvGV5l
 hjo042nUFwEUKuTbjZmMwHQ=
X-Google-Smtp-Source: ABdhPJwHNkMohciy9QMc9txPm4gNPWvEEssmPLZfOVFLAQW4UOPDVFX6Ry/jP25YRbLh9pAP7h24lA==
X-Received: by 2002:a5e:c006:: with SMTP id u6mr6101793iol.66.1627767745609;
 Sat, 31 Jul 2021 14:42:25 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id q10sm3721040ion.3.2021.07.31.14.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 14:42:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Baron <jbaron@akamai.com>,
 Ashley Thomas <Ashley.Thomas2@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Wyatt Wood <Wyatt.Wood@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Jim Cromie <jim.cromie@gmail.com>, Johan Hovold <johan@kernel.org>,
 Jessica Yu <jeyu@kernel.org>, Nick Desaulniers <ndesaulniers@gooogle.com>,
 Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/7] drm/print: fixup spelling in a comment
Date: Sat, 31 Jul 2021 15:41:58 -0600
Message-Id: <20210731214211.657280-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731214211.657280-1-jim.cromie@gmail.com>
References: <20210731214211.657280-1-jim.cromie@gmail.com>
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

s/prink/printk/ - no functional changes

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9b66be54dd16..15a089a87c22 100644
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

