Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E20758088F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4B910F97D;
	Mon, 25 Jul 2022 23:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EC310F81A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793305;
 bh=cn905GothKnvTDgA+xETEp59lnPBZD34/Dq7YO1en4c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SH8/PmKMRAujG76SrAfJEjC/A22qClo/Hv5jL4o1k6hNrgwupO2Rs8q+4qjRDex61
 OJ/FrtS3q9UAt43kYrqQBvWMT92rpuVyjAASBAOPquwh0l2mwT6z/fM/g4ADTLoad4
 bsXf9oYGEp6EK8M9ZE1tQXcoy2s6g+Sq1Tc77yHE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MHGCu-1oKVdP3y1Q-00DIS1; Tue, 26 Jul 2022 01:55:04 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 32/32] drm/via: Modify DRM core to be able to build
 OpenChrome DRM
Date: Mon, 25 Jul 2022 16:53:59 -0700
Message-Id: <20220725235359.20516-13-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235359.20516-1-kevinbrace@gmx.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aaCZN/W+0o3aY/Slwkd8gNNlsp8YYTVeUnCMhbAup2k/3bFqHAP
 pcVtZOOPWv7NnOtUuEwp3aPTKmntVqm63A049bRRzzM55Ks/EWQG2YJt11TRPAPj6t/eSqV
 /dB4HHyxHe9Np+J9CB7ZwfYIqAMmhJJkN7nfT6FixGU5ja8oRCIbjoqIa9OkeRLAX/2G4uK
 B9nd0ILtLrBrzf0GkzoGA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:O2W173xSvWs=:MEECTSf+WA8em4+r5KYIQm
 7opQECBAH8CyP5WtFyVS/9gBhiMOIWALn58NhwqXmiSsJCevNvQsp4LQInLJmWkCiUe9wD9Yh
 b/Bb3y2OWajZzucdE2QVc74R7QLhobRpaXJM5YlODvLU1434hi2/AKx5DYaAdTczes2KPcDyI
 63CXyBw3JIlAuzdIS0CmA6w2VeMC8NnmWHrrhg9+kDVTyrnLoEIVgpIQ7c3u72KBQWzsqeHQ9
 r0b5NpsSGfL4l6PjIVJ+CmoQ/R+KCs7XcAUpLyIVGOvtDKIp/Momm+Dm7JFcwFF6vJawLrrdx
 dzf5UZWj6gsWHMhHBYnUjiH8rHUX80FcU/n+xzHQM8oirRaio6C1NXpRQ7q2FBdoxrnnJRaUE
 vsIXIDwAOtlYn+ex1o7hnqIm3jzx7GXOZ2hL1zy677fN0+gnB0fdkLKWbx3ouL+CQheAFKkkT
 v+XdWD3PIOWbOMW4b8p9ac/V0wWn9kWNHGUQa1V5CzWNmjZUcLkMUJ+ipHyIys/pixjw9fS/O
 O3mHP5nEu6/NQYNnBxPqOTCbi+0lncpYNfRPe4hHbotVZ/qmLn75yS6PmmuYvbIR/x+XlV/sE
 SCjNxHUTXu/gs/3JiKxZEHHOmEi8zlIVZnXrM6YaVdgX6X2T6aeL4PSw99hrgiFqNNPOFjbsu
 n4/ugNiDIGNQGWjElguFwUCiW6OChmMc2DjpA9Pp7DZlFvT29wOmIOcc5GS8nY8bESjp3DY/8
 f3TcNPJ67SGpxdCT3rXpzHzoEfNMGPnDKZQwCKdevN55/NaCFGVg75oxdZqvku0SBN+yFZ62H
 kUCU3ec3L8ikRfmsMvxscCnqF4J/nrK6nhnQXNSEUx9tucQAGIBSMce9NpKzQWZke0HaCGIOL
 fWK+Q7g6jsunddmiWEaY+104serJDuSBMitQ1O7jTZu5DkOUi8IIOUKa/71LSD6FeZm/h2XUb
 U8KeB87hFpSS257UETnJtECp7/0PEgRlc05G+3+HAMruPMcHElP4HPeuXHlRWRWtsLyOd3KdC
 oc8aCrr6VutHeOdKMxv2m031C8ebhNicXMdBmceNA1aNFrDrGArTgJsrFX/4Q2mPu1DvOYuwI
 ycTQ2mOfDKpcUmwVOf3k9A+sFx39SWAsGvWwRu2FgB0rVG4EYsj5sNhHg==
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
 drivers/gpu/drm/Kconfig  | 2 ++
 drivers/gpu/drm/Makefile | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 30d5b91b717f..475d20c58da0 100644
=2D-- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -385,6 +385,8 @@ source "drivers/gpu/drm/solomon/Kconfig"

 source "drivers/gpu/drm/sprd/Kconfig"

+source "drivers/gpu/drm/via/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e6d0daca9bc2..72c6db91ee61 100644
=2D-- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -97,6 +97,7 @@ obj-$(CONFIG_DRM_VC4)  +=3D vc4/
 obj-$(CONFIG_DRM_SIS)   +=3D sis/
 obj-$(CONFIG_DRM_SAVAGE)+=3D savage/
 obj-$(CONFIG_DRM_VMWGFX)+=3D vmwgfx/
+obj-$(CONFIG_DRM_OPENCHROME) +=3Dvia/
 obj-$(CONFIG_DRM_VGEM)	+=3D vgem/
 obj-$(CONFIG_DRM_VKMS)	+=3D vkms/
 obj-$(CONFIG_DRM_NOUVEAU) +=3Dnouveau/
=2D-
2.35.1

