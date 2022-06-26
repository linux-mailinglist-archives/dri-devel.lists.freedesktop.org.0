Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D255B004
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 09:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ACE14A1A5;
	Sun, 26 Jun 2022 07:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957CB14A1A5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=Usbj4xtxxEGp0kaYoyrQ4HKHDXVdkTN035WJkoI8zIc=;
 b=CURkRsOtsfaF+pW7C9vxmgszJ2KjaXHEG6FrQvRrd2kVriKXjzXIe/NMVs9T4dBZzqlYY9p8mUaA3
 3RmJFXg1Hid+3jooy0BzOFoJq64YeCTNiY1MGe5p/k72knUgxsy4wkKpukeoyK0cBCdDzpMWjXdD9u
 xgZ9Y5iyn5IJx/G2ISrCktK+X3Mb4VsDFYFLG30sQCogIbTXhx0OEKsNeM2BLyG7CErnc6+el34v9A
 uhbSEtikSy37051gtn1mVH8QqmK36jN0/nPR4Eie4iDiNdmBhNyP+xCIfasNmetihqqgC94qO4JcZa
 1c93MsCx/D//7AARtxR3Hqt8AaT5diQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=Usbj4xtxxEGp0kaYoyrQ4HKHDXVdkTN035WJkoI8zIc=;
 b=v4o1U+q+aFiaGu997X7hZZL4Q/XU5gNrQNLFUiShWnKLptmkZ4O+NEO9ZzkPAejJz1LIoYEcVSErI
 PR1sDKyCw==
X-HalOne-Cookie: 57526dece2acb09934b81452261f6ac3ad4b01c5
X-HalOne-ID: db1b5ebd-f524-11ec-a6c4-d0431ea8a283
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id db1b5ebd-f524-11ec-a6c4-d0431ea8a283;
 Sun, 26 Jun 2022 07:51:58 +0000 (UTC)
Date: Sun, 26 Jun 2022 09:51:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: [PATCH 0/1] Delete VIA DRM
Message-ID: <YrgQHe5fTnRhe6hV@ravnborg.org>
References: <20220626025641.4464-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220626025641.4464-1-kevinbrace@gmx.com>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

On Sat, Jun 25, 2022 at 09:56:40PM -0500, Kevin Brace wrote:
> From: Kevin Brace <kevinbrace@bracecomputerlab.com>
> 
> This patch is a supplemental patch to delete VIA DRM so that the proposed
> OpenChrome DRM module can be compiled against drm-next-2022-06-03-1 tag of
> drm-next branch.
> Apply this patch first before applying the rest of OpenChrome DRM patches.
This almost works - you need to delete include/uapi/drm_via_drm.h too.

For your v1 this is fine, but when you submit v2 it is not OK to just
delete all files and then add new files on top.
We want to see the diff between the original files and the new files.
Even though this is almost a rewrite we need to verify that copyrights
are kept for example.

As an example via_drm.h generates the nice diff below which is exactly
what we want to see for reviewing purposes.

As your patches will break the build, just modify drm/Makefile in your
very first patch to drop the driver, and in the last patch you can update
drm/Makefile to include the driver in the build again.
In this way you do not break the build and the bots can give you build
coverage you cannot do yourself.

I look forward to see v2 of the patch-set.

	Sam



diff --git a/include/uapi/drm/via_drm.h b/include/uapi/drm/via_drm.h
index a1e125d42208..e9da45ce130a 100644
--- a/include/uapi/drm/via_drm.h
+++ b/include/uapi/drm/via_drm.h
@@ -1,4 +1,5 @@
 /*
+ * Copyright © 2020 Kevin Brace
  * Copyright 1998-2003 VIA Technologies, Inc. All Rights Reserved.
  * Copyright 2001-2003 S3 Graphics, Inc. All Rights Reserved.
  *
@@ -16,10 +17,10 @@
  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
+ * THE AUTHORS, COPYRIGHT HOLDERS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY
+ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
+ * OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
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
 #define DRM_IOCTL_VIA_ALLOCMEM	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_ALLOCMEM, drm_via_mem_t)
 #define DRM_IOCTL_VIA_FREEMEM	  DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_FREEMEM, drm_via_mem_t)
 #define DRM_IOCTL_VIA_AGP_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_AGP_INIT, drm_via_agp_t)
@@ -97,6 +103,10 @@ extern "C" {
 #define DRM_IOCTL_VIA_DMA_BLIT    DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_DMA_BLIT, drm_via_dmablit_t)
 #define DRM_IOCTL_VIA_BLIT_SYNC   DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_BLIT_SYNC, drm_via_blitsync_t)
 
+#define	DRM_IOCTL_VIA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_GEM_CREATE, struct drm_via_gem_create)
+#define	DRM_IOCTL_VIA_GEM_MAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_GEM_MAP, struct drm_via_gem_map)
+#define	DRM_IOCTL_VIA_GEM_UNMAP		DRM_IOR(DRM_COMMAND_BASE + DRM_VIA_GEM_UNMAP, struct drm_via_gem_unmap)
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

