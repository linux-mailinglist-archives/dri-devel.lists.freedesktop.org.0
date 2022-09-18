Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8005BBB5B
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 05:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C8D10E103;
	Sun, 18 Sep 2022 03:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CC810E103
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 03:44:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 52B8C320099E;
 Sat, 17 Sep 2022 23:44:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 17 Sep 2022 23:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxfierke.com;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1663472665; x=
 1663559065; bh=JNw+5gbeLx+VtE5TX56WLsuM3gmr3GoJ1cjwUH7Ro8U=; b=Y
 Xda0yKZadsG6bsX0dXzb35cTUAuoJqvJy8I6e547k8pI21f4lhfW6oRJDva9/ubt
 qOFUdQIJ5GCB2ovxSSXdVARdMBdHu5STqzxriEg+O8PyVs610wVQ5twOa1j+UAVG
 GRVIrB+2hLIOGz31E1LnnzU/6hTZykRV9OgLYYhRKL/Z0N3Cw50yGVwShzJsstez
 EwFObGrI7otBesyH8O/AV5PByoPZVnIMowyz3BW/ClAjMrNHrPKFWPzGorJF0jDo
 rIhmHgG5r38H4E2vIno2nZsx7SEk1H3Exx8XKZ02fjo5T2aCrkB/ONZcRrKO+7gq
 o/KYTuuBsDxpyZT+SRVrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1663472665; x=1663559065; bh=JNw+5gbeLx+Vt
 E5TX56WLsuM3gmr3GoJ1cjwUH7Ro8U=; b=t9M5rJCKxyUytymLMUZUKiHz19pku
 EA752QSIuLwy9TzXriwDyKJNa3eFN6Dq9ccd/Cor0dKHxdRdV3g+RO2orxNaxEXT
 Gs8ulzClaGt2eKhist9UBi2KoHLdSfP1vsZG/idy9mONDm+mINu22csQsAHAhCyI
 IKOU1sotxhkEhIZCqDWtZhr4Cr5BjZC1hXPmwvSa8br4Po6BOPJZBQz8di4YLs9R
 OImYmPNMWUAoFGO12zIIjH2V/OpOhX8Fa6uXQY0xWm8KAV0L6CpijIwmnKip1vQQ
 Hu08LwaYSdwdrY30HIdS99IX3M7/R0J1LBD/lWvsuT94obJvralvwk6bg==
X-ME-Sender: <xms:GZQmY4HEMaxKLIB-H9QesmRupVeKfv6WYwQSkzX2yacYfgqpeeZu_Q>
 <xme:GZQmYxWtnlTNXmp_behpErq-0l-cQHHiKLZnpr-N6lqM5f-Mlv8JqP0GwvBcJBXhi
 _pNql85skrnQBixfXo>
X-ME-Received: <xmr:GZQmYyLozFO_4MBR9kCriXGzgYXJgaW_Uqjr9NySKSWQmjGKvWlmIcDK2eaak4tcC6CL4qnmueZaQZZEBP69ZpmQNm370NT3-X34tjTwo1kv4xPHSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvfedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgicu
 hfhivghrkhgvuceomhgrgiesmhgrgihfihgvrhhkvgdrtghomheqnecuggftrfgrthhtvg
 hrnhepudelvedvtdffhfeugfelieevvedvhefgvedtteefkeevvdfhieekudeuteefgeek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 esmhgrgihfihgvrhhkvgdrtghomh
X-ME-Proxy: <xmx:GZQmY6HOCIdFp825OHeLnFUJfP6IcfvAiPYo6P8ZKmYmo-_T1D9xWw>
 <xmx:GZQmY-VkFL9lVJ9LiOBrTeTSym3Z2AFwtYgLCgJCrcwXh1YMK2iUog>
 <xmx:GZQmY9NPV8j2-AxUXoNyJLwrRYha2_w8fyXnKuVAjB_NQW1ny3JbwQ>
 <xmx:GZQmY3UF2rjh9w-7QyBDzoKTmqZMCocsCofqacOzaFtn8Eo0HKxYdw>
Feedback-ID: idee9475d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Sep 2022 23:44:25 -0400 (EDT)
From: Max Fierke <max@maxfierke.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add prefix for
 ClockworkPi
Date: Sat, 17 Sep 2022 22:44:12 -0500
Message-Id: <20220918034415.74641-2-max@maxfierke.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220918034415.74641-1-max@maxfierke.com>
References: <20220918034415.74641-1-max@maxfierke.com>
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
Cc: devicetree@vger.kernel.org, Max Fierke <max@maxfierke.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a prefix for Clockwork Tech LLC, known as ClockworkPi. They
produce a number of hobbyist devices, including the ClockworkPi
DevTerm and GameShell.

Signed-off-by: Max Fierke <max@maxfierke.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2f0151e9f6be..64f4b899c40c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -258,6 +258,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^clockworkpi,.*":
+    description: Clockwork Tech LLC
   "^cloudengines,.*":
     description: Cloud Engines, Inc.
   "^cnm,.*":
-- 
2.37.2

