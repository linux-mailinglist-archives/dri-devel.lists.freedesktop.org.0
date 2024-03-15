Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90DD87CCA7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 12:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397971121D9;
	Fri, 15 Mar 2024 11:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r0kdI/aB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D661121D7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 11:46:30 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-513d9176cf9so686517e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710503188; x=1711107988; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JxuX+Ti8fZn5m/f6VGuBCXk/rLdBCegJSuZBjwwF710=;
 b=r0kdI/aBXJrgZUM+6ZezX4ebKzboJJsq7geK4H98jGTIuy/QIrIjZonaMAVgCKDd8M
 znn70J7gKcAducpgYw80jbetRvbyIScAlVlNvmgWEpfOXmDibNjfUFCe741kxFWcsQ6Q
 7/wFO4qt3Qv0D4y7EdYfvtVmryB8GEIIu+trCyMvzmSpGeMjMhSW7TQYRtXSJR9KIbb2
 O0ZpPBMUEujRuHHOIUXf3y2pumX7X8tNYh9pMwN0hQ3BDtpBYKrAKJ/nZPge7PwSqJPr
 TQ2pWx7f/Xm2xsmtU9qb6hym8fuGENvbDV0AEUEIDD1So9xVyXSqHtTXiG+BVeB15GZl
 XgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710503188; x=1711107988;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JxuX+Ti8fZn5m/f6VGuBCXk/rLdBCegJSuZBjwwF710=;
 b=LTWXintUkyuNCK0KE9e2TPKXgRrxg1312c+zeq0zOPWa7SUR9NMCySKdrhYpj1Z9Fc
 4CDr3QXX45dewOVXEYCrWeSppTlYaH26VMPV3K5bouWWy5DhbzCBuTlPTFKl67QrwOdS
 oJxgSY8ZYniHfFeuOo33qAeCMTG8SIqO+XfqwNW1K38D7Y2YhoJeefmZUvYXe8bdIIez
 ZNUmuJMouTfOk9NID7au2gWOLU6o2pRrovV/WQm/0WSDELB0VEqAam0OF9/9VwSPgxT2
 YIHiBm9Xi40L6La/1hnRq5onjnzsIvf2Z+UjCPbRtBYrCEOEcdv/AIi4vHg2Z8puz+P1
 hGlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMU7E/bL0WWsvWwSr4y6+SDJSxx0UmfJjhpi6ekzIXwO5TaGvQanbeLyX9W+KqrLDtuDtUVORJWbQnFkBqq8fWvEIGZRvFYB5EPMlebLBP
X-Gm-Message-State: AOJu0Yy+6URXQzzauBop59sfEqjwmKFbAz3pM6QnJTSDH/dSy4RA2h8e
 K8HaBC8dyAoeqCmRFnuirk6OwRL4/mq6EoGxG9iODF9LIcF7pREHb2mrTpKm8rE=
X-Google-Smtp-Source: AGHT+IG9loNuyVc8//m6ic0j8Svp2nfhDtNubUz8f7QGRIjouieDxv551LYQkLnlsit4nPLk8OzCpQ==
X-Received: by 2002:ac2:4902:0:b0:513:ba9b:80ea with SMTP id
 n2-20020ac24902000000b00513ba9b80eamr1897125lfi.63.1710503188171; 
 Fri, 15 Mar 2024 04:46:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l17-20020ac24a91000000b00513b024b232sm619987lfp.10.2024.03.15.04.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 04:46:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v3 00/12] drm/msm: generate register header files
Date: Fri, 15 Mar 2024 13:46:22 +0200
Message-Id: <20240315-fd-xml-shipped-v3-0-0fc122e36c53@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA419GUC/2WOQQrCMBBFryJZG0knNVZXguAB3IqLNJm2A7Upi
 YRK6d0NQRB1+efz3vyZBfSEgR1WM/MYKZAbUpDrFTOdHlrkZFNmIKAUAFveWD7dex46Gke0vNZ
 7LaEwFm3DEjR6bGjKwiu7nE/slo4dhYfzz/wkFrl6+9SvLxZc8ErVtTJSlsrCsadBe7dxvs2uC
 B9eFn97IiR+Z6yq0JhSgvjil2V5AdjevhryAAAA
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5696;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9bSTjD6AablTExbFVQTQerY0tTFpkWHBp91hc5H4cUI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl9DUQ1vnb905j4UscY4QZmZYGeF6jFRsUj0dRE
 RZHB73ol7GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfQ1EAAKCRCLPIo+Aiko
 1UYhCAClgd8Y5INWbu6fvY7IYqDegE8lnXbaciORcH7QIUzQM0yn8mW3EJ1XG/hwCGvvsfH68H+
 GnVaIds3A6UjmImexoUoNOqK+yOfyt8347G1R5nim7gNZTC3IbRiobW1rIbegYp308TWXqUMBZX
 rjBQEa3OG+AZsMC6yZlKQONDH6c6uhBOkbyL5S6LBEA34K5P8XXgtWhfWAIrsM4vMxotWUzf0fN
 9heRihYI9GIe647vpWdv2wCRK7CXpb+mqIJFOWBNxtrbIwng2Fq3VjQIq6yCQhyZCbiyvb2/tmf
 DgbGhhfBfYiaNYYMibJxt0Yx9GRPIpl8JZNN8VjP3lL2Adea
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Currently display-related register headers are generated from XML files
shipped withing Mesa source tree. This is not fully optimal: it requires
multi-stage process of the changes first being landed to Mesa and only
then synced to the kernel tree.

