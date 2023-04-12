Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC26DFEE6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 21:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AACF10E939;
	Wed, 12 Apr 2023 19:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99CD10E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 19:46:10 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id d7so27222516lfj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681328769; x=1683920769;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NMipdxD21+cTBwwjF9nIXWkP9aMovr2x6cJ12UzFBGQ=;
 b=ZUWzkEEhsAjbaZQgTj0rlwn/drPBU86OEIgej+DIOuQztUP30oyfgFyTzyzb8pnETi
 zE4HD2x7r78lOZujlDTv+Kw3pcJu2eNFrOllAx3REOoXwI6C102WK4BMhxNWvwTe3pS7
 pVLj0f9I354PlAOaXWCud94ORPNYywjFSPowjkp49I+2NzK60/5mvCo536L78mcxRiEt
 fZoyx/Q+m0ntizaAncNgvtEQnkaYJ6jdYohhwU0cRmWLzVanvjC8pPtZxazbMqrY2ndE
 zwok8WOXwTvbhtEr5RABBBxok5f3teVV4eU2igkZOYKxjlG2Z6EQ8J5XpOwIPjyznfIP
 nVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681328769; x=1683920769;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NMipdxD21+cTBwwjF9nIXWkP9aMovr2x6cJ12UzFBGQ=;
 b=ctfc+3T8yWXuNoTguKfSdfHnsZ6KvZNJj9WBpWjanjmYXQ301AyHQp5bEH9hOqRFzW
 mAWd/G1q6GMfTCthjv4RD+VEt+K5Nu6jwl+8jo3vpfzJHgbDsVH4BzwJArVldIcOIYHf
 CGA25RrZRzbfvPOpZMN1SbiSTcUMneWYMb4NngKJL7xE9xwZeI7fDGiDnwPsFKBPsdsL
 SPLdv0aoSXtOA0p6vNDZbkz8/QbkATid+d/BTfDJk14IEv5kR/oWJyCKZQ32hXLANeys
 adnhSN6V8DfRDE+2K3cdl/YXPr5FulsgjYbo75QS7MUAOUY+VA9yuHsOnUBqI417bMaY
 F0mQ==
X-Gm-Message-State: AAQBX9ciqMUKC7wKSvylP5tewx7digco0l5eJDogw+eZRUVMM/CcAKLo
 tcgs6xKdg6q+QHAnA+s/EwcWuw==
X-Google-Smtp-Source: AKy350b/GcDfUeo7sGLetepOSP0yU5RY//t78Kcc47q1fNwT7YY8CDV4bnc0kzUieVodM0Vf5Nky8Q==
X-Received: by 2002:ac2:5985:0:b0:4ec:8853:136 with SMTP id
 w5-20020ac25985000000b004ec88530136mr14965lfn.12.1681328769085; 
 Wed, 12 Apr 2023 12:46:09 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
 by smtp.gmail.com with ESMTPSA id
 x2-20020ac25dc2000000b004ec8de8ab3fsm1205865lfq.132.2023.04.12.12.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 12:46:08 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/5] Lenovo Tab P11 panel
Date: Wed, 12 Apr 2023 21:45:57 +0200
Message-Id: <20230412-topic-lenovopanel-v1-0-00b25df46824@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHUKN2QC/x2N0QqDMAwAf0XyvEBtJ8J+ZfgQa9RASUvrZCD++
 8Ie7+C4CxpX4Qav7oLKpzTJatA/Oog76cYoizF454N79h6PXCRiYs1nLqSc0C2B3DByiD6AdTM
 1xrmSxt1K/aRkslRe5fsfvaf7/gEEzIP1eAAAAA==
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681328765; l=935;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=kRg0hch6fi2xH37nEAUaLth9fudXwCTpRDD+mFHIEi4=;
 b=p9fFAxQHlWtrzOnMlWnUTK2o6ettidJSrzZB3UJBevjLz0bQ1QgEQ11kV9n6iT8HMHj0t19sIr4b
 u0wpt4HuBaMK56RyX0IUYlSq4PeKP3frYi2e/Z7cj3s0Z3bHwaD6
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Continuation of:
https://lore.kernel.org/lkml/20230217-topic-lenovo-panel-v2-0-2e2c64729330@linaro.org/

I rolled back the versioning, as this has been remade from scratch.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (5):
      dt-bindings: display: panel: nt36523: Allow 'port' instead of 'ports'
      dt-bindings: display: panel: nt36523: Add Lenovo J606F panel
      drm/panel: nt36523: Add DCS backlight support
      drm/panel: nt36523: Get orientation from OF
      drm/panel: nt36523: Add Lenovo J606F panel

 .../bindings/display/panel/novatek,nt36523.yaml    |  31 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      | 573 ++++++++++++++++++++-
 2 files changed, 594 insertions(+), 10 deletions(-)
---
base-commit: 7d8214bba44c1aa6a75921a09a691945d26a8d43
change-id: 20230412-topic-lenovopanel-0d3a057e3c23

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

