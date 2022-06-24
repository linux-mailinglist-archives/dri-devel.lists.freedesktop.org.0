Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94255A2BD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F6610F4A6;
	Fri, 24 Jun 2022 20:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9AC10F4AD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102821;
 bh=t5SQxQ16qFHhpQ7Rv0c1lb9LCk+IBiVpe1ZG6TOMB2U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dvDo7pntaZZp6zTicNnexS7P+nSwKCfkJDdaV5yDVRvHu/44t+TyqTdJDRK3+zG7D
 VQTzftfIZXACPTrRKOPki1pHU2Hb77v87DrOhp2u4+DPTgmrDdb3nlx9REAk4kJgMg
 yVs3iJdRi83QORVY3IUsyQXhobGDDvGkY+T7++PQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.2]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MYvY2-1o9K7Q0bFw-00UugQ; Fri, 24 Jun 2022 22:33:41 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 26/28] drm/via: Add Kconfig
Date: Fri, 24 Jun 2022 15:32:57 -0500
Message-Id: <20220624203259.4051-7-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624203259.4051-1-kevinbrace@gmx.com>
References: <20220624203259.4051-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AhfBaY+dXKkPxZqjNnARGiRI8FWyb4kol2nRIzvHLivDaZq7AuY
 aWv+pKBLnBge1bNOyMVPt5aXUPqBSmBwKqs3t+JsVneXXMYszeBw2TD8eZwwFm8jnzVCDMG
 kj96XXub0OiW6MP8aJRb+3BDl2Ux4M/fJPrIsz00wRN2WlrEKR1ZMPh3oEKbmBb6nXcK0Py
 4xqYoIh/VRiSzp871I5RA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RpgfbUFz3yg=:u0Z8MeUYe22lLO7MORzjeh
 IMVoAOV4OKQD7XMmCEwA2qF7F+qw5uBnCitwe3pkVcX0xh826Y1XLJTySKpjI8ByftSmeyzY8
 y/1msTd2NSS+JZYZ3Z4TLOsIyj0Ul25r5h6QgPRvN9+HCexpFWz120v/OXNezejuKiz5OiQoW
 IezYVVuIlhIs2THEhoDR47ifZUg54UFDd0nGYFRCkuJUXoLH7hFtbffi3GEban01E79OW+pSc
 9/2qx0fv8XzxgJ91IRjipmWtr1ifaZjlhx8LB/zkMD2GMD/ryZpUJdssCp3PO14y5NIm3Fr5Q
 OhuohYHV63pGQt31UIVCbsF7PJ5390a/w96bIP6+4A0rlb9bjJ1UTppotTw9tX/xAC5KPP09i
 yrKbUc9GfH2Gb5rGHQNggpPPJaxpgmXq4a3FuQl5dC9RR595Ak3JfTBeJNWeL9U1rOkDlKkvE
 9sp4Ina3rhswzXN8K9xjGpXE4UzqobVmPTNyIfKmFFGLY5DMx1Oe7U+UHPsiWLD9I3FNjzENC
 VYbQ3FyMiUdLcqYHvpPk+Lwy6E2EK5Q0OgZQAhwSpEiHZlVnTpnsHD1lCwtJ2o4QpYvkl425c
 pFV1tfcBxO8LExOutjfOsVJvvz0X1W0FiLaMNLsS099EPL9fftbqjgOQZcIjrWvyNO1/zUtDH
 uOxn/x+y1Es5jwerDeZJ2A4Wj40gWazpmdFGbziLmwKr8XQadgaG32St6ffAmV1tx4RApKr3I
 3QMt9PRJrL5G6XikKwwTBFJUE76Z8lkjZS1MRwUdYS3UxGuwgFiDpJTqOVUiHi+i1KHzXTrMg
 RWmFjGzH+fow1o3Sy7g6FuXgQ5Sq4UEQ/qlPKEmz64rp5ebgz7J1ij0pSdr+sgQDWvV3ecoGL
 RZKFj1zJ5J1z7uf2P9lH/0tOCV7/HCBxW8xmTvJb5XHaz6jl6kuE2MsDnhHHXnvHaxPQhUgMr
 1Yp32iGbi/QCDAIW+Uh1iQxsy0FvBja/z+5r1rqEy7hrMx42Azi49zkDMDjMwOQz7pF3jLwwp
 EY/I1eccuV5vcGyu3xRlfleQh3ooN4Q7EMYMnKZcRdPzmJ4guOqZ3vnbCKCrwmiRSJfHBerIZ
 K4z0akilzok/gBLybpJLfHcWQcm3k9WBf6frnx+XujKh5Rwx4OoUsXL7w==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 drivers/gpu/drm/via/Kconfig

diff --git a/drivers/gpu/drm/via/Kconfig b/drivers/gpu/drm/via/Kconfig
new file mode 100644
index 000000000000..760bf5906d3c
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/Kconfig
@@ -0,0 +1,10 @@
+config DRM_OPENCHROME
+	tristate "OpenChrome (VIA Technologies)"
+	depends on DRM && PCI && X86
+	select DRM_KMS_HELPER
+	select DRM_TTM
+	help
+	  Choose this option if you have VIA Technologies UniChrome or
+	  Chrome9 integrated graphics. If M is selected the module will
+	  be called via.
+
=2D-
2.35.1

