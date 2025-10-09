Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77609BC9F72
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 18:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB14810EAB6;
	Thu,  9 Oct 2025 16:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZGN+kJkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E85F10EA9F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 16:07:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-46e4ad36541so12769975e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 09:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760026060; x=1760630860; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pq2Tr08L1lg3adWXzaD7SZjNMtQpBC/86/5deu6J4qw=;
 b=ZGN+kJkF3RdkCoushuf1JLghp1PpycQY5GFFUK2HkSQuVKFO4WjtvNECO/T+x6UJ0V
 fXhAJwF7FB1lV0/xmsMQuyKPk+ePuvPE2HTfmTq/Il/VqIDGt0fN/G4IgWXcaYl399xr
 sznSmfYaqIaHunGiZ6u60YH+Db5W9wiumayD/q7EnT7RI6au6FdUKP43MVcZeFacKCux
 A17yTV5oR5JbRT97YTWf1o7WbIDniwR+sovNaGVL0OFryfiGMJmOmfL4apBbHN7d7Wzg
 OxBVCElgDc2RF+RJUKpUjBO1Wx1Zm/nhAJQLhl7VgBzWY0HkSRNqiT3iLEsvl68VM6+A
 TFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760026060; x=1760630860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pq2Tr08L1lg3adWXzaD7SZjNMtQpBC/86/5deu6J4qw=;
 b=Io79ril7XAdY9olJgEz6+tevo/IDH7Eb0kl3xiITmwBsrVV1N8s7KjMQK55OZoe4oX
 OA7wQD6/QgOvAOgm8VefRCrNGR9fDVWVeB1cjaXLrzSDP7+TP4TX7oR4LJuwFtNEsTrL
 rpwckow5FR/sEg7bXNZ7o5Q37eIqCsh0lxzRkYhBCAsrstiBVf/nLAwjax9J5uhbUL3w
 ui+zXANeCee5R738y+q9Toc6pApO/MuT2fk4AxQDWX0pa0FUvrFtbA4RkBnUUtJmTcjZ
 xaROQ0muoQQH/pYtwqTcICsUpB5lnd+bNLLiC7ZtWpOm5yotfCM2kWNMffBJ4M4kWvuV
 MK/w==
X-Gm-Message-State: AOJu0YzpzrfTOhTPk0nekSsHfrE2ZwfWvE9/qiNFwSnT/isHz45rUajQ
 Wt5pW7KrWliXfoRblAVRdug6ZaT73Yo5fxOLsmmCldoDvfTPWweS9KGM
X-Gm-Gg: ASbGncs086Ia5Zki3etbILI/88u8A6y2vXs8iKp9LpsI+nzsn6CbwK0TiKMTFSiA1/I
 fvfFPLpRf7+RbJyxTfV2MbH9XZ7N8GfrLLBR1QUskBowVmMUASXploMZhW7+ICi3iiy1oLZybPV
 4o7CVAGsNtAjBcewoqLpMLrIf0fHot9nWFpSVMtDIqx//xtzx5YP8EK7I/1hf+CaBRVKOn4qSs+
 wCI/4ykCRFUQ1BfFTC6X4tazviVcDTCUM4JaCN4ayWzAuKjp6y9V1n5mm9L+87Y+NhoSfg4DNku
 m2ei3QK3ibhl25XcbpjZdhuaUXvuBsniIey9wrw+Ps+9WKppA5YFI65uPipwD+gntWyQeyjeygT
 XgWq3g2iymJbey0fLOzV0Tor3WfEigs3ejlKs8W+RqOOX6iSXYuZXKEfSQWXwGXS7thLa1cZEzo
 bULP1rh9dd7j28k6g=
X-Google-Smtp-Source: AGHT+IG0LyGj7zfSQuOuhq0aYpFFxrUIfS3oUT4MH30fCAKrUqSSLWi2E25suH7i+Zh55ryMx4uMAA==
X-Received: by 2002:a05:6000:40dc:b0:3ec:d78d:8fe7 with SMTP id
 ffacd0b85a97d-4266e7d91f1mr5245654f8f.33.1760026060415; 
 Thu, 09 Oct 2025 09:07:40 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:480c:edeb:2884:a92a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426cd93e45fsm94632f8f.4.2025.10.09.09.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 09:07:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v10 1/6] clk: renesas: rzv2h-cpg: Add instance field to struct
 pll
Date: Thu,  9 Oct 2025 17:07:27 +0100
Message-ID: <20251009160732.1623262-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251009160732.1623262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a two-bit "instance" member to struct pll and extend the PLL_PACK()
macro to accept an instance parameter.  Initialize all existing PLL
definitions with instance 0 to preserve legacy behavior. This change
enables support for SoCs with multiple PLL instances (for example,
RZ/G3E we have two PLL DSIs).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v9->v10:
- No changes.

v8->v9:
- No changes.

v7->v8:
- Added reviewed-by tags from Geert and Biju

v6->v7:
- New patch
---
 drivers/clk/renesas/rzv2h-cpg.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 840eed25aeda..e2053049c299 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -16,20 +16,23 @@
  *
  * @offset: STBY register offset
  * @has_clkn: Flag to indicate if CLK1/2 are accessible or not
+ * @instance: PLL instance number
  */
 struct pll {
 	unsigned int offset:9;
 	unsigned int has_clkn:1;
+	unsigned int instance:2;
 };
 
-#define PLL_PACK(_offset, _has_clkn) \
+#define PLL_PACK(_offset, _has_clkn, _instance) \
 	((struct pll){ \
 		.offset = _offset, \
-		.has_clkn = _has_clkn \
+		.has_clkn = _has_clkn, \
+		.instance = _instance \
 	})
 
-#define PLLCA55		PLL_PACK(0x60, 1)
-#define PLLGPU		PLL_PACK(0x120, 1)
+#define PLLCA55		PLL_PACK(0x60, 1, 0)
+#define PLLGPU		PLL_PACK(0x120, 1, 0)
 
 /**
  * struct ddiv - Structure for dynamic switching divider
-- 
2.51.0

