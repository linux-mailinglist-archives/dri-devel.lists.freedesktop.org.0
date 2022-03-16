Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E794DC210
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6F610E10A;
	Thu, 17 Mar 2022 08:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CA810E5D8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 13:58:33 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d7so3097203wrb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b6vRm7DFQWhptVouBz9lNoj2sjJPbt8GKE52QtweUyM=;
 b=PKKdDEqaCO10/rc/G4bcQjaSk1hrihkTPnkC4h9ITtWhr52dOC+zBfUgLtBqp09rzZ
 E6fMWCnh8R36SaKUEMGMCBQIupa5jYlORDOvgycd4XSnmq3RQ8hux8mweEpmihLQHfFN
 iX2Su/t3Qa0mzEHn0OE6eMd0PnJzfc61emUZKeWW/Nm5DwA8xmrghfdFgTDWmbCWBMpf
 hfRxhIJWj4mWGZLPVnbZxSGMdbWYxVO6cVfGXfxcmhbw728WHbriSj5S9mhaL6kJ73F2
 rw5U7L/zko4L4yOMKFvdPIRq/oQHwoxP/nmLo1L9ooniPu9eOphnA5wUG68jppspRBao
 iQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b6vRm7DFQWhptVouBz9lNoj2sjJPbt8GKE52QtweUyM=;
 b=dm8U7RBWJmNN7wRSzRJioeyyG9qcqAtevwxlz3Yw0xjKYmlMSl665sAbWljoMI+eh2
 7KA0Ns+xEn+OTXBIpT21fZO/clNvy1SFc6htH4Tq55Qu10sp1OU1dCBshJ+nsIGaaLD+
 ZWw3FCm0phVtL1bmYH8oDodIqP4AxlWvMx8qYs4htCZVqNpLXgo1sFOtpmx3T2yDjOjF
 vfO8e0GDx8dKW+pSbgeM5vX1OeM5XytF8tb9qCjQp0geC46nS7XZOUs3w6G823LbhIIf
 xDejxsA5Aqvtj1+Hus1wjbqXWEO6aKrb1L91yAdMOCPJpRU4oI9KBfJDbPXfHECZVQxg
 5xZw==
X-Gm-Message-State: AOAM531ZjiANDpZMDjQ4FjCq/z3CWIi5QMEK/M+C4vbd+WV1JpybBTrM
 DD46Ya3VgQrkKsurHJ9zDIaBvQ==
X-Google-Smtp-Source: ABdhPJwzHiIKP0+Q4q4J7rkc1uIhEVZWdpLU0KdF04jlKVLkBlHig0tKFYV5ztMniLZCI56EUEETXw==
X-Received: by 2002:adf:ab06:0:b0:1f1:de8b:ecd with SMTP id
 q6-20020adfab06000000b001f1de8b0ecdmr114110wrc.156.1647439110584; 
 Wed, 16 Mar 2022 06:58:30 -0700 (PDT)
Received: from localhost.localdomain ([37.173.241.155])
 by smtp.gmail.com with ESMTPSA id
 ay24-20020a05600c1e1800b00389a420e1ecsm1790563wmb.37.2022.03.16.06.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 06:58:30 -0700 (PDT)
From: Nicolas Belin <nbelin@baylibre.com>
To: narmstrong@baylibre.com, andrzej.hajda@intel.com, robert.foss@linaro.org
Subject: [PATCH 0/3] drm: bridge: it66121: Add audio support
Date: Wed, 16 Mar 2022 14:57:30 +0100
Message-Id: <20220316135733.173950-1-nbelin@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Mar 2022 08:58:23 +0000
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
Cc: devicetree@vger.kernel.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds the audio support on the it66121 HDMI bridge.

Patch 1 updates the ITE 66121 HDMI bridge bindings in order to support
audio.

Patch 2 sets the register page length or window length of the ITE 66121
HDMI bridge to 0x100 according to the documentation.

Patch 3 contains the actual driver modifications in order to add the
audio support on the ITE 66121 HDMI bridge.

Nicolas Belin (3):
  dt-bindings: display: bridge: it66121: Add audio support
  drm: bridge: it66121: Fix the register page length
  drm: bridge: it66121: Add audio support

 .../bindings/display/bridge/ite,it66121.yaml  |   3 +
 drivers/gpu/drm/bridge/ite-it66121.c          | 629 +++++++++++++++++-
 2 files changed, 631 insertions(+), 1 deletion(-)

-- 
2.25.1

