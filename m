Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829EF163ECB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B1C6EABB;
	Wed, 19 Feb 2020 08:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1556EA59
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 17:29:02 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q9so3607382wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 09:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJCUVuOG5tbGj7Unp2+2ZA6RrFKuCTBt0CDjnpp8ebg=;
 b=DeBfRQwO7WmsMiUEWqqu0pisiFiytN1kRE3ovxPWxXPUPasgOx5xW0HDHV087Z6J3S
 90y+ekqox/Isc0OFu5EzaPyiwh8IISlBzER96+R1SLct3516OZigGU2J7Rfo1WKjP/qJ
 ypaMSnbmhb0U9z87AkcGaI/sqVW6XaIEU14eExHOKin9KMDwgoN+oim2AHWeTkSjtEzm
 NRkMDcoffXeWOMvX9IrfT2xMdxPp3hOQBHbPsOhXirwSVICOu9ji2al0z1UW3xIV3uRI
 hfsgnfE6oKqjlPkAh5+fce+Ejladdoq8D0dPQSH4w2O8fjin8DV+dLlpDA8/fvoaM2CZ
 EQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJCUVuOG5tbGj7Unp2+2ZA6RrFKuCTBt0CDjnpp8ebg=;
 b=Y6ChJyKSrgWZ2VDN9me7BL0JMMHuONjAnWCa1JQ2oWbWIyqLuDxMa24lhRChL/ylIn
 d7zdtzvxSPxnLIzQPPIabGZuvH/VUgtQBSu0WWcw1i0x9AsSp78Wu0cy+z9sJCDfgQib
 yCJwWZTSx1XxuYg+NGuUe4sJV9AhM6Gxpbf4uTrfd/CESjbFhNfLmPqVTuy5unAeuASj
 DY0pu5065wohNKGC3QER+UvSsFgKkCUwarGgf9jCe/bWAJZBrgrbyUusZ+FgPkUNMg92
 W74JMOqXDXoGjdcj5Nw3TfXJbTjWA19eheNjDCgqzPDMavVNA/rcMHRvt48q7yJxRhjp
 rFOg==
X-Gm-Message-State: APjAAAW6uRNkKc98O3Tbe/T/7ynP3mK90rH4g4CgCgKl2MmgN6baneJM
 /LTH8/7ykXtWrJ1fSaqjA+Q=
X-Google-Smtp-Source: APXvYqw3tIG1R2etYvj88Ogz3GtK578NDQwQLSkwGjFUdFIVtKGsq/kiEFl+t5zzQIAd9aNUeEIu8Q==
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr4165934wmj.43.1582046941333; 
 Tue, 18 Feb 2020 09:29:01 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t13sm6998757wrw.19.2020.02.18.09.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 09:29:00 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: eric@anholt.net,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vc4: remove check of return value of drm_debugfs functions
Date: Tue, 18 Feb 2020 20:28:19 +0300
Message-Id: <20200218172821.18378-8-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218172821.18378-1-wambui.karugax@gmail.com>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary check and error handling for the return value of
drm_debugfs_create_files in vc4_debugfs_init.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_debugfs.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index b61b2d3407b5..1835f12337ec 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -30,11 +30,8 @@ vc4_debugfs_init(struct drm_minor *minor)
 			    minor->debugfs_root, &vc4->load_tracker_enabled);
 
 	list_for_each_entry(entry, &vc4->debugfs_list, link) {
-		int ret = drm_debugfs_create_files(&entry->info, 1,
-						   minor->debugfs_root, minor);
-
-		if (ret)
-			return ret;
+		drm_debugfs_create_files(&entry->info, 1,
+					 minor->debugfs_root, minor);
 	}
 
 	return 0;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
