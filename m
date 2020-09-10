Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE40F265CE3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61B96E9A5;
	Fri, 11 Sep 2020 09:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CF36E95C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 17:05:52 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 16so6805895qkf.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kX63D1UHED1kS8hbCxUzu+mEWg7ZHS1VFvzltaxjL10=;
 b=KFEjsz6dsif7THN645xuBX/Te4+yd6MQ/TqEo10SYpgYzr6PqmPiUvOnofhZTm8pLJ
 i1MSGyiUENF2fRYa4g7GQyXxK3QGxk0ORzFvLkYrquAF92ONVfZSpirXIun2NYHPJjA/
 SklQ2A5KYMnTEbIBXPvILYPo87Bh4Mtyif+RUApWr4mGX9fMK0BgMEh72V8C35BkVVhZ
 k6gq97Fv/tAkKyUTFXItuHq5Xp4FrAITe3pZgmcixtymxAzJAZFpbtyXIUMfeWKHaCmU
 GUojq/Qd0HEpx0bdDj14qXy97BfhZsdn85u6NEhuJddW8wrCVxfshFetMeUfhMjEgqlG
 43Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kX63D1UHED1kS8hbCxUzu+mEWg7ZHS1VFvzltaxjL10=;
 b=YgYkc6SXlBJmXxI9tzNcs7iZdjlGTbb92hkU0ocYufO6rNRzRI99TaC6FTaBBhMtGQ
 xoJce0vtiOIE9A6Ee4PUOzTPv/7So7Bh5c1goDXifWJInwSnePq1S7NXVQ4MVi2MOr4g
 +u3TDEYqVMjiDvh8NNJRRCY1wFU/ASMOm/spvwWzX656OQSWhvvFG8mb2j8L49KDOJM5
 8oBj5s7YtE1EcFnNqfDTgxv+MwGMeW/hKbktkRiuMupWMQ5MLuTjKdwUNDZD15DfUmBi
 SjN/Ip928Tn7Ob+Xqx9PRsrByG6eu9sQVB/pBJaTmD4jeX+CSh/y2Opwi5YZBM4ZaV4b
 B6Mg==
X-Gm-Message-State: AOAM532783n3Vggi6FFBCJKW+W6npzIjBG0k/nFnobeScuTeCF73V9VV
 77jqbZ+jVY9ut5M1+Kerc40=
X-Google-Smtp-Source: ABdhPJzfkyubjrBmIlbp6+8/VJ+krP7Kmjd4yU/hWgCJgzQjIQ0+RGK4MS0ntgOg5NX5QZvDFILGMQ==
X-Received: by 2002:a05:620a:8c8:: with SMTP id
 z8mr8748406qkz.63.1599757551410; 
 Thu, 10 Sep 2020 10:05:51 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:45d1:2600::1])
 by smtp.gmail.com with ESMTPSA id j11sm6924193qko.111.2020.09.10.10.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 10:05:50 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Eric Anholt <eric@anholt.net>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: Update type of reg parameter in vc4_hdmi_{read,
 write}
Date: Thu, 10 Sep 2020 10:04:02 -0700
Message-Id: <20200910170401.3857250-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns 100+ times in the vc4 driver along the lines of:

drivers/gpu/drm/vc4/vc4_hdmi_phy.c:518:13: warning: implicit conversion
from enumeration type 'enum vc4_hdmi_field' to different enumeration
type 'enum vc4_hdmi_regs' [-Wenum-conversion]
        HDMI_WRITE(HDMI_TX_PHY_POWERDOWN_CTL,
        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~

The HDMI_READ and HDMI_WRITE macros pass in enumerators of type
vc4_hdmi_field but vc4_hdmi_write and vc4_hdmi_read expect a enumerator
of type vc4_hdmi_regs, causing a warning for every instance of this.
Update the parameter type so there is no more mismatch.

Fixes: 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout abstraction")
Link: https://github.com/ClangBuiltLinux/linux/issues/1149
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Note, the variable names in these functions do not really make much
sense after this patch but attempting to flip the variable names made
everything feel even weirder. Feel free to rewrite this in whatever way
you prefer, I just don't want my builds to be chalk full of warnings :)

 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index 47364bd3960d..7c6b4818f245 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -392,7 +392,7 @@ void __iomem *__vc4_hdmi_get_field_base(struct vc4_hdmi *hdmi,
 }
 
 static inline u32 vc4_hdmi_read(struct vc4_hdmi *hdmi,
-				enum vc4_hdmi_regs reg)
+				enum vc4_hdmi_field reg)
 {
 	const struct vc4_hdmi_register *field;
 	const struct vc4_hdmi_variant *variant = hdmi->variant;
@@ -417,7 +417,7 @@ static inline u32 vc4_hdmi_read(struct vc4_hdmi *hdmi,
 #define HDMI_READ(reg)		vc4_hdmi_read(vc4_hdmi, reg)
 
 static inline void vc4_hdmi_write(struct vc4_hdmi *hdmi,
-				  enum vc4_hdmi_regs reg,
+				  enum vc4_hdmi_field reg,
 				  u32 value)
 {
 	const struct vc4_hdmi_register *field;

base-commit: 8c3c818c23a5bbce6ff180dd2ee04415241df77c
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
