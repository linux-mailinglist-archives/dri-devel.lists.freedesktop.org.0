Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F017A429E2F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 08:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB776E575;
	Tue, 12 Oct 2021 06:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AB389F49
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634021343; x=1665557343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=py28RwQGibErpBHxE3imxv81UcOevlz4rdcJLiTV48E=;
 b=aQxZHfJTOZdoz5wKmiDnwyQGLJjSaBhajxm80seuBLMENycG2lgOS758
 m14yq0jHKYIOqS4NNYNaIr138Ax1B5ODW1s35UG0/3IauiX+dV2Afs9in
 F8q6nQX6BvTP3GggESjH1nND9LB9zXCDXwDiv2UHTDua+fNNvYAlJ6mSj
 H4fTbJ2LxkV5rT0fpGif2BHYKb5WA88jJRrsqMS+jqdg9o1LPLOerTWcN
 Sa8L6TIID79ni6QQUImg29N3ymcDLUES1r7IFIwrB0XWoBn8J7OlZdbFt
 QcIJ5rSGCIYJ7XDrVUfgCfIRdF9mVJBBwDaGasWGPitC9ubl2qeIXaa3L w==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19985090"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 12 Oct 2021 08:49:01 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 12 Oct 2021 08:49:01 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 12 Oct 2021 08:49:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634021341; x=1665557341;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=py28RwQGibErpBHxE3imxv81UcOevlz4rdcJLiTV48E=;
 b=B6xw377EbkoP+Gf/CKJ/rbg3C/APTjTdhLWEGcHMug0TNTcW33OH6LDl
 NSEEHM4UYhI4jfdDX55elWjmOub9/bW7LxHIfY3ltAyQbY36My/ChTtnV
 4ObGHu/mHXmMGf/rSlKMwM/qErEmfUmiyf+q5+DV7j+TBLny9xyJHR1Il
 fBaxdyNViMmEVo06oZjgaCZK4z+vVgmI/VXoIwAaJzOoLVm1uCWjSmsPT
 q7VkgD0hFLSSfm/xb3eprWUJvn9yXX3l6yJNEQYakSK8ewbBJgdeuvUCj
 eUXn+zYRLwZ1ae4eSchfz4ziQ/upeiRFV5mhytHE3pxGZFshd1obl9uX2 w==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19985089"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Oct 2021 08:49:01 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2DF84280065;
 Tue, 12 Oct 2021 08:49:01 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] ti-sn65dsi83 patches
Date: Tue, 12 Oct 2021 08:48:39 +0200
Message-Id: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 12 Oct 2021 06:54:21 +0000
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

 .../bindings/display/bridge/ti,sn65dsi83.yaml  |  6 +++++-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c          | 18 ++++++++++++++++--
 2 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.25.1

