Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA1B2DDFC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 15:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0562E10E737;
	Wed, 20 Aug 2025 13:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RpKt53yu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5148910E056
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:30:37 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-24458242b33so56886705ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 19:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755657037; x=1756261837; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WBLspprFztDG6+Qc7Fdl3/57LW5xmP9NJiJ32and0f0=;
 b=RpKt53yuoFJOX4keHB/Pn7yvSYKLcpw0Z/g/0kEhLD3XM4w2deWHBD++qRuihxPHXZ
 /2XIjWX5pCdeaAwjvYfCRk1wGmgaNs7d3bTVCVqFvk63muqWS8mCPzQD+nBN9MvJj3wy
 q5B5pKX0P2lWNidED99OnC2LDEE0mIFlnz9bd73CllN7DByzdXmLpONg+PpcI1K18Xpz
 bfJqXI0UNh6D1UtG1/36nulCT8HNgHQGzQ6y6/HM6zXVW9vZWpLND8OIVptQrqL6AnZ5
 ThktvXlVK4TpFrPfueYtgzJ0YSemDDexqYM9MIc242OOBaMkie5oBuEeBEtitFWlJTM4
 b+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755657037; x=1756261837;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WBLspprFztDG6+Qc7Fdl3/57LW5xmP9NJiJ32and0f0=;
 b=Shj8iZlCjo9kv/QnVABn1vy7XPgYUkru+9iEc364mvrBJVwpPVqjq1BVtJLNcrKvWs
 Et/QTtpUTk43HdVEXGf18UzrEEFrJmcAxDgxl6efB5rRd6AgZSUkOPVHdZhaaxkJIIec
 3EiTahPxHAXi9ESi6bHUMzudbHePa+yOqDxOp9MgRTj/r35L0pNhzHMNzYNa6zRdD6iG
 U/bKydYb7MyEMqk1Hlto2zCXMci92DCbf9tZUvmMJ7BHYI2bbPEMfYZ6baKzd4osLQJR
 zgAUmt8aqEJXOC2C9rg4RcsFnU+YDFookmL6kxvf1pDFhWLBuApOmfCdT7aTTaswHuaE
 HisQ==
X-Gm-Message-State: AOJu0YzcCRMuPwdtipgHvD+1uUr2+ASxbJWpUU5IXotSy92ya4hBrT2r
 ZxdIXZHCN0aA5HcUyhCuGml2XMv1fF+g1yoWWtyGYfX71MtB12ExIEuV
X-Gm-Gg: ASbGncuFjBjSLtYUCzIEXUT7t0admAc0csIHQD1uLG/Q8lk6UOEQGv8FQJlelZyvdHP
 +9w6o/S+VBnW5bbCPzBnbIN0Iud+gTiPEx0km50K9qMQ04+yP+GmLwejwSyHCub6qtujZ87L8Eq
 TxCi+3iQoeTqNOHewhTnPedWPFJ9LYOKn4k7pp8k4w5dNqOS7lPzEmYoUcGn+cHIfOBRtDPlkLw
 hsgEjAJ1A36F+NJq8yUD9GP/JI34XaA4oKS++pQVXF+bQ6eZxkYA6Lf1F0Tee4kA1/E4SRaDi53
 ldDxlbE1d/xD8G/zpZVbya81SHYBF99w1FLeU3wXWNyPSGn3bRipuPbIhMe3OWmzwEGYB6ZYQSo
 336K74EkSIwaLyi6Qeoyf
X-Google-Smtp-Source: AGHT+IGLN6/IE/ONxayhxMru/n5hlswUbEMiZ+nUf3HnpdaEUno4s7c46v0prUlmyY7rIbErGmDIYQ==
X-Received: by 2002:a17:902:e74a:b0:240:96a:b812 with SMTP id
 d9443c01a7336-245ef1728ddmr16515215ad.24.1755657036687; 
 Tue, 19 Aug 2025 19:30:36 -0700 (PDT)
Received: from localhost ([159.117.70.219])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-245ed514ec6sm10616305ad.136.2025.08.19.19.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 19:30:36 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
Date: Wed, 20 Aug 2025 10:30:31 +0800
Subject: [PATCH] drm/display: remove dead code in drm_edp_backlight_probe_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-drm-dp-helper-logically-dead-code-2-v1-1-34421f4a7442@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEYzpWgC/x3NQQrCMBBG4auUWTsQo4HoVcRFzPy2A7EJExCl9
 O4Gl9/mvY06TNHpOm1keGvXug4cDxPlJa0zWGWYvPPBRe9Y7MXSeEFpMC511pxK+bIgCecqYM9
 nH3MMJ8HjEmiUmuGpn//ldt/3H6bCSpR1AAAA
X-Change-ID: 20250820-drm-dp-helper-logically-dead-code-2-428c853deb95
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, Nai-Chen Cheng <bleach1827@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755657032; l=1205;
 i=bleach1827@gmail.com; s=20250730; h=from:subject:message-id;
 bh=dnPR+j+/0vH+fSk8M+SdilglPAKMc5DUN83yjz++SlY=;
 b=sSnGAQmYvuBlMPlBySv7ODjuBt6ADkJzz4dI6N5kWwoGXBf2MRiq6DHDh8HSSqloPQoJsporV
 KXBaR0fekm1BPmnuY9u9HoZE25em87dxI1rfV2XgoiXI65mtKmJhra/
X-Developer-Key: i=bleach1827@gmail.com; a=ed25519;
 pk=jahFPRplw20Aaim8fIt8SxlFMqkHbJ+s8zYBGbtHH5g=
X-Mailman-Approved-At: Wed, 20 Aug 2025 13:38:50 +0000
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

In the error path where ret < 0, the ternary operator "ret < 0 ? ret :
-EIO" will always evaluate to ret since ret is guaranteed to be
negative. Simplify by directly returning ret.

Found by Coverity(CID 1649044).

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1ecc3df7e3167d13636e194c4aab44ee8979aa11..654d466183d5ccdefcb4029dc4efc199f3b7b6ff 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4227,7 +4227,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);

---
base-commit: b19a97d57c15643494ac8bfaaa35e3ee472d41da
change-id: 20250820-drm-dp-helper-logically-dead-code-2-428c853deb95

Best regards,
-- 
Nai-Chen Cheng <bleach1827@gmail.com>

