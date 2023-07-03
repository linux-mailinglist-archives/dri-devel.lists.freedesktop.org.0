Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D05AF745D02
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 15:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE2E891C0;
	Mon,  3 Jul 2023 13:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27C1890BE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 13:21:57 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b6994a8ce3so65304721fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688390515; x=1690982515;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tinG0/XqkHHzI3FCP2o6G+zrStuwejYrOQFggB4/KKI=;
 b=Akv376SiheqT7/HD212s99wJLv9JXMTr9kmlGBpWnI4y8zKrM2IHTYMQIj3nB2iNhK
 VBSi/XV1bivCL1R1B9yFgxz2ShMDnaySOMEIwphtfvcBnY/hbhodRtGxpErpQgytv9kh
 lqs/Lc1VGxRR/s/Tr8nnNsoiPfpP4v88P++WA955l79d2vhnLm2tGUofBe7uGlntf/Ul
 xzyk42q7Uk/yLiUKZGwgCzOJFOINeaMdCbqOJC1lhohTZ8vfoRHmDUMez/ZiHxBzEYjQ
 6Yrd0JyCXg2SB/6bLJKa/iAWUtVxf9qr4QDktVY15KbKymPXL6cN15pJ1/aKDmthWE1r
 HI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688390515; x=1690982515;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tinG0/XqkHHzI3FCP2o6G+zrStuwejYrOQFggB4/KKI=;
 b=MJK7tY/PtUjdyg7uUA/K5yNgvHikdqxHky72YFCf++bHydiu5WO6DsLx+i3xdJOJ7E
 vERbtTzZtPMmKABdWg/kmtPPZmhSfHLl1+h6UA6GOO/n/xKOUZI0Yay01t0Tf6OCHY5w
 0+XiVuK96EiTlOOIH4C9iZ937PImcmDPVJjp874/PaiSJXBIrS6Zj3Onfzj1da7lFDax
 e33QCr9g2Z9YOPzGJQG+gjSHY/JcwR01affZ8NdEVv8gwcC5pOhbosZ2CcAQ4P9g+n6a
 QuR0anPWHcrYv4mrXl1B0bj1IPb3GLEBuAOopfe4PX1T+qVNxmRYiY+ikUWxG8T5BR4L
 5iwQ==
X-Gm-Message-State: ABy/qLZgYGcRLIcGpFyuggU5m1SMGKkvcnYzlZcnPo8GrRhQD47gI/pm
 hpYXdrwBVYzqAkqH12r1XQFibw==
X-Google-Smtp-Source: APBJJlHyfemJUeV2FAvERXLUeaCPUSlvq4XuIXhD6FBKsVkUD/9X+Reh8IAmeeY48HFE1sybjSdCQA==
X-Received: by 2002:a2e:90c7:0:b0:2b6:cf5e:5da0 with SMTP id
 o7-20020a2e90c7000000b002b6cf5e5da0mr5791563ljg.40.1688390515464; 
 Mon, 03 Jul 2023 06:21:55 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 u10-20020a2e9f0a000000b002b6b7a98c4bsm3535238ljk.77.2023.07.03.06.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 06:21:54 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/4] Fix up the boe-tv101wum-nl6 panel driver
Date: Mon, 03 Jul 2023 15:21:48 +0200
Message-Id: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzLomQC/42NzQ6CMBAGX4X07Jq2lB89+R7GwxYWaAKtabFqC
 O9u4eZJj7Obb2ZhgbyhwM7ZwjxFE4yzCfJDxpoBbU9g2sRMcpnzUhTQmRdoRzBHwcXzMYEdSyg
 R8w61lFoplqYaA4H2aJthG08YZvLb4+4pCfbe9ZZ4MGF2/r3no9iuP0pRAIcam7yqFS86XV1GY
 9G7o/M924xR/mORyaKKqq2oIVWc+JdlXdcP7DD+LBgBAAA=
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>, 
 Stephen Boyd <swboyd@chromium.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is two patches fixing things I would normally complain about
in reviews, but alas I missed this one, so I go in and fix it up
myself.

Discovering that a completely unrelated driver has been merged
into this panel driver I had to bite the bullet and break it out.
I am pretty suspicious of the other recently added panel as well.

I am surprised that contributors from manufacturers do not seem
to have datasheets for the display controllers embedded in the
panels of their products. Can you take a second look?

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Rebase on drm-misc-next
- Convert the two newly added Starry panels as well.
- Break out the obvious ILI9882t-based panel into its own driver.
- Link to v2: https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v2-0-457d7ece4590@linaro.org

Changes in v2:
- Fix a missed static keyword
- Link to v1: https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v1-0-8ac378405fb7@linaro.org

---
Linus Walleij (4):
      drm/panel: boe-tv101wum-nl6: Drop macros and open code sequences
      drm/panel: boe-tv101wum-nl6: Drop surplus prepare tracking
      drm/panel: ili9882t: Break out as separate driver
      drm/panel: ili9882t: Break out function for switching page

 drivers/gpu/drm/panel/Kconfig                  |    9 +
 drivers/gpu/drm/panel/Makefile                 |    1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 3037 ++++++++++--------------
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c  |  759 ++++++
 4 files changed, 2067 insertions(+), 1739 deletions(-)
---
base-commit: 14806c6415820b1c4bc317655c40784d050a2edb
change-id: 20230615-fix-boe-tv101wum-nl6-6aa3fab22b44

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

