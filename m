Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F045810EB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 12:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB08214A0D7;
	Tue, 26 Jul 2022 10:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5A811B8D2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 10:15:38 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 6so12723303pgb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 03:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DY8UDvduTIOCtNuHCK2D2xodcevGwkNrrMtgQMDx0U4=;
 b=RWYTl97PkgO5lF0RfV58Ff+dY0q6bs8vrahBU7DjS7ih43wu/EAzb/gWF3budszxoA
 F+KWJPOLv+7mv3z7HQa2hECuDcza3UP7IL8fUOhengYAzykfx8QnAIT1YoEMk774vuhy
 0JwdduD+OnlzQEZRCEwC7KcIZbGl1ZCtWv3zT66rNBMtOoy9USw2twHv/K0jdeImgeya
 W+VuHq7E7qRO4e70Wba4KKnD1yrcFW+fTlrPAdzqDYeLg0j4/W44VoMgum1dZdBEAn0V
 2+eW+9oReXkdynD4zMqpqSEYa5UyMrDkxeAXjCcIrbETECmrF9MhZXSLK7iTnDu1MKNg
 DViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DY8UDvduTIOCtNuHCK2D2xodcevGwkNrrMtgQMDx0U4=;
 b=CN+76eahNI79GeXvgsLCgw3Ur1h5Pc2Q9JqCDg7I9Zm5ZDym1UA0zaaEFxjfV8hDwG
 TV4qcBvq9BvQO4+3BD/mzzFV2f9jVQh+e7UGLu9pwzSw1L+7OwyyYU5FlPDcXmUV0pS3
 WsX5pYWeXDv67xukaVWNX/7eTNUxyAOlEKC7hNRL3C+hNBwb3SkdTQW5lR5l7WQHE7Gk
 GkvdT5Uy4Y0BYhA76VU13sHoeTjKmbF+FDQ2t1xoCuu/BWMm1/rW0UY08Jd9B7I9cQw1
 SMirXpHEGmEdo/trK867VjvrhYBp5Auzrs1oj6SGfWJLx1lSmfGzuMzTupNisQYX5w5b
 yemg==
X-Gm-Message-State: AJIora8l9JWckL6Nsu+o62Tn+fzr+5WTTycUxST+zyiwmmuXTTsT6A1Z
 sFFPgcs82Q1YE/CM/EGRXmKe8WXJ1gRjzA+3
X-Google-Smtp-Source: AGRyM1tXTx7wkr1bZ+J3yk8fuXY63jaLwVZDsXoBytwNpMaUaVtopL5oK6o84GNp7OgYbMXCO+iXRA==
X-Received: by 2002:a62:3107:0:b0:52b:83e6:98ae with SMTP id
 x7-20020a623107000000b0052b83e698aemr17035557pfx.55.1658830537585; 
 Tue, 26 Jul 2022 03:15:37 -0700 (PDT)
Received: from localhost.localdomain ([112.0.190.94])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170902e80b00b0016d303f266dsm5515106plg.276.2022.07.26.03.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 03:15:36 -0700 (PDT)
From: Molly Sophia <mollysophia379@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add driver for Novatek NT35596S panel
Date: Tue, 26 Jul 2022 18:15:11 +0800
Message-Id: <20220726101513.66988-1-mollysophia379@gmail.com>
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

