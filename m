Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7B455A2C0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F197789330;
	Fri, 24 Jun 2022 20:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2E010F495
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102818;
 bh=X9zeELfc2a9GMIkvgPLWEyn2DPu6Tl/gj62uj3TUtqg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NFm1q9OBNmIupDoutIOQ1fS6iD4hWBThQ6JMBAzIAuUwefxdNeerxXzuBfTpf+PHl
 Z0RqzoQJcXIRmY8mxTsPLZBqB+2X9YGGETifTbLeqeU0bp/h7jYUB9JYCiky1U7sWL
 CsgzYBrFoxpKU3EXWB46PNkQcJSX+C1x70A84+ic=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.2]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MpDNl-1nJP5j1HMl-00qhGD; Fri, 24 Jun 2022 22:33:38 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 25/28] drm/via: Add via_drm.h
Date: Fri, 24 Jun 2022 15:32:56 -0500
Message-Id: <20220624203259.4051-6-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624203259.4051-1-kevinbrace@gmx.com>
References: <20220624203259.4051-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pj+7yMot7sUXrSek3I5Y+kVRum/ZBT5VrD4xX4jGBo5a1iSTsNw
 NkdePjjKXQBtV02EiQglMvEbK4vmP15l+filqJ6/Dw4ZoS8aedXiQAr0Rhhw2vT/M50OVXI
 NozK3GWSOJNQklUINrgf4eAiC9XlKfAcq1IHx6/xnbOO7vWuiiYCcJXG02mrV8F50UbnpLF
 tOWAlj4ju0reWirpmrtqQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oZVY95MA4PM=:6ATHyifh5NT3zVdIg23Po1
 1mI977mYEEVf57H8iccf1foORmjbLr8bApgLyi77nUeKi1KiL/Yuxpf3Q81+zrRJvV0v8DbWv
 blGrI8VL91NNF19ZWwyQFeDrZi10Daw0PN0QG06mSp0Xq9/txPpoYv7aZe+7UtOppSvp6sRP1
 8mBa32fQbEf6o+csj8KezVj9z8j+YYbJ5M/AvYRwcuSExlxFHK/2AamQhg4PKESrJ91Yk5bVr
 AAI7b95Kzng7Id2M05ev2nj9dVaUCQnWat9rJnxIpCYNv++EqTyP9joZVKPVfLjBibzx5BoW9
 bRq4ejTjtMpsIHfYBkd75PMFNERa0NWttGTB9LxSQEkwC0QacofcqtmS3pupUVdGOQvfHlrP0
 DBvnfb9sGJ/Tq5XJmuoPXc+XZjo+BKOLyzYBT/c2Osr8wk60KjTOB5HO0LyPJ3k4c1fJhDo+z
 +pIRuoCwmPt7bZW9TJWzF09r5DmpLK/gkUwL0r2xwIjuQmP01Yxkycvp+YHJVENonpBtAjp6f
 oxUUTGyb1hZQT8lPsBg4QnM4/G4+lA2RyWrFwNyljKbWl7eR8exrk/ckT/yYJT+KnIZNv+K8N
 lHvK3QYLAAHkH/8bQWFznwEeGGNDJvL3nEYK+y+jLkcym7K2RJ7ZHch8mwdCfCY360JlCpZiw
 9jK0S/vhqc91ZWGS2/KbYg80Qeq1Fkz2TfvnewQrbU8J7LRbiEBkKK804FjlXAmf79kIrPdAa
 v9ui3DLpeXaIB4U9JT+RrvJnr5TEvhPaEe0UK6qHENjBJ9v3ldsGEvTSCw4iqmJDA6Bixu2P2
 TQHZHvs+cWJIkS9Ec3vt+YMkZp1goLUmIgme2YdsozncCVicwAu6jRZldORPNesNP4H7/LNyi
 q/gLrbHhCMQ3L3ANIuAu/RsOCq0lvp+O6gHG6hq8GqTQ2LGPk+DB4gwd9zQ2rjxBD3/duoRLK
 1ID2cqzo9uOFoqI7HZdWH48GKAz6dSGjQfRW7ukuyf5Snyz4uTEuW8Rjx3calpE3c+XaVBqf3
 fMCpPLhNojKQ7fKC+8HB/mDanxISo384hQVppJrXXpyjtIR8UdopS46bXK1t3UPEYOHwcRTnA
 a/hg2nnv7MrrLg1MC/NO9pzst1J136GCxf+JJnFmi3Od6NY90mgQu9yMQ==
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
 include/uapi/drm/via_drm.h | 309 +++++++++++++++++++++++++++++++++++++
 1 file changed, 309 insertions(+)
 create mode 100644 include/uapi/drm/via_drm.h