Move original XML files to the kernel tree and generate header files
when required.

NOTE: the gen_header.py script is based on the non-merged Mesa MR [1].
Once that MR lands, I will update the script and commit messages and
send the next iteration.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28193

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Split XML and git rm patches in hope to pass ML limitations
- Link to v2: https://lore.kernel.org/r/20240315-fd-xml-shipped-v2-0-7cd68ecc4320@linaro.org

Changes in v2:
- Removed the _shipped files, always generating the headers (Masahiro
  Yamada)
- Replaced headergen2 with gen_headers.py
- Simplify Makefile rules, making all Adreno objects depend on Adreno
  headers and all displau objects depend on all display headers
- Also handle Adreno registers
- Link to v1: https://lore.kernel.org/r/20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org

---
Dmitry Baryshkov (12):
      drm/msm/mdp5: add writeback block bases
      drm/msm/hdmi: drop qfprom.xml.h
      drm/msm/dsi: drop mmss_cc.xml.h
      drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
      drm/msm: import XML display registers database
      drm/msm: import A2xx-A4xx XML display registers database
      drm/msm: import A5xx-A7xx XML display registers database
      drm/msm: import gen_header.py script from Mesa
      drm/msm: generate headers on the fly
      drm/msm: drop display-related headers
      drm/msm: drop A5xx, A6xx headers
      drm/msm: drop A2xx-A4xx headers

 drivers/gpu/drm/msm/.gitignore                     |     6 +
 drivers/gpu/drm/msm/Makefile                       |    97 +-
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              |  3251 -----
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |     4 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |     4 +
 .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} |    45 +-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  3268 -----
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  4379 -------
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  5572 ---------
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 11858 -------------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   422 -
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   539 -
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  2803 -----
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |  1181 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |  1979 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h           |    11 +
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   111 -
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   790 --
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   227 -
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   309 -
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   237 -
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   384 -
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   286 -
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   483 -
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   131 -
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |    70 -
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |  1399 ---
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |    61 -
 drivers/gpu/drm/msm/msm_drv.c                      |     3 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |     2 +-
 drivers/gpu/drm/msm/msm_mmu.h                      |     5 -
 drivers/gpu/drm/msm/registers/adreno/a2xx.xml      |  1865 +++
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |  1751 +++
 drivers/gpu/drm/msm/registers/adreno/a4xx.xml      |  2409 ++++
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  3039 +++++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |  4969 ++++++++
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |   228 +
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   399 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  2267 ++++
 drivers/gpu/drm/msm/registers/display/dsi.xml      |   390 +
 .../gpu/drm/msm/registers/display/dsi_phy_10nm.xml |   102 +
 .../gpu/drm/msm/registers/display/dsi_phy_14nm.xml |   135 +
 .../gpu/drm/msm/registers/display/dsi_phy_20nm.xml |   100 +
 .../gpu/drm/msm/registers/display/dsi_phy_28nm.xml |   180 +
 .../msm/registers/display/dsi_phy_28nm_8960.xml    |   134 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |   230 +
 drivers/gpu/drm/msm/registers/display/edp.xml      |   239 +
 drivers/gpu/drm/msm/registers/display/hdmi.xml     |  1015 ++
 drivers/gpu/drm/msm/registers/display/mdp4.xml     |   504 +
 drivers/gpu/drm/msm/registers/display/mdp5.xml     |   806 ++
 .../gpu/drm/msm/registers/display/mdp_common.xml   |    89 +
 drivers/gpu/drm/msm/registers/display/msm.xml      |    32 +
 drivers/gpu/drm/msm/registers/display/sfpb.xml     |    17 +
 .../gpu/drm/msm/registers/freedreno_copyright.xml  |    40 +
 drivers/gpu/drm/msm/registers/gen_header.py        |   958 ++
 drivers/gpu/drm/msm/registers/rules-ng.xsd         |   457 +
 56 files changed, 22480 insertions(+), 39792 deletions(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240225-fd-xml-shipped-ba9a321cdedf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

