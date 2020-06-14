Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48C31F8F98
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CAB6E0C4;
	Mon, 15 Jun 2020 07:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FBE89FE8
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 01:33:46 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49kxnP6WRkz9vYx0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 01:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VXkNpl9R8THL for <dri-devel@lists.freedesktop.org>;
 Sat, 13 Jun 2020 20:33:45 -0500 (CDT)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49kxnP4sqQz9vYxK
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 20:33:44 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49kxnP4sqQz9vYxK
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49kxnP4sqQz9vYxK
Received: by mail-io1-f69.google.com with SMTP id 5so8919359iou.6
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 18:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jUlMgTFm6fgfWMMV+9s/cidt0Ya0VFDxiosQzLpc40s=;
 b=Ei3a4oCienBBw6iPl3GFWh9tQY0JjX8uZSP4hyeKGf0Iq4siwktVhkBFJeMu9dwJMn
 Chw34JghNFTOkIHxYWPcX2+UpEehlBp8JIeBr0oRj/bA5uN3Q7o4yyyAqT7GAZMF0Q+d
 S0i844L14NaGAbApvuzW7pnHYPEBsCSj1kfzImBZGrw3dgSdnbPSvg+2v8ZsH3aJpFMY
 7hZb1cX44hmnYFYpTJLycCmLzr7inAoKdNdrIlie5gMSZ7zwczaPrNIgiThSEtf/+m05
 7mfJOB3cvuM5dhSwAiobY8dTIC69JCgS6oQRCW+KQ51cbA9nwl4O81GOweBb3rvAWj2S
 7C7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jUlMgTFm6fgfWMMV+9s/cidt0Ya0VFDxiosQzLpc40s=;
 b=KNO+pkgJsW8zbjqEWEoiQy75ggVwkA3eas3iOvSWKJGOLA9DfL3NrNALD/vVM4BX0T
 Ow5evbrcKuOsIlplN5W0gWBvj94k4wT6iah5bVNu+2AKB3nC/VrL79AeXlvqPMapIbV1
 MJoZkh/gebPg1U4DlEZn9FQByzcuozbs7ZYl6/Xq4ArJR2Bii3c+lDOihc+Ya4n9zCyJ
 5PeX4GHnMAeoBrhUnEF4czL7OR/pBPN6b3RqwajHe/6270dUsO9A9pKxsTqSnat405VI
 Gh4ZtHOS19qbdOmht2CE1b9ZLll2XsQh6IgZRvNDhjvs+2Ub2aIjyKl72kXfsCEMLAqT
 PXEw==
X-Gm-Message-State: AOAM531TDUsy+66v40DIl34TkzCIYnk0Kk39+9QtjltZfg4MNW6hIZ+9
 8UzWov8uvb3PcvwKwUvYLm0CPWEKqeXTC/8jzIaYXM4NdTud9UxYlm5bLWuBPD5oACvvrDUrSDx
 oT62hgXY+XpN6fDzU2p/iDzgk5eEKW6DN
X-Received: by 2002:a05:6602:1647:: with SMTP id
 y7mr21169395iow.75.1592098424491; 
 Sat, 13 Jun 2020 18:33:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8lq+ZJcFfEGG8Lqn6FC+nNd+cCmmNo/tt7bKBSBKebyGZR+rrsj/xfGHJjBtj4WzgMDZCYw==
X-Received: by 2002:a05:6602:1647:: with SMTP id
 y7mr21169380iow.75.1592098424337; 
 Sat, 13 Jun 2020 18:33:44 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:d65:8ac4:1b02:86ac])
 by smtp.gmail.com with ESMTPSA id w18sm5705722ili.19.2020.06.13.18.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 18:33:43 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/noveau: fix reference count leak in nouveau_fbcon_open
Date: Sat, 13 Jun 2020 20:33:42 -0500
Message-Id: <20200614013342.122079-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau_fbcon_open() calls calls pm_runtime_get_sync() that
increments the reference count. In case of failure, decrement the
ref count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 3d11b84d4cf9..f10d28f8f132 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -189,8 +189,10 @@ nouveau_fbcon_open(struct fb_info *info, int user)
 	struct nouveau_fbdev *fbcon = info->par;
 	struct nouveau_drm *drm = nouveau_drm(fbcon->helper.dev);
 	int ret = pm_runtime_get_sync(drm->dev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put(drm->dev->dev);
 		return ret;
+	}
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
