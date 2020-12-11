Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 285502D7A85
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 17:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26476E44A;
	Fri, 11 Dec 2020 16:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F9F6E44A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 16:11:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c5so5945357wrp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 08:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4fssRouZbXWFBN44jHmfR7th1TsDBIkrLCwxCRLIp+k=;
 b=a7J7hp3rOnBRHKp2O1dvJkyvHfkYf5aeV8zMHMyFRYnoyhXuJHWULVnKPKBSDSbUyM
 ZYzDvc5iS34pUS9ySUgpTP4B1315nvQZoHz8ue2hbGAT5k5LWCn83dc464DfMChuxTkc
 rajeUQKxXiu87nKkNfbGDpy+Ax4kBhERODznY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4fssRouZbXWFBN44jHmfR7th1TsDBIkrLCwxCRLIp+k=;
 b=EXyu3BwBFOCpvNz0fg1R+enq8n99hjs1TRTzUIGZQQ/LNSdUJ/qdB22NqA0x1pBVIJ
 b4KRhOfulmOfNWiqahmOAjlGyeYWQr/MAgiRhylvePkuqcO9qcuoBYSZHhSELRSrnrFe
 lEZcdF04ClW5lpO8Zuf6BDJV4D6NFawsDkaMfdsevF4L1iWF19Ce5S2s6jAH1njsNqxP
 gLE7ZGIaPaslf++m5dm0HkCECezBcnixQzAjJ92MPo0V5Oc+Avsss9p+1tBrP4FQnVpP
 ru3THqM/h/qXX49CQPN+bSxJY2MC0MqM8NzquVllCIcYDL5c/hnvlZCf+X4gtXpebHwe
 B9Dg==
X-Gm-Message-State: AOAM5322UFiqF8DEXM3p7cgAtrYiUCeXgMfSQm8BM8UVcjigKlWKO2pd
 k+xLzrWWkHmOgUywjtFRbciGtNHbZd4z8A==
X-Google-Smtp-Source: ABdhPJzoXn2HvtkGWMCEoEEMjUDaNmyoVpu+u7chKPJnWQT+uhC+Q4ivftxPpGGUX58qennL8TuZ0Q==
X-Received: by 2002:a5d:45d0:: with SMTP id b16mr14569951wrs.220.1607703081448; 
 Fri, 11 Dec 2020 08:11:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 138sm17399981wma.41.2020.12.11.08.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 08:11:20 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/fb-helper: Add a FIXME that generic_setup is very
 confusing
Date: Fri, 11 Dec 2020 17:11:13 +0100
Message-Id: <20201211161113.3350061-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211161113.3350061-1-daniel.vetter@ffwll.ch>
References: <20201211161113.3350061-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I tried to fix this for real, but it's very sprawling and lots of
drivers get this mildly wrong one way or the other.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_fb_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 596255edf023..27deed4af015 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2494,6 +2494,11 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
 		return;
 	}
 
+	/*
+	 * FIXME: This mixes up depth with bpp, which results in a glorious
+	 * mess, resulting in some drivers picking wrong fbdev defaults and
+	 * others wrong preferred_depth defaults.
+	 */
 	if (!preferred_bpp)
 		preferred_bpp = dev->mode_config.preferred_depth;
 	if (!preferred_bpp)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
