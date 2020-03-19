Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6514618C883
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86336EAC9;
	Fri, 20 Mar 2020 08:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB8D88FAE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:01:17 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id v38so1744442qvf.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fM16z92SEo1un958VCQNdAKQJnbQVV8LOPBQhvLRoZk=;
 b=QlaHHv8ppA4DqD6kMC29oEyRqsLMTaCPZWlC+i9gmFsUkYUYuWMVX/5UpLbBooF6pB
 V8sImFyRlvmI97sC5I4LZt/uSgSFEwnwY2I1qgM2OK0FTV0sjFMbo0YWC0cD9YU8IbEB
 I9zmC0rdVaWwX0678SSKY2GfPyrhbS4rxKEfz8V1YFwoKI5GQU1A2+0yJx5eSdoexWLr
 sK05lc/HwVLqFQCXdVJMUOlsCnhSPpmst4WtZOdmrw8O8dqi1V5Gk4G9PtaEdLC0VMMG
 6Sh1Z+q4D813dnjJX5N1bcY2rQKPB2oglQsx516PpUHcCnUmwlDDaeKtb7E6g8DJ2R5T
 0B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fM16z92SEo1un958VCQNdAKQJnbQVV8LOPBQhvLRoZk=;
 b=i640jpE5owEForL+TTCtojf4dYXRujKMugPkG4Ryck9yP7ou+xfvL3iPjnl/D+tZu4
 6TWdSLhL63a8iF++BEVBHVeeAmzzQsBm5PH0vOIYLSD/+bRPRsbd6yIj5vbtU7pAL9Eb
 VW+zG91ZVd1MQWN3iGDkz84kP2H1PId/5AtDlQL8guGUSYfYQga8VILvWvmLcykz/ZuW
 JYVQxah6uj5LOkNdft2Rn98ZjuMW4mWkhJfLeOwgFd9HJGMsJXtC+Yi/WWowbF4bTdff
 S/Kpc+JPwrlxxoBXc2TuKc0LYPwZttccHycdjJD6AiXWIEmchdlNFqWUR0HzAMH5GVWO
 n7tA==
X-Gm-Message-State: ANhLgQ3Tcl43LQApLnA3z9VIV5DQDxGsmNqSJnd40M4ezbEYokUnEBRP
 bNJKonX7Bcf55NmpA8+jaQMgZ9SzB1s=
X-Google-Smtp-Source: ADFU+vvGqpBYk3EQhzi5Ry5WVZ9gbnjXOvsi7mGw4BTA2K94j4VfKAfGDB6E6Nws8lRjv832Amc92Q==
X-Received: by 2002:a0c:fc43:: with SMTP id w3mr4897359qvp.32.1584648076983;
 Thu, 19 Mar 2020 13:01:16 -0700 (PDT)
Received: from localhost.localdomain ([179.159.236.147])
 by smtp.googlemail.com with ESMTPSA id m67sm2226944qke.101.2020.03.19.13.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:01:15 -0700 (PDT)
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: Alligne a comment block
Date: Thu, 19 Mar 2020 17:00:28 -0300
Message-Id: <20200319200028.2096-1-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:24 +0000
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
Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Rodrigo.Siqueira@amd.com, rodrigosiqueiramelo@gmail.com,
 andrealmeid@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a checkpatch warning caused by a misaligned comment block.

Changes in v2:
- Change subject text

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/drm_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a9e4a610445a..564acc1f4030 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -222,10 +222,10 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
 		return;
 
 	/*
-	* Must bump handle count first as this may be the last
-	* ref, in which case the object would disappear before we
-	* checked for a name
-	*/
+	 * Must bump handle count first as this may be the last
+	 * ref, in which case the object would disappear before we
+	 * checked for a name
+	 */
 
 	mutex_lock(&dev->object_name_lock);
 	if (--obj->handle_count == 0) {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
