Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02E7A376DB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 19:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E46110E2EE;
	Sun, 16 Feb 2025 18:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="S9/Ruk9O";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="g7iJc4tM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609A310E2EE
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 18:40:23 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 1CB7625400C3;
 Sun, 16 Feb 2025 13:40:22 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Sun, 16 Feb 2025 13:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm3; t=1739731221; x=
 1739817621; bh=8S0LM67ZallGhiis5MmmYmAmKnXDOKUkcZarC5rYtYI=; b=S
 9/Ruk9OGI1fHRkob/9Y67jzlqMZaeKF/NeUc2Bk6b54vs4OHDfenmvKsry+67Hcn
 Bmbxc8F1ZQ+2YIva1p01QoIUKlM0fGPiQumZUBCQOP5comKy1mNxuDSSvzMEeY5M
 3ey+Sccm3MphM3TwHCBRnrDt/W1IPugoRdB3O0TVA0lnd4Wbj975jO9nmteaXVFp
 V3CpiEQVmQZcO9Hn/SLzULNkNoKUGy5XMeyswZj4VDpOcbAHRiwCaZYqmo6R6mKA
 84sE3W7EM7xx66VdUTL4Kt6bvO+tAh6UE6ZvLyasbGe9xRX4MoF+70e9BeiTGqw9
 le304pp+xyk7hYf/kQHFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1739731221; x=1739817621; bh=8
 S0LM67ZallGhiis5MmmYmAmKnXDOKUkcZarC5rYtYI=; b=g7iJc4tMVK4JDm2pu
 NTnaEbGA3DcV90CBTXvUFzGSn9gftSGIaNVTQxIbBERMAMBV/iAQKfhoomNVC8+y
 3CZkbuYKH1QjdollwISLWjFv7CCWM89LxGNLzBHRlTaBDj+Vn+NPlXpSCXgxYOqi
 OsIwhGuOrtgcQVWf/RremJ2YthD0FJyBpwshrpu6UeiqAijHzjCgSQr7ioks0/r+
 NfZSVZI3PPZbyt7rw9h6SCcKzwD/41xXbSg2QgzX5RY8XeS0QAYN+bLsBbHSZKts
 6E/JGOCwkPo0EvTkCbsolCx1OGUzxcvUQrX7MVTZ0EkZ5/qv3lxu43rPb0rH36R4
 Bq7Gg==
X-ME-Sender: <xms:FTGyZzXIWnZl9wER3MmnE6DsO_9VjnqqeEj42VPUb-VmjmqcUVfSww>
 <xme:FTGyZ7n4WMPDF04weBFUbwW46aZge0ndvJs5esqUv7KkDmjxRaNeYIQMsIuZpNkFO
 TV-I0ggFv0w0qMAQg>
X-ME-Received: <xmr:FTGyZ_Z0RMw3buwGoB_4mokNN3fm8rI5JTPORSWRRxN_JLLA2qJ6MUKBDGBFHb-_kR53QGFjKBH3YVCBd5kd_scgxta3XrCw1P_CtzBezg2m>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
 drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
 veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrg
 hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
 phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
 phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
 gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
 thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
 hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
 lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
 hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:FTGyZ-U85uWqlsyUHiRSjV1NMN2MZeQ1btwAyDt4yMxWO3Y6t_I6TA>
 <xmx:FTGyZ9lvHbOHeulGv1nvJgCG0R3MK0o5Ox70IqVxMBODiufGylcvVg>
 <xmx:FTGyZ7cx-IDY2lYyaeCKChuvCo1gltRXPhBnl5VoALXbE7npKNM7uQ>
 <xmx:FTGyZ3Emqd_nopGXeNgrWJSkRyUMiUG1Ni7fi23o4yhr3_GmW0inzg>
 <xmx:FTGyZ1MZJxY2aYa0Fdfc_Gj9Y6VoMu559YwlJ0AH3LGjEhRvVYpEJ2Me>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 13:40:15 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Ryan Walklin <ryan@testtoast.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 21/27] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Mon, 17 Feb 2025 07:36:21 +1300
Message-ID: <20250216183710.8443-22-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216183710.8443-3-ryan@testtoast.com>
References: <20250216183710.8443-3-ryan@testtoast.com>
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a clock binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems
---
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 70369bd633e40..7fcd55d468d49 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-de2-clk
       - const: allwinner,sun50i-h5-de2-clk
       - const: allwinner,sun50i-h6-de3-clk
+      - const: allwinner,sun50i-h616-de33-clk
       - items:
           - const: allwinner,sun8i-r40-de2-clk
           - const: allwinner,sun8i-h3-de2-clk
-- 
2.48.1

