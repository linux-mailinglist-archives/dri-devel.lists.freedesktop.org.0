Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22839B8D7A5
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 10:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8777A10E33E;
	Sun, 21 Sep 2025 08:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="NesjRj/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583F510E33E
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 08:37:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758443829; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WurbZSMAucWJMG9KteVgGhWwjgsyMgg8B/RMRKCiOq4+ILUxejB4ENCxMgKzGGoRwVfoWdftOgYd0VI1RXqLbRMRUv3qJ6NbecpPzFCdusyihpMlysxPY58P5LP+1mPT9vsfGHF7XA29xkIijPeewvnLxVa0D5R7Krt4b7XQVWc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758443829;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BISvAyyTH0h3AbD1RfOd4M5Y4uTH6JugxkSpXzZ0EJk=; 
 b=Gz9qkt6gLx3oicvXY8PaoTrk1u3+OW5VKy0fwj00pDFDKDSp54BEGZV2Zn3gV0rGMcULDZPkHN79ul9PQ7e6CN7dvn1T+ARbcO7uyYYBtASR4IZ6QR/pF3EcuP34/kgKzJ3tkujcL2xnn+Cxjz20xwnwhs+JtAjmwHpnbrEVA6c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758443829; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=BISvAyyTH0h3AbD1RfOd4M5Y4uTH6JugxkSpXzZ0EJk=;
 b=NesjRj/gNsGIUHJsHrhk9FMhNcV6WFDxKodILy/mkysSawpiQoHD0BcvUZFirAqj
 W1bkUEvwT6guxuK9RsNZwzlnvJMjS+WUJLqdAHgDgAZ4OSpxlF+/FmRkplGqFbPiQAU
 F83Qw+GcnLFTIAPvSBFltLi2bbhRm+7uyHlfC3bRv9Ukv00C3Cg+JtIjtKwAWsU+aqu
 moJUPBSOdhvVUIIKddh114MtxmRWBVgJHNMpoC8POj2xMhdNg8Eeq72ykyxzmC/BXgZ
 fDZdruXoXrh8qI85XZyRWceMW7KXt5y9LUTcy+/AFOKUBdVWjZ4nXTDQsZX3/IWU6lN
 VJepNihaqw==
Received: by mx.zohomail.com with SMTPS id 1758443826199803.7477831973885;
 Sun, 21 Sep 2025 01:37:06 -0700 (PDT)
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
Subject: [PATCH v2 8/8] MAINTAINERS: assign myself as maintainer for
 verisilicon DC driver
Date: Sun, 21 Sep 2025 16:34:46 +0800
Message-ID: <20250921083446.790374-9-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921083446.790374-1-uwu@icenowy.me>
References: <20250921083446.790374-1-uwu@icenowy.me>
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

As I am the author of this rewritten driver, it makes sense for me to be
the maintainer.

Confirm this in MAINTAINERS file.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98af9dd3664f5..348caaaa929a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8393,6 +8393,13 @@ F:	Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
 F:	drivers/gpu/drm/vc4/
 F:	include/uapi/drm/vc4_drm.h
 
+DRM DRIVERS FOR VERISILICON DISPLAY CONTROLLER IP
+M:	Icenowy Zheng <uwu@icenowy.me>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+F:	drivers/gpu/drm/verisilicon/
+
 DRM DRIVERS FOR VIVANTE GPU IP
 M:	Lucas Stach <l.stach@pengutronix.de>
 R:	Russell King <linux+etnaviv@armlinux.org.uk>
-- 
2.51.0

