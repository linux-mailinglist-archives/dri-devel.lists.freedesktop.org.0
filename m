Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D53BB3E6A
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 14:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8789810E7D5;
	Thu,  2 Oct 2025 12:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FS/N1JO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB7610E7D5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 12:35:07 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-414f48bd5a7so733886f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759408506; x=1760013306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wiohunQzlxy1wJLX8ESOSQebIPrb5Yx3wUhdRqNbUmo=;
 b=FS/N1JO16i+H5rpewHC1UqyKG/Y0g8a11/bKV32dy9Gl91x1AQTDS6ZmPTHnEuUgn4
 kKEDay6dKorQar8+Ci9wxdE0njHQOmAOCrAl2aAykQsFyXU9F+XqnhsFfZGg2ZgL1tmH
 uwdUEiZR68R+t/zb3p2ed5iX0SJdI88EgshyVcJCohBYJFHalKr8I9TiXgm+3OxWNCK8
 jH/9EOq66q/NEQNhWnQVNVwhF5G+P5eBHq9+4pMUlhsURT69WFLYyyrd5aSNvf1Rq4Oc
 JAlhfhUyizbOMyKFFuTbwMZz/mhAGu+oBs8WhRtl0WfsNiNzqp581D/wb96AtA+7FUB8
 pMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759408506; x=1760013306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wiohunQzlxy1wJLX8ESOSQebIPrb5Yx3wUhdRqNbUmo=;
 b=NvbqNspu0DI2R6nZep1X4qDs1xQP9xkQGnYAfnT2a0s6Jvk6DIBBD+FwPlC642dt/d
 Xl7Ux1WNNQXnyFGraoDK0/seA4Z1O2zfWp2Zk8sWX6/AigR8hy4WpJLDnVqmtgQ9nuuI
 tc5VwWv996c1NknlQ2I4k7VHPvZZ8Qrrdam5uElCVnT/KN6chS4mX8vQ5Iz9uRf/j1PF
 0flREDKIMff4WncyGerePhu06ig1krMI4EECvha1WGiOyFssemBjA7rijGgt6mjBR1pn
 vVGgXRcEoa0aQ/sMCxFR8CqASgvEeKX/j1Fj3A0qSQll8JeJIZJK7TY+H/aAc6kySHJN
 RY2g==
X-Gm-Message-State: AOJu0YzmeYAo9REFPZjDuhGvdE5DU2mhheixIbU1/Lp8bbAxUg988Z5f
 WzoVVWSIjL8Qf3+hg85Kin5DDwcfI2VRUUPZDwpzpvtusqjih/JsXpCY
X-Gm-Gg: ASbGncsnCzVdXX9JdrH/ZichyYp2lZWHmC13/qdhttnohV9+9leeQjHfvqao/3fF7wr
 +n+lNVtEmJHuY9Xdh8dZJjKSRMhTX1//LI8K0aoINl4yt1yFx6ujikqAp+B4S1vMuLjEWFOKSge
 BTd5og/5R5Ani//z8AgEm0nbV0yGCh2SbANebclEbKaWtZgJMmECwKQfnM9pAvmdQ+Tu+h4KYqF
 yaGzB7DpJ8tmS6aY9hfDkVKF2ExZ0ZcUHwYXectScyQIXreosaANzgEZ3AGEJI4fQO/KZ97qgC+
 YgBHRFW+rwZ7BreCg2qmFpL6ym8q2/OqpzTBC0Qgss4z9Zp6XH4LNKVTjXseDVORoOmM+TrQhdM
 NCWmjRmetPLGkHFDW2j9GlSNxL1+d7yfaHiFhHItgBtUjh9oc+xH3wwCbGLfupk57kpQkYP0uW5
 lOo0CD
X-Google-Smtp-Source: AGHT+IFz8zQ0y7qc4oeft0IMTcDcHyKWcXph7kOA6fb9S5FIHDbOTttgY0hxxnzNKQ04CBzWjJsubQ==
X-Received: by 2002:a05:6000:25c4:b0:3e2:c41c:bfe3 with SMTP id
 ffacd0b85a97d-4255780b8f6mr5803400f8f.38.1759408505571; 
 Thu, 02 Oct 2025 05:35:05 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:607d:d8e6:591c:c858])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8abe9bsm3533304f8f.22.2025.10.02.05.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 05:35:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] drm: renesas: rz-du: Drop ARCH_RZG2L dependency
Date: Thu,  2 Oct 2025 13:34:52 +0100
Message-ID: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
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

The RZ/G2L DU driver is now also used on other Renesas SoCs such as
RZ/V2H(P) and RZ/V2N. Restricting it to ARCH_RZG2L prevents enabling it
on these newer platforms.

Replace the ARCH_RZG2L dependency with ARCH_RENESAS to allow the driver
to be built on all relevant Renesas SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 34d515eb798b..8bbcc66ca3f0 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config DRM_RZG2L_DU
 	tristate "DRM Support for RZ/G2L Display Unit"
-	depends on ARCH_RZG2L || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on DRM && OF
 	depends on VIDEO_RENESAS_VSP1
 	select DRM_CLIENT_SELECTION
-- 
2.51.0

