Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD268207677
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8509B6E095;
	Wed, 24 Jun 2020 15:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8994B6E095
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:04:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r12so2585763wrj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GecQ66rmlEvjIvJ7QJtrKlUl0uFGquQecFmVEnG3vQ=;
 b=ggqKLpgIV8maJfSM69W3D1mszs39U+1t28FTlwnkcd84c+gIgGoPdF7HRsq/DM1jMk
 9gqacJBySBP6gXjN151KeET3e+g/ISEwOAe2QvBA2VVsTUgmpGFsUvJcaS0zCbpK8PpK
 M+aW26fbiPFWEyMUqUmXFNJBEcnnX65jccbSs+sWKgE2FztQ4DtJkHSHVvLRRa0xOXG3
 2iYC8lTFzIXBIq6hePP2rZUhhcMAg/AbI9WcyH3NGJwRc/cwRffpnHne6STLhq0zy8Ca
 B6tEj8wsr44ipYX9tEeaSJHZZci9T/rJQqKuCropA5cvL9bD0AGezcuGfPHafWHBXfd/
 BZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GecQ66rmlEvjIvJ7QJtrKlUl0uFGquQecFmVEnG3vQ=;
 b=JiNqRslHQ4cy7yNriMBt4wzkdpfeHk+ET1x2jNvRlpmzXmVtEMT5uwi53vi1Q1E5Rm
 ASj8cO9C1PrX8QezYSc10cQuIULCflbdueP+Bvkh263lUmNeUmbTmxNek97zwWNdTV7v
 JBqr7U2EpxQBfmAaiAlQsWV++ntJAVOMU8JHCEFE/kLK0ncSlnpstTLaQ3WDauImihhf
 /xk/S5T/c9LLopC1XAPh4nIe/PhCaCuXuFxwn2t96PujmEvNOWnZgE4h9mO+cHFEywS+
 1z4Vi57Qpl5w/n24fp+5DSflpqR/o1QeEgqllaTBBmDflLeUx7SxWK8RoWu7fhDgHnVK
 jA8w==
X-Gm-Message-State: AOAM532XhVintsLXh+yLs6OF0GhvOOr+QPMmS5aO3Gwb7kr8Vgnsc0k1
 gzoYQIkiKZ1OWuVySqLQnA2vQQ==
X-Google-Smtp-Source: ABdhPJwlPY1Prth3NQ7J8sQFtWPaPtlNsxgKb6muWk22U+5w0GKI8UWdfsvMJUKmL/9pxgQ4mmDiXg==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr31187536wrw.223.1593011080131; 
 Wed, 24 Jun 2020 08:04:40 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:04:39 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 0/8] Fix a bunch of W=1 warnings in Backlight
Date: Wed, 24 Jun 2020 15:57:13 +0100
Message-Id: <20200624145721.2590327-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Attempting to clean-up W=1 kernel builds, which are currently
overwhelmingly riddled with niggly little warnings.

Lee Jones (8):
  backlight: lms501kf03: Remove unused const variables
  backlight: lcd: Add missing kerneldoc entry for 'struct device parent'
  backlight: ili922x: Add missing kerneldoc descriptions for
    CHECK_FREQ_REG() args
  backlight: ili922x: Remove invalid use of kerneldoc syntax
  backlight: ili922x: Add missing kerneldoc description for
    ili922x_reg_dump()'s arg
  backlight: backlight: Supply description for function args in existing
    Kerneldocs
  backlight: lm3630a_bl: Remove invalid checks for unsigned int < 0
  backlight: qcom-wled: Remove unused configs for LED3 and LED4

 drivers/video/backlight/backlight.c  | 2 ++
 drivers/video/backlight/ili922x.c    | 8 ++++++--
 drivers/video/backlight/lcd.c        | 1 +
 drivers/video/backlight/lm3630a_bl.c | 4 ++--
 drivers/video/backlight/lms501kf03.c | 8 --------
 drivers/video/backlight/qcom-wled.c  | 8 --------
 6 files changed, 11 insertions(+), 20 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
