Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BC01C941A
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D573B6E9F5;
	Thu,  7 May 2020 15:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06226EA1B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:40 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 188so6949564wmc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EpuMJoUPyI+1rd02xxVkgfIAgraeyyrxwvZasByq3fE=;
 b=u7XzlqvsWZxZfmt1lh5OkeR2UADT/4bkrDUKoFH7JKaegVIcEbP6mxPK+sqpcx1WxI
 rOneHd2kVm/ukTn+iiaJuCHinCgCCf2JTIKY1K0fzr2am3Nr6jL17+GGxAfbFBgnfJur
 hYLZeQ73dpSj1QABj94LZf7PhBFEB+42iiVNlJOFOTxuI5zFWJNOJlN+aBmHaZbKy5gX
 T13ZD0/G+95EuHo/4q9URTcoQKYF4qeHbfv8evnvWUarLJo+TAC1coILC3hqD8EtABK8
 kgfw2VyRbEn1lE88YmbC7jw51OkPSs258AA/8zwOAmzMv4+ZYj1DB8ksw0DAf7PwqMVD
 PDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EpuMJoUPyI+1rd02xxVkgfIAgraeyyrxwvZasByq3fE=;
 b=FbSxembeu688MDgzN7DdsuMclEWN31eDkmPmXQ01KLYjd1+FlJ8PCzQ3qSFcSmKJoS
 ydPonqL+D/jEWHuNbytLFujwA/eRQ3gz/NXZ2ElP0nmZTPfFOZ84Q9nBeBKxruTKxF3E
 mj0AZB8Iyu2rQVajqMGwGOf+lDegMPeyhMDDCRm35nFouO176wKnRY9qqwEmG6dNDtBg
 JrpUKpL9jv3Dcu7urEWNSLLKFcBAfChm5uxq0Hab4WH6YBx3HcVmOuAidUkuCfUz9hn7
 2e3XxvvoF+UsDldcYDLPVHEvPlB8A4gn3ySXC7yr1wpQcudy6dSxcCWsTHQ8YtB4/CQR
 RBeA==
X-Gm-Message-State: AGi0PuYzl/zpLSnvRL3dXnL/lxafNse0ADrfybXWel9ofqJVHCcT/B2E
 O63wit4IQeR370KYr3+SVU01KrY8
X-Google-Smtp-Source: APiQypKjZXNiK3WXZzw18vaqYzB8ExI6JKr9SRkOTm2ppTMHqLSxr6NY6kUu14QJnDszmj377s/yrg==
X-Received: by 2002:a1c:4b16:: with SMTP id y22mr10924794wma.170.1588864299301; 
 Thu, 07 May 2020 08:11:39 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:38 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 35/36] drm/xen: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:21 +0100
Message-Id: <20200507150822.114464-36-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
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

Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/xen/xen_drm_front.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 1fd458e877ca..3e660fb111b3 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -419,7 +419,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 		goto fail_handle;
 
 	/* Drop reference from allocate - handle holds it now */
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	return 0;
 
 fail_handle:
@@ -427,7 +427,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 				   xen_drm_front_dbuf_to_cookie(obj));
 fail_backend:
 	/* drop reference from allocate */
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 fail:
 	DRM_ERROR("Failed to create dumb buffer: %d\n", ret);
 	return ret;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
