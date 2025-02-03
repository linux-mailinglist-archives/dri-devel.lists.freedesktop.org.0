Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C6A26D93
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974B210E27A;
	Tue,  4 Feb 2025 08:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=beims.me header.i=@beims.me header.b="l6kFFaRb";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="tCo9GEwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 362 seconds by postgrey-1.36 at gabe;
 Mon, 03 Feb 2025 19:31:12 UTC
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A168D10E54D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 19:31:12 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.stl.internal (Postfix) with ESMTP id E33B9114011A;
 Mon,  3 Feb 2025 14:25:08 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Mon, 03 Feb 2025 14:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beims.me; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm2; t=1738610708; x=1738697108; bh=5R
 cEvpqfY5WECtoKoKIUpeLQNDExBxkuSQ7CCSdlIJo=; b=l6kFFaRbF6WxWkQJYd
 cYD4du66egC9Grd6/1RymNfmoJdVuEqNUXYoSX5q0VjeXziwGZ0uyWvq61Epa/1v
 vWgGsTqneTG/jmi2C3n95pkpWI6QzbxC7Z6GfsT777lqEacIyhS4Erhopi8nQFVG
 BWINLBwPISYtIdbiHQbMeAZhrYvRGDyWSraGXS7bHWdrdGcYSPWZhjS8HlGFzepr
 fYDpciC6xlVqhC/B9TSihKcgZS6+DQ0sa5LASFs/WPNxIwUe1As/w8gkd2xJl9U+
 h4FAFaHT6X3PEkR5qYphP8nRNX+CBvs4VnEdxYmnUNeHGVg5AD+lufCWzEroM9hT
 l9uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1738610708; x=1738697108; bh=5RcEvpqfY5WECtoKoKIUpeLQNDEx
 BxkuSQ7CCSdlIJo=; b=tCo9GEwflfRqjxRWXUoyJ65+U3c2SZb+qINg24nvXFen
 G+EPC1TvakViK4Zah49rfTZpVXHv9yvhZebir45F88rJVXOhBViDXiRgRAwbz2Vz
 BI0oCOwDPqLiAR/UQjS0x8s5XKUgCNz6h9n56k/XKnvCS4Ya8dwUH3Z8kX3HOugJ
 KEgqUzTWfCaoSTRGOcYkK+lW5Rq/VBRmCBFEh1nD/2xFKJoLozZnTxML5T6ogcvv
 RaqqY4NpeBesPUqszt1HxTZbbwU8DOBEuODrtH4zz6a1k9pRjlMCHDkYHWIWjUuq
 UG3dlm0WsVlYct77ZW2GIdboA0cDOKbMPNlqhFBPfg==
X-ME-Sender: <xms:FBihZxAVvywbiIzElrlrICZoInsXtbQi12sXK-44urIKVm_7NKT13g>
 <xme:FBihZ_hz_kxZIlGibDLalYDtO9epZSVhpiJAMN44_LdMZ3bOc4Gs1zsMLVrBVIbob
 YRuEy0et-ZZ2ZeqWcQ>
X-ME-Received: <xmr:FBihZ8mIiFTXy_vCSLabw2nyIwYJjODVzrHiUahNGGMPIVTnhVXewt7QyF7rcX9apg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeggecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
 ucfhrhhomheprhgrfhgrvghlsegsvghimhhsrdhmvgenucggtffrrghtthgvrhhnpeevje
 ejleelheeigeetfeejgefgheeiieeltdeiueeggeduhfeiveektdejkeevgeenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghfrggvlhessg
 gvihhmshdrmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhr
 tghpthhtoheprggurhhivghnrdhgrhgrshhsvghinhesghhmrghilhdrtghomhdprhgtph
 htthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohep
 nhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfh
 hoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghh
 rghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskh
 ifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuh
 igrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdho
 rhhg
X-ME-Proxy: <xmx:FBihZ7w_NlV9DpC1KPjnaL02POSbZ-WjEtAjfLf-VddcqWxs0d9iWQ>
 <xmx:FBihZ2TP7wqz52IuNOCV2nT8w4wzGopQwD7k7YplzFhjlWCz27UKdw>
 <xmx:FBihZ-bBhYXVpX6Jqh0bynMRuJtiWnO3HsUKzCBMA3-Jj1NtLwDuKw>
 <xmx:FBihZ3TEzaxKakcX7nImqM17lQzlIYIdXZ0AG2dkfWX9U-42Mgbjjg>
 <xmx:FBihZ_QEaVNeU47Go7bcfCEsNEEBWycBp_88UFEpmvwqu1GkCIfA7Z60>
Feedback-ID: idc214666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Feb 2025 14:25:03 -0500 (EST)
From: rafael@beims.me
To: Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>
Cc: Rafael Beims <rafael.beims@toradex.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add HDMI audio support to the LT8912B bridge
Date: Mon,  3 Feb 2025 16:23:54 -0300
Message-ID: <20250203192401.244651-1-rafael@beims.me>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 04 Feb 2025 08:48:22 +0000
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

From: Rafael Beims <rafael.beims@toradex.com>

This patch series adds HDMI audio support to the Lontium LT8912B bridge driver using the I2S input. The audio output was tested using a Verdin iMX8MM + DSI to HDMI adapter connected to different monitors.

Rafael Beims (2):
  dt-bindings: display: bridge: lt8912b: Add I2S audio input port
  drm/bridge: lt8912b: Add support for audio

 .../display/bridge/lontium,lt8912b.yaml       |   8 ++
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c      | 107 +++++++++++++++++-
 3 files changed, 115 insertions(+), 1 deletion(-)

-- 
2.47.2

