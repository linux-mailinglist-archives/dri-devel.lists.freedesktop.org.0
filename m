Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE58844C221
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 14:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09FE6E24D;
	Wed, 10 Nov 2021 13:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782956E1F6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 13:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636551130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R5O82lGkB3NN23PTLRdAp79haIJ8wleiAOOJrRsNtqo=;
 b=HusnHholkqAASGoYz+FDYUcwNTg7XSCS6eZGUo9OHzQxjFp0/8Ii/DZCUmXbMzSkwfMhko
 lg+hS9F8Qmj7DjJKT9x8vp90gzNIblUkM8NpbTZ/qJE40JMLM2BepHnLO3KE1Cki8TgaxP
 Jztm+PEoBPft6BVyAWtYNy1eSksLyNI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-hlQqVcFAMM2PEncE2B6Ivg-1; Wed, 10 Nov 2021 08:32:00 -0500
X-MC-Unique: hlQqVcFAMM2PEncE2B6Ivg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o10-20020a05600c4fca00b0033312e1ed8bso1201165wmq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 05:32:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5O82lGkB3NN23PTLRdAp79haIJ8wleiAOOJrRsNtqo=;
 b=ISuCz2k0IHlz3G5RrF+gRUWQIiO2jfE/k2TTO+rL0AWWcb1S7yJBA7zmtiqo2wUMPr
 edo9zunp4Sya+xM4cnCzhKHL+JoTPvKHwXIqEzs2+++R77F25edjKmKHLd74myw7tins
 H+b26SaB9LzjsOtcUtnNus778NMK4A21gTc8izIYNKl9bVmXT8HJbj7rUrsEvT2WTmD/
 T6Ga0QxOd3w9hdaxUbxWGsM7YbwbcuglgTBsUl+ut65E6zWcmWRfdaqGvRVvT4mX7YtN
 NBOSAvdJPtlhGKvq/lDaCpmqHjjCd8MBGJCyV7ZsNaIiKNpv3aSC9dX4YzKhe7gKq9eB
 S+jA==
X-Gm-Message-State: AOAM5328J1CBJjdGqR6qVMWP59Grsnw/hnT3Kj/C69+xxXSn78ywfjHO
 /UYEntwP9xDwcXHUiZomhpioah9MIOYtQ4Di65byRktNChNmDkl15DKz3qqOHyQ867McwoL+9Kp
 J9tSXNl0+jfxAHVn+Sj892vTl58G6WsblMXgDo9NOk/sO6vA1WbS7/g7xOq8OtwBTRO1ei7P3co
 2vlfY=
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr15869364wmb.28.1636551119553; 
 Wed, 10 Nov 2021 05:31:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGGGzVwTOL8QLg2ck4YLOC7KbDdKHAN5gKNStHaLSAVi4yTBuNpaQQHI7zqpuTdkyTPJCjnA==
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr15869311wmb.28.1636551119225; 
 Wed, 10 Nov 2021 05:31:59 -0800 (PST)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72])
 by smtp.gmail.com with ESMTPSA id 9sm30391203wry.0.2021.11.10.05.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:31:58 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: update information for nouveau
Date: Wed, 10 Nov 2021 14:31:57 +0100
Message-Id: <20211110133157.553251-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some side notes on this. Atm we do want to use gitlab for bug tracking and
merge requests. But due to the nature of the current linux kernel
development, we can only do so for nouveau internal changes.

Everything else still needs to be sent as emails and this is also includes
changes to UAPI etc.

Anyway, if somebody wants to submit patches via gitlab, they are free to
do so and this should just make this more official and documented.

People listed as maintainers are such that have push access to drm-misc
(where changes are pushed to after landing in gitlab) and are known
nouveau developers.
We did this already for some trivial changes and critical bug fixes
already, we just weren't thinking about updating the MAINTAINERS file.

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 MAINTAINERS | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8805df335326..270dc9c0a427 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5961,10 +5961,17 @@ F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
 
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 M:	Ben Skeggs <bskeggs@redhat.com>
+M:	Karol Herbst <kherbst@redhat.com>
+M:	Lyude Paul <lyude@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 L:	nouveau@lists.freedesktop.org
 S:	Supported
-T:	git git://github.com/skeggsb/linux
+W:	https://nouveau.freedesktop.org/
+Q:	https://patchwork.freedesktop.org/project/nouveau/
+Q:	https://gitlab.freedesktop.org/drm/nouveau/-/merge_requests
+B:	https://gitlab.freedesktop.org/drm/nouveau/-/issues
+C:	irc://irc.oftc.net/nouveau
+T:	git https://gitlab.freedesktop.org/drm/nouveau.git
 F:	drivers/gpu/drm/nouveau/
 F:	include/uapi/drm/nouveau_drm.h
 
-- 
2.33.1

