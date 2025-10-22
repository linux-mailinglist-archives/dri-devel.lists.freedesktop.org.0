Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0F6BFC73D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A0D10E7BF;
	Wed, 22 Oct 2025 14:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ebeSwJGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E185710E01F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:21:56 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4270491e9easo4308026f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761142915; x=1761747715; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
 b=ebeSwJGXQLhyNlENGJUtJeRVsLY3LC+l5VdhFyjoyNo7gDBMKCTrXcsRWAUbNGvU1k
 tAoVJaSwBwxTFFnroMqJ2hmADBXRuY07uYwnTu32qhcdJmLcL1BaISCOXSzkAtw3bC5y
 fby9U5qmJwHHqxqICHC+VBeLU4zQAv+laT5H90V3BpQjo267ML5v0zVOlhlatZH+LSf/
 vHYjhsdFhO/YX1waK/P0oyA3CbP/EUCGERKS3n7WF6+WafKf9xMhT5u1BmX2S2l2uUZ6
 9TTORhhqhUSHrJrtcicji8QWDGsC44jp5bmTVIFR4M4hm0XPWx1/bOgnDcY5JASYUn9u
 n9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142915; x=1761747715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
 b=CYXMD/jz9xUpxhW3J3DVCo60WnGb/nKeObF2JOawACn0ViRonrxP6Po8/thQo9LdzB
 PhutzN0DnQZ2l73OfZmpzQC0QCglYCLeqVMSiG5EVf0ELnyWiRjflXC2jWF2pZxFJFPf
 gjrvZjGY0xhmHC2yiMkeopm35oslJ9kQTOY0q5Cjm43twco4X87wqOS8kKyabo7JoUKj
 ZufNtWC5pJ5/lkoW604Bfee46MWzQCxrqAeg43Xp1iisbc+ZKqKG2P9Ag5/XOZzB43so
 JSwCYSac3GWlAX1LORZiScmTuwOgdZP+tEff/gGKy9YVW4WydZlddA8aZhuA/JDbBddY
 7urA==
X-Gm-Message-State: AOJu0YxotdjWiwwsW+fufklbVsXlEqt5c+Y8t0Q+MqoRdhqTmjRF85GL
 tC4wGsBpjXvRoWmv7J8i3Zo9VcdMom3jeCZ+KhKB8Fj9Y7iVdOZ7U1JI
X-Gm-Gg: ASbGncufb/JRsDYQtvQGYu0vDj7gNYwJ7kHA1EA4rtqMrU1Nkv3NKnlHoDcd7wcjsgN
 wEN/yeOjB438WrXVsO/QMOVoXl1a+jwOOfROZnMzVAR2iKN6Gcy/r9bvhBpc3J4gODyP8uMAsLv
 mGMw1BReQo7Bix3f0SuwZtvmLfIQ9x61SVkL6cTQhCMMyXrLpwxw9BuK9G6RIlRyb+Gt8PRk+Ar
 P2ToayIQCzqzSvoo/XSXhfKAWuy2z3YXkmnqtwmH1faiNBgueTwsfZk4F9DBmanyxWHjGlE9oXd
 txsczyHkqGDhEMWOVJyYcCitEzgoMazHHRD6zBejhE4e5Sa82sh4F/FWcjPpy9y5Fj5aTRlIMKp
 haaSHNEikNVipGyTh/N/34G6AogYtEUlLaAFn6e/aUyuiATb5CldiotEqdWhR7w2X5es=
X-Google-Smtp-Source: AGHT+IFX0XnrlT4GW6rKQFEmK1orh25Up0PxK9L9DQEcm8KVBweiXSL9uA4QjEkF/hiMIpTbvZ0SpQ==
X-Received: by 2002:a5d:64c4:0:b0:426:d51c:4d71 with SMTP id
 ffacd0b85a97d-42704d44253mr11937579f8f.8.1761142915306; 
 Wed, 22 Oct 2025 07:21:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:21:54 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v5 18/23] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
Date: Wed, 22 Oct 2025 17:20:46 +0300
Message-ID: <20251022142051.70400-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 93105ed57ca7..149386a15176 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1

