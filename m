Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581EC587B5E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 13:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D7912A6DA;
	Tue,  2 Aug 2022 11:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCF114A2F4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 11:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RDKDOiFX9DJ8KJteDihxk8WMDzoB2Csjk08l0LD8urs=;
 b=YYJ0qctBXv88GsNUDDNT33hYVMfzU0NR1ZQBx9blGPAvzIvet5IGH6U276Q4QRrbjrRKQOHDbHsHX
 ehy3h59/m4ZFXy2i+//iGikdiFTgITOkVC6wVq9CwhW17wIVG3y4KnWJiCjNbsHzlKqJ8GQK12oSN+
 vTghv9j/i5Cpu1CEJES4bZcrwGIS9jy9FqYbgRKvGkaIew0LtaIGYjuxGgZIr4TB7SSPrlWlubjxD4
 KwJLry3hydoqzPvDzgIJlc2wKBVmAyX4G9/ekt9dZ6emWms1tGX+tly/s/JeddzPNB99Di4ioU2b1z
 PYK4Fm1bfrLhSLXwbYlUpBnonjPiGEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=RDKDOiFX9DJ8KJteDihxk8WMDzoB2Csjk08l0LD8urs=;
 b=RfehnFKbBeGZ5laUH541Vvbtp9nCobaNvG+kFiEw6Jv8jvaQ+KdwLmoydHj2tO48Bk5u4v8iuSiP3
 e+Rrk4PBw==
X-HalOne-Cookie: cde644e7151886fe86bb052493c110b6859a4db0
X-HalOne-ID: 97c2082c-1253-11ed-a6c9-d0431ea8a283
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 97c2082c-1253-11ed-a6c9-d0431ea8a283;
 Tue, 02 Aug 2022 11:09:35 +0000 (UTC)
Date: Tue, 2 Aug 2022 13:09:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Message-ID: <YukF7guP0EBIz0PT@ravnborg.org>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
 <f7a47d59-d4d2-61fb-4e42-1decff2e7d62@suse.de>
 <trinity-e1f9136b-24dd-44ed-861b-a0735c91422e-1659221316349@3c-app-mailcom-bs07>
 <Yufl737qQnxlHeGd@ravnborg.org>
 <trinity-4501b716-d008-4a86-9e0c-681c301e4b87-1659399030120@3c-app-mailcom-bs06>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-4501b716-d008-4a86-9e0c-681c301e4b87-1659399030120@3c-app-mailcom-bs06>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,
> 
> OpenChrome DDX carries lots of legacy code.
> 
> https://cgit.freedesktop.org/openchrome/xf86-video-openchrome/tree/src/via_drm.h?h=main&id=dc661c59257e855cd9b29c14b91a8ee2d9b86ccb
> 
> There is a requirement to use the same via_drm.h with both DDX and DRM.
> Hence, I need to keep a lot of the legacy DRI1 definitions inside via_drm.h.

This part is fully understood. Also on top of this the via DRI1 driver
uses this. I am not asking to have anything deleted from the existing
uapi via_drm.h file.


My feedback is that the following code should be dropped from the
openchrome driver:

+	DRM_IOCTL_DEF_DRV(VIA_ALLOCMEM, drm_invalid_op, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VIA_FREEMEM, drm_invalid_op, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VIA_AGP_INIT, drm_invalid_op, DRM_AUTH | DRM_MASTER),
+	DRM_IOCTL_DEF_DRV(VIA_FB_INIT, drm_invalid_op, DRM_AUTH | DRM_MASTER),
+	DRM_IOCTL_DEF_DRV(VIA_MAP_INIT, drm_invalid_op, DRM_AUTH | DRM_MASTER),
+	DRM_IOCTL_DEF_DRV(VIA_DEC_FUTEX, drm_invalid_op, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VIA_DMA_INIT, drm_invalid_op, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VIA_CMDBUFFER, drm_invalid_op, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VIA_FLUSH, drm_invalid_op, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VIA_PCICMD, drm_invalid_op, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VIA_CMDBUF_SIZE, drm_invalid_op, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VIA_WAIT_IRQ, drm_invalid_op, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VIA_DMA_BLIT, drm_invalid_op, DRM_AUTH),
+	DRM_IOCTL_DEF_DRV(VIA_BLIT_SYNC, drm_invalid_op, DRM_AUTH),

(Copied from openchrome-drm - I recall you did not post this code yet).

The new openchrome driver should not care at all about the old UAPI,
so just drop the above.

The comment above is based on the understanding that when we have a kms
compliant driver the user space is generic and we do not expect or need
any via specifics in user space.

In other words - x86-video-openchrome should - according to my
understanding - not be needed. And we can have a fully operational
wayland (and maybe X) userspace using the generic UAPI. This is where
Thomas Zimmermann's comment about dumb buffers are relevant.

Do I miss something obvious here?

	Sam
