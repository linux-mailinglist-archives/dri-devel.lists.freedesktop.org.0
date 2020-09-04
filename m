Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28625E4AC
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648EB6ED00;
	Sat,  5 Sep 2020 00:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DB36EC99
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 17:30:04 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id v54so5208728qtj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DsXwsK4zCY7HkfSZjqg83ys549zTUY/sWT0C9/KbzMc=;
 b=wn2eFHmE1kWbL2a8K8Yh+La67pFCOUsumdtML9qwrvWmq+yGf8nat6Qh+6sMJkEA8e
 sq+oefUn+dYVfq0NzuFeab96xkK+5E4EfjJHloESInKi/fg91TCu4/F6vbtGlLWLD4eR
 77i8FbuucNnLVjYwQ6yy8uHQhC7Swb2QqhPH4IZiwNfTpTIc9PFtuYl9li7QEneBtCF0
 YX4kLuhatJjgHf1OdeaKm+I8b4oPmHDaPmRhkz9KvRtIVRYSvaE5F1QcYTNeytaibc+U
 MfLIA9JMlDAE3fIOGTmyu4Td3L+ctfG1jsBj1+xrTSspKo4ZJd/UB+gG4TtpAu8pydVj
 bQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DsXwsK4zCY7HkfSZjqg83ys549zTUY/sWT0C9/KbzMc=;
 b=CRQ5/vobq95/uETFw0hByM41MRi7QSU2DTqKazj5w58Vc+QPZZQ4JKPJlyhGItMoKX
 OFQ86bH4JePewSSxsXA/ZvObcfTLIhiBqZpGm6WCXxJqEjmn5nMVqwAa6C3yC+HLSnOS
 crV9czPI+VbsjRVU4EF/FFmND3JLIKGJLp5KKV/x24jk9z6owFQCS8d/kj9iRScbxWDR
 wHEBooPqxTis+Ntj5ooxbvyQfLUW+xRU6UsSSVr0l/W12a371CJ0YJ2hTh54P6ni4Fm1
 xJaw5IfBkmdGIRUGNAkPE86Bd3ht6tAAu2sdqK6A1rn6SXrYOI6eWQu8VoO/UU5hyfz7
 g4qA==
X-Gm-Message-State: AOAM533Phf3/hWTo32095u6hk3RVNMDgxrUqwjGmWyat3TZoBLJcu9WZ
 GIAuGB2tLz2UQ/HCxCA61hG+Rg==
X-Google-Smtp-Source: ABdhPJwqgJ2k4b0aRGXeq53bb2KuhyjL7osl5nkksXjBIvFgVuAWNuDStYVzQTlFUxGZYemuzcTynQ==
X-Received: by 2002:ac8:b46:: with SMTP id m6mr9497558qti.72.1599240603664;
 Fri, 04 Sep 2020 10:30:03 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id i66sm5103330qkc.63.2020.09.04.10.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 10:30:03 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm/dsi: support SM8150 and SM8250
Date: Fri,  4 Sep 2020 13:28:35 -0400
Message-Id: <20200904172859.25633-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Konrad Dybcio <konradybcio@gmail.com>, zhengbin <zhengbin13@huawei.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Wilczynski <kw@linux.com>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for SM8150 and SM8250 DSI.

Note I haven't tested SM8150 recently, but DSI is almost identical to SM8250.

Jonathan Marek (3):
  drm/msm/dsi: remove unused clk_pre/clk_post in msm_dsi_dphy_timing
  drm/msm/dsi: add DSI config for sm8150 and sm8250
  drm/msm/dsi: add support for 7nm DSI PHY/PLL

 .../devicetree/bindings/display/msm/dsi.txt   |   6 +-
 drivers/gpu/drm/msm/Kconfig                   |   7 +
 drivers/gpu/drm/msm/Makefile                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi.h                 |   2 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             | 423 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   5 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 102 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   6 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 255 +++++
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c         |   4 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h         |  10 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c     | 902 ++++++++++++++++++
 13 files changed, 1721 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
 create mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
