Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C331659A6DA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 22:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0D410E8F3;
	Fri, 19 Aug 2022 20:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADA910E7F8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 20:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660939777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4WKsTj80+KlAOcyLxVq2MH02vD1fdMO95DXY/VPgDU4=;
 b=N3eVlCeFh9tB7G/XEZyNDE+UJLZZnQyz/pkFHetLhOSCMMRUkjWM7CIU/qcZ/YYNaP2AT3
 /LUZjqj2O+8lxhbxKef/K20XysqVAs6oV5VtlyFuuN6xrWUtJ3B/Ai7lt8vISTFXBzf6/K
 6zcjp+XeOc0x7d0ZDM4u5sGTtd/wXvQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-s2EV3cYcNEaLBjZjZknMvg-1; Fri, 19 Aug 2022 16:09:36 -0400
X-MC-Unique: s2EV3cYcNEaLBjZjZknMvg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r10-20020a1c440a000000b003a538a648a9so2825400wma.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 13:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=4WKsTj80+KlAOcyLxVq2MH02vD1fdMO95DXY/VPgDU4=;
 b=jI2TfLHekcetepRM4CPgCT3BVrj++oeJW02xPCSvh1bw7XbwGIxClEZPgu9JaQ9/np
 OeWB5M1vb9ECRJlvuXNe1GsWlHxsssiCsRgAoVtK9R86yhT4o9fl8CbVPl/hZ4uuqyUZ
 d5TC5LilQLTVEaFkr+NIyV6a4jFI1Ey3NxLR+ANFBsYT06OPWf2lzWdAvq1t9Wm5v3ku
 6fmAzO5UjlkE3hFgwPWSnU+NLxOSjqABLiWgR2oi7er1nl6efMoN7yWiBCCo2XFKjHKr
 Bk1+ikYZkbFJ3Sntug+BRqjP4vEgIf8FbcOIwYKiesKCRzE39wfKpSr80FFVJ9PqT7pI
 +KNQ==
X-Gm-Message-State: ACgBeo2BbyO/4PmYM6WVSITyqai8XkTYO3C4MUSCeI7xZzM74YIJZlvS
 82PssPj/Ts1U/GMuqR5PszTcgHkrqdRZdA2p+0oD28s3uO/w40rx2SLOdW/kIYg8hI0w2tLhNjF
 rgg5U9sYubWoH5L0BPgsAY45TGN8N
X-Received: by 2002:a05:6000:18c:b0:21f:170d:446e with SMTP id
 p12-20020a056000018c00b0021f170d446emr5029333wrx.304.1660939775655; 
 Fri, 19 Aug 2022 13:09:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR41MvAqMhAqH36jAsYe/x4lLfhc9bERm3BktAuEeK79ImvBnIv/1szPfEWDOHxRsmuy+tKIGA==
X-Received: by 2002:a05:6000:18c:b0:21f:170d:446e with SMTP id
 p12-20020a056000018c00b0021f170d446emr5029327wrx.304.1660939775474; 
 Fri, 19 Aug 2022 13:09:35 -0700 (PDT)
Received: from kherbst.pingu.com ([31.16.187.72])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfdb92000000b0021eaf4138aesm5991920wri.108.2022.08.19.13.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 13:09:34 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] nouveau: explicitly wait on the fence in nouveau_bo_move_m2mf
Date: Fri, 19 Aug 2022 22:09:28 +0200
Message-Id: <20220819200928.401416-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.37.1
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is a bit unlcear to us why that's helping, but it does and unbreaks
suspend/resume on a lot of GPUs without any known drawbacks.

Cc: stable@vger.kernel.org # v5.15+
Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 35bb0bb3fe61..126b3c6e12f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -822,6 +822,15 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 		if (ret == 0) {
 			ret = nouveau_fence_new(chan, false, &fence);
 			if (ret == 0) {
+				/* TODO: figure out a better solution here
+				 *
+				 * wait on the fence here explicitly as going through
+				 * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
+				 *
+				 * Without this the operation can timeout and we'll fallback to a
+				 * software copy, which might take several minutes to finish.
+				 */
+				nouveau_fence_wait(fence, false, false);
 				ret = ttm_bo_move_accel_cleanup(bo,
 								&fence->base,
 								evict, false,
-- 
2.37.1

