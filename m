Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA945FB0E9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 13:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6C310E09D;
	Tue, 11 Oct 2022 11:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44A510E002
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 11:04:43 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r14so5238179edc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hYvJPISu8Cd00aj0C7m3IzNcADb6NJxK33RBMy4pz1I=;
 b=GEqGc7LyhJ+xLFWpYh6Xlru4O+i/UxkawIo3qehwQugVYylVDPhNoq2ec+XVozWc49
 pfh3PP/gSqkmTbB05JU63q2DPfhjFKR14sCPUr62n61RAt05FAdm/Rp3GH9MWaEuozEB
 BqX2jhp8rJ/upLbRBEDBnPqIFfkcFMQIUcY4GfDogOaO7Dc2FOtWqPdb8UNe/n3X4IJn
 FuykbyCEgODHHXX/UqNHjkmaiQ7tBMkbyRa8UOUUzStQuXImaKxX7/WSzgeUIhNyJi2b
 umI8cMqXbugCcvyFAZ161Rj5l+sHKqjuBDWJ9wvP+QbMKlgztziL9a8pWM89cf6r+YYb
 7b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hYvJPISu8Cd00aj0C7m3IzNcADb6NJxK33RBMy4pz1I=;
 b=1ybYPozdw+WgNIhnDKTsNMHFig8CFLq8uqXlwWL91uDe/jrkw9fTyyMeZrTZH3Ijmd
 32HG8ICWMoqnOj8qtFWcHGADBJp/hKfbwRFEPLjwxMlclZIpzxjAV7qJnXpGIrxVASV3
 2++G2uWj+Z1yyxXPXwiAEOPr5j/KrLJHWTWzqxAUats4JzNnQxetaz78kLXtOnyNStcM
 FP8XHYdpo+d5CLWQTKn1LXKGzao3tqUtylzkhpNDgULikS1HQbJOfO6dBP1gemK/ne+L
 BW2q+XqSqAZuJgp/0CUpyNG+n7OVmOoWIESOrfOiFyPMHyhZhKklNRjDwSQuZdCp90Je
 6j5Q==
X-Gm-Message-State: ACrzQf1VSUZ+4BOSe5jQqMBgjHpdswIIyTJRTnxFyrkG0mZ4Vafs1IVB
 5L9V9JUGO/dZr5oFYINghUdXK5p3xQE=
X-Google-Smtp-Source: AMsMyM4PClmiCy0aYGP/3wJaQj0I747uoIMU4CBDfZsy6BB9ImpCBQ3OEQwckTm4Bxz//7dN7So3fQ==
X-Received: by 2002:a05:6402:2549:b0:45b:e5fa:9681 with SMTP id
 l9-20020a056402254900b0045be5fa9681mr13634762edb.72.1665486282141; 
 Tue, 11 Oct 2022 04:04:42 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 v8-20020aa7d9c8000000b00458478a4295sm8938122eds.9.2022.10.11.04.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 04:04:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch,
	airlied@linux.ie
Subject: [PATCH 1/2] drm: remove DRM_MINOR_CONTROL
Date: Tue, 11 Oct 2022 13:04:36 +0200
Message-Id: <20221011110437.15258-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011110437.15258-1-christian.koenig@amd.com>
References: <20221011110437.15258-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not used any more. This makes room for up to 128 DRM devices.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_drv.c | 4 ++--
 include/drm/drm_file.h    | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..d81783f43452 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -126,8 +126,8 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 	spin_lock_irqsave(&drm_minor_lock, flags);
 	r = idr_alloc(&drm_minors_idr,
 		      NULL,
-		      64 * type,
-		      64 * (type + 1),
+		      128 * type,
+		      128 * (type + 1),
 		      GFP_NOWAIT);
 	spin_unlock_irqrestore(&drm_minor_lock, flags);
 	idr_preload_end();
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index d780fd151789..a3be533e99e0 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -54,7 +54,6 @@ struct file;
  */
 enum drm_minor_type {
 	DRM_MINOR_PRIMARY,
-	DRM_MINOR_CONTROL,
 	DRM_MINOR_RENDER,
 };
 
-- 
2.25.1

