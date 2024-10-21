Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD8C9A6B11
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C2B10E511;
	Mon, 21 Oct 2024 13:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OfzZplYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684B510E511
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:52:43 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5c9552d02e6so5690771a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729518762; x=1730123562; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wfmOIjQ0u6s2Z1vVW23+WlBEpCv3VziXznZyhZ4a8IU=;
 b=OfzZplYoNnnlcgFiXvsl1ibv/IY8bBQc2qX8z+S8qUWEkP1DWCgIWBU6+/3AEouz9Z
 T15L/VDum1fON1UgYPiRU4w1L2uwMPB4dCKxmvWJ6L5Spqsd3APkslPOPHOEvrepQlcH
 xI7GsqNuacu/++3xp+nnuV6X1s4A1VhgWpk7DmPizjMH/0lDhVipBcdTv5UwoKxnjHpD
 CbABP/M3APiZnGOAqMw2uFB9EbvZ4yqm/V5IpXhJ/1IirEvLURmhMgFVboMUYoBX3xcy
 PTGtiucMJrwZjufOarIWYQY966vlodJsF8d4xILIHCbciR5sv7kzOpFMUbojcrktcdJ3
 9Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729518762; x=1730123562;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wfmOIjQ0u6s2Z1vVW23+WlBEpCv3VziXznZyhZ4a8IU=;
 b=FjI/C5OCgVwMZ2b++D5ArD5j6JcbJgljLhyD7GKKSnz+GusIA/DfG9z01Iq7ihFDcP
 XJD6mUxcjdbrHesRUsSeVoT/zN8fBlcX9X8r+7IeOOXWYahxjWDkDuhrOmgVAjhmLRIu
 n4P4Hh9JkQ+YvIjnw3jcrkQAOrN5/F3irrMtcI5YkOp+LihWmN3Ta+VU7eESre5DrZ3L
 WsulYTDCA2TVAX2AxLRHiCycFlvLX4c/f7K3z8WTwOH4Ui/G+S3CtAXyLp7xEOcMjo4N
 Pu1zHClTN7IaEHJjMepCf2Vvxhk7GsOtbEGuIuC2X6qlYhFMUieLd1TBDJz1VBUeEdVJ
 s2qw==
X-Gm-Message-State: AOJu0Ywhbv3EUbW4H9HdrddOPbZcH7UAsJWNYWeab7gYg1bqgVi0zSL0
 cJfgrQFHeDSya9cqTeJGgwK3qXbHHDs0JzDF0h7q0FY03jjoswP1
X-Google-Smtp-Source: AGHT+IFWX2pLQIh7KTEsIrHDg1JjXfzvicpXsd1hy2FovsO7HDGrNsIUYVSKlmKmfJMIudRRkgi8QQ==
X-Received: by 2002:a17:907:6d16:b0:a9a:1fd2:f668 with SMTP id
 a640c23a62f3a-a9a69a680e8mr1237736266b.19.1729518761432; 
 Mon, 21 Oct 2024 06:52:41 -0700 (PDT)
Received: from [127.0.1.1] (leased-line-46-53-189-107.telecom.by.
 [46.53.189.107]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a9a9157212csm205320266b.162.2024.10.21.06.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 06:52:40 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 21 Oct 2024 16:52:36 +0300
Subject: [PATCH] drm/panel: s6e3ha8: add static modifier to supply list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-starqltechn_upstream_integration_panel_fix-v1-1-81776e89052a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKNcFmcC/x2N0QrCMAxFf2Xk2UKbWSb+ikipM26BWWuSiTD27
 xYfz4VzzwZKwqRw7jYQ+rDyqzQIhw7GOZeJHN8bA3o8Bo/BqWV5L0bjXNJa1YTyM3ExmiRbk1P
 NhZb04K/rEQcfh3iLpx7aYRVq8z92ue77D5TWyE58AAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729518760; l=1238;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=FHVpt+ijZNTJYfyRYgoyUA9Z0jPkQ0HEGyo08Iag3W8=;
 b=UOz0GwPCD9+DajTE3mWxf5jA0/6F0aoy87fTUuM96fBx7TIBiFBDUPCtwgdUny5/WOPCo9Bdf
 /q5rtzMDycnClzFSppmd8HUAXq0Y9HaB9NHzxFIcNdZDA8xsj01tImC
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
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

Add 'static' modifier to panel supply list.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410160810.0jaNgxB2-lkp@intel.com/
Fixes: 779679d3c164 ("drm/panel: Add support for S6E3HA8 panel driver")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Fix kernel robot static analyzer error.
Rebuild with sparse to be sure.
---
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
index 76b5a6ea610d..64c6f7d45bed 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
@@ -24,7 +24,7 @@ struct s6e3ha8 {
 	struct regulator_bulk_data *supplies;
 };
 
-const struct regulator_bulk_data s6e3ha8_supplies[] = {
+static const struct regulator_bulk_data s6e3ha8_supplies[] = {
 	{ .supply = "vdd3" },
 	{ .supply = "vci" },
 	{ .supply = "vddr" },

---
base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
change-id: 20241021-starqltechn_upstream_integration_panel_fix-32270575b583

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

