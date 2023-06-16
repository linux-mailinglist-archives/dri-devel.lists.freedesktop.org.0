Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04CE733B50
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 23:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4508410E685;
	Fri, 16 Jun 2023 21:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A60210E688
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 21:07:18 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f6283d0d84so1670792e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686949633; x=1689541633;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RFFb3YxfGmJK2b87DqbF/ilD0Ztmd558ixt8ExIHkww=;
 b=ihaNUkKwifBCoU6PT2SM5pEpEi1ielXvwNdbMGfl5EdHaKXO+Qo9rrmITND1HE41Cm
 J+zFGjIHeL8KG2Sb/3/KUNcCNL6Ches1yz+OzZpi0OC0i3YtnpY9ePDLglKYcKPy2BN0
 O5vKG42sQM4U+AC/vNCvRUZ6QnHG0SrRwH/xxZJaTJ1ZOkFTzx5tv7t62VKeNhKAhiyU
 /8jqNfAML6QhtNuRbNNGNNNLMlxoZOqdiwuQ33uUR6zm72QrpLqML1ieE8VpBGijhH5v
 2gXlwP+7kOPRx9j3RRbil4ehgyStIJAD4uOLvoSO47LR1HnMkg/tio1UtA6rN3FTcHz7
 uTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686949633; x=1689541633;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RFFb3YxfGmJK2b87DqbF/ilD0Ztmd558ixt8ExIHkww=;
 b=BjaK+iXF6euaxIlIGaddtzqBr1widc6dqJf3Ft7FBzl52O8pIo2lVGEQ7H8zN0pzGF
 mfedEliIqYeniF3QwMpXPn8VtoZxf1q2xgHbA1gY3NxfqpD60MED5Uls/MERROvprDmC
 fB1bjAWFmBoakV7LiSagBicTAmr+KdrQq2kObR/vVeNAid6C969Bv03n9F0dflFOTJfd
 2xqXs4+Y96HyDbrYXJTecxa0ksBnzxlyINzO1HALF750yBwX/EAqw4kgDAdONkfz4XHb
 uFrshFV3yHRwJ93hOB/FePhdLGPZY+A9a009YBJHajJK4aAARk8b2ooHhurh1FNZGg+G
 LUXA==
X-Gm-Message-State: AC+VfDzknEOowHtkS2KtDeZWCQyYyV2h31rE1sXobgaC/qCM4CqkiV1X
 8rf7PE5JUQTe382lfO1No/3EDw==
X-Google-Smtp-Source: ACHHUZ5blRCZnKqsQFllh31kgK8mRTbs3vZ1iFksdiHDQ/EZMzyNTnk0F3AHdmS/Nd05QsBgej6RgQ==
X-Received: by 2002:a19:654c:0:b0:4f8:4aed:b489 with SMTP id
 c12-20020a19654c000000b004f84aedb489mr2364662lfj.18.1686949632960; 
 Fri, 16 Jun 2023 14:07:12 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 r12-20020ac24d0c000000b004f4ce9c9338sm3180909lfi.283.2023.06.16.14.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 14:07:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] Fix up the boe-tv101wum-nl6 panel driver
Date: Fri, 16 Jun 2023 23:07:10 +0200
Message-Id: <20230615-fix-boe-tv101wum-nl6-v2-0-457d7ece4590@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/OjGQC/4WNTQ6CMBCFr0K6dkxbfuPKexgWUxygCbRkilVDu
 LuFC7j83st73yYCsaUgbtkmmKIN1rsE+pKJbkQ3ENhnYqGlzmWlSujtB4wnWKOS6v2awU0VVIh
 5j0ZrUxQiTQ0GAsPouvEYzxhW4qNYmNLB6Xu0iUcbVs/fUx/Vkf4xRQUSGuzyuilk2Zv6PlmH7
 K+eB9Hu+/4DZrLTptIAAAA=
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>, 
 Stephen Boyd <swboyd@chromium.org>, 
 yangcong <yangcong5@huaqin.corp-partner.google.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Fix a missed static keyword
- Link to v1: https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v1-0-8ac378405fb7@linaro.org

---
Linus Walleij (2):
      drm/panel: boe-tv101wum-nl6: Drop macros and open code sequences
      drm/panel: boe-tv101wum-nl6: Drop surplus prepare tracking

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 2420 ++++++++++++------------
 1 file changed, 1193 insertions(+), 1227 deletions(-)
---
base-commit: ac9a78681b921877518763ba0e89202254349d1b
change-id: 20230615-fix-boe-tv101wum-nl6-6aa3fab22b44

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

