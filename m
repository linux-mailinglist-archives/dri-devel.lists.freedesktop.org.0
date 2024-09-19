Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A4497D1A6
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 09:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4210910E7C9;
	Fri, 20 Sep 2024 07:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="Ydd7ddqK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1152210E258
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vPt+To74DmgnbmEWmfloIsf609b19hv6wfExzjJ4nZ4=;
 b=Ydd7ddqKjYj3n2S07UPez4wHhS4zZF3iqe92rnPHXYtgfeTFUzdgOFP0
 e1cuOGPFHKB7WR+dTnLut0EIakgrbcTUbvHnhnmBnoaWJy34X7E1Zb+wh
 qPrjg1i89uKWCYe++SW1Pk21AAJUB0rgD+aXnmBhSaCLcIYCZ+jhB2s/N
 d9c1nTpN7d20XqS0dQsazAzQKC7nsFZYQ1qKMk0CoRyOw9tqW1MCgoJ70
 L6JNUxheAubE/6zCZZ8NLmDEFoHqQm6crkmRpHwKyhHVI3mLN2oX0eojO
 IOwXvjmN+8Ovlfljl9lwPodfu+CQ1mEMK6MqOclBY3gNY62r955lPcLxa A==;
X-CSE-ConnectionGUID: RAeOzic4S0q53+pWpFKmAQ==
X-CSE-MsgGUID: dlSz94oyQpSJGhD2MegUCA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 19 Sep 2024 17:20:10 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48J9K4AY051461;
 Thu, 19 Sep 2024 17:20:04 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 17:20:04 +0800
From: Hermes Wu <Hermes.Wu@ite.com.tw>
To: Pin-yen Lin <treapking@chromium.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>
CC: Kenneth Hung <Kenneth.hung@ite.com.tw>, "Hermes.Wu" <Hermes.wu@ite.com.tw>
Subject: [PATCH v1 0/2] drm/bridge: it6505: update dp aux function
Date: Thu, 19 Sep 2024 17:19:14 +0800
Message-ID: <20240919091916.1484-1-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: ED49CCEF2B8117D7D54482B1CBE584045A64E892F10997E0EC16F39FC91376582002:8
X-MAIL: mse.ite.com.tw 48J9K4AY051461
X-Mailman-Approved-At: Fri, 20 Sep 2024 07:22:50 +0000
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

