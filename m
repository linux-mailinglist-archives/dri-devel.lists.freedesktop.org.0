Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0E197D2EA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 10:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEF010E7E5;
	Fri, 20 Sep 2024 08:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="nrZmw5wq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C51810E7E2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vPt+To74DmgnbmEWmfloIsf609b19hv6wfExzjJ4nZ4=;
 b=nrZmw5wqvh/kInQBrKFAABA3BC/kv7/WM9DKKkOZfwumW5AAwJIZ4InB
 p10uX0ZZtY+/bj5H+r8OCqwqTgKGzYJZa33PK2HRpZvbeBvgdcjQDHR0L
 ha/B5ABvEBJu1WdRiyNvcZ77rIjne/nputz8WoEQyocWPv/WZgTWAv6fM
 D5fiuOTuL57IIj5MpkEWN7Jc82FqwygWYJrs0fFQ8yGGOggieZlnJYC3c
 xy9y/ycT4nc/2iJCxTuDhK3PyWDT4H/h+88aLFv22iOlnZT9eOeZTkII+
 qp9rBLbutFM5oA6GBJ/2U8hhwAwqZO4uZTwOwZGgA4J9j+if6BvrMY5bv w==;
X-CSE-ConnectionGUID: 7a2v0iOaTyeh1zJTI4lsBA==
X-CSE-MsgGUID: pGPLbbXZR9KWHO5AZoTlSg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 20 Sep 2024 16:25:06 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48K8P21a024254;
 Fri, 20 Sep 2024 16:25:02 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 16:25:03 +0800
From: Hermes Wu <Hermes.Wu@ite.com.tw>
To: Pin-yen Lin <treapking@chromium.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>
CC: Kenneth Hung <Kenneth.hung@ite.com.tw>, "Hermes.Wu" <Hermes.wu@ite.com.tw>
Subject: [PATCH v1 0/2] drm/bridge: it6505: update dp aux function
Date: Fri, 20 Sep 2024 16:24:45 +0800
Message-ID: <20240920082451.9240-1-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: 27455162FD9A048BF7D4AC22E9177FDD40D1EF491B961C59BC06B61A7CFCE0422002:8
X-MAIL: mse.ite.com.tw 48K8P21a024254
X-Mailman-Approved-At: Fri, 20 Sep 2024 08:40:41 +0000
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

From: "Hermes.Wu" <Hermes.wu@ite.com.tw>

This series change aux function to support MCCS and fix HDCP CTS

Hermes.Wu (1):
  drm/bridge: it6505:  Add MSSC suport

allen chen (1):
  drm/bridge:  it6505: HDCP CTS fail on repeater items

 drivers/gpu/drm/bridge/ite-it6505.c | 343 +++++++++++++++++++++++-----
 1 file changed, 292 insertions(+), 51 deletions(-)

-- 
2.34.1

