Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B2E1A5FBF
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 20:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2786E12E;
	Sun, 12 Apr 2020 18:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F49C6E127
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 18:20:26 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v16so6765137ljg.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 11:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=did1T2/HwLMbYWYOlmzUGj6USB2Yk/B/7FfjOftQ9s8=;
 b=hipBb+D/jP/qEHd5BxbwYSODqx8BortuRIMkzRERp+XNGiT4yk7To7/dmj1lelc1as
 +0NSQvV64w2t/PnzKb1LJ3XbFzahoqefh/RWPrxsSegizIkWgg36JQCN7Pzo1nK5cvN0
 lJGNzou6X3se3VQTxHXXbePUXVNBOzKlaBO7QS8ktk7UZG46dTbDykrRvVjsRkLAqgvJ
 nurSgm8718ek6yzWafK9i7ZgFVeXqFJyZ81gy03GMLVQhUJHCwpBjnj6wwSdxV6cn8Pu
 EsR5rTAsyO+knJtNRCnAFVxaQC0KxbtqlP0eGap3QBlcASp7GH3XKhXAjIACUV/Pci/X
 cG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=did1T2/HwLMbYWYOlmzUGj6USB2Yk/B/7FfjOftQ9s8=;
 b=tELv/uihRLwAh/+3GnE1HHz5GL0cpXu15n1YpsBtKY309V23bImEmktOQ+8sJbb9GG
 nRs9JtA8UPDRXOeP/W1sYQEtr/RVge2VjnBuuuCFgOJ9yniKwkNwNkob+qKozR9mCcp6
 67v2sWc3CP9S0pvXBP4bI8z366H54+KqywDmMFEpLImbvUp+RxWOXFKLqiNa0Mr4lyka
 b7Dbt8jnwvFaXshLAu8lJ7H1+bV9IsyB0JqNhhaNhVSoEDt89Z4pDSOsvAbAKmv6bDeW
 SXPG9Avi81OV4a96ZynC3oJHYl2V8cy/tS2hCAVdKG9RO9nvNoCmfd62dtUs4VcOmvGr
 0zsA==
X-Gm-Message-State: AGi0PuZN19FlvYL/XfbRi7apDy1RbQAoM+FYk8252v9lHqnBMGjeKVqt
 kNQ9Q45JULj+TQ4/1OlKavE=
X-Google-Smtp-Source: APiQypLW6zIR1umbR/uxwiVl6Mu1txVZ1wgbVD7efr/eOYIQSegWjWS1ZWxFJ0MQHCvZ9C0SrDDCRg==
X-Received: by 2002:a2e:7d09:: with SMTP id y9mr8491929ljc.146.1586715624424; 
 Sun, 12 Apr 2020 11:20:24 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 m13sm6434394lfk.12.2020.04.12.11.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 11:20:23 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/4] dt-bindings: media: add wiring property to
 video-interfaces
Date: Sun, 12 Apr 2020 20:20:11 +0200
Message-Id: <20200412182012.27515-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200412182012.27515-1-sam@ravnborg.org>
References: <20200412182012.27515-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The wiring property is used to describe the wiring between
the connector and the panel. The property can be used when the
wiring is used to change the mode from for example
BGR to RGB. The first users are the at91sam9 family where
such a wiring trick is sometimes used.
The possilbe values are so far limited to what is required
by the at91sam9 family, but using "text" allows us to extend
this in the future.

There exists similar properties today:
 - display/tilcdc/tilcdc.txt: blue-and-red-wiring
 - display/atmel,lcdc.txt: atmel,lcd-wiring-mode

Neither of the above are defined as endpoint properties.

The new property "wiring" has a more general name and
is defined as an endpoint property.
It will replace atmel,lcd-wiring-mode and may replace
blue-and-red-wiring.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
---
 Documentation/devicetree/bindings/media/video-interfaces.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index f884ada0bffc..c3bb87c5c9a9 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -141,6 +141,9 @@ Optional endpoint properties
 - link-frequencies: Allowed data bus frequencies. For MIPI CSI-2, for
   instance, this is the actual frequency of the bus, not bits per clock per
   lane value. An array of 64-bit unsigned integers.
+- wiring: Wiring of data lines to display.
+  "straight" - normal wiring.
+  "red-blue-reversed" - red and blue lines reversed.
 - lane-polarities: an array of polarities of the lanes starting from the clock
   lane and followed by the data lanes in the same order as in data-lanes.
   Valid values are 0 (normal) and 1 (inverted). The length of the array
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
