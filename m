Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC8B3A0F1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B99A10E9EC;
	Thu, 28 Aug 2025 14:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="o2Bq9byC";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="CAe+mZhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a7-smtp.messagingengine.com
 (flow-a7-smtp.messagingengine.com [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A8D10E9CE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 14:16:16 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailflow.phl.internal (Postfix) with ESMTP id 365331380DD7;
 Thu, 28 Aug 2025 10:02:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 28 Aug 2025 10:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1756389757;
 x=1756396957; bh=LFw85klDbF0tct5t5icXIdCbmXxoBwHs3W+D6BI09PY=; b=
 o2Bq9byC34Jekx1/YpwdAXHhD2egUVnuvZvz+O4+0KvSZDKIcfjg8Q2/sFszmNJo
 ueqYqoM+UvOyRNianQJOuVlte89QhZ3cKXCeLK4OSm/HHLKuL321Dwfz1VgV0Zwa
 /OqJz5ITbPcjZU/hbZjYrb5KWVGNsE00A0PsrSAdT/l7q8/ww1dBNSUqMRLt+1Br
 CE827cH4FHzWIRvlqfSKYOuF5UPvDl8kkdc0o8QD7FesD/oMLkjEdOk5sEu9eAvB
 V2L7azskT7tIsstKPRSXleEJ827HSjAW9jaM7h+hIukUjQ3SYsh9tPcESFlfMjHm
 jOBPb+MHKuINNPv8mq6TRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389757; x=
 1756396957; bh=LFw85klDbF0tct5t5icXIdCbmXxoBwHs3W+D6BI09PY=; b=C
 Ae+mZhi/Uy7vtE08bKWZ7lnTRA0oHgGtR3fn4lH9af6e0MMyULOhr8cYVPitjTUz
 lN96+1LzoFFFv2F4zkzSdvRgvELQnG6Jgf8/4R4Cqr0coWm1yBLUFQDm24OYgoSz
 t7CTePFqTOr++7NmE916ft9aJgz4g/zuQdc/+BoXoJSsrfZqEAxP3UVAAx5ttFHX
 zxCLaFL2ySGIiMr21Hr1cfgZUYIZEOCnYhxtP0yE5HFVD5Cpzl/W7dKbxcc8zII0
 r8CKtllG0s6Dpg1B3UYYQ7Kcqz1lW2aJjQOkhcE4e3brPTkgLEsq3Cr5mvS30w25
 BY0DE7cqeJE1wP2zIy0Rg==
X-ME-Sender: <xms:fGGwaPa3NbMPKOUHyVFdJsDrr1TuqroyS80fmkzHNUN5RagRLPoIhg>
 <xme:fGGwaF07Eq9zfjbuuGlYsWqJwhVwP8_kbTdqIWR04ne4QnVsBUrfuDnCdybsTda6a
 DBgkXONBdecFLA5ppk>
X-ME-Received: <xmr:fGGwaK7gm52ceTxC7jWCvTN-Gd__UASW230_nWG3Q2R-CjLoBYXg6zaH1Nt81TBO-iR4N98FcKkCZ6Cned1e5lJqPsp0I3SGacBKjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvdduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
 ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
 ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
 uhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
 hurdhnvghtpdhnsggprhgtphhtthhopeeigedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
 htohepjhhohhgrnhhnvghssehsihhpshholhhuthhiohhnshdrnhgvthdprhgtphhtthho
 pehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlh
 drohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghr
 nhgvlhdrohhrghdprhgtphhtthhopehkvghtthgvnhhishesohhpvghnsghsugdrohhrgh
 dprhgtphhtthhopehksghushgthheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgr
 ghhisehgrhhimhgsvghrghdrmhgvpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvg
 hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:fWGwaAl5lphBG5i0JNCK4-fyh4q1Uh7x6haVK020O5eEV_HbU4w2gw>
 <xmx:fWGwaJ4RdoqV0NHmEotg7kWiZjUL2633OuelGBufUk9zs1pwDtkpRw>
 <xmx:fWGwaNuP_a2dx0Vq48TdNMeeCELUdhDzANQ5TxiFb2qz4CLBh1lcQw>
 <xmx:fWGwaEt1hCEpmSCQoTJjBlYbpWMYZusrg4aE-lCUADlfhZXwHQDF_Q>
 <xmx:fWGwaE1un5jGHLmMtwkl3j2K4yWQFN6Tf6QYSI-85mr9vX42KKlhP7nD>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:36 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:39 +0200
Subject: [PATCH 20/37] dt-bindings: pwm: apple,s5l-fpwm: Add t6020-fpwm
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-20-507ba4c4b98e@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 van Spriel <arend@broadcom.com>,  Lee Jones <lee@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Michael Turquette <mturquette@baylibre.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=z3iL5HvhFofpTTFUNDyus6PZ8qeRDmg9wfOX36vK9a8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiVYZkyWiH3s+39w3Qd4uTeZSFxNbxIUDkiIvb/Cf4
 rWae3JlRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgInoKTMyNAW86eo2v/3N3VjM
 5K7pg0lVrUkTTP+w7Imdud5LyDeAleF/oFP9yU+m9zp0Oc0cWC29j+zb6PZjbcpb/lVdV/nWNBx
 nBAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
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

The PWM controller on Apple's M2 Pro/Max SoCs behaves in the same way as
on previous M1 and M2 SoCs. Add its per SoC compatible.

At the same time fix the order of existing entries. The sort order logic
is having SoC numeric code families in release order, and SoCs within
each family in release order:

- t8xxx (Apple HxxP/G series, "phone"/"tablet" chips)
  - t8103 (Apple H13G/M1)
  - t8112 (Apple H14G/M2)
- t6xxx (Apple HxxJ series, "desktop" chips)
  - t6000/t6001/t6002 (Apple H13J(S/C/D) / M1 Pro/Max/Ultra)
  - t6020/t6021/t6022 (Apple H14J(S/C/D) / M2 Pro/Max/Ultra)

Note that SoCs of the t600[0-2] / t602[0-2] family share the
t6000 / t6020 compatible where the hardware is 100% compatible, which is
usually the case in this highly related set of SoCs.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
index 142157bff0cd851c85fbf0132d734d470c5a0761..04519b0c581d0e9fb1ae6aa219a4e850027de6a2 100644
--- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
@@ -17,8 +17,9 @@ properties:
     items:
       - enum:
           - apple,t8103-fpwm
-          - apple,t6000-fpwm
           - apple,t8112-fpwm
+          - apple,t6000-fpwm
+          - apple,t6020-fpwm
       - const: apple,s5l-fpwm
 
   reg:

-- 
2.51.0

