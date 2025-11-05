Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC6C39C89
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0FE10E84F;
	Thu,  6 Nov 2025 09:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.b="Z2rUmKEh";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="EhvbVEhF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3B610E7CC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 23:28:12 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 0A8E71400171;
 Wed,  5 Nov 2025 18:28:12 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 05 Nov 2025 18:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1762385292;
 x=1762471692; bh=hQZul0dK84r+FCTzoIx7IdlSi1u+IUo4n5+Grf7gWWk=; b=
 Z2rUmKEhpEWWaXg3AjTgmbj4o8gF09CDLXcTuA66UlP7xGeISa80BfKfQkwptNHo
 zT/hK2yERPJEVkNiEaaFBTxrb3APGNAfHJ1KTWZAY46O0G+91WyoB6r88sHZ03X9
 OUqFFD5STN7S9RZfqQRGn5CJiHsxvwmR3i3w3HbzPMUMjaXw5maMGuJ9QnX3WdLq
 pjii7pjsKBKjIwM45efYbYKQlxvX7XQK/qLjHNCLXTep7OiAjtVAr2ke+31RxwB9
 ELPNIXSp42jBy2jt4guxVam9DVGY7+evy/jWAmNOyei3d90p2Rht1HdN2ljeExr0
 62KNxTWllkdhu1KUat7mBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762385292; x=
 1762471692; bh=hQZul0dK84r+FCTzoIx7IdlSi1u+IUo4n5+Grf7gWWk=; b=E
 hvbVEhF/+/MFm8HVAT3bnO0WIzdgdJTxNv5nh4nSF4x0LHnkFPeSOVJUhtIip6+N
 vrKGIGHuRBb3JicLCd7QTxFGw0NCM1XvQO3OLje1CVmFxPXmBQcYRetH6oNIvXhU
 7ogOdKt2T+/qZplEJK9OTu2btCob5nr5su4HaAwllppBetR8rESrgajGEvJnR2BI
 e9qVbaG6sRtGAUcy18TQx4cxiy/QDvsUnl0uJ0e0D5WEa/FethuZIDgeJrpzsAFD
 A1IP3AMbigOaEyE/Ogzftem3IXV4F8Kid3TsTlfDewUNWmeIZ/xeWavbilgBDLBc
 GOdb7kwTxh2Z5S9s8Ynag==
X-ME-Sender: <xms:i90Ladwkrydrxz0CaP8j1LWF7WEQpLTQShPaRUmb9z-80diO5JuPVA>
 <xme:i90LaZkjArFS1sfRMFmKhQ6ZEaZjJCtTrKbWI_Sjew9kRwEYqRlR0KMEQpWtRT3Vb
 cq6F5OPX_hb9qgEnNBFlN_yAPaiGw3pbbrvV7Ag9jlOLQHbeaW0j5Q>
X-ME-Received: <xmr:i90LaY9A5oIxweK6Vu9YNES_StrojzcPNOgEgo_aWC0We-utK5SufYa7VmCBu83S0DAhbIE3UMf6kBG0YazAqdI9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeehvddvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
 shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
 grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
 fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
 uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedujedpmhhouggvpe
 hsmhhtphhouhhtpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshes
 mhgrihhlsghogidrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglh
 hiuggvrhdrsggvpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdp
 rhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhrrg
 hnkhdrsghinhhnshesihhmghhtvggtrdgtohhmpdhrtghpthhtohepkhhriihkodguthes
 khgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhsth
 eslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrghgnhhushdruggrmhhm
 sehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhtrdgtohhsthgvrhesihhmghhtvg
 gtrdgtohhm
X-ME-Proxy: <xmx:i90Lacq1ImlRQG0zEQuLe8LMbDfs0UX8jYIAvucq_isqW4HlGpSe7A>
 <xmx:i90LaUJ_NHg8cUgaetkGaSRFPiPWFIN1mVqG6ZR7z69MOhS-GJKKBw>
 <xmx:i90Lae1TLQhj88K93mY50b5aEtoRo2ytAhLiT-pyUvBkzpMapEqCgA>
 <xmx:i90LabVc7yUpO6RyOh8ixCSNTChy6FdeSGNJmUAQbTDIE8hzJGOppA>
 <xmx:jN0Laamq6KYaQx7OwN4INHMChN6ZNBAfzwznZ3IITSJxHm1wr2mZoKfx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 18:28:10 -0500 (EST)
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
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] dt-bindings: gpu: img,
 powervr-rogue: Document GE7800 GPU in Renesas R-Car V3U
Date: Thu,  6 Nov 2025 00:27:36 +0100
Message-ID: <20251105232737.1933437-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Nov 2025 09:19:09 +0000
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

