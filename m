Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A016D472D7B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 14:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6123E10E76C;
	Mon, 13 Dec 2021 13:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F0210E717
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639402596; x=1670938596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OC4DluTv7Ck+tGkqPC2WyfnXfKegKd/Vd10PxezlL6o=;
 b=jTSggTJ885cLqB6PfCzXONqQjZue8XvQpVMvBgXfGOCGJugrYaJEH2iQ
 Dk7sRfjrKSxYyNu0bEnTLlmUklbHW0GO4KDn3iGJ8jS8LI4zqKxi3daaq
 nOnJ0t+NBIclMq56cu4xCpQHoW6vqlkd6F8trX6zydmC9VJ+pxp2npS1J
 N8PoZJ36HVXQg0R3x6D3mPklOWP/yHOQrvoZRzzabO7F1kIBLzqvOD9xS
 ivdaJA0Na6komVtpjtWDFQiQCIST1/oOyLs4oYpoVMwnxd3OLL4s58kLv
 Jju4xBHkPIjsMntV8JfQKi75OOcr99M1Vk1u3/DcsXWm29arHGrupcEE6 g==;
X-IronPort-AV: E=Sophos;i="5.88,202,1635199200"; d="scan'208";a="21012620"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 13 Dec 2021 14:36:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 13 Dec 2021 14:36:34 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 13 Dec 2021 14:36:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639402594; x=1670938594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OC4DluTv7Ck+tGkqPC2WyfnXfKegKd/Vd10PxezlL6o=;
 b=EI5og9WFsjBheOm9lfGrcNRPQ1bYC6FLrv6+mxH7hdFMu7Eu9ze4G2Jn
 dlb7cC59YYJ2I4LRFig9xuWF1rrRN1106jMnewQ2Ib2vhccd3/r5iBHoe
 NOsh21Yf+zyCEkZI1YR1iIntDb1Wyq74H9wfXVxwL+Oi6kSgn0WnFYsbW
 AhVS+L7bTZkqhr/fwhaBgvjGhdjRZuzCWVMkR4qHjf5reVISxb1EYtEZV
 Z3zTyjoXAXfByjdyNFAvPX3aSvcjq+5fa9BCzzjwoZVy1EXxH4jfP1A3M
 lBzhlEf3NooI8KLvk/MdMDgXj+HK2q6hN5si3k+wGi7bWkK5lcxTlI9xA Q==;
X-IronPort-AV: E=Sophos;i="5.88,202,1635199200"; d="scan'208";a="21012619"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 13 Dec 2021 14:36:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F0870280065;
 Mon, 13 Dec 2021 14:36:33 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v5 0/4] ti-sn65dsi83 patches
Date: Mon, 13 Dec 2021 14:36:22 +0100
Message-Id: <20211213133626.2498056-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in V5 of this set:
* Rebased to next-20211208
* Fix format string in error message
* Remove superfluous error value for dev_err_probe()
* Added Reviewed-by: Jagan Teki for patch 3 & 4

Changes in V4 of this set:
* Rebased to next-20211118 (due to merge-conflict in linux-next)
* Added Rob Herring's Ack on Patch 1 & 3
* Reworked patch 4 due to other changes in linux-next
* Removed Sam Ravnborg's Reviewed-by for patch4 due to rework

Changes in V3 of this set:
* Do not require vcc-supply in bindings, making it purely optional
* Move regulator enable/disable to sn65dsi83_atomic_pre_enable and
  sn65dsi83_atomic_disable

Changes in V2 of this set:
* Add patch from Laurent for fixing the binding regarding optional GPIO
* Reorder patches so bindings are changed beforehand
* Add small fixes from Sam's review


Alexander Stein (3):
  drm/bridge: ti-sn65dsi83: Make enable GPIO optional
  dt-bindings: drm/bridge: ti-sn65dsi83: Add vcc supply bindings
  drm/bridge: ti-sn65dsi83: Add vcc supply regulator support

Laurent Pinchart (1):
  dt-bindings: display: bridge: sn65dsi83: Make enable GPIO optional

 .../bindings/display/bridge/ti,sn65dsi83.yaml |  5 ++++-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 21 ++++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

-- 
2.25.1

