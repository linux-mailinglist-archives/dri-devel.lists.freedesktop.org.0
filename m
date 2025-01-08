Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB78A0630A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AEE10E175;
	Wed,  8 Jan 2025 17:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bZ47OQj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E12610E175
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:10:52 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso14415a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 09:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736356191; x=1736960991;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bZRl/jIT8uB/r9kmnVgG5TBst8UCINOdajarq/Q+Phg=;
 b=bZ47OQj5ECTcsiwd5QVDWygPAlb0fKfi7h5rplFR3qQa90VhUnkCWPNSqrOF5EYJDM
 eqih0PT/dQHxVkC3Eas4Cw4ME5iB6mSky3Sy8m6PN9QE2UeaiakEywlOo6KgsODspbzV
 JJGJyEDHcD7I1uMeEvz9zCgEgXMIA3YCaTMR5CCzaxMulDmR5B9eVoPfNkYaZiDrlE8o
 S0kZAfTcSoh5FnCskY6VDYFV4dU41bEuUwML9kwMX9+pEylgM3jJPzN9A5FeO/nZSv8N
 NruibRgIFeE9b5D3E6favXQh+T52/cgvqYVgnRRnNu3yEjXl0fg/hieMre4/3qbNYLmV
 bSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736356191; x=1736960991;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bZRl/jIT8uB/r9kmnVgG5TBst8UCINOdajarq/Q+Phg=;
 b=LBD+lLwL7CLrrOk1SjM41hKY6j/QornLJa2TUJjOhlz9z/2+qgvhrcX5DEIe6LHypu
 i5b7tg12iYljXScS23XI8RxK0w2ClsubTeiBbgrnAvdMHAcVH8ADVKuRoxXcu664T1Po
 lgCrMRM3Y0kwukHHoGuKrifRshbJoO0qjgVR1RFmnLBMPJkn4WoYhZxFsl1jVhp4T5Fw
 LAHvaTv262pKXWEj+XaDFV3n6psW89JRvMtlx8zJh7K9+wQmTx9u0PBjGxkfql14suBx
 gQA7AZR+ofXFRDOHiqEh4QE+TRwK6ki8KRrXDXq+R/UfMmQtvUoM2ShO7LPWl9Y9UtuW
 kJ+Q==
X-Gm-Message-State: AOJu0YxdcUpzsR3joC2o3apAvZT+oA0SY0ael2TxJ62Y0BRNV6EbIOLP
 FukKQt43uNhJRil9+gejZwt6R5L4YyuXf6m5g7YmnEPckmEvGn/NFRdACGKf5bF7pXEYIEp1t4a
 swdg=
X-Gm-Gg: ASbGncsDs4VAMHPYGS8OXARjiEjOHabsgbQdifOhd0mdmEMAs+WJFQ10sk/k6q7VQAp
 W2Q99VT3/Ues67CUbg26Ijw+T/4eekvRBToYZvOVW1drU1Gc8qykv9jV1hiGB55EMMTKsnNUj00
 oCDkDTGb31InrWqocKAmzgz2c4y3HUKDLU73V8xFfweoMZ+ssI3Af14LXFAfL4d1Zqq4k3A+raf
 POiU6SCYvNA6qVYm1y/3Zv8/buRW6q9zNDOaoBP7PnbeCgCjl7QYUx85Us9
X-Google-Smtp-Source: AGHT+IGT2W9yiRNnHWhCQFwEtFEOBt+fTSjqZ7msqjn6YQpc4lBgX0/mDPLImROOnOo9J0j7h9H6Gw==
X-Received: by 2002:a05:600c:1c28:b0:434:ff08:202e with SMTP id
 5b1f17b1804b1-436e1de8c6bmr31114125e9.8.1736352953222; 
 Wed, 08 Jan 2025 08:15:53 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 08:15:52 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 08 Jan 2025 17:15:47 +0100
Subject: [PATCH v5 5/7] arm64: defconfig: enable STARTEK KD070FHFID015
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-5-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=772; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=/H4ZYocEqi4RE1sb0guDfUix0kyAfFw8e32hk6SxuDc=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSyZUqWDoRMqRxRWHdPZ1OmxpMWlPUStE40NTbR
 Qh5ok4mJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksgAKCRArRkmdfjHURcKfD/
 4j0lpGO03jOuFcKFmvdaUaWEoZgiGAxt8XbpFYnaIbzTWK37FaYHEIf0bmWVzjb36+j7dMvjk3G0vE
 tDu1yKnGhJNNZvpXYAotSbPYGfrG0wFGa53PDQ25CFHWfjw6AuBoMmQx89hkTD7WXlECivSkpMG9Ex
 /dM+uCbl7m7BimpucKnVF8YrFNrw3vGeLald1Otgt9AWwjDSsCeU2Oy57L+BnP+/eBI+jmv9r0Dap2
 M4p1qYPfkMm3ebiLkEUvu2THntvG+8inAV+RvNAoRWfLaGejPYVB5zrPi2DJoECyhMvYKLIu6m23Kj
 gGa1P8jpok/dMlR58qCfw7xoFeSqTItsSI/W4p6Xymz2Htq+CQJjI0sQW6r52jj0GTGK1mE86Zkyh5
 V43A6rJeF+D2c9KFPX/DU0TOts8T7yrae/3G4Kx9mIae1bYWIRqROUP027GtOiWt0Oid5EENR+fxWW
 hrZONNg7KZIhiRHx2lgcdSCRSSawj8U5v/OFOVgl7n8aDGMm4L20ldq0upuGTEH0/58PvzDPNm1lxM
 5DnnNPlY2E3sd6V8WfmAMkOdZC4b6Z0cPzIq/yUilH6307scGsEPpoehZoNfiLRnAep0Mj4wsSrsM5
 GWG7aY9McdcqYrM94dwZQtfzr98WvGjRc61h8Py9+LTeTBkcxSX/bKsb8KOg==
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

Build Startek KD070FHFID015 panel driver. This MIPI-DSI display
can be used for the mt8365-evk board for example.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b2db31e010ff..1e2963a13500 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -897,6 +897,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m

-- 
2.25.1

