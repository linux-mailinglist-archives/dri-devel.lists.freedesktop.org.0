Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7125B69D4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 10:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8D110E658;
	Tue, 13 Sep 2022 08:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F25710E658
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 08:48:50 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 13 Sep 2022 16:48:48 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 28D8mkk1017639;
 Tue, 13 Sep 2022 16:48:46 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from VirtualBox.internal.ite.com.tw (192.168.70.46) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Tue, 13 Sep 2022 16:48:46 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH 0/2] *** IT6505 driver read dt properties ***
Date: Tue, 13 Sep 2022 16:48:33 +0800
Message-ID: <20220913084835.78490-1-allen.chen@ite.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.70.46]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 3614B426C08A09BF188F2DAF5BD90D342D867CB900288FE8BB4244F8061882502002:8
X-MAIL: mse.ite.com.tw 28D8mkk1017639
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
Cc: "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: allen chen <allen.chen@ite.com.tw>

This series let driver can read properties from dt to restrict dp output
bandwidth.

allen chen (2):
  dt-bindings: it6505: add properties to restrict output bandwidth
  drm/bridge: add it6505 driver to read data-lanes and
    max-pixel-clock-khz from dt

 .../bindings/display/bridge/ite,it6505.yaml   | 10 ++++++
 drivers/gpu/drm/bridge/ite-it6505.c           | 35 +++++++++++++++++--
 2 files changed, 42 insertions(+), 3 deletions(-)

-- 
2.25.1

