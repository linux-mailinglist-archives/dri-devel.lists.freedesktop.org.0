Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A77C80171
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E3B10E212;
	Mon, 24 Nov 2025 11:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="dUhWPqjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com
 [136.143.184.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CA910E211
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:07:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763981573; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MyLWk6DGeOqNZua+Ib/Kg1BXV5VxZhFtpGoCJ5ZU56Eiznb08Shp0lXGGMCBKaDc+DuD71uxpWDtjUbwUVIDrPJH5/jNkv+lk9wSiy0UDp9Bf2wJT/SmTYnV+Y6q4gUqTGRYjN6szsA8HbM2rUZ//ssCNTzuY4wj10tr/CndQNM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763981573;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5UH1ELIx0rGkAwsYn6mhBH82FdAwuQpZmsddW1CJp1c=; 
 b=hjXqEpxRr/DlpHzQZGTMYPWVfLfZI6oP26BNGuxZ8svTifBWjvoOxEkcFrgnH/5SZ+NWGj0Kd0KXzCKI/Y4ITXKdQVUeI+kLGiFC3aJfzXzPik2i4UHVjhsV787UZyz/2Y+GrsbiUSh0IPgMOscN5PCOAL3eJ98eL49psWVF8GM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763981573; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=5UH1ELIx0rGkAwsYn6mhBH82FdAwuQpZmsddW1CJp1c=;
 b=dUhWPqjVSpCRi34J1erETOUIBVwH0DW2X4CVCiYmNM8Yw6xu4qZkUqiv7o54cT/t
 RnibpqKByAdhYRkL09x//Kq0rlWJ/5aIRGGRwIjr3uwWe4NcxvMSUu7Sy02DbvVlnR/
 gXVVGOBA1UC3wfcZd2W8Uks8AgGFH6B7QYghdeHlABOX4V8AUz7OE/phTMzZu3Q0m7m
 y+WdJW3bF2okk8Ts6ibwDHUuCqVbczmNwmsYme4M8IkU8Zo1+1XqPh2bsNcBYi4EOve
 wOt8VdgnDmDlrFXS4E7HK6D57uKRFIk/dRCP2SDqYPIduuIqjJzSmCK+8pHUbuM7gFv
 mqZxoUz/1Q==
Received: by mx.zohomail.com with SMTPS id 176398157093628.493570075381626;
 Mon, 24 Nov 2025 02:52:50 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3 1/9] dt-bindings: vendor-prefixes: add verisilicon
Date: Mon, 24 Nov 2025 18:52:18 +0800
Message-ID: <20251124105226.2860845-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124105226.2860845-1-uwu@icenowy.me>
References: <20251124105226.2860845-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

VeriSilicon is a Silicon IP vendor, which is the current owner of
Vivante series video-related IPs and Hantro series video codec IPs.

Add a vendor prefix for this company.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v3:
- Add Rob's ACK.

No changes in v2.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1d1882009ba9..88a83031f4d6b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1721,6 +1721,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verisilicon,.*":
+    description: VeriSilicon Microelectronics (Shanghai) Co., Ltd.
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":
-- 
2.52.0

