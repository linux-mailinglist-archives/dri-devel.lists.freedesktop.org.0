Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAC9BEF078
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 03:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D879F10E235;
	Mon, 20 Oct 2025 01:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fsOW4Dw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF0F10E235
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 01:42:58 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id
 d9443c01a7336-290ab379d48so34582515ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 18:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760924578; x=1761529378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hLJMAroOuEjEfmiC8wuRqME2tmvcm6bRHXY9lq4lfzg=;
 b=fsOW4Dw+1THr4W6clLlM+0N+aQNPp/RBzootcY+H+81VlF3cyFvz0KgxEYZJGggimX
 mnb6UQqZ1PoKkccFAXgd+PZZA52a8hSv9ecKJXL3CWx3gee1JAcD2xlpB/yRCmii24GM
 ACophylACUUFmu1Av1mZc+Al3xbD1UfC2YVwlKUvy4nuBT9+Wb0QC0PaSShTDAg2Y7tT
 wHDfRu+mLGbAgpz8eBu/5oUv1ysiT3mKu/uqnAUiz9l5MxqSvMcD7iWsk/WRxhDz5WLW
 GFhGjDgqpXrsmSk/NJftpm1x5lLqCwFCWvLjictO3nzo0W8IuQet/D6WRdeY82eBTcDg
 MjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760924578; x=1761529378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hLJMAroOuEjEfmiC8wuRqME2tmvcm6bRHXY9lq4lfzg=;
 b=sVfr50FvxnoMVxf8dmGnycd6tgCx+29RvRE3O+/oIwcDv+R7baHqySBqIXBjsLuFle
 kz4xLdEwaloEz9/R2EZTPLn2m2wpQVR0PF+EviSJmxtSqRVzx/IXO70J0o4sEtoMEo60
 VuhltMEbO9oU+IW3KOO6Jv2Q6BmmS5SRwqY3x4Ghz45ABTXIZe+Icxb3SDG7UmdgGEDJ
 Wrcuv/Ji5AO99evMB8adqzTwzpis5x80tsiQyUGwjZv4uYk6UAiU6mdRz/szuVkz1X2G
 SrBQ7vDk895nVxDvgk67JPIDY2F0axo/8Lz2m5zBVnVJee5rodPUETb4jKABWTCkHJ0i
 O7Rg==
X-Gm-Message-State: AOJu0Yygpp7ILs9HNgTyMygvz9uUd1psdsECWAeYZYsI4hhBW6A1xhWK
 uSRi4/8UQT4v0xfV/fmOAPfnNAJTVKlA2VrBkYlWHvN8wUvXSTxffGqQ
X-Gm-Gg: ASbGncuXD8TeB/AQxJ7I3Vx8/brPakc2tOAuzEm+XwotRMDAuEWfuN248rb3ufanIGV
 IJvZPwMA2mpHVaF01oVcjQ/MH39J8nlguoqs6HHAVA65x0TVm+TbJBqMzLeW6ddJZ3m+3YJNQ5E
 mast+mM5dsGT2QnA1NTftUbkQS0b3+WZw5+jxGHnViqZsuNpmiLNj2I+zsZ/RvqtSgYEVLyPMUU
 WtBmus/psGgHX+9ETwVqFJbxUo54eV2s7rLDCGnq2bKBh6g8TAVrdgHi5iiTfNgMbXqkqew7sGP
 UXk38CiHFhrAOae+7MS7qH87yPWnT9WwpaaxOW6/IKLUWApt9yrdKwjKczWlCvhReZ/IEmcasTA
 5g8PCMyltjSVwta3Ww/5m6ZWqYH+XFdSgEnKjQuUHZptHor27zIsKZYgLRo8RdNEruJ7Z1hmBU+
 p1kONZPuGwqIv1/nG2AQ==
X-Google-Smtp-Source: AGHT+IHbBpBYJ9xuTUr+8e8R2x206I3Dg3JjY2xjNJ+AjmYNNy7hKRGNFm1GDWB2gyHgbSQdRzGtdA==
X-Received: by 2002:a17:903:2310:b0:246:4077:4563 with SMTP id
 d9443c01a7336-290ca121a15mr136211665ad.34.1760924578216; 
 Sun, 19 Oct 2025 18:42:58 -0700 (PDT)
Received: from VM-0-14-ubuntu.. ([43.134.26.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471d5c0bsm64773965ad.69.2025.10.19.18.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 18:42:57 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Junjie Cao <caojunjie650@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jun Nie <jun.nie@linaro.org>
Subject: [PATCH RESEND] drm/mipi-dsi: Add dsc_slice_per_pkt field to
 mipi_dsi_device
Date: Mon, 20 Oct 2025 09:42:48 +0800
Message-ID: <20251020014248.2846466-1-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Some DSI panels require multiple DSC slices to be transmitted within
a single DSC packet. The DSI host will only correctly program its
registers and avoid display corruption if the dsc_slice_per_pkt
parameter is provided.

Since dsc_slice_per_pkt is not part of the VESA DSC standard, it should
not be added to struct drm_dsc_config. Instead, introduce a new field
in struct mipi_dsi_device so that panel drivers can specify the required
number of slices per packet, and DSI host drivers can retrieve it
accordingly.

Originally, this change was part of a single patch that also included
the DSI host modification. This patch splits out the mipi_dsi_device
changes. The corresponding DSI host patch for Qualcomm MSM, along with
a panel driver that makes use of this field, will be submitted
separately.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380..a6357e8c2 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -180,6 +180,7 @@ struct mipi_dsi_device_info {
  * be set to the real limits of the hardware, zero is only accepted for
  * legacy drivers
  * @dsc: panel/bridge DSC pps payload to be sent
+ * @dsc_slice_per_pkt: number of DSC slices to be sent in a single packet
  */
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
@@ -194,6 +195,7 @@ struct mipi_dsi_device {
 	unsigned long hs_rate;
 	unsigned long lp_rate;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 };
 
 /**
-- 
2.51.0

