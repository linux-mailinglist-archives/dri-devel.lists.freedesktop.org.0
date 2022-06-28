Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D3055F0B9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398A7112E0B;
	Tue, 28 Jun 2022 21:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993C1112D8A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453373;
 bh=t5SQxQ16qFHhpQ7Rv0c1lb9LCk+IBiVpe1ZG6TOMB2U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ukq0Cl2Ko3B5pekvnopmaxvMgDdeZLzqlvUDEHr65VVbXsO3daS3/i3wtpXAupYkA
 1GQ4lhwfs2Q2ZgxFJBL/8iu2iE7WL6yiQ+mGyQRiGsoca5/7ngv+DgKxK6gTmJP49M
 ZMxpTWwPziU1B/zpCrX/xiaruZcwxy413CtM/rPM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.2]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MPog5-1oIbF928DT-00Msil; Tue, 28
 Jun 2022 23:56:13 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 30/32] drm/via: Add Kconfig
Date: Tue, 28 Jun 2022 16:55:18 -0500
Message-Id: <20220628215520.20674-11-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215520.20674-1-kevinbrace@gmx.com>
References: <20220628215520.20674-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N1sQcR46IILhQRD+DU3RGnPVguerhqW5KhuSWRGUmkkZ3jarnzk
 4NUc+vTVdqtpnacO7o6Uby139IQNrMT2zVY2waRoibmRW984xUmqeeasK8sf29jX0fYrnJf
 zLhC13XGSy7CpBnD0kaA8qNigPPOo4zUqF6wuqOYWs5wFLxVG4UMd858ipovqaK61wCAMFe
 Ba7TXdqCL5rIrRKxUXABg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:N9mH+N/x7ag=:EexirVZVjxXI3kcrhbIVgG
 wavv8lbvuQeBiOGbQ/b/RChMeTRS0BP/I/z21TbLO88hc1ImJwocAy6lOBQV+SvDKgpRsYoc7
 HsN4vQn0w7HKAo7STu05PI78gVRqXjeIufNLBDhtvBlzLcUDuPeHcGO+1Le5kpKx1NscQlPzd
 ttJTBTmzb3pgDr+4dAaTxm3y+p9FsKEWbxCEeI7UQcECFaEO/P4p1YuKKzOHPgcv6HVr/O5J6
 PyV/6gsBKQlgxghgxo6AG8ApU1r9u7WPC6Mzl/T4iyzsHNjEyFpZb7SGXTE0idXUeqnZau2gQ
 GP3rt0R8g+M8ZfxD0dF61txEYnyIxMtQfgz5NQV0vH5AlqooigOTQm4x53WM79hkQbc356+n1
 iFqjjNTAQg/BqRmLEN67iJ/YaTkLm6RNFtp2K4yNOnGUyndTYSA2BoDwiGr0wxwn3HCeav6ha
 qOZCPb9Q/dAKLwnZgei+AvHqbyXJFU18lLVBTDh750sm3wYg5lgFTAvqymy6V8+pxUMCEIVS9
 N0Odn9rM4WgiUyyICu53HpD8eR6h0WXpiMVStP4w1nJIGvWyjivDT2s4YOhljFDqOzXFXjOHl
 6LP/EpamvHJP5LoYkpoWa7lYgr+f7A98TV6OsuCp5qXLOWuVCRUp1+EIZPMvuiBMJiX7WjB56
 w0siMkgcXWNW3JE1fEvpmkSuOVFqdUf6sRMiFqM1z61lpfpfwJ4rdu3zw7/K6hphasRI5tIux
 boVklkWwEUgh8izdS2SnWdCQJGF1dDHF1TUyLoxf+RWLMqH8G0UHS08bj0FujM7ey/6EcuN5+
 1SHCMKUjS3ymPLOwjCcJKZ4cX00wIPMxqaL41FiAp5xMWrPs+1IYj8jGXnIaeyF045vWSfjQz
 rhpk6kY2UlXA9f3sV7+p0vAE2xSmlyLOw8y2z8qjvs5rfK5Bs7oiQN/nGqD2rozvwfDPizih5
 X+KCkpUBSHfSPSVU6Fz2fXSN4WzZLKlGBV8nadZ5Ei8Xq5qdAVajBNrrkvQ7Cjo2e8YxlRVkw
 0DV59BEoyKwpizYKMXEpyN69DOVmxihQ6DOrXO/lOXR2fD/LwsW6BaFpaLV1jXK8lETMctNw3
 14gY8SpwsOfS87Nhl+FqxMF5ay9YqRHOVfoLFHcATGQDx471VbNdggXNA==
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

