Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FAC3D1E88
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 08:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033D46EA08;
	Thu, 22 Jul 2021 06:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DE06E201
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 21:48:41 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so3436315otf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 14:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lk2qnSXrWsRAOtpQDj5ZePRVFVd1vSDHOfo3JUXRbMc=;
 b=aipYZnJJ5FdMzbtVbTDpN9xNxl8qPZ/Rtl9fDV5AjzOctlWZ02nY5doq7giOTsvPpX
 FlBD8C9RMEf0jGsreZnNbqGsVOqJ0TVbWpNC7uDaMjGLcJBTCzJed/vFpVzByqY0dva6
 1BWRkbGdoKfGDatDQbOuePxVof0iNMGc6SRWAM9zLyGzBdC1YE39ocLSy8W8tiUSxVMk
 rf0Q+8q/OysCNBHPLUacGJopPNGz9AUZ6XgWeJeu3ABjapkK4Vacv++Cs8jsW0y69Exb
 e8bvQP7+sdMN/E/RHh6HZXYR6ha1MuHr+XKVZoabYpm/+Ds5Y1Pcw/CBUN1GAexfdDAM
 U+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lk2qnSXrWsRAOtpQDj5ZePRVFVd1vSDHOfo3JUXRbMc=;
 b=UOGujaTZDSfu8nTZCzCrsrBeyi6rVr5vVR5DvyrCjHB7QtQSlBfqtZ4Cu79fs8gB04
 B2TAYrjySfO4WEu5h+F2znHZG6YyXoy035pzwc/OwDisqHVMWREyPVAnz00whroyiq20
 9HBEXjRkmioXPdXYdI+J42JggUNejPjh1lKUEXdDr/ktpTQoVmmLBD7zSkOmjAqb7EMF
 jVUT8AcB5U9q0PGhWRwU+1VZcRnYlBs48eYNpXeldkBSQWXl+ydX+A+5M8tcvXDwLl6K
 jUZBb+gpHvxxm6pvgK+nGsvq5H2fVnUjm5kNO8sR+xMZDCSEgixnDujTva3aLsGdOgk8
 at0A==
X-Gm-Message-State: AOAM533nqbXn7cLXTRdMzGyF9oY7EZClC2KMARWZEP2QlGMTG/saECyF
 YRcitLzGvAjE4XHzaHCtNuPorybvZxg=
X-Google-Smtp-Source: ABdhPJxl4XDT9Tt2kGfZPc+e+Uo/wubdhNpArtXqy+8+JRUekyd6f3ecRBI88zSUMDBwad29jSGWMg==
X-Received: by 2002:a05:6830:16cb:: with SMTP id
 l11mr18749698otr.209.1626904120600; 
 Wed, 21 Jul 2021 14:48:40 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id g66sm4802587oob.27.2021.07.21.14.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 14:48:39 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panfrost: devfreq: Don't display error for EPROBE_DEFER
Date: Wed, 21 Jul 2021 16:48:30 -0500
Message-Id: <20210721214830.25690-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Jul 2021 06:54:33 +0000
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
Cc: airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>,
 alyssa.rosenzweig@collabora.com, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Set a condition for the message of "Couldn't set OPP regulators" to not
display if the error code is EPROBE_DEFER. Note that I used an if
statement to capture the condition instead of the dev_err_probe
function because I didn't want to change the DRM_DEV_ERROR usage.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 3644652f726f..194af7f607a6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -106,7 +106,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	if (ret) {
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV) {
-			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
 			return ret;
 		}
 	}
-- 
2.25.1

