Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7442C8A7054
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3A3112D2F;
	Tue, 16 Apr 2024 15:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WJ3gEgYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C4C10F199
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:46 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-570097653faso3256609a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282825; x=1713887625;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=;
 b=WJ3gEgYxMC0tRCR9LA9fibWLHhKWk8dvc/dkfLxd+Y89czK3VBmSGneT058UKze0co
 p8WK+l3PL204ITSwHvFm6xwBWdcaG/tTOq6nuy+fsWo5YXo56RwoOXG8wCi24h0O56wF
 AlWdK27f7mcnVRlcGPaclVXc7n/q6P7S2sMf53QEbjW2jQ5T6i9LaMCCHRv2FM1+QKu8
 sqOY0DKmQuUxRG0cmjpHJYfMaikLwjB0TvBJsPncItQD/WUvAfCP2CNS4wFFLGYF59FL
 tXGRsWcsnujv7I0cbFe17gLJNyexo2SCW6G9UPK8K7h62A48vel3nPQAai1dErRClrFz
 ghmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282825; x=1713887625;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ngpZb20B2h9Qc9IbX5I/ZiczUNGoVVnils8jWsBLdA=;
 b=FGEft13QiVKXx+Hwgnfg6ftsK1phL76dkOeVB9PPqACqPIJz1Zgeg6ZYPWA4HV4gPL
 xoicxhaPkcl1gcRkMmkIfi4HMtKzPGrNAfifaffWocHXRAJUJapUhdCkNL3J8mLmuuqH
 wKd47Zn3HwDjt9/aEsvwZa8pNJx31SDoqMxiCJl48IZDAYbLwiOwBZksqajE5YGA+Tpq
 K5iBfI5xnTJGqcHy+OMRPy0quJXdDMRhdaVZzwSnamlggj4Pm0chijQvgazXSpTO/O5i
 0mwLa3m0WJXCC3Nwz9HE7728UP5NMLND40d4uI5GXApYoy1b8cq+vhJbWtWNopx8krk8
 54+Q==
X-Gm-Message-State: AOJu0YwPOVkgZ/4vMG0l7IF6IUm/YSvx6pEScw8PFu9W53uPVPl+4XAu
 010vhuN/rGhGPVCfVcurhe21jbatxUMlt5XhttF4P/4N4v6kPFB83dCKDCR2TVY=
X-Google-Smtp-Source: AGHT+IHS8gkjj052p63IxLAZQoDwSNpts+GSvD3Ttdv8alHt/Cx4qP4IbNw7Ik0JeHFuC8d5NxqZ8A==
X-Received: by 2002:a17:906:70b:b0:a52:6e54:1c96 with SMTP id
 y11-20020a170906070b00b00a526e541c96mr3885284ejb.15.1713282825054; 
 Tue, 16 Apr 2024 08:53:45 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:44 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:17 +0200
Subject: [PATCH v2 16/18] arm64: defconfig: enable display connector
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-16-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=693; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=woF6NgCy9sWp4jU9xhCym7WDVQPI/tzmO1lBDEzOVXQ=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qIwtSSbyVpXRpUFOdzU8YlXuq4amJoGc3u/12
 S1MzvACJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURd5DEA
 CxggRzPxIw7OeYNeMDqJ2rnFJ5h7mlJ9X2EP80Dokttj2mIP4Bk+vPXL/6hYoAmzTjqzWSaiekP1h5
 a2SWzg4kNXkdFyooQxYqwPPXjeM0+sJETbmIWw6c8v2ePq8ZYCsJmKO1bqaI99a3OLVwRA1G2jlrIl
 zzBJe4HOehi4zwzV4FFxaDRznY1+sPKrT7fNcham2SDvEeoI5flZvTAm3j1hKMYVO049HUWJ1pNTZo
 dLFiwMlTUHLQJvdFuuzahgPAk3UgJkTW8BVqGDf9vA3wcnlfDrVostJvktfroFrgFd56zqvGUgVJza
 mH2J4qvmYVlaz5wiQZdgtgN8BGQopSjvQCwFacVTz98+UdmmNmEjxp3SC79KGYJdUSZDfLcWORGlzy
 gLkB6ZuHZSJI+y/CEXRz8bdVfKFoYCGZsYx5z0WcRQginyxYUzPd/NOofzxfd6sxeXLE9DJZyrDAgX
 TObwzMlqvAes96Z5e1PUy/juWu9QKPIZmGCNFfjdo/0dpKzTSRI+14BTGvPULQhxrrdu57vJLFVeuR
 MleDRGDahrsn6feV2eDPRhMHNTWBLMGuP10Nr7V6N9yHirzp/jJK5ZIB1ibq0LWVgLH7KSvKmxFiKL
 uwHmdBqyhnNhKh7m6Dt/emc6Hcusn/f0ocbUSLIHNvWwDZsIU4b6ngOBc1kw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Enable this feature for the i350-evk HDMI connector support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce98a150014..1df337882835 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -872,6 +872,7 @@ CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1

