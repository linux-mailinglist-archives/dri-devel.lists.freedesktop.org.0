Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FDE398CE2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F18A6ECB3;
	Wed,  2 Jun 2021 14:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45356ECB4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso1820826wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjGrcIOD2Z+Nhsp7UBZvNxk73/3NibtTsjxqFhOCaZQ=;
 b=B5eapVtXzrPgrbyn1no4++7E3/uyzNNcp0YRodoZhe/7iVG9VhheW7sq8o0Dzo8HEA
 3wjS6sImWqTgA8oIi0ByjoXOWdJHZWqrr/kpZ8eahVhucaE7G3+jSzQj8/PT4wmA1JIa
 8kiJX7A9VyvvrE4EnRv2MC/NB59qqRHGMlYS0ZT0uMBt/X0N7wedWhDjtTIRx2bPXoP0
 8RQPuZjNoQaDXJRJgWwV8w56gPTIjO83KS4sEXfW2Y0RxRaXgg9Bya6ul5+hqjTL6xcl
 X/oHfcoGl02m4aT7q94NVz6FcJxSsW7wLw99FCanuuybwqMp1qO9QWVxv0w956JxGjcE
 NAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KjGrcIOD2Z+Nhsp7UBZvNxk73/3NibtTsjxqFhOCaZQ=;
 b=E8xvCwGa6XhBSq7AY0gCm7lJyNwzGnQOjPvHnk0NsgG21zT2Foh3HsI6c4I0brjVzc
 WUHNkQhQ9ONBoX5SvGniA0wnkaEOg//ut8G95fWt5HP3AFCJyhDc+YOBbSJ9bC34Fyxr
 5sseWc7zk0E7tbJCJoBzf1aOqYtYR1LZRak8HL7lDdrRdTPoOItzTVrhrY/2JsL9LJ2u
 9D9LSAkHvMGhAYejTpq9jR74YaGWuWAjZegnKcn7C0lZ5pe1nw+flWoe54tB1JkgxCpG
 bGkXD2CBTGPLtQlEGGIvCgxkG6vdXiYLwT6nzLiZAHL3B/TD5vyCpwes/FPqCB3XBRsj
 IROQ==
X-Gm-Message-State: AOAM5336immwwEtd/gbcsOuEUcpaln/b9E22gAfsYMVNCT9zfKqTZCuL
 T5bvtW9zv4GL763K/aVz9+I9dA==
X-Google-Smtp-Source: ABdhPJwxPRXLmbCCUUch5fo3cAuuWEWS5/sxOyuVrPft+LO9FzDB58nFhNnDAbN4KR1KSBP0zTeO7A==
X-Received: by 2002:a05:600c:ad2:: with SMTP id
 c18mr21788160wmr.93.1622644395561; 
 Wed, 02 Jun 2021 07:33:15 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:15 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 06/26] drm/sti/sti_hda: Provide missing function names
Date: Wed,  2 Jun 2021 15:32:40 +0100
Message-Id: <20210602143300.2330146-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Dessenne <fabien.dessenne@st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/sti/sti_hda.c:283: warning: expecting prototype for Search for a video mode in the supported modes table(). Prototype was for hda_get_mode_idx() instead
 drivers/gpu/drm/sti/sti_hda.c:301: warning: expecting prototype for Enable the HD DACS(). Prototype was for hda_enable_hd_dacs() instead
 drivers/gpu/drm/sti/sti_hda.c:383: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/sti/sti_hda.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index 5c2b650b561d5..03f3377f918c0 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -272,7 +272,7 @@ static void hda_write(struct sti_hda *hda, u32 val, int offset)
 }
 
 /**
- * Search for a video mode in the supported modes table
+ * hda_get_mode_idx - Search for a video mode in the supported modes table
  *
  * @mode: mode being searched
  * @idx: index of the found mode
@@ -292,7 +292,7 @@ static bool hda_get_mode_idx(struct drm_display_mode mode, int *idx)
 }
 
 /**
- * Enable the HD DACS
+ * hda_enable_hd_dacs - Enable the HD DACS
  *
  * @hda: pointer to HD analog structure
  * @enable: true if HD DACS need to be enabled, else false
@@ -380,7 +380,7 @@ static void hda_debugfs_init(struct sti_hda *hda, struct drm_minor *minor)
 }
 
 /**
- * Configure AWG, writing instructions
+ * sti_hda_configure_awg - Configure AWG, writing instructions
  *
  * @hda: pointer to HD analog structure
  * @awg_instr: pointer to AWG instructions table
-- 
2.31.1

