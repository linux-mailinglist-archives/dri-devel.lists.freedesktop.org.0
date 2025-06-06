Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC73AD0921
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 22:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1A810EBBF;
	Fri,  6 Jun 2025 20:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="U0+gVIzl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF1810EBBC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 20:37:38 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-604f5691bceso5151043a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1749242257; x=1749847057;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fTnbotTKBrDuh9yFMLlTHsKfcYmOYKw+giMri+h4htU=;
 b=U0+gVIzlNG4TMQBcD/5Yns1TD8cEtIcftkFXf6rWJPJcX8l5eCZ5JCce83yS1E+1ok
 W+aXQPKYlMY5HB3gDjRucRnaXaIDtuvonQe5jL1CCv5eievMZdslVc14oGGm8iibVrSA
 2ewdYmCna/TVFUhnHRQogv8qvcSg2Ld4w1qaXfQsiLdUhY9ZFneo1u6UucP0wBV4IBrr
 pW8Wq8OSpbFBD0b2C9hpfdvaUpcY8W2U3fJOCk7fwd8L8397LnY9H4sXVzWkNt3BMlRQ
 lWCC5hQDePH72ZJivu3tEI+E3SPStmquTtJm1Lk47Tx/ZbjjfYkilQKY+e/B5uXN1zH/
 0TmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749242257; x=1749847057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fTnbotTKBrDuh9yFMLlTHsKfcYmOYKw+giMri+h4htU=;
 b=syOR2HuX66sL+1rlWLv1XjHcpG0qtd5SAhTAlvR0Ie2UgO6LxXcLzdCfCvV437Y/YI
 W9HhqSHQHf0qVXvelIXXLiRAB8evtiOFYNNnvcyj6if+SPwH4/VxW9b4xUG7EAzi4MMk
 gQNJtWzZp8JnZ2eLrWB7h7hT6ZlLCBpMEQW1Xt3hJbuZtutPbmaE2hT1j8+m1srk9Cnp
 XPKbK9nuFGbGiaHgOn2dCrHDUUFv7/sFjalJSNo2wqH6ZRkYdl9gcaDj7Y44H1L3ssVL
 H2a/fxi3wagrSXRzbQ+XgkeRBkr+nTPdbSFLauhVPZp+nNwkYDFg0EMlC0j+uKaDYDie
 1gOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ8torgcM0tDjNv0+VhaRx85MD4DLJw8ULkoGXMXRGZ/XBnOmo2WuD34t1D6dMKWNRJO6Wkfvk8EI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAKjve5rOVw/cRS0xpwhPQcCOoXWGoJKQD3Xg5SHi/MewbCEhN
 Yba3hvXQ9app3LVN92ClhknWoA6VNowQ1dFqF7rFNImJSc2XDuBfkopY
X-Gm-Gg: ASbGncsqkFlbu5jK5zEsLuL9m9XFspSnxKX56GbRNErWDpO02CAquQKGMRykmnvpJ8p
 HqwUwAbhEohRZS0iG7Ft71I0T3W/N+fM4y5R8FSnUVHt2Bmt8CLMqcrBZvpe69pQP5t9GRRqf0V
 LgsG7dy5GqNhEjwGW0cMfdz5eBEeBRxKV8LM4L6rtxrtAiCGDeRLgzBqySOUKKStN+V0HiVABLM
 08gHgRjDlv6u550eXxJFnuTmMw4mIPZ3IJrKzDePJTztmDFV9Ku+3FjE4Y6R/v/OLYWOSlF+/3Z
 gxPDBEVZcChWF3ZiSbITawk7jPliK1a2FkseNIlNBKoyEeGcVChZbuZGnOvaDuJrsmvpwEg40LU
 gLVWU+E4ZJr2TDCf8+RxGZ/fhouWrk+soPRME6m6Y9OoGjRp2S+DhZlKzkPrTuFEE/ZjJnILl3S
 vbGHPiBDQ/vodYNo3Q3Eow03/aGq8IeQ==
X-Google-Smtp-Source: AGHT+IFdovf47zA5w77hCKENzRX0iCD+h8wdbY0d2TkUMANo/kiX7t5oGgF0SPw/Z8mbPgOCYyvO0Q==
X-Received: by 2002:a17:907:3f95:b0:ad8:9811:c0c2 with SMTP id
 a640c23a62f3a-ade1ab2b859mr396798066b.61.1749242256967; 
 Fri, 06 Jun 2025 13:37:36 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-a016-f000-1e86-0bff-fe2f-57b7.310.pool.telefonica.de.
 [2a02:3100:a016:f000:1e86:bff:fe2f:57b7])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ade1db55f3dsm172072366b.60.2025.06.06.13.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 13:37:35 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] drm/meson: fix debug log statement when setting the HDMI
 clocks
Date: Fri,  6 Jun 2025 22:37:29 +0200
Message-ID: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
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

The "phy" and "vclk" frequency labels were swapped, making it more
difficult to debug driver errors. Swap the label order to make them
match with the actual frequencies printed to correct this.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 47136bbbe8c6..ab08d690d882 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -109,7 +109,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
 		venc_freq /= 2;
 
 	dev_dbg(priv->dev,
-		"vclk:%lluHz phy=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
+		"phy:%lluHz vclk=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
 		phy_freq, vclk_freq, venc_freq, hdmi_freq,
 		priv->venc.hdmi_use_enci);
 
-- 
2.49.0

