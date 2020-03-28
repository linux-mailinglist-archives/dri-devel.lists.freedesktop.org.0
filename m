Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13247196645
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 14:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CB96EADF;
	Sat, 28 Mar 2020 13:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449136EAE0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 13:20:38 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n17so13043650lji.8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xQHYLpnmCtzpowlLpatbX/n/JNs+MUjyjnti9QnDO0s=;
 b=cmQu0Y7Ee9BWq06ktawcXMwCn19Et0C+bfoxYk+xO5p4eO8MerAJAFJ+Z8HxamuHQ8
 cpglkArPaMhhSKC4+2Vh1XtXVD+mO+nlPYk5Ob4sa1zi+vP7ojJojBC+DsxwRqxGJAa5
 NYRzWyFvAZOw4Wpy+JVfhjCiOPkxOiQJnShU9tMpebGSFHcWtOWmsybe/RnFZK9OPGoF
 1DochQWz6nRWFC2AGZNbPGy2DiyuATnR0wTIT+fiG8bnGDxbeEGnHQ+8EJ00xyw1JkpG
 NYA18IMsOEd/RhcisJGYWejxGyFJ/uc9J9KqECm81vcKmO2qJm5yanjq9u6EcIemPqcE
 Dy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xQHYLpnmCtzpowlLpatbX/n/JNs+MUjyjnti9QnDO0s=;
 b=ByjrYhGmnGD98vkLrslGNX3ZSFgv0/X/6MmYG9+3YuZ47Xz3R4sjhz9cLMDM3HBHAV
 H8yMI0CxzAPQiHj85T3VQgGrdK3A27dy942HM45zDWDP9Zv1RxoeVqFwNIhqPgkLIvM0
 WkpHp0ujIrtN+XgkySiUX+VGVJhv670bQ7il1thbqDI0R+D3MJoNrfyVIWTsMZbmW6aL
 sYr+0IMQUrahXTO8JpnEzm6JPBF0Mntad9CFLucqwWoi2kDJzxIHEiW6GLRzPSL45DC4
 /ttGvaZ5krBxVyCB+CRZi2GU+jQW84gmrDe83oODMP2O5I+kIhymvwUR0PhGJVVMhKcE
 Uttw==
X-Gm-Message-State: AGi0PuYBDgnHGja72BeB46Jn8Gpj6DYk48ojjIRkYFZgQx4e/lemA0OO
 tgXMaHqKFwHXkN7odflOS83oHlLzZfs=
X-Google-Smtp-Source: APiQypJYzgecCUqByleVeU/hT2b2c4HBFjdis1NkwzsIhzWZR88euhiWAHZqQuPTmODtdiIs3tzSbg==
X-Received: by 2002:a05:651c:549:: with SMTP id
 q9mr2209310ljp.210.1585401636404; 
 Sat, 28 Mar 2020 06:20:36 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 j19sm4542916lfg.49.2020.03.28.06.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 06:20:35 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v1 1/6] drm/vblank: Add intro to documentation
Date: Sat, 28 Mar 2020 14:20:20 +0100
Message-Id: <20200328132025.19910-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200328132025.19910-1-sam@ravnborg.org>
References: <20200328132025.19910-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lyude Paul wrote a very good intro to vblank here:
https://lore.kernel.org/dri-devel/faf63d8a9ed23c16af69762f59d0dca6b2bf085f.camel@redhat.com/T/#mce6480be738160e9d07c5d023e88fd78d7a06d27

Add this to the intro chapter in drm_vblank.c so others
can benefit from it too.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Co-developed-by: Lyude Paul <lyude@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
---
 drivers/gpu/drm/drm_vblank.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index bcf346b3e486..95cac22d59d1 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -41,6 +41,21 @@
 /**
  * DOC: vblank handling
  *
+ * From the perspective of a computer, every time a computer monitor displays
+ * a new frame it's done by "scanning out" the display image from top to
+ * bottom, one row of pixels at a time. which row of pixels we're on is
+ * referred to as the scanline.
+ * Additionally, there's usually a couple of extra scanlines which we
+ * scan out, but aren't actually displayed on the screen (these sometimes
+ * get used by HDMI audio and friends, but that's another story).
+ * The period where we're on these scanlines is referred to as the vblank.
+ *
+ * On a lot of display hardware, programming needs to take effect during the
+ * vertical blanking period so that settings like gamma, what frame we're
+ * scanning out, etc. can be safely changed without showing visual tearing
+ * on the screen. In some unforgiving hardware, some of this programming has
+ * to both start and end in the same vblank - vertical blanking.
+ *
  * Vertical blanking plays a major role in graphics rendering. To achieve
  * tear-free display, users must synchronize page flips and/or rendering to
  * vertical blanking. The DRM API offers ioctls to perform page flips
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
