Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571C81C940A
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11ED6EA0C;
	Thu,  7 May 2020 15:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B743F6EA0A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e16so6835740wra.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQM0jqAutG1SIIPeLC+toLi1XISxe/sLa5ITGf34pqo=;
 b=i1cGCxy8mtEmMYoopmNeXsZimZjeVPik1iw4UX66oKlGRr2Eyc8F7LWxHier8q3IPO
 QwaSBj9YSJ+6BuOFhnKibBNwjk/+7xv+A3BJ50GzDDoO+vw4NYEZxqSOOlUwssnMd69r
 L6bFde0AfC122yTIzfLdPQ+ApOYCnGVH0LDbDDYl1abHuHMxTt35xm49MO6+OPITx90V
 NZyZoXnrbglwzuNEOrmnw265mbi45SMMP/2FmU2xpjb1+rMiYgw8j3O25+oVYez6uLb2
 iH52KR3KAr68a1ddJUtNEqF5SpIIJXufjNdYs0k8bV/zJGZ5aCYOnk4JwxY4N3mEavUz
 BxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQM0jqAutG1SIIPeLC+toLi1XISxe/sLa5ITGf34pqo=;
 b=RmBjLk1nYhPJ9UVGIykmAA71acv8dZ2StIj4q7FykmAcMyBbyVYjYJyD05Ll6iwbmj
 LvMdHuz98rQJwIhh6J949lFOiKsq74Q8IYYtrRPRkebF8BQLYNXWgokzViC3AWPm3uid
 hdIJTLVmORymqptgQjZ57OURQCFzhq8Ivfc0N5R54omGIg1ZRL0GXNNedNTQH5qotcrW
 C0RPWZyaTSTWcZWZaS3WMIX34gyz6MEDm/zkPvsIj+ZKrcAkL4i086JlfLv/OF5hd5V7
 LW3Kjp+Ic9U8vsDS+Xd5I4x3joOf4JCtdVBC0vWUMNnfpgrUC1sYVQAYsPgDVzUdu/rX
 LVig==
X-Gm-Message-State: AGi0PuYw8TdeRP6B6h/hfpYE42oDaZsnH/mTAMnZlYXiLaHrfNAxx/47
 f9rm8YWJ3UnAJf7sdQ5UIxZk5BzJ
X-Google-Smtp-Source: APiQypLQ5+XmNLRFlXvkxF/VJ7+gu1C0ctStU0hPiB8rxfBdcW81I6ksMDR2UYi1d2AZhw983kGGyQ==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr15637552wrc.24.1588864280071; 
 Thu, 07 May 2020 08:11:20 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:18 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 20/36] drm/mediatek: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:06 +0100
Message-Id: <20200507150822.114464-21-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index b04a3c2b111e..fcb81f354224 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -117,7 +117,7 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 		goto err_handle_create;
 
 	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put_unlocked(&mtk_gem->base);
+	drm_gem_object_put(&mtk_gem->base);
 
 	return 0;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
