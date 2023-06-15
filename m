Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B8B7320D9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 22:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DF110E53E;
	Thu, 15 Jun 2023 20:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A3B10E53E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 20:21:45 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f764e9295dso3885772e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 13:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686860504; x=1689452504;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HBnJ2Bgs7NnTPEf+29k5afFhHZznLH3YJWpF/myufg8=;
 b=rhRosn2JrgLJL3Q1sCXeF8kp/wjw6cigH9cy9pqtQajK16RqRLjbcJDBVxNEDLE8Rb
 B2jBgmKP1QRJAA47Cw30RsYi45YQhRVsSy/NiFOVAKueAe068MzuS/E0h/JlMUQSy8oU
 kWrcQOtOr6jjOpbTKh5iEP/x3A0H3/BuoMGjHuUnqaWkUuY1wtwfvUhp2nYqOZLM1Cnn
 2fvqfTPzf+cdP1Xyy+Q9EmXNqGJZ+D+aRvG5CEEGfDn6CHxNJnbdNK/ALEKTxxYYb8KQ
 y+iBt4UyKtm1wN4uV+E4BfW/QnIfJtvTMIfNZP2MPpyMu2Jj1GmUptHMH6F9BNmPFigV
 l8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686860504; x=1689452504;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HBnJ2Bgs7NnTPEf+29k5afFhHZznLH3YJWpF/myufg8=;
 b=MqXtFZ+OxWZPcBnaGk2y35LTLUowpPcsZIgZ8zz613umS2zWKbbBYCJC+c7Xcchzo1
 wcnKbFjf/TkCEtAke85PuxMcRG0AwEEi9HTGKOxna0OKFuEnLwmDx9Egao+mFLxmi5wq
 ojNA7Xq2u7CholXjuT6IbaWB4eFRIEfcdABUTyMGtscD6s6wxvjIQkPrA5CqOW5mCodM
 uva5Sgk1Gtdg8XqO8KUUmbrDct9dTSqLw/w4c/TVdJtZql/7QVz0evFZMWBEi/jJpaDb
 oVNh/yckwsAqO4F+nq0eeR261IoygZjUa5G0s4JEFwRRVQgHxTsjPQ6J5GW+1sQmneNH
 Dftg==
X-Gm-Message-State: AC+VfDzXDyag1DJqVYsefnKPVOpfbevOq+iUzCo2L2koqb2d/8EgT2ys
 AJ7eVjOtTqpWM0GbmeqnECMxSA==
X-Google-Smtp-Source: ACHHUZ4tm5UWambBbENZJom/hP8F6JMPK4ZhtdiOrvN5EfawIBP4DVJCelYmU+FAt9DWV8RNotQVrw==
X-Received: by 2002:a19:4f0c:0:b0:4f8:421f:cd37 with SMTP id
 d12-20020a194f0c000000b004f8421fcd37mr2117173lfb.56.1686860503800; 
 Thu, 15 Jun 2023 13:21:43 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 r14-20020ac252ae000000b004f3946030fasm2736470lfm.68.2023.06.15.13.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 13:21:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] Fix up the boe-tv101wum-nl6 panel driver
Date: Thu, 15 Jun 2023 22:21:36 +0200
Message-Id: <20230615-fix-boe-tv101wum-nl6-v1-0-8ac378405fb7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANByi2QC/x2NQQ6CQAxFr0K6tsnMgLPwKsZFi0WayGBaRBPC3
 R1cvvy89zdwMRWHS7OByaquc6kQTw30I5WHoN4rQwqpDTmecdAv8iy4rDHEz3vC8syYidqBOCX
 uOqgqkwuyUenHQ57IF7FjeJnUwP/vetv3H7tVHAp/AAAA
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

