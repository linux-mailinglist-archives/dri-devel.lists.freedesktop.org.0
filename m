Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D1F1EA01C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 10:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0F289C59;
	Mon,  1 Jun 2020 08:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E10289C59
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 08:33:16 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b6so7105753ljj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mpxe8RjpMW5DpayumaX4Kfk6OnL4xAaQL+RDtMaTSdY=;
 b=aIZ65SfjREaq0XuCaxGf7NARmqZzIJ7gr5rjIHchheeg7vYxAbgZjf9UwM3pJIfJYC
 Pb/l8xsqOCRSLchWv7zyFZTlPsyTWUdVThjCMNH223JDUR+FbJi6rBQBeL2cjxuQLgvb
 vd5TDVAmaq6kxPNX9/1eVPEVeRdc5gD7M++AlrPSMBP/xXcUl1RiEZuAmzCjpgunoUCv
 9fxsbj6xn6E37GWy2rWCaVdcvbD01muRqEfVkvmxPQiPexoy7itKaoAN4okNPgCIwZzB
 p+ZuKUi//fQ55vVGCryB/TenMCAkF9mF0DipN/drlrAPM89B5N+XjL2tP7r+HHDqMiZJ
 /4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mpxe8RjpMW5DpayumaX4Kfk6OnL4xAaQL+RDtMaTSdY=;
 b=ROsgPSRVm3zwbnGgC+ZZe8dB9TIjxlepzPNGgy1rWs+rjpqv7W4CU53J75R8sZ/Y0u
 WoteMmf4U0bjNAghFinEMYMS7UZCgkziF21IxHOyh0R207zF/FMXdgkbPxGOMw5EBNsr
 xk90BSt266ggvnRhfcmaW6dNI16z/yfnRSkVs+X7+d4vqR804/kZagELEs2b/MFoUodV
 JRqL1WNvKFrIRyMy5ip/2eyrWf9A3fZx1hFJYZnEtBqBKtBitdcebAu5Apsw36sW4LTz
 a5NqbZSeZEFXrBouoHJFeG+LZph3ReWJEvm9DeLvWPwZttOKLBTu5Z44m3R2q9fJdhWk
 HrYg==
X-Gm-Message-State: AOAM53319susfSPMkdEj9pC7SLoHRcUq5Deo82ZTPebsDT55n35tAO8r
 VHp7gCh6wWcIy0+9hzNms5FJJNwz8NU=
X-Google-Smtp-Source: ABdhPJw6taJK49jkCCaMb/dSqpSzU0Cd+iiRUpQY93CUje0Fa2ggawOMOk7cMJdWts8CbJjisKhQDg==
X-Received: by 2002:a2e:9a05:: with SMTP id o5mr258849lji.60.1591000394587;
 Mon, 01 Jun 2020 01:33:14 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 01:33:13 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/6] drm: add a few simple panels
Date: Mon,  1 Jun 2020 10:33:03 +0200
Message-Id: <20200601083309.712606-1-sam@ravnborg.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Push a few patches that has been sitting in my tree for
far too long time.
Adds a few more panels to panel-simple, including
documentation of the compatible.

I have added the last few people that added new
panels to panel-simple to the cc list,
in the hope to speed up the review process a little.

	Sam

Sam Ravnborg (6):
      dt-bindings: panel: add Seiko 70WVW2T 7" panel
      drm: panel-simple: add Seiko 70WVW2T 7" simple panel
      dt-bindings: panel: add Hitachi 3,5" QVGA panel
      drm: panel-simple: add Hitachi 3.5" QVGA panel
      dt-bindings: panel: add LOGIC Technologies panels
      drm: panel-simple: add LOGIC Technologies panels

 .../bindings/display/panel/panel-simple.yaml       |   8 ++
 drivers/gpu/drm/panel/panel-simple.c               | 127 +++++++++++++++++++++
 2 files changed, 135 insertions(+)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
