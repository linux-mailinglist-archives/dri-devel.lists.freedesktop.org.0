Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 380BD427D12
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 21:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A3C6E1F7;
	Sat,  9 Oct 2021 19:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FE66E1F5
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 19:11:18 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y26so54323011lfa.11
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Oct 2021 12:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YHzV+YpP+BYjr0TZ1VjoF5fEGQZXlwNqfD/o1zzTFIE=;
 b=E+m4bBy6bZpj9fmAwtCryXLrW01nTSb/mEIuv+KVdwV+5nKJekxgEvPo9begWp16Qu
 cgLY2qg7Rad9OQ2tL78AEMxm04X85A4CuHDcBavK7ZDk84flxLal2xyHzuauvmpWw9aD
 YCI96g5C8+lsPQtFSc3HnxW14rVNUTsZNvZ6G1nWK7YFIFWXXpy4SBKJO9Ua5dt78npG
 88YTmaUcvwFgYsstbKiAAb0ztcWg7SKT06u6VFGjanEm5lrNUYgzNumPjByqTaioxTDh
 nRQkMP010Q32kKGMILupHVEOyK5Nxh3j8c+xOyNSmOcKsPsW7DAoaViUl9OoFyJ20D39
 01VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YHzV+YpP+BYjr0TZ1VjoF5fEGQZXlwNqfD/o1zzTFIE=;
 b=c8MUHhGOB09fb50ZjVFn6gXKc73ZPAZKnYQBIAn7QvBZP1uCDrBmwgHsGFnGlesGxA
 bhK/eRe34gYlqKZHKFeeZrb+u+5Q6SjOCbipGW9YVawtHrKVHgi81HsPEzEyVrAOdIkp
 HFkyvP4oCSw6nxQoXuq9W1f1oV+XUBD/DFgDlNeyWeJclcNyNCbZm8H94eVG4Bw+wUtd
 DEh0u5ZGoR/9gzYR/vxC9P5dfNiKpujY0ZEEiPK5OpehzUo+AIw6xwk9oHtKcKp9JS+2
 nyez8qWT/8YM2uFjwLBMhJL3+JpqbrhpogWp/Ia7qt/BFwdogQZHDSkFhLdjReGTAfK/
 ZGFw==
X-Gm-Message-State: AOAM530RhJf56y4XPPsD5PSzt9Kuf+ATWoRduCXl/iPvQboBXlguoqi1
 5mBC2lSMd0RXjEErMyn3weHGqQ==
X-Google-Smtp-Source: ABdhPJzrt6nic+Xq3OUoi8vcr5PyPvYs27zUrEVJnKzAO7UGjhd9XtlyB2G3GmYJ6sEG0c5+Py6jBA==
X-Received: by 2002:a05:6512:5c2:: with SMTP id
 o2mr16727718lfo.207.1633806676559; 
 Sat, 09 Oct 2021 12:11:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id r3sm272311lfc.114.2021.10.09.12.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 12:11:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 0/2] Add support for Sharp LS060T1SX01 panel
Date: Sat,  9 Oct 2021 22:11:12 +0300
Message-Id: <20211009191114.45900-1-dmitry.baryshkov@linaro.org>
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


