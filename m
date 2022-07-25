Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C6958088D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A869510F851;
	Mon, 25 Jul 2022 23:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D6710F7A8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793295;
 bh=dr4bCyXZ+36PZ+la7orHXZ1y8r374w+cQsUNEpPZ6oo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ai1L1+rPix9iyzEwJHTo0RnGMWbLvGvcESU8vo0TXjFnbTGJl/OP/ksOjwigF+Y1t
 2voSI38u6PUo7KsJ9rNbvW/9ANJCx3YMkm0xsfK0DvhJn0z0QeNYSWvJhQm67/bThx
 O1Mo6Aa6rcdIXftCqurc2QvheJHNE8+9Y52tNlLs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1N6KUT-1nRR0p1LmD-016cvQ; Tue, 26 Jul 2022 01:54:55 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 27/32] drm/via: Add new VIA Technologies Chrome supporting
 PCI IDs to DRM
Date: Mon, 25 Jul 2022 16:53:54 -0700
Message-Id: <20220725235359.20516-8-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235359.20516-1-kevinbrace@gmx.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JidaK6Y19TJ6mHBReN4qra08TJyOQEHTtyUZ/m7Hsh9J2UjgQ0z
 H6AkwJV186+OGqQ0Er7/OoeltRMN8GYpCBjiBQIQjOBSAPrnTbAJXmd14CyheFqAde/tD+D
 fWJtZqd0PaADowSIF28y6x7GoL18Vb56QPKmfAdDt9v0adIEMEN2dxCaasL2g9CwEKKCK1H
 iX6GCCqaa0xAf1LImXVTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vCoAffuNqdI=:NUSyrNsjAq3SAPHrBSo2FZ
 FO4EkxBLZbe7swV1YVswnil41xWbgyC5eX7D/N9euyy9PX2kbathJxPCokXfIh9mQNAjPWPND
 K0Lyfbrb0BZPA4xPjP9IhqkpXizF78l+jgWBze3yKpIXbdEkx5Xdef+b5IlXrT7t6/s0647lF
 /hJb185MhwTSl6gAVOVUnmmdqKyjtqbfvH87OsCoZZ6MZol+dSfL0w+lnc9EJwL+rH9aKzdq+
 2PXvfJyImEIrZQrb2CM9pOQjSgoiPKz4M/fMSOvKKdYTgb8os8UDt3WEhuSzkFoo7Hf1ifJgo
 XzbLhBGu7mFKwxbnJORSLldKSoVWg2qQTmxlopMEui87AikKRmKHI5+x/AdcQFtdyqXs/ZsnT
 Yuz7pnbkfYRW6yg7skUKEAr/dCoeaXsHH5IGFBdxqSd165oQlCQ23Y6rkeF7z+88VRRK+nG3k
 KUZBh773HQCzdP1lFWvUnVJBcl8qH085g1/4D+jh+QyqBjc4VPuLFwefawA0BsZa1sGUlpFoz
 Ydvc71W14ikucHu78lQIDO24Th5d8oW88V01S273w0I6fEoSFZUzBIYUAruDyW2MA2uySB3ix
 RZdo6x8QXl5N4daiGSEDETz/28LX5czCbnEPWHgYZKP4HXohHjC1NwChDZOYnDDAaqannj8qp
 I+9qLB2h34Xv7HzLfyLLCvD4saVinl3sXchIExe58UIvxkxSNzEHmCoWHJ0BnkpmtwgfnU195
 ewpZcxgIVMwIRToB2B/WPP8dsnF0pbD5V0mCh7m8ZCPQcnn9JURDjRJoDJVGxfUAKmBM30FxY
 XmXNqvZ7l8zjcI2qG4wbpqrKDT/3aRKAdZcDUI77ncuaXiL74ewRkuDW7vbmcDS40LFczoiCS
 yY0fH7lwJiTiwasFGLcwuk2dK/hK0KWut9cVGEd6SODB+jzVjjHIYjFTI/r+xJwP7N/ARrM7F
 9LLrV3ufg8Lk/y2vTW7aw2S7tGCY3foFKGoxhR+svJcBN/NBLp7cJ8OqRaL8dzoK33HQHm4ew
 OPCqYa+W96bChAusC+VudnxaE65zTq8I0SAYIWVzSNIN7gQLOXGJSwLdDqCRXZkkxByM8VzOB
 xtvQTiBJyCE2yhDXE3ZTyg8Jfw7dsXrqITDBa9exV4OEnJK/BzeWAdKjQ==
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
 include/drm/drm_pciids.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_pciids.h b/include/drm/drm_pciids.h
index b7e899ce44f0..e91b93d635fa 100644
=2D-- a/include/drm/drm_pciids.h
+++ b/include/drm/drm_pciids.h
@@ -777,7 +777,11 @@
 	{0x1106, 0x3344, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
 	{0x1106, 0x3343, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0}, \
 	{0x1106, 0x3230, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
+	{0x1106, 0x3371, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
 	{0x1106, 0x3157, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_PRO_GROUP_A}, \
+	{0x1106, 0x1122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
+	{0x1106, 0x5122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
+	{0x1106, 0x7122, PCI_ANY_ID, PCI_ANY_ID, 0, 0, VIA_DX9_0}, \
 	{0, 0, 0}

 #define i810_PCI_IDS \
=2D-
2.35.1

