Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173EB163EC5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794386E462;
	Wed, 19 Feb 2020 08:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2E66EA57;
 Tue, 18 Feb 2020 17:28:54 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z3so25018541wru.3;
 Tue, 18 Feb 2020 09:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VWLVAjVqPSSmv6Lyrg6I9TSWLedwmPZ7BTiNRFjBZfs=;
 b=YhrSjxZLtGfvAutwn8YXFwmbIyBZmPMAei0Fyr8NP5P4i3Gp8eZgzHpsb9eo8Pa+Es
 +LH6mOifsUsSk06cf9tYGHTcT7/yjMT2jJd/EqCGxhTfPJPA6MlUzgXg5LQk18yrc+6W
 bpSlX2Xzi1WMNnd0F7fBEGop0CFOcPjhbtIddN7U11+HPL5Ae1IqGwUyt4Af3A09EwaY
 jYyVAKbqA0t46R5hjSlRg8q9JXobzCge1yIKGbRQRqC2k02bQOq96g+vhLJc8n/0hGby
 qsxO1TmWs7fAEXZwEDma4hCS8ucziSvs38CEOwATpGoC4oiQ37tnaBU3gds1+jTGoubu
 Ow5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWLVAjVqPSSmv6Lyrg6I9TSWLedwmPZ7BTiNRFjBZfs=;
 b=ipa6zQOtCn53DAXk+J0ohBjK9/4GRMugieTTnzrsSTzwzBwUxMcXN3o6IpQLNY+MQL
 OLcq3fZZFBW3DWPr1RveJ4iUzCnNnJkLBivGA7C8tWbzPMvlIHmSW6aBwiqYd16nuQhy
 qc5NCDzBtFBPzSFKx2Dct8+V5NNP0Yzw14Y8ZYyIbdYSEsE4bCfC2dGRfXoLxtRBMRnV
 /uH1DKQKYE57kXLb1s8F61bk23JrZzGwKuVllw0yQmDMgqrgaf00WdlsNs2YjoaVXCuA
 rvEVsAM0QhjMpnGJnxvTATxG5843N5q6PN3JUJz3tL8Wwt9V1uzc1PG5hhL07+XpnmL9
 4Ctw==
X-Gm-Message-State: APjAAAVve3l8yRWT9ABDbSDKrYq1uhamXVbw6Q5lASRJzs8+qvn5R126
 v99RF0sfCd/78/2wG7Lu/90=
X-Google-Smtp-Source: APXvYqxVyMWdovrtq8J/U94Gcj1SY1oH479AJsJq/mJ7oIUVe9sqlGwCh57Lgm6O1a5ZmnbwhpjkRg==
X-Received: by 2002:a5d:4f0f:: with SMTP id c15mr31665038wru.251.1582046932730; 
 Tue, 18 Feb 2020 09:28:52 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t13sm6998757wrw.19.2020.02.18.09.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 09:28:52 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: bskeggs@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/nouveau: remove checks for return value of debugfs
 functions
Date: Tue, 18 Feb 2020 20:28:17 +0300
Message-Id: <20200218172821.18378-6-wambui.karugax@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As there is no need to check for the return value of debugfs_create_file
and drm_debugfs_create_files, remove unnecessary checks and error
handling in nouveau_drm_debugfs_init.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 7dfbbbc1beea..15a3d40edf02 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -222,22 +222,18 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
 {
 	struct nouveau_drm *drm = nouveau_drm(minor->dev);
 	struct dentry *dentry;
-	int i, ret;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(nouveau_debugfs_files); i++) {
-		dentry = debugfs_create_file(nouveau_debugfs_files[i].name,
-					     S_IRUGO | S_IWUSR,
-					     minor->debugfs_root, minor->dev,
-					     nouveau_debugfs_files[i].fops);
-		if (!dentry)
-			return -ENOMEM;
+		debugfs_create_file(nouveau_debugfs_files[i].name,
+				    S_IRUGO | S_IWUSR,
+				    minor->debugfs_root, minor->dev,
+				    nouveau_debugfs_files[i].fops);
 	}
 
-	ret = drm_debugfs_create_files(nouveau_debugfs_list,
-				       NOUVEAU_DEBUGFS_ENTRIES,
-				       minor->debugfs_root, minor);
-	if (ret)
-		return ret;
+	drm_debugfs_create_files(nouveau_debugfs_list,
+				 NOUVEAU_DEBUGFS_ENTRIES,
+				 minor->debugfs_root, minor);
 
 	/* Set the size of the vbios since we know it, and it's confusing to
 	 * userspace if it wants to seek() but the file has a length of 0
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
