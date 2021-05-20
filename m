Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528C38AD56
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E038D6F412;
	Thu, 20 May 2021 12:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA756F409
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 62so7996809wmb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjGrcIOD2Z+Nhsp7UBZvNxk73/3NibtTsjxqFhOCaZQ=;
 b=FMzN/CHJmshI/NQz++l0IJRPt4s1P1GNc6wJzd8MPovbpNd3uiwbNxSWzv0C2eZLBx
 K9VQ1GT03tkGy9oMFZ8cj8IAixY2iWf8gxxujQf1tHI4Sc4CEECTE4C/OwQ2SefBLGdP
 aRNftdpa0v3glpO8xyg96cLd/6ggfX+p0JOOCrUbzooZf+vDMu/hcfMywf7C5j2m/eJi
 45c4ECLS6Eqz0sdbzM+twmrT7UcDJKdCbKYAMuEhsP9FMVlIALqeK2iUCVA751o7ixHS
 RchM6Whnl7jbMPOWjMKJCB87oX3FOAMNLmZU9kOY+3CnN6Q09hg669xcyLPmHcNDCLs1
 dA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KjGrcIOD2Z+Nhsp7UBZvNxk73/3NibtTsjxqFhOCaZQ=;
 b=Jx8VGSgX07Jn1dnu7Ugj0Fl9W+mgT0adZM0BsHRHsgLneZGoLZKjv8Vh/N+X2hjd/l
 UMfCuwuR1CKlqAEG4T/YeCFcRTE8w0sEABiOkRE0JZhecY0F2CUHpx82baeUtJteK8Tp
 +QX3C0hTnCQofBm1rr/j+TzPixNm5hxAcyuDZ/bX0DkDbWf3PHs/7lwlo7e5oGcEESec
 UjxABZ12bB84cNYWoIB6M6CMPCGoH521UDxL+S/09s+sLWiPh+9MaDq7CBsMuVV/tWme
 mKcI5ar5mRUiLjBUCz6T5BPH08LGPDqfb713+uzKXS1OclaHVVtOJXzGydHfT/sqWB8h
 wcBA==
X-Gm-Message-State: AOAM530Lg8RDbZQwnvVmuHMFFdO/Laj4MmtCbCh4LbLDz5vOT6wG0YOZ
 6rPMttQyAtrjXDlZIiUdtSpcBA==
X-Google-Smtp-Source: ABdhPJzNdV9+m6nHyvdbqHHabPl5Op3KfzG1NQxvE17uSmjINQosUXEbnYAxNUNtSPcxc0ddIs75sQ==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr3234734wmb.141.1621512179138; 
 Thu, 20 May 2021 05:02:59 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:58 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/38] drm/sti/sti_hda: Provide missing function names
Date: Thu, 20 May 2021 13:02:17 +0100
Message-Id: <20210520120248.3464013-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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

