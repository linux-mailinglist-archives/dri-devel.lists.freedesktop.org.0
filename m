Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A98647F49
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 09:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAA110E4F8;
	Fri,  9 Dec 2022 08:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0E310E4F8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 08:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670574829; x=1702110829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PORLHYSX/1kTqOMLWJEv1w2doPx8L9CMFxROJgP2dxg=;
 b=q4qBEVHa7VMEElpUj2pSUTrBmxSDQv1qoNl1FcgOxxiQFBAe7Av3wuLF
 7+1sQK29heEzKWC2ApqN3J0GXjVs8lVOJhHEBoEfnOBQP1R4Xa/A331MO
 zpvxjzMMEvnQEEFwkg4C9xHjFXkYz3oA3FrOsGugVuZ2NIZEORiPF45H+
 +i1nPftIkDkSa9vrX98YvJt4ZZ8PPh9M9koyLDUoQyTm/62av3R0325ZG
 XOmqNd3rV2VeW8dUWdp59C+ExWhlgWLyz/Hh27Pmey05KW62aX9ZhJOKL
 ndRrQJgyj4+6/iIpK03x0XNdPaXuW3YbvFx9bvdyOv/OhQoci+wdqku9K Q==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27857150"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 09 Dec 2022 09:33:47 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 09 Dec 2022 09:33:47 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 09 Dec 2022 09:33:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670574827; x=1702110827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PORLHYSX/1kTqOMLWJEv1w2doPx8L9CMFxROJgP2dxg=;
 b=p2cagO7zTPKeH7+1Q2HHf2dXpTNl5NAVZc2w4eDESXSt1Z3HCSfEERHJ
 JC2TDleoS4/MU+ZgOb62nzzZ/gcQKhTrLwQK8DJoJS4VAtvLvszl3iTwv
 OJLCG4Qwxu4fCfoITDIlxyYFMd39gQXEfJjaUL4xY5xiu4fCJdlxbu/Am
 96XmEVnQBHeXJ48LlK1c+dighe7Gw3RxyNaEcT4iv+NxL08sdBkf2ZBeS
 kQCXR7IWAsIJf0TCF8pRel6WNXehWlu7hWKXg3Lr3ZdcU5+EcDRcV5e4N
 iDWhWNhDbfIsWvkVlhhE6NV3u797nlBfZWiD7TUUR5N0ssm/VpyiycMFh Q==;
X-IronPort-AV: E=Sophos;i="5.96,230,1665439200"; d="scan'208";a="27857145"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 09 Dec 2022 09:33:46 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 766B2280071;
 Fri,  9 Dec 2022 09:33:45 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/2] TI SN65DSI83 GPIO enable delay support
Date: Fri,  9 Dec 2022 09:33:37 +0100
Message-Id: <20221209083339.3780776-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

this small series adds a new optional property for specifying a platform
spefic enable delay. The LVDS Bridge requires at least a reset time of
10ms, but this is just the low pulse width. The actual rising time is a
different matter and is highly platform specific. My platform has a rising
time of ~110ms until the SN signal reaches VCC x 0.7 voltage level. Thus
make this time platform configurable.

Alexander Stein (2):
  dt-bindings: drm/bridge: ti-sn65dsi83: Add enable delay property
  drm: bridge: ti-sn65dsi83: Add enable delay support

 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml   | 4 ++++
 drivers/gpu/drm/bridge/ti-sn65dsi83.c                      | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.34.1