diff --git a/include/uapi/drm/via_drm.h b/include/uapi/drm/via_drm.h
new file mode 100644
index 000000000000..e9da45ce130a
=2D-- /dev/null
+++ b/include/uapi/drm/via_drm.h
@@ -0,0 +1,309 @@
+/*
+ * Copyright =C2=A9 2020 Kevin Brace
+ * Copyright 1998-2003 VIA Technologies, Inc. All Rights Reserved.
+ * Copyright 2001-2003 S3 Graphics, Inc. All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sub licen=
se,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portion=
s
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS, COPYRIGHT HOLDERS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY
+ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, T=
ORT
+ * OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE =
OR
+ * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ */
+#ifndef _VIA_DRM_H_
+#define _VIA_DRM_H_
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/* WARNING: These defines must be the same as what the Xserver uses.
+ * if you change them, you must change the defines in the Xserver.
+ */
+
+#ifndef _VIA_DEFINES_
+#define _VIA_DEFINES_
+
+
+#define VIA_NR_SAREA_CLIPRECTS		8
+#define VIA_NR_XVMC_PORTS               10
+#define VIA_NR_XVMC_LOCKS               5
+#define VIA_MAX_CACHELINE_SIZE          64
+#define XVMCLOCKPTR(saPriv,lockNo)					\
+	((volatile struct drm_hw_lock *)(((((unsigned long) (saPriv)->XvMCLockAr=
ea) + \
+				      (VIA_MAX_CACHELINE_SIZE - 1)) &	\
+				     ~(VIA_MAX_CACHELINE_SIZE - 1)) +	\
+				    VIA_MAX_CACHELINE_SIZE*(lockNo)))
+
+/* Each region is a minimum of 64k, and there are at most 64 of them.
+ */
+#define VIA_NR_TEX_REGIONS 64
+#define VIA_LOG_MIN_TEX_REGION_SIZE 16
+#endif
+
+#define VIA_UPLOAD_TEX0IMAGE  0x1	/* handled clientside */
+#define VIA_UPLOAD_TEX1IMAGE  0x2	/* handled clientside */
+#define VIA_UPLOAD_CTX        0x4
+#define VIA_UPLOAD_BUFFERS    0x8
+#define VIA_UPLOAD_TEX0       0x10
+#define VIA_UPLOAD_TEX1       0x20
+#define VIA_UPLOAD_CLIPRECTS  0x40
+#define VIA_UPLOAD_ALL        0xff
+
+/* VIA specific ioctls */
+#define DRM_VIA_ALLOCMEM	0x00
+#define DRM_VIA_FREEMEM	        0x01
+#define DRM_VIA_AGP_INIT	0x02
+#define DRM_VIA_FB_INIT	        0x03
+#define DRM_VIA_MAP_INIT	0x04
+#define DRM_VIA_DEC_FUTEX       0x05
+#define NOT_USED
+#define DRM_VIA_DMA_INIT	0x07
+#define DRM_VIA_CMDBUFFER	0x08
+#define DRM_VIA_FLUSH	        0x09
+#define DRM_VIA_PCICMD	        0x0a
+#define DRM_VIA_CMDBUF_SIZE	0x0b
+#define NOT_USED
+#define DRM_VIA_WAIT_IRQ        0x0d
+#define DRM_VIA_DMA_BLIT        0x0e
+#define DRM_VIA_BLIT_SYNC       0x0f
+
+#define	DRM_VIA_GEM_CREATE	0x10
+#define	DRM_VIA_GEM_MAP		0x11
+#define	DRM_VIA_GEM_UNMAP	0x12
+
+
+#define DRM_IOCTL_VIA_ALLOCMEM	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_ALLO=
CMEM, drm_via_mem_t)
+#define DRM_IOCTL_VIA_FREEMEM	  DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_FREEM=
EM, drm_via_mem_t)
+#define DRM_IOCTL_VIA_AGP_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_AGP_=
INIT, drm_via_agp_t)
+#define DRM_IOCTL_VIA_FB_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_FB_IN=
IT, drm_via_fb_t)
+#define DRM_IOCTL_VIA_MAP_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_MAP_=
INIT, drm_via_init_t)
+#define DRM_IOCTL_VIA_DEC_FUTEX   DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_DEC=
_FUTEX, drm_via_futex_t)
+#define DRM_IOCTL_VIA_DMA_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_DMA_=
INIT, drm_via_dma_init_t)
+#define DRM_IOCTL_VIA_CMDBUFFER	  DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_CMD=
BUFFER, drm_via_cmdbuffer_t)
+#define DRM_IOCTL_VIA_FLUSH	  DRM_IO(  DRM_COMMAND_BASE + DRM_VIA_FLUSH)
+#define DRM_IOCTL_VIA_PCICMD	  DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_PCICMD=
, drm_via_cmdbuffer_t)
+#define DRM_IOCTL_VIA_CMDBUF_SIZE DRM_IOWR( DRM_COMMAND_BASE + DRM_VIA_CM=
DBUF_SIZE, \
+					    drm_via_cmdbuf_size_t)
+#define DRM_IOCTL_VIA_WAIT_IRQ    DRM_IOWR( DRM_COMMAND_BASE + DRM_VIA_WA=
IT_IRQ, drm_via_irqwait_t)
+#define DRM_IOCTL_VIA_DMA_BLIT    DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_DMA_=
BLIT, drm_via_dmablit_t)
+#define DRM_IOCTL_VIA_BLIT_SYNC   DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_BLIT=
_SYNC, drm_via_blitsync_t)
+
+#define	DRM_IOCTL_VIA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_GEM_=
CREATE, struct drm_via_gem_create)
+#define	DRM_IOCTL_VIA_GEM_MAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_GEM_MA=
P, struct drm_via_gem_map)
+#define	DRM_IOCTL_VIA_GEM_UNMAP		DRM_IOR(DRM_COMMAND_BASE + DRM_VIA_GEM_U=
NMAP, struct drm_via_gem_unmap)
+
+/* Indices into buf.Setup where various bits of state are mirrored per
+ * context and per buffer.  These can be fired at the card as a unit,
+ * or in a piecewise fashion as required.
+ */
+
+#define VIA_TEX_SETUP_SIZE 8
+
+/* Flags for clear ioctl
+ */
+#define VIA_FRONT   0x1
+#define VIA_BACK    0x2
+#define VIA_DEPTH   0x4
+#define VIA_STENCIL 0x8
+#define VIA_MEM_VIDEO   0	/* matches drm constant */
+#define VIA_MEM_AGP     1	/* matches drm constant */
+#define VIA_MEM_SYSTEM  2
+#define VIA_MEM_MIXED   3
+#define VIA_MEM_UNKNOWN 4
+
+typedef struct {
+	__u32 offset;
+	__u32 size;
+} drm_via_agp_t;
+
+typedef struct {
+	__u32 offset;
+	__u32 size;
+} drm_via_fb_t;
+
+typedef struct {
+	__u32 context;
+	__u32 type;
+	__u32 size;
+	unsigned long index;
+	unsigned long offset;
+} drm_via_mem_t;
+
+typedef struct _drm_via_init {
+	enum {
+		VIA_INIT_MAP =3D 0x01,
+		VIA_CLEANUP_MAP =3D 0x02
+	} func;
+
+	unsigned long sarea_priv_offset;
+	unsigned long fb_offset;
+	unsigned long mmio_offset;
+	unsigned long agpAddr;
+} drm_via_init_t;
+
+typedef struct _drm_via_futex {
+	enum {
+		VIA_FUTEX_WAIT =3D 0x00,
+		VIA_FUTEX_WAKE =3D 0X01
+	} func;
+	__u32 ms;
+	__u32 lock;
+	__u32 val;
+} drm_via_futex_t;
+
+typedef struct _drm_via_dma_init {
+	enum {
+		VIA_INIT_DMA =3D 0x01,
+		VIA_CLEANUP_DMA =3D 0x02,
+		VIA_DMA_INITIALIZED =3D 0x03
+	} func;
+
+	unsigned long offset;
+	unsigned long size;
+	unsigned long reg_pause_addr;
+} drm_via_dma_init_t;
+
+typedef struct _drm_via_cmdbuffer {
+	char __user *buf;
+	unsigned long size;
+} drm_via_cmdbuffer_t;
+
+/* Warning: If you change the SAREA structure you must change the Xserver
+ * structure as well */
+
+typedef struct _drm_via_tex_region {
+	unsigned char next, prev;	/* indices to form a circular LRU  */
+	unsigned char inUse;	/* owned by a client, or free? */
+	int age;		/* tracked by clients to update local LRU's */
+} drm_via_tex_region_t;
+
+typedef struct _drm_via_sarea {
+	unsigned int dirty;
+	unsigned int nbox;
+	struct drm_clip_rect boxes[VIA_NR_SAREA_CLIPRECTS];
+	drm_via_tex_region_t texList[VIA_NR_TEX_REGIONS + 1];
+	int texAge;		/* last time texture was uploaded */
+	int ctxOwner;		/* last context to upload state */
+	int vertexPrim;
+
+	/*
+	 * Below is for XvMC.
+	 * We want the lock integers alone on, and aligned to, a cache line.
+	 * Therefore this somewhat strange construct.
+	 */
+
+	char XvMCLockArea[VIA_MAX_CACHELINE_SIZE * (VIA_NR_XVMC_LOCKS + 1)];
+
+	unsigned int XvMCDisplaying[VIA_NR_XVMC_PORTS];
+	unsigned int XvMCSubPicOn[VIA_NR_XVMC_PORTS];
+	unsigned int XvMCCtxNoGrabbed;	/* Last context to hold decoder */
+
+	/* Used by the 3d driver only at this point, for pageflipping:
+	 */
+	unsigned int pfCurrentOffset;
+} drm_via_sarea_t;
+
+typedef struct _drm_via_cmdbuf_size {
+	enum {
+		VIA_CMDBUF_SPACE =3D 0x01,
+		VIA_CMDBUF_LAG =3D 0x02
+	} func;
+	int wait;
+	__u32 size;
+} drm_via_cmdbuf_size_t;
+
+typedef enum {
+	VIA_IRQ_ABSOLUTE =3D 0x0,
+	VIA_IRQ_RELATIVE =3D 0x1,
+	VIA_IRQ_SIGNAL =3D 0x10000000,
+	VIA_IRQ_FORCE_SEQUENCE =3D 0x20000000
+} via_irq_seq_type_t;
+
+#define VIA_IRQ_FLAGS_MASK 0xF0000000
+
+enum drm_via_irqs {
+	drm_via_irq_hqv0 =3D 0,
+	drm_via_irq_hqv1,
+	drm_via_irq_dma0_dd,
+	drm_via_irq_dma0_td,
+	drm_via_irq_dma1_dd,
+	drm_via_irq_dma1_td,
+	drm_via_irq_num
+};
+
+struct drm_via_wait_irq_request {
+	unsigned irq;
+	via_irq_seq_type_t type;
+	__u32 sequence;
+	__u32 signal;
+};
+
+typedef union drm_via_irqwait {
+	struct drm_via_wait_irq_request request;
+	struct drm_wait_vblank_reply reply;
+} drm_via_irqwait_t;
+
+typedef struct drm_via_blitsync {
+	__u32 sync_handle;
+	unsigned engine;
+} drm_via_blitsync_t;
+
+/* - * Below,"flags" is currently unused but will be used for possible fu=
ture
+ * extensions like kernel space bounce buffers for bad alignments and
+ * blit engine busy-wait polling for better latency in the absence of
+ * interrupts.
+ */
+
+typedef struct drm_via_dmablit {
+	__u32 num_lines;
+	__u32 line_length;
+
+	__u32 fb_addr;
+	__u32 fb_stride;
+
+	unsigned char *mem_addr;
+	__u32 mem_stride;
+
+	__u32 flags;
+	int to_fb;
+
+	drm_via_blitsync_t sync;
+} drm_via_dmablit_t;
+
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
+#if defined(__cplusplus)
+}
+#endif
+
+#endif				/* _VIA_DRM_H_ */
=2D-
2.35.1

