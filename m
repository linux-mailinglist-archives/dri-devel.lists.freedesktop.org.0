Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E461D6E4BA0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEE910E544;
	Mon, 17 Apr 2023 14:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A4D10E544
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 14:39:12 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id k15so8751329ljq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681742349; x=1684334349;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XsIvUH+XayEW3em5sjVpj1a0LkS0qVXLQ3PvMIChjTs=;
 b=U8TVSD3ytEtFzyvwE3/ugTmdIEWJA21DHC6b5S6xIO76jbPO5FBdsTz1/nijJgTWFF
 gsITLQVnyvAuHbKThXL28aUs4ow/2Suj4/zDOuGMrAcs4c7n3RuqMWZ37dZEsrX+CTKT
 C62gf67VvC3WMEGWv99eYCMvw2Un4Pc6yP4tJEpjysnN3f5lNnVmlCPixF5JfNBTu5Gy
 dFvJcGvLhBaPxmp9glat18mwwi+eJapqyuWgKEDYIJ0frgqbK8ks+3ZRGxmfiuLAzYiK
 IaUVJBit/XYGSdHFIhqp9sIk6oeqkyz5W0025WtME/WmwK7iukgsJvzuon0ONMFSRjf3
 4HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681742349; x=1684334349;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XsIvUH+XayEW3em5sjVpj1a0LkS0qVXLQ3PvMIChjTs=;
 b=cPDTpwwlCVGHvcCniSE0AfA3CVB/PV2YLmlCwx4GyFcSj9/AsZ5w225c924/k3X6Ms
 SHyAsQszV5jrdEhqD8Xfhf+adYk5DY8ejUZCOSbIrGIumGyn2BT0ImN07YdOJEQJ+Tmm
 9DEEYd6qQkulMHyk5W2p4CvJpnEvs3PQ5QisNjB0ZYUewPXktkkLA+N65idKHJrAkEKQ
 GnblKWj35P7nz6bmRsct8TRE4Ddk/Tn/jcNYTGA1z8yzO8WmdcYFgdbbSdWb+4/UCK0a
 1JlyVTyM6/Ga+Lx5w3CAQZ7Z1RD+TExPQH5CiWPTIhF5nAuyOXrImkQyLyDTE89Y72jo
 YvIQ==
X-Gm-Message-State: AAQBX9dzeNwWgnAGoPWUypkslM9jA1jJIS8QA7lGRbHqIXPIzu6JHQhP
 dv/Lb2PgSg7MYgEcPLJ9mMPR7A==
X-Google-Smtp-Source: AKy350avdw011yiluXtOCLZaMkfJCMPHvpeq1uuP2Rp+U2kGyI5FYCROYpmK/Q8kdkD2pGGEjb3mRg==
X-Received: by 2002:a2e:7c18:0:b0:2a8:bcea:7d18 with SMTP id
 x24-20020a2e7c18000000b002a8bcea7d18mr1827308ljc.19.1681742349218; 
 Mon, 17 Apr 2023 07:39:09 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 2-20020a2eb282000000b002a76b9e4058sm2235785ljx.43.2023.04.17.07.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:39:08 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/4] Lenovo Tab P11 panel
Date: Mon, 17 Apr 2023 16:39:02 +0200
Message-Id: <20230412-topic-lenovopanel-v3-0-bcf9ba4de46f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZaPWQC/4WNwQ6CMBAFf4X0bE3ZUkBP/ofxUMoCmzQtabHRE
 P7dws2LHuclb2ZlEQNhZNdiZQETRfIugzwVzEzajcipz8xAgBRVCXzxMxlu0fnkZ+3QctFLLVS
 D0oBk+dfpiLwL2pkpP93T2jzOAQd6HaH7I/NEcfHhfXRTua+/EqnkggvRgeqHqm6hullyOvizD
 yPbdQn+KmBXKGVkXV2atsUvxbZtH0/CNhgLAQAA
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681742347; l=1221;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Li0EROMjBKT4+PRFLwKoKhmbnSL5mgFiclMhq0TezPY=;
 b=3XTRoAvKGwihPYa4YKQSmrCyU05BaQDzP+rUjAbRS5YBW+GG21irjYzz40VaBrSQMC7sQUrUzA3x
 GuLnZ9fqDpk2kLh3HfbfqE/VReIgyauC/VRONMFX+Pe25+in6DQ4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2 -> v3:
- Drop patch 1 (the one allowing port AND ports)
- Pick up tags

v2: https://lore.kernel.org/r/20230412-topic-lenovopanel-v2-0-055c3649788e@linaro.org

v1 -> v2:
- Remove dsi_info (unused for single DSI) [5/5]
- Add backlight.scale [3/5]
- pick up tags

v1: https://lore.kernel.org/r/20230412-topic-lenovopanel-v1-0-00b25df46824@linaro.org

Continuation of:
https://lore.kernel.org/lkml/20230217-topic-lenovo-panel-v2-0-2e2c64729330@linaro.org/

I rolled back the versioning, as this has been remade from scratch.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      dt-bindings: display: panel: nt36523: Add Lenovo J606F panel
      drm/panel: nt36523: Add DCS backlight support
      drm/panel: nt36523: Get orientation from OF
      drm/panel: nt36523: Add Lenovo J606F panel

 .../bindings/display/panel/novatek,nt36523.yaml    |  16 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      | 569 ++++++++++++++++++++-
 2 files changed, 577 insertions(+), 8 deletions(-)
---
base-commit: 7d8214bba44c1aa6a75921a09a691945d26a8d43
change-id: 20230412-topic-lenovopanel-0d3a057e3c23

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

