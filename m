Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A709A1DA4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 10:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5C010E300;
	Thu, 17 Oct 2024 08:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="afsw8czs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DFF10E300
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1729155405; x=1731747405;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p9lHJGDnOyVNG8VW73a+G3JiuEx6zQ94Mj/zJcCD5Ho=;
 b=afsw8czsyWC5+mdJ5AsMVelrB33rCVrzr+NVmoumXh87wYUqS8cEMuDJsNX3GT+v
 igpji+/teN/pyk55NiCLP990xIMYLTO5AGZEfdZ+hGgRwPlzE1lGXPY5m1jFdkOr
 r/BaGc+NGsfcvXqH61cM1cI4YSlzPNdB4UoAXqoRUNE=;
X-AuditID: ac14000a-4577e70000004e2a-86-6710d14c6578
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 21.81.20010.C41D0176;
 Thu, 17 Oct 2024 10:56:44 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 17 Oct
 2024 10:56:44 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>
CC: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bbrezillon@kernel.org>, <conor+dt@kernel.org>, <krzk+dt@kernel.org>,
 <robh@kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH v3 0/2] Introduce bus-width property for input bus format
Date: Thu, 17 Oct 2024 10:55:54 +0200
Message-ID: <20241017085556.3045686-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWyRpKBR9f3okC6weUmFosT1xcxWdxf/JnF
 YnXLdEaLNXvPMVnMP3KO1eLK1/dsFs/nr2O0OPnmKovFy1n32Cw6Jy5ht7i8aw6bxcKPW1ks
 2jqXsVq833mL0WLSvJusFv/37GC3mP1uP7vFljcTWS2636k7CHvs/baAxWPnrLvsHrM7ZrJ6
 LN7zkslj06pONo8TEy4xedy5tofNY97JQI/73ceZPPq7W1g9Np+u9vi8SS6AJ4rLJiU1J7Ms
 tUjfLoEr48GUeawFd9gqFq/qYW5gPMbaxcjJISFgIrH/9x8wW0hgCZPE7/0FXYxcQPZjRokX
 15oYQRJsAuoSdzZ8AysSEfCTuPVlHztIEbPAJmaJz693gyWEBTwlbjztZAOxWQRUJTYevgHW
 zCtgKdF3YgMzxDZ5iZmXvrNDxAUlTs58wgJiMwPFm7fOZoawJSQOvnjBDHGRvMSLS8tZYHqn
 nXsNNSdU4sim1UwTGAVmIRk1C8moWUhGLWBkXsUolJuZnJ1alJmtV5BRWZKarJeSuokRFJki
 DFw7GPvmeBxiZOJgPMQowcGsJMI7qYs3XYg3JbGyKrUoP76oNCe1+BCjNAeLkjjv6o7gVCGB
 9MSS1OzU1ILUIpgsEwenVAPjkovnXG++79l4tKd+vcldM8W55zWuHLZzfHmKJfs1B29K8SXz
 /buap2yYqC747+oTyTwLi9BIXeYNGzZIXNZ90XnCi1M87GVvbN2z5PVHdskonP2roZ7JeJ93
 /j/J7mamhg8LPJ8u4nVLEGS0ZrBa8GLi3TVt25i23pB7wPxvRUiK23xdxtMySizFGYmGWsxF
 xYkA9FwOJLoCAAA=
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

This patch series introduces a bus-width property for the SI9022 HDMI
transmitter, allowing the input bus format to be configured based on the
number of RGB input pins. The default is set to 24-bit if unspecified.

v3:
  - Add Reviewed-by tag from Krzysztof
  - Ensure bus_width is set/defaults to 24 even if an endpoint is not defined

v2: https://lore.kernel.org/lkml/20241007085213.2918982-1-w.egorov@phytec.de/
v1: https://lore.kernel.org/lkml/20241003082006.2728617-1-w.egorov@phytec.de/T/

Wadim Egorov (2):
  dt-bindings: display: bridge: sil,sii9022: Add bus-width
  drm/bridge: sii902x: Set input bus format based on bus-width

 .../bindings/display/bridge/sil,sii9022.yaml  | 15 +++++++++++-
 drivers/gpu/drm/bridge/sii902x.c              | 24 ++++++++++++++++++-
 2 files changed, 37 insertions(+), 2 deletions(-)

-- 
2.34.1

