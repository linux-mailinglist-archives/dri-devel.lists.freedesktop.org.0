Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8635A01E8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B464BC11AF;
	Wed, 24 Aug 2022 19:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E4C10E497
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 00:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660868957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJnA1gWIAKMVWb7er1TKy0XozOPw4mLsXagd+kCHnAI=;
 b=QySu4FF0mLj3zWDHJPtDsRyU2i1vTwDNs5lsOsdcmv9u1yvzEBULe3LnkvFYXav0sTcm/j
 UeKrWhPX2P343DtWAtWZIdEEsm3pHMIvegZ54DPyXaPPkYwsS9i0s2zHU4Q2Se5dSolLN8
 91nUSTHRg6efVagaq6hns5aUgZWAwtQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-318-57_5HBJMNp-vLUnelNovnA-1; Thu, 18 Aug 2022 20:29:14 -0400
X-MC-Unique: 57_5HBJMNp-vLUnelNovnA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z6-20020a05640240c600b0043e1d52fd98so1867564edb.22
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 17:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AJnA1gWIAKMVWb7er1TKy0XozOPw4mLsXagd+kCHnAI=;
 b=5+GqQJsQLTEb/21sLMi11vKUK+V5dzLaRa/jo86G1S/Tg+Jv89WpJiwcfb32522pzx
 tOKfVYmvXDTQqLcmBI4JTwQTtlmTnDzlXaY2zkMMBmoRScczmJTswO2vjcM9r54kEXyn
 F01zoSLBUzT9sa0+6tREp2wMOjkRjOKwrSXQ9dN+5q0Gc1dWEWmQ8Oovtjo86pdZJVXD
 HWACpEw/I9zB7zmQoEOdbMrrKw7iSdbRH4YlBFd3EBcSyCdVvC6ISCU1304puTg5GEIE
 fgI1EBXu9psRtv69ZfCValvxRqPDd0/qjAQsbt6XYeaWxvT+kSsOOhGXMaGR583Qrfyf
 L9/w==
X-Gm-Message-State: ACgBeo38PcUmsS/ckvvrKAqvpDqpNqzJ9FwYeRMPKDlt3+Xl54Hfw4kU
 MRp22L4a72TkVCSls62HqIeTHJrJFbMfLRgdma+agzFtXDtdsLdzqih0Oo5cFgoBoCgcaT+w+8J
 GNr8ZEwNP9+J8ZV6xN8qAidHAQLg9
X-Received: by 2002:a17:907:a07b:b0:735:6744:c6be with SMTP id
 ia27-20020a170907a07b00b007356744c6bemr3118223ejc.685.1660868953215; 
 Thu, 18 Aug 2022 17:29:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4bPd1mGGbe4dYNjuUk6IBg2CW64/qzKlChk1S6e92cEUNZnl9nwhQOXUa5thhN1mFXZmO1Mw==
X-Received: by 2002:a17:907:a07b:b0:735:6744:c6be with SMTP id
 ia27-20020a170907a07b00b007356744c6bemr3118217ejc.685.1660868953026; 
 Thu, 18 Aug 2022 17:29:13 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b26-20020aa7cd1a000000b004460b020ffdsm2027913edw.83.2022.08.18.17.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 17:29:12 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next 2/3] drm/vc4: plane: protect device resources
 after removal
Date: Fri, 19 Aug 2022 02:29:04 +0200
Message-Id: <20220819002905.82095-3-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819002905.82095-1-dakr@redhat.com>
References: <20220819002905.82095-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Hardware) resources which are bound to the driver and device lifecycle
must not be accessed after the device and driver are unbound.

However, the DRM device isn't freed as long as the last user closed it,
hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Fixes: 9872c7a31921 ("drm/vc4: plane: Switch to drmm_universal_plane_alloc()")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h   |  1 +
 drivers/gpu/drm/vc4/vc4_plane.c | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 418a8242691f..80da9a9337cc 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -341,6 +341,7 @@ struct vc4_hvs {
 
 struct vc4_plane {
 	struct drm_plane base;
+	struct drm_device *dev;
 };
 
 static inline struct vc4_plane *
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index eff9c63adfa7..cb13bb583546 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -19,6 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -1218,14 +1219,22 @@ static void vc4_plane_atomic_update(struct drm_plane *plane,
 u32 vc4_plane_write_dlist(struct drm_plane *plane, u32 __iomem *dlist)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(plane->state);
+	struct vc4_plane *vc4_plane = to_vc4_plane(plane);
 	int i;
+	int idx;
 
 	vc4_state->hw_dlist = dlist;
 
+	if (!drm_dev_enter(vc4_plane->dev, &idx))
+		goto out;
+
 	/* Can't memcpy_toio() because it needs to be 32-bit writes. */
 	for (i = 0; i < vc4_state->dlist_count; i++)
 		writel(vc4_state->dlist[i], &dlist[i]);
 
+	drm_dev_exit(idx);
+
+out:
 	return vc4_state->dlist_count;
 }
 
@@ -1243,8 +1252,10 @@ u32 vc4_plane_dlist_size(const struct drm_plane_state *state)
 void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(plane->state);
+	struct vc4_plane *vc4_plane = to_vc4_plane(plane);
 	struct drm_gem_dma_object *bo = drm_fb_dma_get_gem_obj(fb, 0);
 	uint32_t addr;
+	int idx;
 
 	/* We're skipping the address adjustment for negative origin,
 	 * because this is only called on the primary plane.
@@ -1252,12 +1263,17 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 	WARN_ON_ONCE(plane->state->crtc_x < 0 || plane->state->crtc_y < 0);
 	addr = bo->dma_addr + fb->offsets[0];
 
+	if (!drm_dev_enter(vc4_plane->dev, &idx))
+		return;
+
 	/* Write the new address into the hardware immediately.  The
 	 * scanout will start from this address as soon as the FIFO
 	 * needs to refill with pixels.
 	 */
 	writel(addr, &vc4_state->hw_dlist[vc4_state->ptr0_offset]);
 
+	drm_dev_exit(idx);
+
 	/* Also update the CPU-side dlist copy, so that any later
 	 * atomic updates that don't do a new modeset on our plane
 	 * also use our updated address.
@@ -1271,6 +1287,8 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct vc4_plane_state *vc4_state, *new_vc4_state;
+	struct vc4_plane *vc4_plane = to_vc4_plane(plane);
+	int idx;
 
 	swap(plane->state->fb, new_plane_state->fb);
 	plane->state->crtc_x = new_plane_state->crtc_x;
@@ -1323,6 +1341,9 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	vc4_state->dlist[vc4_state->ptr0_offset] =
 		new_vc4_state->dlist[vc4_state->ptr0_offset];
 
+	if (!drm_dev_enter(vc4_plane->dev, &idx))
+		return;
+
 	/* Note that we can't just call vc4_plane_write_dlist()
 	 * because that would smash the context data that the HVS is
 	 * currently using.
@@ -1333,6 +1354,8 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 	       &vc4_state->hw_dlist[vc4_state->pos2_offset]);
 	writel(vc4_state->dlist[vc4_state->ptr0_offset],
 	       &vc4_state->hw_dlist[vc4_state->ptr0_offset]);
+
+	drm_dev_exit(idx);
 }
 
 static int vc4_plane_atomic_async_check(struct drm_plane *plane,
@@ -1521,6 +1544,8 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 					       modifiers, type, NULL);
 	if (IS_ERR(vc4_plane))
 		return ERR_CAST(vc4_plane);
+
+	vc4_plane->dev = dev;
 	plane = &vc4_plane->base;
 
 	if (vc4->is_vc5)
-- 
2.37.2

