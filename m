Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3874CC606CF
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 15:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A5310E2A5;
	Sat, 15 Nov 2025 14:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xqy/Yxi4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D912910E2A1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 14:14:15 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-64149f78c0dso4543519a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 06:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763216054; x=1763820854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MocqCxWcaLZfsHWYqTZWM/wBzmMvMPkWJzIzBgPappQ=;
 b=Xqy/Yxi4bKWljaeT2OzzEhFyYCWxCaMedMRnetEKZC6zeeT8n7BE50jpX3/VAyqLqx
 1fv6ZZX9lwQ9GTMeABB6+aoWW/UvDLnOAKdDhbRKARDJtCxlGq+f1Qy6NVEUJ2xno/NV
 8x7TEU0lZcp+YuNR9NM8+jSaFobRCwMoaWke0CTzItUU6krGTc8CDKk5h6ZcjBxkP//9
 af5COP5Mo9EM+alXSithq0kYH1ZaulTXQpMZyJmmPTnJSgyXKAyGhL1q8X0XkFWuYd9g
 WgmdbbPCurhi2wsQ7kvDqMkWVMn0KpmIs6LHlt6Wxu1DkFklY/qjsn88Dr+CsJ4TPOnd
 WfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763216054; x=1763820854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MocqCxWcaLZfsHWYqTZWM/wBzmMvMPkWJzIzBgPappQ=;
 b=L5b0JmTywL4pdI2JhYz7TmujPNzThyBnmewHJFEztOkbuyLw+CsM5/4mj0rKJYVoF9
 mrtTC9btBXRAy9c+vWNDj7J8RDvkgnl/VItdHdsqkLN1cExuBZDAM+DyCufERrBWBkWZ
 S10DlrAF+uBmf1MeAuSLHanmF/xB8ohsm7q1OUQydvSGaUScOgBnA8TPfhR0x2OHb9mr
 FRIXNRVB5vBd/dp8fiSUu/4Muz2K0D36d/PWlLOrJHHkMciiQhLmI/xtGJLqoiFkJC1x
 +5klECWMVmLESX+R41mZ3nRpc9AL7848Zp9OJFtSg8HQec6mi43xTtHmzYE6hhoxwdVf
 OvhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNtIKXO5lFqRg3ENLc29SWnTVr+0+RUo9FpiwTBVhzA8QmSWT5sJ8yJZpGQNts6Opf/FxrHEaXudA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaMdYYQ9eO8yHH0ecVqwDyOWrCdroNeeMWzVm5bvzkP+OuxUSG
 FoFeC1TINiCN+A6wJCOzAtYASbs08vIsyOJouG+PfxgXVKjAk+LzpEC6
X-Gm-Gg: ASbGncuJKgJAiKqot6MLDwlfqdOs63Ti03wvIFMAmrqujb2QmsU0o0LJPcBqZL0avgB
 D1r8db/rKgzvUJXvwJTRH590wRZxfDqZWwXrL0WoaPOqR3KJ18n2JBQBase85yu/THrwBtZn+G5
 wgRqrFWRDAeDDHs2JPn9f9xdhpdjUsnra8ccRKsULm30dvX+AOdcMhxeWvoP452XuYIQeyVA1Yz
 /V9i7HuRdz319gON7wXiNyjBJJMQI8LEH5t/z99OqjZALWH13JBKXM+poSKs25xk7wtXskljjP/
 MEaurxXzioVT8nc/i5wzFodGwMgHTu0Ugvjkm6iPbS2SKNNYl79+w+aU6bCMdjQ/yuS1iHcyu4S
 gGF6l06jiL25e/BDw/wU8pBzwTMUqGh2KyoGhxDAtTxdEsfY7K3Xp3NDrNfVpSeXFX+OuCX8qoF
 tAFt8rHJWUTFOgP9fqJnZQItAnepp4MUB0ftiRDsDUblgooE3i6YA9YYP9
X-Google-Smtp-Source: AGHT+IFSj1aDwiro/wwK4L9h7pp1M9ctQw+POyBArF5AsNHZz7cGsgDc33Ii1wskS73N5JZnJxCpEQ==
X-Received: by 2002:a17:906:f145:b0:b73:6d56:f3ff with SMTP id
 a640c23a62f3a-b736d573ee7mr440406566b.20.1763216054020; 
 Sat, 15 Nov 2025 06:14:14 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 06:14:13 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/7] drm/sun4i: Add support for DE33 CSC
Date: Sat, 15 Nov 2025 15:13:41 +0100
Message-ID: <20251115141347.13087-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
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

DE33 has channel CSC units (for each plane separately) so pipeline can
be configured to output in desired colorspace.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c | 71 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h |  5 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ce81c12f511d..70fc9b017d17 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -205,6 +205,72 @@ static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
 			   mask, val);
 }
 
+/* extract constant from high word and invert sign if necessary */
+static u32 sun8i_de33_ccsc_get_constant(u32 value)
+{
+	value >>= 16;
+
+	if (value & BIT(15))
+		return 0x400 - (value & 0x3ff);
+
+	return value;
+}
+
+static void sun8i_de33_convert_table(const u32 *src, u32 *dst)
+{
+	dst[0] = sun8i_de33_ccsc_get_constant(src[3]);
+	dst[1] = sun8i_de33_ccsc_get_constant(src[7]);
+	dst[2] = sun8i_de33_ccsc_get_constant(src[11]);
+	memcpy(&dst[3], src, sizeof(u32) * 12);
+	dst[6] &= 0xffff;
+	dst[10] &= 0xffff;
+	dst[14] &= 0xffff;
+}
+
+static void sun8i_de33_ccsc_setup(struct regmap *map, int layer,
+				  enum sun8i_csc_mode mode,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val, base, csc[15];
+	const u32 *table;
+	int i;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = DE33_CCSC_BASE + layer * DE33_CH_SIZE;
+
+	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
+	case SUN8I_CSC_MODE_YUV2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case SUN8I_CSC_MODE_YVU2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		for (i = 0; i < 15; i++) {
+			addr = SUN50I_CSC_COEFF(base, i);
+			if (i > 3) {
+				if (((i - 3) & 3) == 1)
+					addr = SUN50I_CSC_COEFF(base, i + 1);
+				else if (((i - 3) & 3) == 2)
+					addr = SUN50I_CSC_COEFF(base, i - 1);
+			}
+			regmap_write(map, addr, csc[i]);
+		}
+		break;
+	default:
+		val = 0;
+		DRM_WARN("Wrong CSC mode specified.\n");
+		return;
+	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
+}
+
 static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 {
 	const struct drm_format_info *format;
@@ -238,6 +304,11 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		sun8i_de33_ccsc_setup(layer->regs, layer->channel,
+				      mode, state->color_encoding,
+				      state->color_range);
+		return;
 	}
 
 	base = ccsc_base[layer->cfg->ccsc][layer->channel];
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 2a4b79599610..d2ba5f8611aa 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -18,9 +18,14 @@ struct sun8i_layer;
 #define CCSC10_OFFSET 0xA0000
 #define CCSC11_OFFSET 0xF0000
 
+#define DE33_CCSC_BASE 0x800
+
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 void sun8i_csc_config(struct sun8i_layer *layer,
-- 
2.51.2

