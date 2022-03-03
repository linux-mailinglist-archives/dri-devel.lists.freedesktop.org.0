Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3B74CC3A0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 18:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEB410EAC6;
	Thu,  3 Mar 2022 17:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18FA10E1D8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 17:24:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i8so8905265wrr.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 09:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ls9wtjKYLj4Hrf28Z+jhrJUB0UPCL2pVKG+9il9xBMw=;
 b=np2zAnpjMIqsdkfxo/fkvM/eHFjijTVV2oc2VB2wXnLbcPj/CZbi9jPdNBlc0VQBAV
 tt5VEjePWc9atcrUwAoTEFgi435wlNXiHGp+8GRE1Hwiy6VxqK2WnjTmmQW2KJVjy1Me
 CehXzLAkKiVM4VnBZs5w6ggj9hjzcKC4E4nYVmh8a+718i9SdlAbvHGzuqszpLWTH7JR
 WEcD1zvOFHlNZ2iDP6qmpzS8oUPNd1fw6z5NUe6427gDY2MsVj+zZvit/q+Mo0W8FX7O
 BnS30xKYsMYmsaoJkfyDQJx+ContJK+QZoiKhddCtOHXCKbf7JkhUguWPtg2Z7boy1vR
 TDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ls9wtjKYLj4Hrf28Z+jhrJUB0UPCL2pVKG+9il9xBMw=;
 b=exS7YQL5oqqtO8v6gVSpncIK9nqNpsQvX7+lPhVJqRuhOUVSVoMzdNR+XEYISj9wrB
 6UlxiDlp5iBHVpnXyaxPHnAtJPk2FtwQBF/73aDgzVxWSOkWVS4J46mc+e5Sgfgmg2hz
 66gp0D3epzREoydgMRAv/8xawwY2dDphfuqn4nD6ecycCaTGP/dt0mnQpOe1zDLyOXhc
 JSOyeGcN6MvjWenQiQHp1gkZtN/wM0vu1iLBaT92ptmsgERpgyeiKSqWGHwo7unnksuZ
 Y9FceSvEWvYft2xilEq1R1caJ9tGAwFJiXtncO1lApIUZm8MB8NZTva/WxyfnBh1g4Pa
 GZ1Q==
X-Gm-Message-State: AOAM5306s3DS86UmpfKbEO+T1WTTukhP6CiPQmSvOGBp8suVQCxAzCYC
 xLFKyidVkaqbnquWtiLYx10=
X-Google-Smtp-Source: ABdhPJz2u46vSdsRNfknxhbYenuQ8ABIT7APAs++tsCg9FhykB/A7oF11/3IOfy3ynvopQr5WVlrWQ==
X-Received: by 2002:a5d:6c6a:0:b0:1ef:e5b6:ebe with SMTP id
 r10-20020a5d6c6a000000b001efe5b60ebemr14117768wrz.502.1646328277256; 
 Thu, 03 Mar 2022 09:24:37 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b003814673f202sm10298928wmr.47.2022.03.03.09.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 09:24:36 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: marex@denx.de
Subject: [PATCH drm-misc-next 1/2] drm/simple-kms: Drop format_mod_supported
 function
Date: Thu,  3 Mar 2022 18:24:17 +0100
Message-Id: <20220303172418.12565-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303172418.12565-1-jose.exposito89@gmail.com>
References: <20220303172418.12565-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "drm_plane_funcs.format_mod_supported" can be removed in favor of
the default implementation.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 72989ed1baba..2c6aa67c6956 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -284,13 +284,6 @@ static void drm_simple_kms_plane_cleanup_fb(struct drm_plane *plane,
 	pipe->funcs->cleanup_fb(pipe, state);
 }
 
-static bool drm_simple_kms_format_mod_supported(struct drm_plane *plane,
-						uint32_t format,
-						uint64_t modifier)
-{
-	return modifier == DRM_FORMAT_MOD_LINEAR;
-}
-
 static const struct drm_plane_helper_funcs drm_simple_kms_plane_helper_funcs = {
 	.prepare_fb = drm_simple_kms_plane_prepare_fb,
 	.cleanup_fb = drm_simple_kms_plane_cleanup_fb,
@@ -339,7 +332,6 @@ static const struct drm_plane_funcs drm_simple_kms_plane_funcs = {
 	.reset			= drm_simple_kms_plane_reset,
 	.atomic_duplicate_state	= drm_simple_kms_plane_duplicate_state,
 	.atomic_destroy_state	= drm_simple_kms_plane_destroy_state,
-	.format_mod_supported   = drm_simple_kms_format_mod_supported,
 };
 
 /**
-- 
2.25.1

