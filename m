Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECE9580888
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9667C10F816;
	Mon, 25 Jul 2022 23:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520E810F7EB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793293;
 bh=/Loeaihn0pHLUAba9gjuBBFjizyJB11O4VwhQk2mYGc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SW5MUyCDrwWbr5jW9tSOoP52RoXMQ5C6ZrgXl+if6UitzMzJENt+1i38NH9mpuYoP
 r0nKmdJfq1AK29+G/8cv1wPaP51q5MjYZP07MwWX2Ci5PEpbmSVoM3kjMnqfSV3IDk
 b/EuXH0KRRJ0qL5DlTHELCq2PzSw4CiYm+54Poeg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MOzSu-1nqtvM23xM-00PMDF; Tue, 26 Jul 2022 01:54:53 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 26/32] drm/via: Add via_drm.h
Date: Mon, 25 Jul 2022 16:53:53 -0700
Message-Id: <20220725235359.20516-7-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235359.20516-1-kevinbrace@gmx.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jdLwUQiNKk3A7ro6ynU5F341tjdRvi8ELCirEWtxVLknG/ScRQ7
 VNJM4mH9eh8yTNMBprSkFZD23rjWE9Xc/BQBsbt3zYVKU3fOnYr3LFLTE2K+V31Fmd6/6BS
 78mKZXZm/pqz29k1Sm/7X28j0wnxwuPlFpM+M2Ta0wlNeAD5pxok4IH+5HXK9UNlGrt0EU7
 MM/nJ2p0FZJgKmkE33dMw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R6lVSb1/Y8A=:5OVnY9b76koZAlvDTVSlv4
 icDP3mb03lgWD6N+WYwmSvX4rC0ZjWHD1qz0tcVpn51ZyFo/NcpPZUuXqxu6uAxl/SeZg7h1H
 zYYZWeE6GXCrJWy6LTzhfRhhKA7Ln3e9ICUq5xbZDDNgaPSdo9CTm5b9pTsMuucg2uCZ9dfBa
 T1L100uw3P7xZRqSUNt83ECc8qwfvuvRneIao0W6KUEq0Svz1fnEYyEYvEwsi1hjZmF7bVWaf
 mwwBKsNFGV0CSh7h4APkIO213n5G5QDqcyzUooJqD55rZeC4E47SMqDAxoeKQyIF4PwA1q3K9
 byyKVDdW3Mzqyq7WVTwoQpgejKGSDFlAizoiX8FGiacXOz3V32SyMIE2DwO+z/u4g5nAptqb1
 2rxfnG17yDp1gTRJBDU1oXhGnkMERx4o/VYgHLdEVbLhRDMWuaDdYHuLh68H5ghLNY0biGKuP
 VIxra6ei5ctA8Bv4K/2oLYUVF3Snmbiy8lw/Uv/whr7+2DvP8IWQ8D+CV4Tdur70+/ExnRmfw
 rkFucfmz9qwWxjALUkGhwohk0mzT4uEYyffwtH+PEHwZsd/PdzQQncL15mle/+BxVrp+C35Pe
 +4fjmMmHEY3AV0SQ5RIAxEIBaKvkjCO0FT4XifoSzvgYwq2zKOh2avawCou5DMh7TFnRAojDl
 vojYXCthW0x+FfXe1yQb5P51Qg2f57UUV6vcDGqO1cQj8yZulqXqkq8YbsYueBKN3047+vYSj
 4WOsyZmhYEhFY4dkWhEdXq6Gca88AGy3DwEWyd+Dz92WTJShqFj43wHw8dlBlPfqbErbLXk4R
 kkCTq3dKHAU3joUTAm1jXAgj3r2F2wKUPsWPQY78VQQW1qlWD5in2Q52EhrjEc+3ZIqDl7gsN
 KFacB+WDVMbSeP6ADCh/iqhhl+nEKZXldFr0sdWzc/xY1ALWL3Bp61KW2GvwBFR9XZ6TkaUSx
 WBHW2MZYAW5+4xm5FYbDIVOe7uzA0PUEhp54mTkj9Zw+Hy/M5tFzHTE/jRmFWjuZSqRxVWdb6
 PcTj64JZuLgxhbVpfZLR8CcbepnG0o0T2i7McpqYXVZ7OCaVdCz72t4QxWj3Xq3rSApCwTwrM
 hYft/TDZaJj4SmsafhXQy9v5nF58pw9FpEJP25wEGKNs92iBTYObfkXAA==
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

