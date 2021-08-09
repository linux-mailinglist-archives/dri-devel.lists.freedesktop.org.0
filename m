Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAE43E4C5C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 20:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5707E89CE3;
	Mon,  9 Aug 2021 18:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600B089CE3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 18:47:32 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id m9so25053080ljp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xUec3r5h0Yf1GVOfo79Nmw5vtoHWTeLeIGZ7Wbs+czs=;
 b=ytMzuEMLdq+4fO/i3YjOzv6wtmp4E4UdwKWpqBmwvNCEJSdvX0SqbeP8zK5p8BF9cP
 LyW0/WZEjKl5r94GPEGezJK8tmi0RVc4d/OtgEWbsKqkptbqRCNa6dMlgOHr3VCnBNGh
 cNYZ92TS/157tp9zzrPDAjbWNlBkwHwc3/Snt4x18L8yZe/fyYDtT2MZPcdWATMSSS7M
 Gfs1gKigSbsy0rJrB6DUxC2wvXxzaKzTTxq4NVI/aNnOVIBRVk6gZcI9P5I7WF7aG/Lb
 aRQPquhQRw9CQvh+Gqx6O9foRYPuVApF1M++AESTf81uHk5PJ40xCR6mpImpjrm8w2N3
 InTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xUec3r5h0Yf1GVOfo79Nmw5vtoHWTeLeIGZ7Wbs+czs=;
 b=f5woUrH2ICIP6DGt3QlzK69XLRBvyTm8A1zm+zXLprFq0N2mbcIm/QqGjwHKqSPTSQ
 eyI/UFaeveUPs2n7abF5v0IimHofkNT0aC1nVObl5SVEN8I+zfq907ZEGb2klBbx36uF
 ZjHjuP57KzOc17h1g8OC5LbPZzn7XpNSEDF1iEcSFyQSl6EYvNhsl/QfYgELQWZmuz8p
 t9QTxhW8oM2k0z5u6YDY3THqYTYZXrlKf3IW1MlecZP0xSGUjs3Wbd27gxoad6LJlQbY
 u+LyJqbf3vktwJDw2o7ARZ3Dvl3Hgkr/XU3moG0H/5jWFmYBmPVtSnS0FHust58C8dZm
 tRNA==
X-Gm-Message-State: AOAM533LoY33yxH//t7sWMcpBgiOdcDhUwpwqkoATmTDqaFbvykwCsHT
 qkIS4TmpVgdttY13TGizV+FAOg==
X-Google-Smtp-Source: ABdhPJzBx3kclUH4ijbuYY+bcSZYOZzCsOcVxnsmQPiqZjnK7kw8JzhXnikmPLBMjXWcr9MmjSkt4A==
X-Received: by 2002:a2e:b0cd:: with SMTP id g13mr655984ljl.270.1628534850704; 
 Mon, 09 Aug 2021 11:47:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u22sm1216128lff.270.2021.08.09.11.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 11:47:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for Sharp LS060T1SX01 panel
Date: Mon,  9 Aug 2021 21:47:10 +0300
Message-Id: <20210809184712.203791-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add driver to support Sharp LS06T1SX01 6.0" FullHD panel found e.g. in
the kwaek.ca Dragonboard Display Adapter Bundle.

Changes since v1:
 - Fix the id in the schema file

----------------------------------------------------------------
Dmitry Baryshkov (2):
      dt-bindings: add bindings for the Sharp LS060T1SX01 panel
      drm/panel: Add support for Sharp LS060T1SX01 panel

 .../bindings/display/panel/sharp,ls060t1sx01.yaml  |  51 ++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    | 274 +++++++++++++++++++++
 4 files changed, 336 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c


