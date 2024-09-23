Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24E597E909
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 11:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADAA10E18A;
	Mon, 23 Sep 2024 09:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="mAX5y2UK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A37D10E18A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=frtGvz3cE/Zu60QvqPC121ABD9QJ1izKaHMhIg5KpHE=;
 b=mAX5y2UKqzC3qtJnKGNztIST+iD6d4waIwi+pCqlPp6TmaR/Bv+OYI4D
 XW/7piNPEr+xwszSNEIuRAePsiqZ+s09Y54428JsR3oxZxHz5wBzz63/g
 E7lej/X3xA5buPXIp9RUjTBRRYOHJNIohrMi1XS3YayI7Cm8af6mrBQzA
 9z0E3EWHewj/gW/aEJRD0A0T+16aGfpJ3gohqV+p/RxelymWB1kfjKzKR
 omet7YQXqA2C46fy/Tq3mjE02HUh2ZiDiBD+0lVjW7Mm8WPA9rSMLlVv5
 CFVwi5QCXKBFmEO4UZkc7VATnz9nLW0zRMzS5HHinzMA0M3j/6nRqwEjD A==;
X-CSE-ConnectionGUID: W/HX3Zl6QCunZwJp1FwmaQ==
X-CSE-MsgGUID: 2Pw3udIpRYOHKCQWBrVoAA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 23 Sep 2024 17:49:00 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48N9mv71009793;
 Mon, 23 Sep 2024 17:48:57 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 17:48:57 +0800
From: Hermes Wu <Hermes.Wu@ite.com.tw>
To: Pin-yen Lin <treapking@chromium.org>
CC: Kenneth Hung <Kenneth.hung@ite.com.tw>, Hermes Wu <Hermes.wu@ite.com.tw>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] drm/bridge: it6505: update dp aux funxtion
Date: Mon, 23 Sep 2024 17:48:24 +0800
Message-ID: <20240923094826.13471-1-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: 3FF1979B2A64C846F3A1DBB708D4B8FC126E95E7C40430440C7CB331A4D395732002:8
X-MAIL: mse.ite.com.tw 48N9mv71009793
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

From: Hermes Wu <Hermes.wu@ite.com.tw>

Changes in v3
 -Seperate AUX fifo access to a commit
 -Add discriptions about HDCP CTS
 -remove non used aux i2c reply definitions

Hermes Wu (3):
  drm/bridge: it6505: fix AUX read use aux fifo
  drm/bridge: it6505: HDCP CTS fail on repeater items
  drm/bridge: it6505: Add MCCS support

 drivers/gpu/drm/bridge/ite-it6505.c | 311 +++++++++++++++++++++++-----
 1 file changed, 263 insertions(+), 48 deletions(-)

-- 
2.34.1

