Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829532F461A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B346E0CC;
	Wed, 13 Jan 2021 08:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2947F6E22F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 13:47:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EEEEA5C0293;
 Tue, 12 Jan 2021 08:47:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 12 Jan 2021 08:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=JWQNirOCgOM2r
 lstJWqPXFg6DdN+cQ+AH+7XHaW4yko=; b=gVefcNDBSnxfzwMNAwZIDWB0BWTKt
 2P8lqAX6AFC93ieIuvn+C/TficuWyy+0LtKm1Y5+bS4nBYuqkWl4YgFNgZbafGGb
 szfgECjlv3g7c4jnr9CUahVNWTKePt6/5Adk/wrw7sOy89yr93mJ5mKQbtyph5J1
 2uZBwoZWCM63zVUlPVO7/D+mLOfJKpsiTDasja/Tl4XM8H6EH3MSD8sG2z1k7DoX
 eWqdpbGqFbXGhT+abYlRIUFsNYqgl/O+GxU8hyXuN1HBVH2m8o+eXtgfjWSSo+fI
 gRh1U6d7g7kM7W7x2eg45LJiB8w0fxwR8rpQ9gVCs+WiWUMxFinThq7Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=JWQNirOCgOM2rlstJWqPXFg6DdN+cQ+AH+7XHaW4yko=; b=Iz7bPq3C
 5DQoitwe2snpEjcEE2Er98/VvS1KIw9YiJlIOj9Acq2SudrkeJPQZvqHapfe4GU/
 9MjNR2Vm+n6LRD7p12u6EFj9bwm0FupxJvHNp3E+b9PRtlCGAIu0Y67yfOWR9n5a
 RSE2kmSYdfbugczuduKJ8dIvGMN0o3tHMKrwGQ/m3jw8P58PZpdq2IBtIqhTOoBE
 zDrF98rXInAJdwzgvOdePZc0zvezXQqlpbEg2jkv5u/+562NTzyydc2GPDWfk2TR
 KpvQ4btnTnOIdYgMl0x/qeYU3CV1elkHWfos5b5Gm9jSaG/MG5USzP2nuC1vEQHc
 tnbza9Y/73XXPg==
X-ME-Sender: <xms:d6j9X0wTn6ZY6Mdabh1MrH_yvn9B7VlgRdcE6fqq9tt0B47-ngEGzQ>
 <xme:d6j9X4SbF9eAxhh8eTPGML-PfcYSSkj3Mkj2B3X42lcBPPkPof6axdJ1a6aquM3RT
 sY8bYz9ROnick7heak>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddtgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:d6j9X2Un1pep8VUvxnqsSmX7Z5mx6BTmrAcKEmRjRTv47FncL7ky7g>
 <xmx:d6j9XyjwkjlDYV374jH31PPT6DAhbKTlise_-Un3ZjAXzMUk-LWy_g>
 <xmx:d6j9X2D1d9g-WqgKcnpAEIF4pzBLVitFC59VUCi0qiPO_0h6T4F9yg>
 <xmx:d6j9X37YOFiZR7-QgEwV1ud6xzSMP4ZubsmYb083lpJum-wcDKZLWg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B3C5240057;
 Tue, 12 Jan 2021 08:47:35 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Lucas Nussbaum <lucas@debian.org>
Subject: [PATCH RFT 1/2] ARM: dts: bcm2711: Fix the HVS size
Date: Tue, 12 Jan 2021 14:47:29 +0100
Message-Id: <20210112134730.810697-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112134730.810697-1-maxime@cerno.tech>
References: <20210112134730.810697-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BCM2711 has a larger HVS size than the earlier SoCs.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 4847dd305317..5254c63fbf8f 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -290,6 +290,7 @@ pixelvalve4: pixelvalve@7e216000 {
 
 		hvs: hvs@7e400000 {
 			compatible = "brcm,bcm2711-hvs";
+			reg = <0x7e400000 0x8000>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
