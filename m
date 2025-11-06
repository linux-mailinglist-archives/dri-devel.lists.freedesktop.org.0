Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F00C3D7CA
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 22:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E0E10E9D8;
	Thu,  6 Nov 2025 21:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.b="nHFuI7MU";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="CqcMww8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2775910E9D8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 21:24:04 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id 8540DEC042C;
 Thu,  6 Nov 2025 16:24:03 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Thu, 06 Nov 2025 16:24:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1762464243;
 x=1762550643; bh=0mlPNpJlkadojIg6KcIyMoRdueRpIXEtPdw2pK8Ma0M=; b=
 nHFuI7MUW5m1GJQo/w5NzwGc14NYBUWE45crSCrWHaLoi8F3Rhz5upH3zbyPwdQ0
 /ZTMVzzuFr2A+THiSnS1YKSVRUVT1VONHYRF4yT6i2mqR0wvZHYbeVK2f3s5ZwuU
 0SxdsL0N1xN3uIBgYa9ltIxWKPaK6gDEMBaaxqjHhPZLZVcJFGC/YyGpFvoEjMCB
 RIYdk7skxqM6W4vMJj8qNWsnqMvsX138AdiPQiV9Y0NbiYnOV+Z9Q/X9Greios8b
 nD5oSthC/qovTIf/rbNjvxbqiuMBJGerYCJfH0EjaAkPa3a4rWfG8jLWHx+mTpxH
 2TsWr9UDPkJ2qniZxn2cUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762464243; x=
 1762550643; bh=0mlPNpJlkadojIg6KcIyMoRdueRpIXEtPdw2pK8Ma0M=; b=C
 qcMww8BsK7f41Y7ZCZsfMYj6EFqGswRk2BmF3M7RtVc4y3y5bvTv1UI/Pn6K1wOL
 fgHOu9cGySyZaqh+MhKBoFyc69I6FEl/GfP7OoFJn6SSUeMfdMprz8L3EwWjbipI
 gqi/uFvYnwijhDWtuzw/Y27RymoFiRr2s67tsYXkKQAEEDMvCIhrPNq8SF0DlvZS
 XTsh+ZY9+ph7880eZNm4mrR39q+7uByWADdvEISQHwRTLAx+vntTjvYaCndcDv8Y
 XCqxuHlbEgyt+wEOP8g2GussTYQSjBqcY0l0kw1ggriv9fxM9K5wmFQzCOTUydpv
 6+PkARiSN9Nwuz4Y97KZw==
X-ME-Sender: <xms:8hENaYEKvHWsSoz-_Pto0j70p0QtEYTnFi3q5hVHMnU07x2Imqo2WA>
 <xme:8hENaaH6lDywUiMl8JqifpcdbnYFOzd5QR7mn1bKVsIl1AteCgLOmQ26vhIO5NHxS
 _GbZA8Wi4KsCHQp6TyjTVp1-eJDNGmWhnd-goJ2Y6gRPTYPB3L2tK4>
X-ME-Received: <xmr:8hENaQ18ppk87qvADB7IrEF1QXIdLW3ATPudIUSi9xA8_iBAGAJxwbbq8c0wGvKDzDj-bjJSC04lR2x0MWgDC1XP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejkeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
 shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
 grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
 fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
 uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedukedpmhhouggvpe
 hsmhhtphhouhhtpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshes
 mhgrihhlsghogidrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglh
 hiuggvrhdrsggvpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdp
 rhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhrrg
 hnkhdrsghinhhnshesihhmghhtvggtrdgtohhmpdhrtghpthhtohepkhhriihkodguthes
 khgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhsth
 eslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrghgnhhushdruggrmhhm
 sehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhtrdgtohhsthgvrhesihhmghhtvg
 gtrdgtohhm
X-ME-Proxy: <xmx:8hENaccWbQOScgpFVVYiHrOYxPCaBuz8LR0CVluu6lk4NZ3Saci3qg>
 <xmx:8hENaSI8FKXcTrzvXI9xqmqa0qs3bJunQKp9WdFxXcXx7MDGYGmJIQ>
 <xmx:8hENaSHd8mblyI5qIAjNgGcezABpL666B232wnpZiaOSjyZX20wE_Q>
 <xmx:8hENaZ7WJZY7jV3d4mTwxHReRwev1jEvlrilMRhLoyv6Zukx-NblLQ>
 <xmx:8xENacOgDMktQF3wZm9uOrjl1hcIjGe9EGzITKyARQabotUYYcY7JMvW>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 16:24:02 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, 
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: gpu: img,
 powervr-rogue: Document GE7800 GPU in Renesas R-Car V3U
Date: Thu,  6 Nov 2025 22:23:41 +0100
Message-ID: <20251106212342.2771579-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106212342.2771579-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251106212342.2771579-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
present in Renesas R-Car R8A779A0 V3U SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index c89dbc92325a..142d6b0add85 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -20,7 +20,9 @@ properties:
           - const: img,img-gx6250
           - const: img,img-rogue
       - items:
-          - const: renesas,r8a77965-gpu
+          - enum:
+              - renesas,r8a77965-gpu
+              - renesas,r8a779a0-gpu
           - const: img,img-ge7800
           - const: img,img-rogue
       - items:
-- 
2.51.1

