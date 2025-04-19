Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25880A9418A
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 06:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1B210E433;
	Sat, 19 Apr 2025 04:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k+S5HesU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F036010E433
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 04:12:47 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2ff784dc055so2217000a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 21:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745035967; x=1745640767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2EEU4lAECRnBASq+mrLLeIBt7peza+IbheB4UcrfQE=;
 b=k+S5HesUJudjMjL1x9Ff5vCoZPqsv5OSO+S6AKuAzuz8WclLnNTUFU9kmURHhl61QN
 ofqlW4ABsxJlzuCm54kE/MuKoRecrobgBLjX054i5pzM7rY4M53GmU8dVtXfDopDtIMz
 qzkDkHFFVch1hW7lp3rpCkFNutcPaOt2gaiYwGBNBUvCx919jFa7Z+N+GMof24L932Ln
 +01Q9O+LqChTeQYES3u6Ui2IiHArI8dmT+YA2rqazvkxcgJR5s0OtThX/IrtkRVXs4zq
 Q0ZUeWc0QywtYWM5kHhpQVG+bMpAXURnvd+40qCBHMnCtKu5YdFdGFBJl9mq1a6mybj4
 g8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745035967; x=1745640767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f2EEU4lAECRnBASq+mrLLeIBt7peza+IbheB4UcrfQE=;
 b=ZoF31DxiK5V226xnksvJjku+VovFngOaX/8Tc+W2Jzm8OBCKX0M8opIZPOacHREdrk
 sf9yLDBFOTVdxza5V38VJtaAE3TlYJCIoF6RsWvtomk28ok2GLOLG+ZWHGDQGCqinAF0
 vGIDc9jnKF4PJQSVtqRSqX7cAq+wWtB52uZJpJOx7Z35SLb1kUxdajSMfZ0HcUmDL9rR
 lKuBE/+M8L12WC3ty6rNNLKCocum9F4nomagcfW2nWXyHtvFhUaoUyrYEwt2Nkht/7MW
 3ASWJEvJEtfxeFw45uab/Hq8Fqdtk0127yCBpzCG2PtG0ZVK2MeqmrJY81xo3RAAWZLZ
 C1Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxGlvIQ2C+A2gc6ntW77mwZp+y2Bs797xf2F1iw8cb92G7pCl8b+ETbWrXYFRujcEldZdiILMBA/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybdm7unU0BnhnKkq0tblPiI1G5U8BFhYHVop/Xk5edIdvVo+mv
 C1aIKZveqUUlrllOtaMzaLcIeJ/xDzmHtleDqtvyK8IHd8/B9MhO
X-Gm-Gg: ASbGncvzs3prwK39WUgZGXMax57QYOLiSZNIQSsZFfi8ep8jCDLBu6PAepejY6xeANV
 MDH0Vmst60VCrQQ8PG3BooYxSQDehYThZWeuNo464HgM7aQ5LyBPDRVRP4VKv23tverLwwTnAFM
 z064jSOjay2OCm3qt9taQBdSQ/6LRPBZoWAfxhSOLJ4tporivD0mEm7nT6hxkqV2NItbNWN4Tle
 +I41cUaeo6Znd5g2XwE1Gyvokuvqz8Yo+GF9OziqF/rdMnKKbxbAm3i/TnefzoT5Ej5FsvQUApy
 giFFSV8gGsmtAyJJuJGu6Z9RykSzAqcbMpb/y6LTdC3nMOQa5fKLC86n3vc=
X-Google-Smtp-Source: AGHT+IFueTZgV/3cVROXVf2/9ezTnpmIjBgGyIsCuJh58nnz8D7r00Dtgd3pGYWX5jwTrtUtU+MweQ==
X-Received: by 2002:a17:90a:fc44:b0:2fe:861b:1ae3 with SMTP id
 98e67ed59e1d1-3087bb53f21mr7425566a91.8.1745035967512; 
 Fri, 18 Apr 2025 21:12:47 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50bde283sm25296545ad.6.2025.04.18.21.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 21:12:47 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asrivats@redhat.com, Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 2/2] drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq
Date: Sat, 19 Apr 2025 09:42:10 +0530
Message-ID: <20250419041210.515517-3-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419041210.515517-1-tejasvipin76@gmail.com>
References: <20250419041210.515517-1-tejasvipin76@gmail.com>
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

There are no remaining users of mipi_dsi_dcs_write_seq and it can be
removed in favor of mipi_dsi_dcs_write_seq_multi.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 include/drm/drm_mipi_dsi.h | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index bd40a443385c..0d6e0d03d802 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -416,28 +416,6 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_generic_write_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
-/**
- * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
- *
- * This macro will print errors for you and will RETURN FROM THE CALLING
- * FUNCTION (yes this is non-intuitive) upon error.
- *
- * Because of the non-intuitive return behavior, THIS MACRO IS DEPRECATED.
- * Please replace calls of it with mipi_dsi_dcs_write_seq_multi().
- *
- * @dsi: DSI peripheral device
- * @cmd: Command
- * @seq: buffer containing data to be transmitted
- */
-#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                               \
-	do {                                                                   \
-		static const u8 d[] = { cmd, seq };                            \
-		int ret;                                                       \
-		ret = mipi_dsi_dcs_write_buffer_chatty(dsi, d, ARRAY_SIZE(d)); \
-		if (ret < 0)                                                   \
-			return ret;                                            \
-	} while (0)
-
 /**
  * mipi_dsi_dcs_write_seq_multi - transmit a DCS command with payload
  *
-- 
2.49.0

