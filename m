Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71564557E2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97186EC6E;
	Thu, 18 Nov 2021 09:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F6D6EC6D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1637227212; x=1668763212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GrTbX6NnVrq3CIDGxkQfcmgwIMWNlS4xnPEnZovsPEA=;
 b=e+7IlQcCAN68g6qp6Ht66TdKCBNRV1/4vhgXL+JE8AghNJWGmdjgYuxH
 Yhfl+CATUq+N2o0ckk7+FrHqeR8AKbzDFhSoFaEl6Gax+wpb21cukmEiw
 LNepLsvdxusNWzMvZlYnLtmeywTs6lBpGEhpkHqb142Hzy/E6qPNHgw0o
 hIc/xTIeO6F4JgZBIimVO1sCG8bgsvREZZN1C7ZDRwGLGrFw+ZEH4avAf
 EYTbi15XCTI46XasKdcONy6d+47syqVwzqz5TH3990CRIfNwpWTiB++oM
 qKayJmVMqyFZZ4tZQRokVMtY1INLeOwvn+1MHxzGkn3Mm2l4AHOvzGFUh Q==;
X-IronPort-AV: E=Sophos;i="5.87,244,1631570400"; d="scan'208";a="20534720"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 18 Nov 2021 10:20:03 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 18 Nov 2021 10:20:04 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 18 Nov 2021 10:20:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1637227204; x=1668763204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GrTbX6NnVrq3CIDGxkQfcmgwIMWNlS4xnPEnZovsPEA=;
 b=LPPENEIMNoqtVnXoEEheMI5FeUFsKbSnibWP0hmqaJ8KypvjtQWgBppK
 e7EJH2JDj+vDEaDhqcmPbti6iOOm30zwdq5fao5CjXp3I+7FBJUIsbzNO
 vhbr92R2d4M+UmLTPtPYmwA+fVXPIV0LF/N0/Ut6/V07TwrXRR8bDA7VN
 R/GsBF7kgzXFypYQEV7EIyx1GRe0sg4H4FLf+tPBM5s8VIMDSGCw6aKM3
 L7Kib04KM7SSciyJmTaANelwKwP1/Ffeyh0tYZAF/7ZXteWwTGRoCOjkV
 8GFNEGPXYQn0q1kS6fusbLB4TGRD7v/3752X7+VN5XCA3Hik6TM+s0d8f w==;
X-IronPort-AV: E=Sophos;i="5.87,244,1631570400"; d="scan'208";a="20534710"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Nov 2021 10:20:02 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A2A7E280065;
 Thu, 18 Nov 2021 10:20:01 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v4 0/4] ti-sn65dsi83 patches
Date: Thu, 18 Nov 2021 10:19:51 +0100
Message-Id: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
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
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 22 ++++++++++++++++++-
 2 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.25.1

