Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCBE97D2ED
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 10:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8632710E7E9;
	Fri, 20 Sep 2024 08:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="Wm2UNUZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B92010E7E2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cyjl11zioga8O08AuDApD/N15POhIL8GuoayOO0MSJo=;
 b=Wm2UNUZbsSz0id3tz6Own3f/W5pCPXjxSiibgfa3GNdEHxKq+3q2KKa9
 lddEiIw8oD9tuiGexXbMyuMbyqXo/c/H1ODQIo6TJf8NK3vn8ONLGQjSs
 ag47Oeis/9aVY4G7gz8xn9s1rHlTYK0mY+25w6DBp87dGy1VUg9LKq1zR
 smY6goMpYgiTP5grCPKXRYKtgWorZfyhkRrabwcvvIRwS6NrhEPXKc8Ry
 w3YxpJt62ebYNMmqnMl5M9C5C0uZ0mmUWzufYIeRCaO9PNOxKb2QMfzlU
 MUbwuS2L9eECf0zlDgclC2/giLdIXFSzsvHyPAI3WrRLShzcklf3fDgHS g==;
X-CSE-ConnectionGUID: QQzgZHEiRKKggNelztubbg==
X-CSE-MsgGUID: FMVweCoVQO6f6/FH6Sj3MQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 20 Sep 2024 16:25:10 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48K8P4PY024274;
 Fri, 20 Sep 2024 16:25:04 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 16:25:05 +0800
From: Hermes Wu <Hermes.Wu@ite.com.tw>
To: Pin-yen Lin <treapking@chromium.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>
CC: Kenneth Hung <Kenneth.hung@ite.com.tw>, Hermes Wu <Hermes.wu@ite.com.tw>
Subject: [PATCH v2 0/2] drm/bridge: it6505: update dp aux function
Date: Fri, 20 Sep 2024 16:24:49 +0800
Message-ID: <20240920082451.9240-5-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920082451.9240-1-Hermes.Wu@ite.com.tw>
References: <20240920082451.9240-1-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: 8978556ECDD5E1C9AA890D66EB7EF1F768CDF67A36252FCE5C8241E842BC42572002:8
X-MAIL: mse.ite.com.tw 48K8P4PY024274
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

From: Hermes Wu <Hermes.wu@ite.com.tw>

This series change aux function to support MCCS and fix HDCP CTS

Hermes Wu (2):
  drm/bridge: it6505: HDCP CTS fail on repeater
  drm/bridge: it6505: Add MCCS support

 drivers/gpu/drm/bridge/ite-it6505.c | 343 +++++++++++++++++++++++-----
 1 file changed, 292 insertions(+), 51 deletions(-)

-- 
2.34.1

