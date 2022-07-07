Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AA6569C6C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E122E10FA63;
	Thu,  7 Jul 2022 08:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D796F10F8A3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 08:06:23 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 07 Jul 2022 16:06:21 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 26786F0a042483;
 Thu, 7 Jul 2022 16:06:15 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from VirtualBox.internal.ite.com.tw (192.168.70.46) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Thu, 7 Jul 2022 16:06:14 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH 0/3] drm/bridge: it6505: Fixes bugs
Date: Thu, 7 Jul 2022 16:05:56 +0800
Message-ID: <20220707080600.49041-1-allen.chen@ite.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.70.46]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: C46E169DD7E906D2332A2008763020DBA6D15BA7325E0A4B5FBD7445B1C477EC2002:8
X-MAIL: mse.ite.com.tw 26786F0a042483
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 Pin-yen Lin <treapking@google.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM
 DRIVERS" <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Hermes Wu <Hermes.Wu@ite.com.tw>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: allen chen <allen.chen@ite.com.tw>

This series fixes some it6505 driver bugs and improve computing time.

allen chen (3):
  drm/bridge: it6505: Modified power sequence
  drm/bridge: it6505: Add i2c api power on check
  drm/bridge: it6505: Modified video clock calculation and video debug
    message

 drivers/gpu/drm/bridge/ite-it6505.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.25.1

