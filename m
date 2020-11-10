Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61002AE44E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEB689D57;
	Tue, 10 Nov 2020 23:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09BC89D57
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 23:46:57 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z21so597008lfe.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 15:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4Xa/l6hcOuo6O2PvTYvhnAdUWCTUpLbiGCy7GG0DiE=;
 b=v7m4D4165f9a57yRAyiBKUSdS/RuywD+qM5tbSQr9Hufhx2MiwfriktitKlbcxSSVc
 yqr5tMqWY8UggXwOLOPxU9wpGD8kQvYd53dwzvnvqzBhxqtNT+TlTzEXxoZo+6rE3e7l
 4yCSryYNcHRc7B5SJZ6EPOTIv/UgzucjAFfJjSdO/BMGrQojgebN949qNHY9npFYOu/6
 dsipNXlzyuU3SgbcgvulInWk0t2DfUI/gipAzBtuc39LaOo13potSiWMGFKV+Qf9c5jJ
 57ssDESZUnqLnK2weZuwMNC/fnEfDfSa0LsOPyUJCVSAsdxQ0zbJ9jfhnvtANh2IhYoI
 8taQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4Xa/l6hcOuo6O2PvTYvhnAdUWCTUpLbiGCy7GG0DiE=;
 b=m8I7cPBBPKHasdJcf119oe3ErrgLo1tRqtMZvwcX6RBhNilB07bkedzNuavBLduCjz
 sGB3gaEcgYx6FczpDGwuYNYi9kedsU0vo8BOhsUpI2ti+xU8tET3mrPtCcWNvDvP5k9M
 hlf4/Q/eFF9okNBFRKKYLGJ+y9y6WpyrqqKTtGdU2ykGVFw7K5HF+3l3qLtEmFKJNNjM
 kfLDRmUoviOJ6Ro9FFx11Cn9jjLP11D1ixFiZNalbId5xTi+b+LSOIuPs/3xsCNW7fBk
 a4muEfElp74zLUezo3ucsNJEqcThopBXt2Fn20CK/kLjq9T6A9/Qm9yJqbWiGg6wfYqa
 q5WQ==
X-Gm-Message-State: AOAM531MBijORVl0EB9rIrIrxNwNgjGc9xuR12GsqRzQbOcSAuLcaHh2
 Srf3psjVPCv0Gefq49PE9/3vPw==
X-Google-Smtp-Source: ABdhPJzvM3pWGOju1MyJi31mGZyKcl02aBDElj2Bo07kh4BaYsQrbYbX3pzq7HS81I8pHQGgIp0Sqw==
X-Received: by 2002:ac2:4317:: with SMTP id l23mr8418687lfh.359.1605052016042; 
 Tue, 10 Nov 2020 15:46:56 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id y65sm39883lff.73.2020.11.10.15.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 15:46:55 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 0/5] Samsung s6e63m0 improvements
Date: Wed, 11 Nov 2020 00:46:48 +0100
Message-Id: <20201110234653.2248594-1-linus.walleij@linaro.org>
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
