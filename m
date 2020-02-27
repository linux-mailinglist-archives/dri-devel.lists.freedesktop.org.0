Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BC3171808
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0516ECAE;
	Thu, 27 Feb 2020 12:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421786EC96
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:04:04 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z15so3040364wrl.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5RmVYnpM+0YRA6Cv2NCMoJPgFkzlEM1UmxN/+rA46XY=;
 b=eYp7pK095FWJZ22AF506/TxhHaBaOUrk6NBpcrFHMd7Q1CeGnht2M2Isss9iDeLBI8
 KL4fsGDE/euAxYh219pEjWMbkE1Xs7EKw5PSlShRq+Hf9AknfRpZQnInkBNGXTvhnX0J
 mLEnA01NnD/XNycEpdVZUJ08nsV4RU5aau8gTJmldLpHI5WtXFKFhf/SODX3oTnDnTN/
 UaEi/uF1vqwYto5JhGKr3gAajyyCrRqEIZZmeaclxt2e9imBYcWPbVlWopXp/2so0qWV
 UUPdH843sXBS99qT6Hi0/+ohXETPvMXjPWoOAENdeQWrVVWDXQmAyMPS306mgfOmtl5d
 277Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5RmVYnpM+0YRA6Cv2NCMoJPgFkzlEM1UmxN/+rA46XY=;
 b=NqhW/xcgdW62n+mlNWx/CdakOFX9gDzZ2GrUCeosEZbdgBbXiiUTY9owec4NPDuQCk
 WTK//hvhSlv5e9JCO4lN9NPvsvZYxEoWnlEipQ4Unz5zLN8PEQ5ex//DAfgJr1h/q23C
 k1ymMPHALXl9h4RiL9n5MTvTuRTGD5b52nX0tK4DmysVhs0DRHGwKja1ZC+FzlxKC82O
 S61vVboAQg6DtYLyeOym5GAoXcSHU27JhP2kOfZBEuR0EFlGyyRuY0yh4MB3oUVeHWIb
 rf0nTXeDT9YqvbzqOXXshOjq32DAiIJXP8buNoemtFgsHMELIJgCv2p9nWhutzAyMDVj
 joag==
X-Gm-Message-State: APjAAAX5GZ9Z2v/D9pR6yea5PFs20Ipg4tzuglVufMV+m371sYg62v0F
 7MmWy1Plp/ThZ3WGERm3ZE4=
X-Google-Smtp-Source: APXvYqz4WeZdLGhzPJnokepnWxHo1W+4oAupLckaGCVy2TSEI09yxz0Zdl8ZBaoACC7g6gyM+DcRQQ==
X-Received: by 2002:a5d:424e:: with SMTP id s14mr4834741wrr.226.1582805042932; 
 Thu, 27 Feb 2020 04:04:02 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t10sm7655017wru.59.2020.02.27.04.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:04:02 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: daniel@ffwll.ch, airlied@linux.ie, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>
Subject: [PATCH 21/21] drm/arm: have malidp_debufs_init() return void
Date: Thu, 27 Feb 2020 15:02:32 +0300
Message-Id: <20200227120232.19413-22-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227120232.19413-1-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 12:59:10 +0000
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

As there's no need for the return value in malidp_debugfs_init() after
the conversion of the drm_driver.debugfs_init() hook, (drm: convert the
.debugs_init() hook to return void), convert the malidp_debugfs_init()
function to return void.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 37d92a06318e..def8c9ffafca 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -548,7 +548,7 @@ static const struct file_operations malidp_debugfs_fops = {
 	.release = single_release,
 };
 
-static int malidp_debugfs_init(struct drm_minor *minor)
+static void malidp_debugfs_init(struct drm_minor *minor)
 {
 	struct malidp_drm *malidp = minor->dev->dev_private;
 
@@ -557,7 +557,6 @@ static int malidp_debugfs_init(struct drm_minor *minor)
 	spin_lock_init(&malidp->errors_lock);
 	debugfs_create_file("debug", S_IRUGO | S_IWUSR, minor->debugfs_root,
 			    minor->dev, &malidp_debugfs_fops);
-	return 0;
 }
 
 #endif //CONFIG_DEBUG_FS
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
