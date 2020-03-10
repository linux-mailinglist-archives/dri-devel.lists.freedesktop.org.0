Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4920180C7B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C8A6E908;
	Tue, 10 Mar 2020 23:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1246E2DD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:31:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e26so1351067wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+a3U4jSbxticLykwAuG4RkKwJpCBQwiZh0yEiI3Sz1U=;
 b=Hne+jWLI3BEBXhjTKXTKSXzecGEn9zVZbio6NzdOolzhUuU35a/RSfPB/0hld5jEHd
 /T79833bgefuOdpb++hrCbv9Slc6giSs2BUjwIYeExhy61lYFZ8aAVWLRBUQZBVsJCvn
 jci4iWqnoA9S1xifYoE2AB45AD6pBtBWzu22LUKnbxts0aRBfKVH9P45hPMwFymWtBG2
 VrtTAG4/N/f/WDTyqzwHAM2vr8G91QxbPOlq2q81u2MpKagSYBVxLvt88rpZEtQoHnUU
 5S9LjWWNtEr0nT6WxADFgDg1F4oJn/UoXC6isCff60o9sBUi/E9f0JBsChihYDu3NqvM
 jJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+a3U4jSbxticLykwAuG4RkKwJpCBQwiZh0yEiI3Sz1U=;
 b=MrMod0F7QD7ES2Z1vrJKWgU6pw/iLoAqTLOW9NRXbq/fwKosHFW1vm5ZTn1phSb+r4
 zkUI7ZbtiaZmFq750UYtha0+YZyKV+1DZ5XY3eR8+mlBxo0hiqAhaQ5r7t5yw5dWYwjL
 u29yI4z55bMBMtaqD61HrzU8r+IOKUhEqrBHf/zYKmwLI+UstjgLAY7jNK+sEqQHRuos
 unXVjvPjMum4XFdm4rNf9Gf6750J+9G9ITzmGh69mdUuVG/N0g7y+gjbXrMfLuu6IWXQ
 jNlVWbxr49mpGWpU5f4sZSKvUQYFZbjEv1Ul/jirhU2VAohNHuOpKsppZf/hcHFFKkeg
 Uwnw==
X-Gm-Message-State: ANhLgQ1de8k77Jc9CPQaVqGwBHfncWbu1unSXt1PyxhavEsWW3wprJRs
 7EtmOgXO0nwhJnIX1xF1k1E=
X-Google-Smtp-Source: ADFU+vtU5VeSEld2wS8M/m4RC1/3sWDuFSBxIzBLiQGjnG2YMcxIEjdiLlbMK9QpWLHIcit2kZZzfg==
X-Received: by 2002:a1c:6108:: with SMTP id v8mr2214208wmb.58.1583847099964;
 Tue, 10 Mar 2020 06:31:39 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:39 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, Alexey Brodkin <abrodkin@synopsys.com>
Subject: [PATCH v2 05/17] drm/arc: make arcgpu_debugfs_init() return 0.
Date: Tue, 10 Mar 2020 16:31:09 +0300
Message-Id: <20200310133121.27913-6-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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

Since commit 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails and should return void. Therefore, remove its use as the
return value of arcpgu_debugfs_init() and have the latter function return
0 directly.

v2: convert the function to return 0 instead of void to avoid breaking
the build and ensure that this individual patch compiles properly.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/arc/arcpgu_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index d6a6692db0ac..660b25f9588e 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -139,8 +139,10 @@ static struct drm_info_list arcpgu_debugfs_list[] = {
 
 static int arcpgu_debugfs_init(struct drm_minor *minor)
 {
-	return drm_debugfs_create_files(arcpgu_debugfs_list,
-		ARRAY_SIZE(arcpgu_debugfs_list), minor->debugfs_root, minor);
+	drm_debugfs_create_files(arcpgu_debugfs_list,
+				 ARRAY_SIZE(arcpgu_debugfs_list),
+				 minor->debugfs_root, minor);
+	return 0;
 }
 #endif
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
