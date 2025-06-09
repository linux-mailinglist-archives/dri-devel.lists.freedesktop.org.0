Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDE1AD1EFB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 15:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CCC10E384;
	Mon,  9 Jun 2025 13:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Na/kmnl6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA45010E384
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 13:35:50 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so2370656f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749476149; x=1750080949; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yjjPZ8IQoCrPDiUSgK7PqlqTNZ9ZsE6eNw3NT1KnR6c=;
 b=Na/kmnl6Pc/tQpOz6n/fnQpDMr2sdz2mpbBJn0zeL5eRKnmfmERy4R7jMNg+7wriwp
 8SgmODc6AmBE48H7cShV//SoaVOBF+q8b8iPvSQk0aCfAeMHexiXHD4hBYbMgJgM7jCw
 Vb/UIZLDzQTN6JSu1FvTN+LJiEcKldgMLnphG0OUJtjwQvtOfF38/vKkPfGfrpJ4sqGL
 38Mu8EecEBb3SvKMNgllpNatKJAp2j+0g9aADiF9JEmL5CMVUDTwKT1P08C7hjUnGuUR
 GA65ucXpGKzH36pkSmdBm+fwNu3C8fY/QiC2MpzwSshjbJRNwat9UxQArk+lFSZGSmK7
 6WFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749476149; x=1750080949;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yjjPZ8IQoCrPDiUSgK7PqlqTNZ9ZsE6eNw3NT1KnR6c=;
 b=dej2O6mR3ivIElRWk1lplpvNw6ler4nBkNebkn/FFpOL4kiQ2Bvw6TJJctO3Qf3O+X
 cr6/6fHq1JXdsw8Yn8euGNAVKdPy/3qy/Kn8V6VR34oxJw0IGCsY9fCh1lfcQZ9G+V9s
 xMEIWAOm+6NxpDZB3++oqJI3u197JfoKzqE80VCjLunWhca4Ha7DknmMOGc/B2qdWK+D
 AD8K0+6RcL9A6ZUiDuhjUA3PF49OR5q+I0QAxU3OF4wZHr/iBKSrWHjRiW8JkWYvd4y1
 aUtVI6yjp2sw9t15DdWlzQzlISaQTzztA72WOu/8pVFZ+Jl/AUs5A/gkhbmyrWRkpALh
 BSZA==
X-Gm-Message-State: AOJu0YzTZXIZFcTXQlvh6BWxObXQMQPjeSi30/Nroqv6KnvNOXnHt3Sl
 zSvYmAFiD+eVAGC/8HdP/djS2wW5kvH6+CuhQkc4B+mp/vTu0+Sw/jUh
X-Gm-Gg: ASbGncv40WQ5upo3UNkimgj5gTAqfULHrJYpTx3rnjoVehvZ/dnV/sLoJgOsnWaUgsG
 7Fh6iXx8xMcpIgtjsdOGyHxobhy7kJpuFQdakokDYm4TePMH8RhvAmK1sxGwrdsluaOQ4EPiGfa
 AOuAdB6Z0fZErV/lRcaxrZg4seh2junQR//So6pgMmSNyy8mIjbZezMbds5uZxuNO/ljt/Kl2DR
 roC8lAzTAXw9IKJe8oieN4NB+ppumkDnhAW0mZ6E3oBjSjD4ODz7n1TyFphVt/tCn5AT2TJYQwQ
 jOgwBEoiLnhemle1ZLk22ePYAh1N4hdES6UnyVIFb3cIlboCakA=
X-Google-Smtp-Source: AGHT+IGGzUSDC7mIgTCMpDu41hE45aqKcJRnUYi9VdCFDGuv+PfFNnZPug25wJZHIWl7CUoxFqVFHA==
X-Received: by 2002:a05:6000:400c:b0:3a4:f7df:7564 with SMTP id
 ffacd0b85a97d-3a53166eb0fmr9297865f8f.0.1749476148837; 
 Mon, 09 Jun 2025 06:35:48 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a5323a8c79sm9430096f8f.27.2025.06.09.06.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 06:35:48 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 09 Jun 2025 15:35:37 +0200
