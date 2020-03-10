Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69F0180C89
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5231B6E905;
	Tue, 10 Mar 2020 23:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2B36E2DD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:31:39 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a132so1422788wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tXUXpfsdCjWegFjK6o49/yfS5Hf4azfEJHKKYm1M5aw=;
 b=dsgViamHkuqL5E/qu4DHG2LJlKsYVc627GdlasOH5Z89EYsnD5i5Nw17QW4E9KKkqo
 XbsZ4XCLuBtfssOPNBC3TZqU8fw9oWFxQQG9FlqUaiowl9Sa1lm6xk3pQcZi1jGcy+Sv
 lF1h5ynuNO3P7z4/azbtL6hvN5dT37YcyjWyeK5gXNMjTdLYbVpLHRRMeGXtVr5OGqVP
 VaeuDz5Mp6azujkEkxS0J94Ko7p55X5bQpmLFUR8/upcFDTOaTJFOyc08XiE7w1lJUo5
 xD2q3LkyLcdtEd59fgCfa816rmpnvqjms+dukHMz2+IG1Oe3B0PmuW8xw8h8FbJr18JI
 RJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tXUXpfsdCjWegFjK6o49/yfS5Hf4azfEJHKKYm1M5aw=;
 b=NVsQKYjvUOheBXxKFbVfEbPhSgrnSGTK3CtSQLfQXbSiqJrOosRzJzQvkRPM6wIpal
 MYj24ziLPuGzVHGed+i2XRwgc4t/iCK/WAVZ6O4HzRKLvYfOqNJO7aXJjex/MdI+uZso
 pxAqnTBORI/Ex4pLMS4JsB3+1ok3fO9EEl1SiqjMtpfrQZZOr3qMAS0Rxn4lA1HAnqBO
 mksaqBLozISRDQ0pC7xXGNQ/OWkT0rl9vlBJaLuQxvWILlwgSyIrvjgPJ0aOErq7u6nA
 SlJNS53OkUzlBkewE76uM1la86jWJfAFieb1HQLRMP26hUEpVfwOhNXPErO8/pmirCg+
 S9Iw==
X-Gm-Message-State: ANhLgQ3OwRInUJykOXQ9I7X6xs1hjQBKw0TawhdlprGwZcNTMMPewnRy
 Em/BsycHDzkNrFOabtHkrTE=
X-Google-Smtp-Source: ADFU+vt6mBL4lirRwCfawoFlTde/BBVc6SCRegcT2K0roRx4Tto3ds4ertE+WbaEScxvCAapXCTVaA==
X-Received: by 2002:a1c:5684:: with SMTP id k126mr2236302wmb.181.1583847097802; 
 Tue, 10 Mar 2020 06:31:37 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:37 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	eric@anholt.net
Subject: [PATCH v2 04/17] drm/vc4: remove check of return value of drm_debugfs
 functions
Date: Tue, 10 Mar 2020 16:31:08 +0300
Message-Id: <20200310133121.27913-5-wambui.karugax@gmail.com>
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

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails and should return void. Therefore, remove unnecessary check and
error handling for the return value of drm_debugfs_create_files()
in vc4_debugfs_init().

v2: remove conversion of vc4_debugfs_init() to void to enable individual
compilation and avoid build issues and breakage.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
