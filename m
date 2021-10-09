Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9E427D5E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 22:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B516E1B8;
	Sat,  9 Oct 2021 20:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419676E02B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 20:38:10 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y15so54459241lfk.7
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Oct 2021 13:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=99pKd25SlfyNwZ2UvwoyajO81GWR+hZ2KGuOR2xE0FM=;
 b=EIBIWYWFul8IPgIji+n3BzdBAhv0Xpv6Xn1l8hoSkAsP70pW8DbIlTL13nbigbiFNx
 DUS7tOKZP78iQEl54HYzocsibZSwFy7EZaJRvk2MR2y/BVVVIQMz1MRo/fYi7YfjWwXh
 yM0pK297AfiMZj3psrvJuk4/p4p+WyZw19I6/LC1hWjHetMNAFoiyl1JF9zAf3AtMPTw
 dh6/ANd5hGjuBkR1IZ3X9NEEdiie80SIrQUZXTfRZ/d4+zFK3uvwlNOHLtfy6glPQ896
 JQ+uExeHVLBGacViv/myj55tEI7b1fS9camfT2HUMOqc4966KOZ3ADABOJuiD3nR4eOY
 PEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=99pKd25SlfyNwZ2UvwoyajO81GWR+hZ2KGuOR2xE0FM=;
 b=i4v3ZRpQ54zG+3KhsH13QUWSBUNj3ORi41df1NgvylwrSuFmi+GZjbccfBd2P9Q73L
 Wa2kawdFjlToIeNuABx8vZPVdF8BkLtaTcF6N9ak0vSI9URAaxDrowP2FsfWdmGdHbh2
 uUgwz39ApfVWTP/V9HVSZhgX67Ef7aogkzCgX+tbu/vG6sIDPMUEUb85aUMCdQvxvC2s
 pdGauCjhYXWSNq6Aoqw3JhHt3PqGysFZgMr+crz8Wap9mHvl5lb/GAIpzQWolpg8fzWa
 3ae42G+nQl3FgfRCOb8iL8atVOFH692a6r2QXKXLdu68DlTG5kIHWdcFcGniNYOCrcfQ
 CBWQ==
X-Gm-Message-State: AOAM532+Z1Gj3r6Mi/SDBUqAQMZ5iXXAt0uAf81YLgxIsaOE69Zq6ePp
 BYjYQ7koDaoxMEha7esi7OGM8oS5XnMWrA==
X-Google-Smtp-Source: ABdhPJycmqupkmyS1Zhq+1iJIoVBvzOOt90oNU+a/t5Be9s5S6+JdTpEMrkNK8bZ6yYMfE2D8Pgj2g==
X-Received: by 2002:a05:651c:2115:: with SMTP id
 a21mr12779368ljq.34.1633811888549; 
 Sat, 09 Oct 2021 13:38:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q187sm303794ljb.6.2021.10.09.13.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:38:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 0/2] Add support for Sharp LS060T1SX01 panel
Date: Sat,  9 Oct 2021 23:38:04 +0300
Message-Id: <20211009203806.56821-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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

Changes since v4:
 - Use MIPI_DSI_MODE_NO_EOT_PACKET instead of the old name

Changes since v3:
 - Replaced small msleeps with usleep_range

Changes since v2:
 - Add missing power supplies used by the panel according to the
   datasheet

Changes since v1:
 - Fix the id in the schema file

----------------------------------------------------------------
Dmitry Baryshkov (2):
      dt-bindings: add bindings for the Sharp LS060T1SX01 panel
      drm/panel: Add support for Sharp LS060T1SX01 panel

 .../bindings/display/panel/sharp,ls060t1sx01.yaml  |  56 ++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    | 333 +++++++++++++++++++++
 4 files changed, 400 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c