Subject: [PATCH] drm: of: fix documentation reference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-drm-misc-next-v1-1-a17b11a06940@gmail.com>
X-B4-Tracking: v=1; b=H4sIACjjRmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwNL3ZSiXN3czOJk3bzUihJdozSTlBSLNAuLpCRLJaCegqLUtMwKsHn
 RsbW1ABvbOmNfAAAA
X-Change-ID: 20250609-drm-misc-next-2f4dd8f88bb9
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=N8bYO7LLQ632cobaTZybB6HV6H+J3kJMUJqYn5h+hTE=; 
 b=owEBbQKS/ZANAwAKAechimjUEsK1AcsmYgBoRuM07Mg0o4IBy816X2qh2A9uDfk5ipzShogqS
 x3ZxoozAbuJAjMEAAEKAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCaEbjNAAKCRDnIYpo1BLC
 tQbnD/9S8F4ANI3d+x+/W+0E5QFO2PJLsKHHW5GX+81D3Yf8WcrZ7cITBQCgDLAIOPGakjUgR+2
 6zWD/wLaw9y+SFjnufPc6LhxLjZ0sxWNfrZtQQjz5U4OcN77fhZ+i2kz6R3VYo3jTzUqCv9LvpM
 cAW0Rt8u4VsbIFi6AfUmDKsWTMO38ZsjCMNL9xe9LRy48jkIeZAPMdjwaL3jxOXDshXtVoqrsU6
 w17M2XMmjyLjZyKQNQfT1iGnlgtypiLkmc1GngBDiU5+kjQqVYn9kQCa6AqN4iOYqptKaXVKNj8
 7qyUzqbmDOAdIP2PmOFx9U1MVQxsxhxocfT9LzGGr6totlyweOkd/4ARw/K+/Tkz3vnVG1twFsK
 dM/CCJC6HG3wjaPM1tpTPWe2OaI0uzShSOOyrK7Bpw1+Cv9Adm4m01HVsf7IKU9yakZ48qoWeFU
 tu+QHwAU5m9mRRpXvR+fVg4XWAMlEF8keHkMcsaVrhuTY2jD6LOxwaCUegI/DQN8hb26Z3oBpUN
 Wz4GKXBLirAnvO4scDeOPBxSyNlUSkJ/IWpNHS5x3blrSfSiaTlIiJ3H5fnu3Uf0iK/4C3u4L40
 TvyOuT0OjklRukO4xY8McUFoIBz4uc/+BbzT+ezehvmYxO289zv739hlAOHlETbBlt1tC46XZph
 EwtuGxikw9MV7zg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
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

Documentation/devicetree/bindings/graph.txt content has move directly to
the dt-schema repo.

Point to the YAML of the official repo instead of the old file.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/gpu/drm/drm_of.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index d0183dea770308e77f05da364ffe087d53f3be36..4f65ce729a473ec372bd76a60ac11a40ffb5df97 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -55,7 +55,8 @@ EXPORT_SYMBOL(drm_of_crtc_port_mask);
  * and generate the DRM mask of CRTCs which may be attached to this
  * encoder.
  *
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
+ * for the bindings.
  */
 uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 				    struct device_node *port)
@@ -106,7 +107,9 @@ EXPORT_SYMBOL_GPL(drm_of_component_match_add);
  * Parse the platform device OF node and bind all the components associated
  * with the master. Interface ports are added before the encoders in order to
  * satisfy their .bind requirements
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ *
+ * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
+ * for the bindings.
  *
  * Returns zero if successful, or one of the standard error codes if it fails.
  */

---
base-commit: 6f392f37165008cfb3f89d723aa019e372ee79b9
change-id: 20250609-drm-misc-next-2f4dd8f88bb9

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

