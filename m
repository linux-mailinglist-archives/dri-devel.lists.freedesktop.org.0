Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50055B2CB
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 18:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192B011A515;
	Sun, 26 Jun 2022 16:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB5411A515
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 16:33:27 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z19so9914531edb.11
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sVuYX13nI5OGMjjEITD7pC0Wd81Pv/YPWpmj93LvrA8=;
 b=WQPH7TPAF5nk0M0CIiemSalGkHAQpRXBYySfGbh8M92ShbwCKawZTWlZumKpVTA8ah
 2sHzR+Dvct2Tszp0DLViGXmm+VbQTTUjub/XvrjDSMy/CRwHA2TH5HMeSBa8yegZvb3p
 IlKqqHlfWBVNPsVOaT7hSh6fboWejbSz1LE48v+ZmoD5ow2ru26OmluujK+kzfldpTEP
 7YJdXI67F5Rp7wPmpUOPVTaZ7YTb6PjH2TUUHRRyx4vvsDGYsvJ6pnxwOiiQbc/3pSq/
 wY960MNg5DmHt8ehTFfyW7JHNwk92jhQlhdrLJlEFz1WK9Z/1zqTD2k3GDJ/xbVIQbJ9
 Uomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sVuYX13nI5OGMjjEITD7pC0Wd81Pv/YPWpmj93LvrA8=;
 b=D2w+Jlj7I4o4anNUF7EkSSxW66R6MnNVaxEVTIBxvW/z6M0JaO07fAgbSNgWT1u2JO
 hJL+P/tjBOlg8b03XriDsaW/ZGm/yFJWUi8CdGsaMkNx1YynCVpBcMmg2S2UvqU3iL5b
 EbpUMLRL4snfTkuv/cufVtOGwMyeAu4KbuYg/ivqXnNSME6w3OLOVjl9SQWA9wRE2zqK
 iR2fmOzsEnywr9l83ZesnDA3jHuz4iPrx3h1Y3OFD/2GLgg5cI1FWuFSJ3q29f0rx+xg
 3pesHOM7/TrY9w0WZ9FVIqPRnb1Vt1j3wQ+wCytK+bl2Ol7GI5OwPMTHtTyL0ErOKBDW
 Rj1A==
X-Gm-Message-State: AJIora/NM6ByRSAL9ubTlnf0S4hQzFnEPJdTdLyX2OzZYoxnLX3V5CR5
 guJFhZmwCJx6eYd7748DCpdWkQ==
X-Google-Smtp-Source: AGRyM1uJs7rgZJoZInvDvRsjNQuVqjd/QN9uwVR+kEH4w9BGFiyiQCHnGTed8Gkp5FmJ9A/WneZopg==
X-Received: by 2002:a05:6402:3708:b0:433:2d3b:ed5 with SMTP id
 ek8-20020a056402370800b004332d3b0ed5mr11863215edb.246.1656261206306; 
 Sun, 26 Jun 2022 09:33:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 g5-20020a17090613c500b00722fb3c99bcsm3930403ejc.203.2022.06.26.09.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 09:33:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 1/2] drm/exynos: MAINTAINERS: move Joonyoung Shim to credits
Date: Sun, 26 Jun 2022 18:33:19 +0200
Message-Id: <20220626163320.6393-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Emails to Joonyoung Shim bounce ("550 5.1.1 Recipient address rejected:
User unknown"), so move him to credits file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 CREDITS     | 4 ++++
 MAINTAINERS | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 7e85a53b6a88..91a564c17012 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3491,6 +3491,10 @@ D: wd33c93 SCSI driver (linux-m68k)
 S: San Jose, California
 S: USA
 
+N: Joonyoung Shim
+E: y0922.shim@samsung.com
+D: Samsung Exynos DRM drivers
+
 N: Robert Siemer
 E: Robert.Siemer@gmx.de
 P: 2048/C99A4289 2F DC 17 2E 56 62 01 C8  3D F2 AC 09 F2 E5 DD EE
diff --git a/MAINTAINERS b/MAINTAINERS
index 19875f60ebb1..d208bf3b6f11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6695,7 +6695,6 @@ F:	drivers/gpu/drm/bridge/
 
 DRM DRIVERS FOR EXYNOS
 M:	Inki Dae <inki.dae@samsung.com>
-M:	Joonyoung Shim <jy0922.shim@samsung.com>
 M:	Seung-Woo Kim <sw0312.kim@samsung.com>
 M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.34.1