Changed the uAPI.

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 include/uapi/drm/via_drm.h | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/via_drm.h b/include/uapi/drm/via_drm.h
index a1e125d42208..e9da45ce130a 100644
=2D-- a/include/uapi/drm/via_drm.h
+++ b/include/uapi/drm/via_drm.h
@@ -1,4 +1,5 @@
 /*
+ * Copyright =C2=A9 2020 Kevin Brace
  * Copyright 1998-2003 VIA Technologies, Inc. All Rights Reserved.
  * Copyright 2001-2003 S3 Graphics, Inc. All Rights Reserved.
  *
@@ -16,10 +17,10 @@
  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
  * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHA=
LL
- * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGE=
S OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
- * DEALINGS IN THE SOFTWARE.
+ * THE AUTHORS, COPYRIGHT HOLDERS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY
+ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, T=
ORT
+ * OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE =
OR
+ * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 #ifndef _VIA_DRM_H_
 #define _VIA_DRM_H_
@@ -81,6 +82,11 @@ extern "C" {
 #define DRM_VIA_DMA_BLIT        0x0e
 #define DRM_VIA_BLIT_SYNC       0x0f

+#define	DRM_VIA_GEM_CREATE	0x10
+#define	DRM_VIA_GEM_MAP		0x11
+#define	DRM_VIA_GEM_UNMAP	0x12
+
+
 #define DRM_IOCTL_VIA_ALLOCMEM	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_ALLO=
CMEM, drm_via_mem_t)
 #define DRM_IOCTL_VIA_FREEMEM	  DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_FREEM=
EM, drm_via_mem_t)
 #define DRM_IOCTL_VIA_AGP_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_AGP_=
INIT, drm_via_agp_t)
@@ -97,6 +103,10 @@ extern "C" {
 #define DRM_IOCTL_VIA_DMA_BLIT    DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_DMA_=
BLIT, drm_via_dmablit_t)
 #define DRM_IOCTL_VIA_BLIT_SYNC   DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_BLIT=
_SYNC, drm_via_blitsync_t)

+#define	DRM_IOCTL_VIA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_GEM_=
CREATE, struct drm_via_gem_create)
+#define	DRM_IOCTL_VIA_GEM_MAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_GEM_MA=
P, struct drm_via_gem_map)
+#define	DRM_IOCTL_VIA_GEM_UNMAP		DRM_IOR(DRM_COMMAND_BASE + DRM_VIA_GEM_U=
NMAP, struct drm_via_gem_unmap)
+
 /* Indices into buf.Setup where various bits of state are mirrored per
  * context and per buffer.  These can be fired at the card as a unit,
  * or in a piecewise fashion as required.
@@ -275,6 +285,23 @@ typedef struct drm_via_dmablit {
 	drm_via_blitsync_t sync;
 } drm_via_dmablit_t;

+struct drm_via_gem_create {
+	uint64_t size;
+	uint32_t alignment;
+	uint32_t domain;
+	uint32_t handle;
+	uint64_t offset;
+};
+
+struct drm_via_gem_map {
+	uint32_t handle;
+	uint64_t map_offset;
+};
+
+struct drm_via_gem_unmap {
+	uint32_t handle;
+};
+
 #if defined(__cplusplus)
 }
 #endif
=2D-
2.35.1

