Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B760A41968D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 16:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BD989FA6;
	Mon, 27 Sep 2021 14:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E64389FA6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 14:41:28 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 d4-20020a17090ad98400b0019ece228690so3883671pjv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p23ioMFXihNK5fPV90Emqpr9ocsUo09yX0SkSX5EZh8=;
 b=do+Z2yHgUPjsMWkdY3uOKLHEUNljWuRXFI8u6ktF++PhoL9Y0xWy5NBUOScNZzesjy
 2k++B4bzJSSfGM+b1OKO4FqdcrbQ9uvSOv8duc45g/dfKQBBPvPg6+FUNlXF0W2mFV2t
 mbMXV0Rs+HmCzL8HFUIQJby2F8ZUqEdSL38/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p23ioMFXihNK5fPV90Emqpr9ocsUo09yX0SkSX5EZh8=;
 b=pL3y8crVn9aYHhS00jvEEC/vzMrdEA+w1FeI1nsOGGm/akGr55HUgKcggRwvSmosnf
 yaqYtPlJOvszpVeMYdTVi/GeTRz4gqH4GXQBGLpMoOY4rNuBAZgpBilW4/0DFkdARe4Q
 nQ7mZqU2uj+shGhM+ba4jtEdhDIY0qYXVTrTLKYyH5PxgTs418xJGM1IyI0oFrN8NPAL
 ICRCznieTuVmYE464G8aJVF3X7tIg+SRryWpdzclG/+GR1wRQNgdONG2jy3TfZnrxyIU
 k1b91FW7YNP6xzOxSPF3CjY80HZQ4KoU3n3WWciPomiVIr+4/ZsoQO5E5NL5jB9MZR8J
 jCaQ==
X-Gm-Message-State: AOAM532Dj4c8v5foM3ckvSVwjU4E0zEr7lyUYjAk9r3BBgyQDUlT3idP
 MFYIVBWADWctQFP/bZB/tphrysfQyQXN7Q==
X-Google-Smtp-Source: ABdhPJxXgPlT3xU0KLmn3J4lvA5hVI2OazHf3+1yesYWmi17QgeBQYoQg0g7i6t92Z7blpfoqnGHPw==
X-Received: by 2002:a17:90a:1d0:: with SMTP id 16mr356012pjd.60.1632753687547; 
 Mon, 27 Sep 2021 07:41:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:aa10:bd89:ed05:6646])
 by smtp.gmail.com with ESMTPSA id p48sm17443377pfw.160.2021.09.27.07.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 07:41:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/edid: Fix drm_edid_encode_panel_id() kerneldoc warning
Date: Mon, 27 Sep 2021 07:41:22 -0700
Message-Id: <20210927074104.1.Ibf22f2a0b75287a5d636c0570c11498648bf61c6@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
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

Due to a simple typo (apparently I can't count. It goes 0, 1, 2 and
not 0, 2, 3) we were getting a kernel doc warning that looked like
this:

include/drm/drm_edid.h:530: warning:
  Function parameter or member 'vend_chr_1' not described in 'drm_edid_encode_panel_id'
include/drm/drm_edid.h:530: warning:
  Excess function parameter 'vend_chr_3' description in 'drm_edid_encode_panel_id'

Fix it.

Fixes: 7d1be0a09fa6 ("drm/edid: Fix EDID quirk compile error on older compilers")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/drm/drm_edid.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 4d17cd04fff7..18f6c700f6d0 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -511,8 +511,8 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
 /**
  * drm_edid_encode_panel_id - Encode an ID for matching against drm_edid_get_panel_id()
  * @vend_chr_0: First character of the vendor string.
- * @vend_chr_2: Second character of the vendor string.
- * @vend_chr_3: Third character of the vendor string.
+ * @vend_chr_1: Second character of the vendor string.
+ * @vend_chr_2: Third character of the vendor string.
  * @product_id: The 16-bit product ID.
  *
  * This is a macro so that it can be calculated at compile time and used
-- 
2.33.0.685.g46640cef36-goog

