Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C78BE7E3
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07816112132;
	Tue,  7 May 2024 15:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HylHtNbi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E35112132
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:55:22 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-34d8ccf34f8so2428360f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715097321; x=1715702121;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=ENm7dGdRCegViXpKOlFOwQirdvQpMHKuwbsV2GUz3rE=;
 b=HylHtNbi5cYhusSxh8ZuKMBy7Q6OqNaH88LnE/3QGOxKLKRyQ8vkiRq7qrv6G1NdvH
 KdapM/elkq9u9SfijC7GrUWP+ejpUal0GpShN90J3x16I53CcBb2sYBoXKDaI7ge9f/U
 vP7sIg9jutoleT1b4d77YR98PXdFq8RMzoG07JSFe88FgNQHtFwrjGECftZNDpK6jpQG
 B5gCritiMo2dg11m755VwF4nkOi4f62p67aTPSrW464odz8Fyxu3hmfLGbnnomrxrycf
 IbdF+frkyqjxehy2AWW1XBMJnwcZAj9eYCV8DDCFOjBtYvKX9naurFGRNDpMQbwJC7he
 c6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715097321; x=1715702121;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ENm7dGdRCegViXpKOlFOwQirdvQpMHKuwbsV2GUz3rE=;
 b=HgYNCje7OnmpiEyPUcsq9Ka5U2K96e8AlnkbDf1urLNZ9FCbH6rXqXi54bcNOnGq6I
 15raF2Sq3FQDk0gwPVId6LyLcW6OyQJBgSHO4pM6cinbsGjic7Kk23HHT5ZjKR1MGA46
 PpFvXcKIS85JMoCiu4LPeCn6O25jBGZIoA1c1LnN4Ds1AoNiXW7fJzDxnzISvjp2WRDo
 RSIreS/vKemImpGNPWGanSflMeUV/CkwzXRoDp/eftorPtEKbR1J/hfsegnvAehcaDls
 /ZSK1ETn2qPMwoyOvfsnHQaH745x7bbnZRFl9K7+i+BQGjrU1hHbffr87UuwAYsp/Wmi
 J7ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrymogJGZaytFoEj1/yRPU7ZBq8lQFbpHu1WBG1YQxWYN1cJdgGG3gUmJcDvgTENGDIw6pPp1zUvrkKPi4BUBF/1YkO17/e8XddSpmhZvU
X-Gm-Message-State: AOJu0YzhlW+lztauwvH1Ej00G1086GDL57OfTVjq01XBfER6r3a9zsHK
 OUIedETioOJav+m1/vsIPiS5p+adQICPGFaGoIkxh20hK4oX+6YAUrlM8pSvKY9Urm0RZ5RjScJ
 ozpWWK2Xfqg==
X-Google-Smtp-Source: AGHT+IHGZ0yavujoh3USa9TPTOqVQ47cF03iCo0u4JgWlc3kP8zUzp3F+JtX/FYOC3mCEQ6JEWGwA5+DbsxNUw==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:adf:ed83:0:b0:34c:d3c5:b12d with SMTP id
 ffacd0b85a97d-34fcb3aaef5mr233f8f.14.1715097320472; Tue, 07 May 2024 08:55:20
 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:08 +0000
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-6-panikiel@google.com>
Subject: [PATCH v3 05/10] media: dt-bindings: video-interfaces: Support
 DisplayPort MST
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, 
 "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Add a DisplayPort bus type and a multi-stream-support property
indicating whether the interface supports MST.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../devicetree/bindings/media/video-interfaces.yaml        | 7 +++++++
 include/dt-bindings/media/video-interfaces.h               | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml =
b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index 26e3e7d7c67b..7bf3a2c09a5b 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -94,6 +94,7 @@ properties:
       - 5 # Parallel
       - 6 # BT.656
       - 7 # DPI
+      - 8 # DisplayPort
     description:
       Data bus type.
=20
@@ -217,4 +218,10 @@ properties:
       Whether the clock signal is used as clock (0) or strobe (1). Used wi=
th
       CCP2, for instance.
=20
+  multi-stream-support:
+    type: boolean
+    description:
+      Support transport of multiple independent streams. Used for
+      DisplayPort MST-capable interfaces.
+
 additionalProperties: true
diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bind=
ings/media/video-interfaces.h
index 68ac4e05e37f..b236806f4482 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -12,5 +12,7 @@
 #define MEDIA_BUS_TYPE_CSI2_DPHY		4
 #define MEDIA_BUS_TYPE_PARALLEL			5
 #define MEDIA_BUS_TYPE_BT656			6
+#define MEDIA_BUS_TYPE_DPI			7
+#define MEDIA_BUS_TYPE_DISPLAYPORT		8
=20
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
--=20
2.45.0.rc1.225.g2a3ae87e7f-goog

