Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8922655A2C2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD2C10F4B1;
	Fri, 24 Jun 2022 20:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534AE10F4A3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102828;
 bh=V2xe2KtFpB6jOdX2vJyRfR+KJA1UbLKtVcy/P8XKi4U=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PPd6cp2nkershK4Vb+2OJ7w6Qj4HHTyX37qCyNQZxV8RQt+lhJook9docU83Y6sN9
 oN0FvvIOhyKqv+XmdSXgVTs+GLcPtlOIpDdb7BYsoRF5pdcLykJmgyszHr2xESOBGP
 +9KvzGTNY2miUGKLQoebmA8H4HW0AObuYXfRbHlM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.2]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1Mplc7-1nJxJv0JUj-00q91v; Fri, 24 Jun 2022 22:33:48 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 28/28] drm/via: Modify DRM main Makefile to be able to build
 OpenChrome DRM
Date: Fri, 24 Jun 2022 15:32:59 -0500
Message-Id: <20220624203259.4051-9-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624203259.4051-1-kevinbrace@gmx.com>
References: <20220624203259.4051-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sWZlAN4rbZpoWIqVY8WaftFPmqwfgiIrOJnJyp/kWiA/hM8U/56
 bJHBKX7TmrElvNSPat+jJptlkE0bQSv7yQQqY7GN5NWqPqZRdeEtZZxo9PsK+EH0upo/qny
 bT1Lpkh7RxkZq+lxfAfm0seiAAQrlAh3Q+BiFen2YH5mJsrrAkG+VHM0dL/wOqBbRnXCK/I
 Z9hGt3bBCF56rD66DKznw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4aHivdHx9lk=:WdJE44LSLOOOi/mQwmJjqC
 8YPsbo1xT/c88WWjYVf2PQvzBA4EBJT9V0BrDk4m37GrroFtfSu4NoFO/ahQepiNBxKe1fb8w
 oL51ekr2wF3y+EdwSoel/UqBdOUjvI6HPoSqpsuP88TApfAE4lj5KqnvaeVuHmDHc9Ew/FkuC
 EfNNNuKoTlOV7bLutFNfr3EhSG26fIeSwPa9AgCwUn+mZ9uCdbWj5vtuTEU9qsv778AhBSgTW
 UUcrUmrX5HEtYsKsmnL06hBZSTfLcYj/ydVuvRl3z7Dq1zKq3JVeCQGgY1trKYLoJd1NisxDL
 zCKDu0qOUTY0kgWR5LKyFFFy7EafCPP/C6B3RAgrFrpVEO1Y0NYYNhlNnD/e7Zc6UfhAixrJA
 +jlB0MjGk7uc+TpNy4yIZ9F2yhPVe3nBeJR1OZ8yXmBkU1sDAyuSROy8I5IjgLGZmd3gdy2hB
 PHZYgZ6ADVo8wnojologz/z4edQCiA/OIFOG+DrsZHUZpDTjrde7GZ7BjEM0K/03BXJEpz0qI
 4FcxnXniUUAi12/6jbH2Xa8cW931NUdccx/zyyG+0gC/F58bLnjRmg7uEsMHH8svLojI9966/
 LgxaOGOA8H/x1zb4+/xUzUSMJfT3yyRqhePadlF7FtUOFUUy+jzsq1pxsJouSKrIgaXjOVsbT
 IsgqlsQ6FhElG1tpjU76oAJTUN+K/i7pvpkGoFZ1mYzf+o4os2vxpFDnwiHKQHOasenfR1cDR
 vGajyUZj8Z4zsZhTSHny+1cbbFgJkaylGomlcspwjxNS9yKbO8hzr6/9BrDnJQ7+dpYy68fuK
 umJHlV10s2CJ4gEl6KrHbyAe5kFBS9HziFLIaPkIYoWApkIikNC1Ttrr6uNt00PjmMna9iKH6
 ow+MlulCcrtUiRANO/Hzoe7LabwzF6n3NRE+EzbPOwFnw3zV4oJeNsoSy1drf36GpxdAs2akH
 PvCK+dYMQouzFYFllVNw4FKl2vt7+qzjkOUfrOBEZHX5zbE0HyKXvjaFosdd6eHXijREhm7YB
 BGFQvHEv0en2MQ+cmyX5DKPkpQiGcBvvMoJuQkIovB+ztCa7sqXFmY6DKwmx1Mn/qe2plZS6d
 T4ADHCRo2YCNTg9BikXRIaeqj+truEllpnbVpTVVKHB6rQCpnVa9zIvPA==
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
 drivers/gpu/drm/Makefile | 1 +
 1 file changed, 1 insertion(+)

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

