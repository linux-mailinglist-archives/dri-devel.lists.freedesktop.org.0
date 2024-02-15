Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E2855D57
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C24910E458;
	Thu, 15 Feb 2024 09:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B570810E458
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:05:25 +0000 (UTC)
Received: from i53875b6c.versanet.de ([83.135.91.108] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1raXgC-0002M4-TR; Thu, 15 Feb 2024 10:05:17 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 heiko@sntech.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quentin.schulz@theobroma-systems.com
Subject: [PATCH 0/3] drm/panel: add one more Leadtek panel, the ltk101b4029w
Date: Thu, 15 Feb 2024 10:05:12 +0100
Message-Id: <20240215090515.3513817-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar in setup to the ltk500hd1829, group it with this driver.

Heiko Stuebner (3):
  drm/panel: ltk500hd1829: make room for more similar panels
  dt-bindings: display: ltk500hd1829: add variant compatible for
    ltk101b4029w
  drm/panel: ltk500hd1829: add panel type for ltk101b4029w

 .../display/panel/leadtek,ltk500hd1829.yaml   |   4 +-
 .../drm/panel/panel-leadtek-ltk500hd1829.c    | 265 ++++++++++++++++--
 2 files changed, 244 insertions(+), 25 deletions(-)

-- 
2.39.2

