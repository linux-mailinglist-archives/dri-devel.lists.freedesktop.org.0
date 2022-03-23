Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DAC4E55A8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3028D10E740;
	Wed, 23 Mar 2022 15:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A412F10E733
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 15:48:28 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0BEBD32003C0;
 Wed, 23 Mar 2022 11:48:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 23 Mar 2022 11:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; bh=KiN4ObRYprXusmbrsgvz1YYBWCwTlWwWphfqiu5Q6zY=; b=rkaJb
 1NKa5bx82M/aPM/WE6bPC4ZZuSxy6pQN1nuvNHcRlXgTHD1HVRN4lAysuu/G9KjO
 eW8ItiFhIRcDdqyAdKVXYqlcvbgyitria5dLxc60B2r0e8F+k6+Hw8JVSGffF502
 1YgE/MtuKNo48UP9rn53WagbMK9EQNmPHeRsZkks6VdEFIQgYx/KtZoFC15z1iBD
 xjkxRzA691nS6d6ap6b3s6c4G4d0AWwseO1wXlQe68S5L/plPg30abKFuqj6gkRO
 dnyJK3m6zG33tMN/q6Wk6iooGyaty9V3nOAolH0bgWN5WtVdyNJvP7x6vzRq8oK2
 5Ze908Rlp6+0983XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=KiN4ObRYprXusmbrsgvz1YYBWCwTl
 WwWphfqiu5Q6zY=; b=Qg/YG5QMct3gCFkr/6ifU7Q32QsW+vNx36IEysFaRMY4x
 4N2xiDmwgltgVRMrD6G9tqEzZkX3jp8wBSHIOuf7dafnN75E+Q0iwE8YvFwb47QH
 2H/zjgo/Ult700DWhajCppkQekhTvAYTkJYdYL0wVT8MLqLGpanV4Z/nIxxWB/yC
 ceziHqFLWrVWv8y4u6gu67iCqNlewWqG1hSv9CxFT/jtP/LIxjyTYBanWsz88i2n
 Gu7l1cqoNOB9iHoxN4wHvw+AaCupoUeRnPM8Yu1FHGsrzrXG61uXifaNRC7IyxBv
 cBgEyF1oX8yQaThm9BD6N/PawGZ6nfMjfpnjFDBxg==
X-ME-Sender: <xms:SUE7YtF6LgddOsgJe9ag4ktqc10zgZ9X0RgLuQSt03EggvnnII9h_w>
 <xme:SUE7YiUtxI-QKxYbpCfxgonE_fAb9rj_oZePvyNaUSyhalOTeZThi9kg2gnjZSUiu
 3ZbQbMIddzu5PavKq4>
X-ME-Received: <xmr:SUE7YvLOkiIS4YmPnQRyBLDUQy89kDjnmHWb7vQYkhVyBTYVrAjGsr2unh0ed0QlW8TVVvZGP4nGPhcOfz6ChKzXzYXM-eJdn1690pA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegjedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SUE7YjH1aoaHOgMUWUZzzQXBlgqvLQG_K-57hypXts0l5H7ktxaxaw>
 <xmx:SUE7YjUwRBfauHab1XDYK9F0fchayV0xJG2_jQczTm4znE-4i5OlaQ>
 <xmx:SUE7YuPAGhOTNAP6USUIT_TsjSusoBbGzqQLjt-mRqOiWzlgJQ-bHQ>
 <xmx:SkE7YgUJrUVM36U9Hx5iocTRtRJGQ4aVtQWi5KxNp7pYjEj5Z1SuEw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Mar 2022 11:48:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH] dt-bindings: display: bridge: Drop requirement on input port
 for DSI devices
Date: Wed, 23 Mar 2022 16:48:23 +0100
Message-Id: <20220323154823.839469-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MIPI-DSI devices, if they are controlled through the bus itself, have to
be described as a child node of the controller they are attached to.

Thus, there's no requirement on the controller having an OF-Graph output
port to model the data stream: it's assumed that it would go from the
parent to the child.

However, some bridges controlled through the DSI bus still require an
input OF-Graph port, thus requiring a controller with an OF-Graph output
port. This prevents those bridges from being used with the controllers
that do not have one without any particular reason to.

Let's drop that requirement.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/display/bridge/chipone,icn6211.yaml      | 1 -
 .../devicetree/bindings/display/bridge/toshiba,tc358762.yaml     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
index 62c3bd4cb28d..7257fd0ae4da 100644
--- a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
@@ -51,7 +51,6 @@ properties:
           Video port for MIPI DPI output (panel or connector).
 
     required:
-      - port@0
       - port@1
 
 required:
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
index 5216c27fc0ad..a412a1da950f 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
@@ -39,7 +39,6 @@ properties:
           Video port for MIPI DPI output (panel or connector).
 
     required:
-      - port@0
       - port@1
 
 required:
-- 
2.35.1

