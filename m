Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF146B299
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 06:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D987BBCB;
	Tue,  7 Dec 2021 05:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B064A7BBCD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 05:48:41 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id b13so8677373plg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 21:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cK1uvr8za9LFh2JaUxJUeWxx5ZWZO7HDm1r4/MOIUOU=;
 b=BntCvO85mYsl2XoQnOm6H8etgLso0dd8Oc9/uvhSwgmbrM9T+bhLJeL06omjB7nJHa
 iz6GaoDKd7UYg8lDaEHg/AI6A5MDl9VUBNkH2A5pnWjJzItTLn3lt8I08nyQyeet3mh7
 gHoG+4Z6TAgB3WFV2cwe7dbNAp8XMq/Zfmwgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cK1uvr8za9LFh2JaUxJUeWxx5ZWZO7HDm1r4/MOIUOU=;
 b=qjGvXSEUxBigzEKiAdTSTOK0/fM85t7DQvlbOGdIcmnRjBP91X9oBIOD0N2vpzB4D8
 mcA0keRNUPs9axZp7fjHngQJq2qrNDIv3bliGTQHNCcXojv+lIKCmYaqVvr5/39KJWyS
 DQbKF1SXhcEJz4k8OfNKQPC3gTn7gZg6OU5fkZACI5ZmkCxOIcLwdYUAi4CwcMxjlH5I
 wfPlCIj4bDZTwI6Ecn60nBboh6s/k0Be6xMOpzbk5kL21eQR/hYThu21a2RYuTB9ibdP
 Y2MMqr2Bqk1UM4NKa0aK9J6jDiXahR7GYwQHJX571sqUPyzzPw+qWWJF3nRW4qMFKpLG
 oHEw==
X-Gm-Message-State: AOAM5315TtjN2uG30AonIvO6Rq0LEgop4nxO83ZPp+S+2zqd51YDMjDb
 yzZ6V64gEC/tQDnmXpqEJnTZ/g==
X-Google-Smtp-Source: ABdhPJwery5SdI8r0X+Yivku7xfy0ZBZVLcLdGlZER5mSSBDLiLNQCKUsrXe+TLiW8+9wEzeLBWRkA==
X-Received: by 2002:a17:902:a50f:b0:143:7dec:567 with SMTP id
 s15-20020a170902a50f00b001437dec0567mr49162454plq.18.1638856121507; 
 Mon, 06 Dec 2021 21:48:41 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:ac1e:ca0f:5f0a:c85a])
 by smtp.gmail.com with ESMTPSA id f7sm14496352pfv.89.2021.12.06.21.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 21:48:41 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/2] drm: of: Lookup child panel_or_bridge 
Date: Tue,  7 Dec 2021 11:17:45 +0530
Message-Id: <20211207054747.461029-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set add support to lookup if child node is panel or bridge
via drm_of_find_panel_or_bridge.

Any inputs?
Jagan.

Jagan Teki (2):
  of: Add helper to lookup non port child node
  drm: of: Lookup if child node is panel or bridge

 drivers/gpu/drm/drm_of.c | 36 ++++++++++++++++++++++++++----------
 drivers/of/base.c        | 29 +++++++++++++++++++++++++++++
 include/linux/of.h       |  6 ++++++
 3 files changed, 61 insertions(+), 10 deletions(-)

-- 
2.25.1

