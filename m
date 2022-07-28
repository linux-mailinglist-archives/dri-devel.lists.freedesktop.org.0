Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C97583700
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429EA11A83F;
	Thu, 28 Jul 2022 02:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF2312A7EB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 02:36:18 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id p8so578079plq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 19:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NdQIfx2yBoVp1XbVGjdpkzY7q06jAiqpy0iyo3m7Pa0=;
 b=RK13hn2INVyTNO+EVC6Jv8ur0KlF4o1tmp2ID1/lA71y+8Em7LGfQyL/D3LAabJWD+
 XxqVCraWinE+JoQEOmG2GyShj0gDD3qGmaBpzh0r73iGjJLeAlLiaDg7kNmSeLYbaE+x
 6qvzWeVjx1SB6Iy/x8lxXd8xvuX8bHT73EkSCltjeMH9mtSzCqwdL8jKTcXW5+e1Tki5
 JcjtO9uEJ4OS0CXe8gthFGQNZFirc8mIILU6isfHmjsQy3GkqmdR91XMHQRXVGCfhaRv
 OnQvWr+r7FJh2F1K2hn3EHWxLHs/5ICbOXFSAyuy7oA3pCyr58RCEt7e3CjJ2S+jrdiE
 93cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NdQIfx2yBoVp1XbVGjdpkzY7q06jAiqpy0iyo3m7Pa0=;
 b=lyNbf9+GuiBm8ui2+BtaCK4N67mtGg9c+KATLrHdKam+HkQNr536DLrDELkmAJDTvx
 zWPlQjGV95/wOG5eM0lwRoe5VkZ9Upp/zgXk393SO/DMo8pXCRr1za0S2Fx3kOM7l8bP
 tVmTj88OkbRfyo8iIqeSt9hzZSXcbfdwezhHjECQRE8U+n/T3cVo9EpYmm8/nRiVRJGd
 DPDlipND9+l690urmrmiRfAdwUtJ55295GuMSE84AmEPe0MmRCTEltf5CXiTGykw3WkP
 9PWN2W745LjAZTDmkYEgxeu9YAUrmyNAL8BA+qGWrbmJgXBiUaiMkK3p2Uo5LlD3qgb0
 LYMg==
X-Gm-Message-State: AJIora81dPEjeLtAJGFjy25SRAtSeiwcT3u4vSCjEzMZE/YIN1AbJtZm
 ru9JT1nI24QFCGvAIO1LF30=
X-Google-Smtp-Source: AGRyM1tJAvXnnyR2+MnboO+W1hgL7XJhlQojAqA0LGuvJUkuDLu7/OtT/Hm2Feb2JBYcqHVzl4r2Jw==
X-Received: by 2002:a17:903:124f:b0:16b:8167:e34e with SMTP id
 u15-20020a170903124f00b0016b8167e34emr24436604plh.52.1658975777717; 
 Wed, 27 Jul 2022 19:36:17 -0700 (PDT)
Received: from localhost.localdomain ([112.0.190.165])
 by smtp.gmail.com with ESMTPSA id
 v12-20020aa799cc000000b00528c149fe97sm14631311pfi.89.2022.07.27.19.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 19:36:17 -0700 (PDT)
From: Molly Sophia <mollysophia379@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add driver for Novatek NT35596S panel
Date: Thu, 28 Jul 2022 10:35:53 +0800
Message-Id: <20220728023555.8952-1-mollysophia379@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Molly Sophia <mollysophia379@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches add support for Novatek NT35596S based JDI FHD panels,
found in Xiaomi Mi Mix2S mobile phones.

Changes in v4:
- Correct numeric order of the items in binding.

Changes in v3:
- Embed the support into existing driver (panel-novatek-nt36672a), as
  these two IC are similar with different initialization commands.

Changes in v2:
- Correct items order in Makefile and improve failure handling.

Molly Sophia (2):
  dt-bindings: display: panel: Add Novatek NT35596S panel bindings
  drm: panel: Add novatek nt35596s panel driver

 .../display/panel/novatek,nt36672a.yaml       |  20 +-
 drivers/gpu/drm/panel/Kconfig                 |   7 +-
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 246 ++++++++++++++++--
 3 files changed, 247 insertions(+), 26 deletions(-)

-- 
2.37.1

