Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44DAA1A546
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 14:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434F810E1A6;
	Thu, 23 Jan 2025 13:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DPyZUUbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E144510E1A6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 13:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737640488;
 bh=mpmROAOILsfpCKAiu41+m0laBpPufv8DP6gWUAS4uW8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DPyZUUbcYzAWqdb8utJjhFpwcaVRw1nwW1idgsmmpH3A+HX4gsUCit+v2MuF0VNKd
 +S/VtL6K3PhqXCluWm9S4njwJyIO3cpRCmqHf4buWAEvuikD/xLub14RvOl9Sb4896
 i39RmqYksu98oNVGzrgSiIvEYJdZImpJ7BWu+6dSEgnWQ+Wumknl240ifEK3L8lft+
 FZER81gHfu10RmXi7VFEnLs13nIqsdmWENLp8iJkcObYwNdjhP1ShvF+CK3lwbIBCk
 ByNKwZ9LbGOrt+OBiV/cSpT8HFfWiC9ONWDoNh0fIJ0fixoXTtjpESc0PFU0eDC2QO
 lLwaVPIQOlReQ==
Received: from localhost.localdomain (unknown [171.76.86.251])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CAFA017E0FAC;
 Thu, 23 Jan 2025 14:54:31 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: kernelci@lists.linux.dev
Cc: linuxtv-ci@linuxtv.org, dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, spbnick@gmail.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 kernel@collabora.com, torvalds@linuxfoundation.org,
 gregkh@linuxfoundation.org, daniels@collabora.com,
 helen.koike@collabora.com, shreeya.patel@collabora.com,
 denys.f@collabora.com, nicolas.dufresne@collabora.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 simona@ffwll.ch, airlied@gmail.com, Tim.Bird@sony.com,
 laurent.pinchart@ideasonboard.com, broonie@kernel.org, leobras.c@gmail.com,
 groeck@google.com, rdunlap@infradead.org, geert@linux-m68k.org,
 michel.daenzer@mailbox.org, sakari.ailus@iki.fi, jarkko@kernel.org
Subject: [PATCH v2 2/5] MAINTAINERS: Add an entry for ci automated testing
Date: Thu, 23 Jan 2025 19:23:32 +0530
Message-ID: <20250123135342.1468787-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250123135342.1468787-1-vignesh.raman@collabora.com>
References: <20250123135342.1468787-1-vignesh.raman@collabora.com>
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

Add ci automated testing entry to MAINTAINERS to
clarify the maintainers.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 33fe500bf3ae..874044e570f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5473,6 +5473,15 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
 F:	drivers/media/cec/i2c/ch7322.c
 
+CI AUTOMATED TESTING
+M:	Helen Koike <helen.koike@collabora.com>
+M:	Vignesh Raman <vignesh.raman@collabora.com>
+L:	kernelci@lists.linux.dev
+S:	Maintained
+T:	git https://github.com/kernelci/linux.git
+F:	Documentation/ci/
+F:	tools/ci/gitlab-ci/
+
 CIRRUS LOGIC AUDIO CODEC DRIVERS
 M:	David Rhodes <david.rhodes@cirrus.com>
 M:	Richard Fitzgerald <rf@opensource.cirrus.com>
-- 
2.43.0

