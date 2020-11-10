Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 227272AE44A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFD389D56;
	Tue, 10 Nov 2020 23:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAEB89D56
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 23:44:12 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q19so15092694ljc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 15:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4Xa/l6hcOuo6O2PvTYvhnAdUWCTUpLbiGCy7GG0DiE=;
 b=b4lVKqy1aSHD62rnTCITMy2Xeu2wcwmZcp4fCqcvN4WB1fbnS/d+l6udbsj5xkq6M4
 LpLG/XHkAaJ7Co+bRBVAZb/lV0VH3UgLniKNDkj0D3JFG39ZtrjAKfjJORUBre7jxJUM
 CGCsx0hKByZ98xTgVJVC5/gyIh1arngntwC9z7pRYn3aAaPI+ql9HppG89C4UwrlptUJ
 +IiwkNL7UkT+Qin4RnKwW1DzWxDPK/jRWkEbFE6pOPDwW7Lz3H1ywxLdWW7r37Ded/sL
 B3ULlEChMDO7Up/U7XPyQig1OdgineXQ2w9eHS4F/6I6rNZXlnpFOaiw2L9Ci5+ax5zL
 +gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4Xa/l6hcOuo6O2PvTYvhnAdUWCTUpLbiGCy7GG0DiE=;
 b=qxBbgWrAGVyrpWSTDRsxLjgy+B0lqance5rK7XIOUeAN+J/q0fq7w4lYJIapG6hzNu
 tEc5V+2KOrju9pdMfi+8RYUX7h5OvFK6hI1PNbBIXlrBEF5gp/8furq5/B6YoUxOBaFa
 MFPveHHR+I/ZAZBoacBnKTLn5AjUVHITib4FCdfRTlBh5+9VFF9kj67BZNxPB4pV7lLQ
 xja9yX+3lq/8KMIdPYdnQMCJAb95vTOjIMWvORBuP+QtcxlPE8MqVtZHzCf/8tsEK5qJ
 mCOwC4PPlj03Ef0Ys8p/ER+lanfyXs54Yx3paAWXszpNJ57r2MYupCD3JZf/4Kx3Mdk9
 9+9Q==
X-Gm-Message-State: AOAM530ileuJCTitxJkiKmzpU3ZXhXkiDNyxjvaCPYkbrZJuOsamRciU
 2gDIa+Ni4mvBuVoGuREL0GJGtw==
X-Google-Smtp-Source: ABdhPJxzu4RXtuoKsL7/ujW9HQbjH9VGPYpp2SsKK2ex9PMTgt8ALhFzqTU/T2VNytsit3FAIgeIGQ==
X-Received: by 2002:a2e:9dd8:: with SMTP id x24mr6037799ljj.168.1605051850431; 
 Tue, 10 Nov 2020 15:44:10 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id t4sm37560lfc.193.2020.11.10.15.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 15:44:09 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 0/5] Samsung s6e63m0 improvements
Date: Wed, 11 Nov 2020 00:43:56 +0100
Message-Id: <20201110234401.2247847-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These improvements to the Samsung s6e63m0 makes SPI
writing and reading to the panel simpler, and add some
support required by the Samsung GT-I9070.

Tested and working fine on the Samsung GT-I9070 mobile
phone with the MCDE display controller in DPI mode.

Linus Walleij (5):
  drm/panel: s6e63m0: Simplify SPI writing
  drm/panel: s6e63m0: Implement reading from panel
  drm/panel: s6e63m0: Add some explanations
  drm/panel: s6e63m0: Support 3WIRE protocol
  drm/panel: s6e63m0: Set up some display info

 .../gpu/drm/panel/panel-samsung-s6e63m0-spi.c | 40 +++++++++++--------
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c |  9 +++++
 2 files changed, 33 insertions(+), 16 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
