Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 099B345899F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 08:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C43489DB4;
	Mon, 22 Nov 2021 07:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22C389DB4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 07:06:42 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so16066322pju.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 23:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5ABWRoDInkGKR4REd2ZvC0qJzZiHSaFc7XdY6XO/LA=;
 b=rDUPvoHb4+pS2w9zi4nm4XqCnAKTBgrWnhAxo0wQc4zsuaaGJDoqna/FG0wTeZyT0F
 LgRkAR5Vh8oAD5bK8sErmTSMR519Xwvj+E8lpz/ssJXXhvAu6pMPHPJPrW49u98dwd/D
 keqH5PBuPdXhd4Qlbgd8NJKY+HGqddpTR344o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5ABWRoDInkGKR4REd2ZvC0qJzZiHSaFc7XdY6XO/LA=;
 b=UmHABG7rwu9OaKrRUDuxozhnJNTESH6NTWjPm+xvlNyYCRnk3d6aLOtVvqwSxk4nvz
 vdpnlN1Td+SihRbbEDdQkgs9NZKOblhpdSE7TxUP+ZCfGkFfUq+CRSJldZ/A32QqREYA
 KAJcbwu/Kqr8P2pFSKToiB6lJKUwpZfhaxvXH01IaJZ2dboDT8kTLynAyLTsRbeOV0fx
 pB8Bw7sgvKhNqUHI9dHhD56q6oV3qptrwtFXiG62ntkvMpwjS2JR3rw7gDgrgFNBytBe
 mjHp6HnESVBlxFF1K4GLJEJRqUvQvKfeI1HdaGH9gLt2/y/ECq/LZV2ma986GOkhoWD6
 wA/A==
X-Gm-Message-State: AOAM531paT7F0t+pt0dVGz9gSHOcMYmFv2C9Ovd8WfSN/4LGd47pXcLS
 x9rZm5UT7fZEO87Hm7ojPysHJg==
X-Google-Smtp-Source: ABdhPJz4K+MBixOGUy75EsQKV+WjPPuhKddvOL+tYYXvqgYA58u/Ux2ilWFMVT4pBfMrR0HqZc71bQ==
X-Received: by 2002:a17:90b:1c86:: with SMTP id
 oo6mr28267815pjb.165.1637564802219; 
 Sun, 21 Nov 2021 23:06:42 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:eed6:c913:819a:3850])
 by smtp.gmail.com with ESMTPSA id s38sm4513088pga.40.2021.11.21.23.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 23:06:41 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 0/2] drm: exynos: dsi: Convert drm bridge
Date: Mon, 22 Nov 2021 12:36:31 +0530
Message-Id: <20211122070633.89219-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is initial step to convert exynos dsi to bridge and
make use of i.MX8MMini.

The previous RFC series for this is here [1]

I'm trying to add minimalist patches as I don't have hardware
to validate, the next plan is to add panel_bridge and other 
improvements.

[1] https://www.spinics.net/lists/devicetree/msg431794.html

Any Inputs?
Jagan.

Jagan Teki (2):
  drm: exynos: dsi: Convert to bridge driver
  drm: exynos: dsi: Add mode_set function

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 86 ++++++++++++++++++-------
 1 file changed, 63 insertions(+), 23 deletions(-)

-- 
2.25.1

