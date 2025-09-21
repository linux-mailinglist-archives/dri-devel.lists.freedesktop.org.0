Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B842B8E54C
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 22:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C5110E27C;
	Sun, 21 Sep 2025 20:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Plysh42y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD6810E004
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 18:39:08 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b55115148b4so2257508a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758479948; x=1759084748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hq6jXGXLG3JigntJa3VtN4WdTvDP+hByOjJ1Pi4yPUY=;
 b=Plysh42yjeX6xgm95KPzwlRJFIrW1dDw5i26U8TYjCFQpo+PX9CS23z1h/AtdfUabz
 LdLiBMbdDCPuMlep3lShrCncoSb4212RdvHFS1wMnes3QJowrwcGsC401OEl691O29rb
 tx1eDXkVPzyODlh/TPDdotG6ORrxwwSle+JXINmG0t7ZGCxp2D5vWAWiUfW3Jl+fdbSD
 C+mqirMpqovJch6ajdQwNyfnT+b6dNGQE+fHMCNfVfLdafsoT9dDLM56SgJA1BR3xW59
 eR9hAmXgbPkS9piIvLiFrvHtxNWjghNWo35t+TswRgGe6w2fG+VINU5CI43SfjStPlDs
 TxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758479948; x=1759084748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hq6jXGXLG3JigntJa3VtN4WdTvDP+hByOjJ1Pi4yPUY=;
 b=rqboB/lFWDFlvdEf3LSp6ignMigkZrSnO8MR1rHwg+F96dVUXJPmJ339bSP0KOxteh
 tXSqwChQJNbCEcPUoMds2xrKZi2J+8+793u5jeSvr7FVpUTu/WZ9OaWKbxE0+V4PcQII
 ZJ3mzxktQ7KJZAziVsLh7CM5JK85g0VAmuBeo7Rjw7gzEwHyRvfqCnP8yV+BvjjFeLbK
 dEsga93307b761gD76vahcj2edG8dvA02WqUzSqHHgxJLicczIIhaHqjtw/k2CLxeWrj
 MYFQVTCIVUdqj+E5RBeooRd/cwswZttvjHlIqCy5BAcI+iMwm3m1F8XF68srefnmRied
 7o+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7L0fGgspY6JGdNzDDQ/8/B1IkF7H4pPyT+Wj1ZZkirCjlIZDgTRWY52Hig1QMa8usSXetIjeXZ80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbYQkkcq0Jzlrh1HerMIVGWgGfrcyNpE50CiZ/AY3S5qJCcbPU
 jMkNsnfxu4hQMgPCyC59VX0GCr2v13kUNcBErNPkFR/ukfMxK3oPLDRv
X-Gm-Gg: ASbGncuKgWqUZzADuFqs/FcJGXubR/GI2M705vLoF8AIRg8Ema6Cfk4Bx3N+8Kf8S6i
 2/3sHXysmJdp66sRuChL9yS69tM/kMKuXyasgYAdCGFLh3/8Rh732fWLRJvZjG38VdcehG0Pdk3
 7MEKBG2VbktddCGdtPCvqWBGSc63FIP4yVvBR6U1bmVXb7Bcgu6Z3BneuEDiolmINVpxPNkXwus
 2+xNJ9vQR63Kp2oyePh7x0EP1PSK28mDzIjmr/oGlHb5LArUxtk6OeMasWmKIa8Ex0sDRwxnF4n
 XKN1IRixDFb4wL2/WzggMZ4lghmd/eMjwACYPG3VG6vfr8xs3/W9PtxvbjHUHpvNkgsS2+y1jDL
 80yhRyySscfvKdnKPsg==
X-Google-Smtp-Source: AGHT+IG/tBXYTLYsn0XwDsfXDr3GxHXFm/OCmsG97SH6xg+8qlRPLcBgWhtCsUeNNJUVJ4KN1b1Ujw==
X-Received: by 2002:a17:903:2347:b0:270:b1f7:2e5e with SMTP id
 d9443c01a7336-270b1f730b2mr82568485ad.22.1758479948106; 
 Sun, 21 Sep 2025 11:39:08 -0700 (PDT)
Received: from fedora ([45.116.149.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802dfcbesm111053795ad.88.2025.09.21.11.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 11:39:07 -0700 (PDT)
From: rtapadia730@gmail.com
To: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jessica.zhang@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, corbet@lwn.net,
 Rajeev Tapadia <rtapadia730@gmail.com>
Subject: [PATCH 2/4] drm/mipi-dsi: remove deprecated write_seq macro and
 chatty helper
Date: Mon, 22 Sep 2025 00:07:20 +0530
Message-ID: <20250921183720.237761-4-rtapadia730@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921183720.237761-2-rtapadia730@gmail.com>
References: <20250921183720.237761-2-rtapadia730@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Sep 2025 20:27:20 +0000
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

From: Rajeev Tapadia <rtapadia730@gmail.com>

The mipi_dsi_generic_write_seq() macro is non-intuitive because it
returns out of the caller on error, leading to subtle bugs in panel
drivers. Similarly, mipi_dsi_generic_write_chatty() is redundant.

Both are removed in favour of mipi_dsi_generic_write_multi(), which
provides proper error accumulation for multiple DSI writes and is safer
for panel drivers.

Signed-off-by: Rajeev Tapadia <rtapadia730@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 32 +++-----------------------------
 include/drm/drm_mipi_dsi.h     | 23 -----------------------
 2 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 3a9b3278a6e3..bc847ab5c822 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -773,42 +773,16 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 EXPORT_SYMBOL(mipi_dsi_generic_write);
 
 /**
- * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an error log
- * @dsi: DSI peripheral device
+ * mipi_dsi_generic_write_multi()
+ * @ctx: Context for multiple DSI transactions
  * @payload: buffer containing the payload
  * @size: size of payload buffer
  *
  * Like mipi_dsi_generic_write() but includes a dev_err()
- * call for you and returns 0 upon success, not the number of bytes sent.
+ * call for you.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size)
-{
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	ret = mipi_dsi_generic_write(dsi, payload, size);
-	if (ret < 0) {
-		dev_err(dev, "sending generic data %*ph failed: %zd\n",
-			(int)size, payload, ret);
-		return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
-
-/**
- * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write_chatty() w/ accum_err
- * @ctx: Context for multiple DSI transactions
- * @payload: buffer containing the payload
- * @size: size of payload buffer
- *
- * Like mipi_dsi_generic_write_chatty() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
- */
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size)
 {
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 57a869a6f6e8..e4d26ed7a62a 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -288,8 +288,6 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
@@ -382,27 +380,6 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 					  u16 scanline);
 void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 
-/**
- * mipi_dsi_generic_write_seq - transmit data using a generic write packet
- *
- * This macro will print errors for you and will RETURN FROM THE CALLING
- * FUNCTION (yes this is non-intuitive) upon error.
- *
- * Because of the non-intuitive return behavior, THIS MACRO IS DEPRECATED.
- * Please replace calls of it with mipi_dsi_generic_write_seq_multi().
- *
- * @dsi: DSI peripheral device
- * @seq: buffer containing the payload
- */
-#define mipi_dsi_generic_write_seq(dsi, seq...)                                \
-	do {                                                                   \
-		static const u8 d[] = { seq };                                 \
-		int ret;                                                       \
-		ret = mipi_dsi_generic_write_chatty(dsi, d, ARRAY_SIZE(d));    \
-		if (ret < 0)                                                   \
-			return ret;                                            \
-	} while (0)
-
 /**
  * mipi_dsi_generic_write_seq_multi - transmit data using a generic write packet
  *
-- 
2.51.0


Test message
