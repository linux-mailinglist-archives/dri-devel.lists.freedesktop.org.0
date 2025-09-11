Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70872B529E2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 09:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9410010E308;
	Thu, 11 Sep 2025 07:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="ZPrD0PjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D97A10EA10
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 03:14:33 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1757560136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/QnOR/jymtXa2WVfw0v4uM8w8LZkCHUggWlTkJYd2NE=;
 b=ZPrD0PjVbKGJ/to/Qz+4tzEfji7w5o3tMgDxikSC+bK8z+nCIqYs7rA67VWLgsqeQEXy8w
 IVNguIoN0n5nzL1d7qMqoUZCIxDNB2t/ZbqAqDUA6sXGKVyYdBZaxk7vqCQSUYd1WCoREa
 Hk80ln0a1zhBFKS9Ii0BroPLgr/yIkUccbLCTdAW/N2Io/yXhYiqU8XrORE8bICeevUlge
 3qjejeA6kwZGYfo9nMHMuhGHxwQiE8DNk4D6EjLkrl7F+mxcTqYz03BPY+qtzxCAAqC5wj
 tr2xAXNZpwfoG2yeKOnRJ3ujq556+xADatiVI8NN5+kjPxzEM7hlAz252i/PYg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 10 Sep 2025 20:08:22 -0700
Subject: [PATCH 3/3] Update MAINTAINERS for lg,sw49410
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-judyln-panel-v1-3-825c74403bbb@postmarketos.org>
References: <20250910-judyln-panel-v1-0-825c74403bbb@postmarketos.org>
In-Reply-To: <20250910-judyln-panel-v1-0-825c74403bbb@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757560120; l=884;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=Wyv04p1vPaFXnDGn+MYaWjpbxivqD5UIWCuLT6Ht2Mo=;
 b=klXhdqEUlHPeele/QPtYTvphyr0G9h6MzY/wM4eg+Oy/XrwzeMmiTVCZx/tHiDA4+i1ClQRpE
 0n5QAc5+aNxAISnW3ic3650yUkLdy+EXJYBve2w5U5+cf2Li0yFhq9V
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Thu, 11 Sep 2025 07:28:36 +0000
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

Add myself (Paul Sajna) as maintainer for lg,sw49410

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b84f8a78b811e0c9c5a3edc09edc22..26a3ce38d4d6a355f7357a9f6bd07f741301a115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7584,6 +7584,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
 F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
 
+DRM DRIVER FOR LG SW49410 PANELS
+M:	Paul Sajna <sajattack@postmarketos.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw49410.yaml
+F:	drivers/gpu/drm/panel/panel-lg-sw49410.c
+
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
 M:	Paul Kocialkowski <paulk@sys-base.io>
 S:	Supported

-- 
2.51.0

