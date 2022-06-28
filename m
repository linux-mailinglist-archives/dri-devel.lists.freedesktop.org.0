Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500055F0BB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E6B112E18;
	Tue, 28 Jun 2022 21:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C1D112DF7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453379;
 bh=cn905GothKnvTDgA+xETEp59lnPBZD34/Dq7YO1en4c=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WJSjrqsbu6xDDueP0kh00XppazjM8KidSMZQqJf2bpZczpoyXOdgk6pLSd8vl9Wra
 rwtXWuiH6H+iShKXPqVr6ZCxKqoks3FvqV3FFHTQHkAeQPwPYOe3wfGdEG58jjLOr9
 7y1pB7SuJb026cJCAHF9f5bT1i4OjcUz8AfmYCMk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.2]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M1Hdw-1o3YIy20Co-002rvK; Tue, 28
 Jun 2022 23:56:19 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 32/32] drm/via: Modify DRM core to be able to build
 OpenChrome DRM
Date: Tue, 28 Jun 2022 16:55:20 -0500
Message-Id: <20220628215520.20674-13-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215520.20674-1-kevinbrace@gmx.com>
References: <20220628215520.20674-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:33AQ2f7VjmnrGKVDeX7N1DYM4rBe4lYa4uhxkG7B/IINMVMv2cS
 GiH93EFwAs/tewn29+0c9k2Pmwwhe8x95HedRBjsMnLB/tzy5SOf0Myyc9BEPp9ujEO5kAm
 /ULyyrIwiBPztW+zlm+a5BjBFbD3a9OZjORsSPN/V5cRQEAB2JnDM5v3KiGBdXnNS9NG9c9
 f2PRbcT2hRrSOEkUFx9hA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6nixFMH2e9I=:KLEKItefNjn5oWM8hmLqLv
 v7jTjhhpCRqaXGllOPXSbIJytAv1kNhaQl8tIGJhCEcdh/ljYsjUnYANPqryfZc4UCbkWTeZB
 J7XZVAgPPiI7wn0qBLU4ofu2OFT5wF+yaaFd/CmM+bumIINd0tMX5IuBE8bRWBsWqO3rTZm0c
 +/zUQ0w/QB6zvaVFBoR8AvYyia2T8bENBysvx3bkgv5O/fia2isyzTWVw+0J90tqunAGdbzse
 gqhUOOULJ5CENz9Z94wtYei6a/tC8frXlEC0C+OP6SmeT8j4JSKEqJkqcRuP7u2NoFf6Pk568
 AbgB5JnFlvChCtsR/BgcTRvpAnbetAKHt87OqoyMc23m+HyLcbWE1qBKfCA5Adl5cgQauTltg
 1g+7OQTfJ94g/FvJY29oc1EhxMi/VrTNJO2YBz/QW8emkQqOPv7wP9V8OPk6DJZfhpNyHfxD5
 KjPWYK9rb6ic76+Mbj+DTkW1p1/0nD/2+m0dv1gPPF0L1jM8lNYnZTOciklZvRuph+RsfhN/n
 QN0MBafuigoTex5rin259aKwQX+P8+w+TAfIbRqPP9usFC+wyTkZGE4i47bn9TGXDqXdJsJiv
 b1pW7QQ0RPwDMlDetZYT3wiPailf61nNam6HYHJLgUplmSggeFZDUWXVdwIVQt+DP+cvJ2oPX
 6FAGl5n16Mu9SPuPQ5Gul/SeEsVHfZz3v8ORBgGvgblT6bWBdGVxRCTgu6yCO2FptE+OMndnH
 ljoU5ktNoiIPxA4tqpMTxcqcVOsLkP74gc69zPvmZlxizk6KpssByCxpxk7Vf2wpRJoVKNKNz
 eo9So/CGdvwhSwASPboIEnkJPrtXLkKs/F7HEs1W1N+VJyN/PbVipIiFS94xsL09YOHBY3EON
 WItRxl0Ow7vWAojK2mgXuCUQnQr4YZntGujmvlOzRA63jgD32cxe/n0QsNWkGdyJZX3OKaiF1
 MHiXbfLaudFfM2qCgfLZTvFB0Vsf0i61VR1NVWEDtudw64oWw67knfqPDLeZ59CmyMolpSIeg
 ARNTJKgA/vC9n60lNXcrc6qubQltGWBVfySp7qvXa1ahf9D4qVYuWglD1ihelS/IdQg/4+FFB
 C/3kzm52HdB/5oW9rePgMpl77Ls98KX7q4tcyTiTIIUDmjQoDSopGhNug==
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

