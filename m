Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51879A9E472
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 21:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3747310E048;
	Sun, 27 Apr 2025 19:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ACxOZXeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2B410E048;
 Sun, 27 Apr 2025 19:30:47 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e61d91a087so6194202a12.0; 
 Sun, 27 Apr 2025 12:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745782246; x=1746387046; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vq2NZtyVOEuDGpHaesgQUonw0VF6mQCOOpBxn+1+3Tk=;
 b=ACxOZXeYqHArMslPd1M5qraGh7uf2GEmcdmoByY5Pa7XkaMF7VoqgGUj55W9ympCZI
 NLLVlvoNbCZq29I1S1dmDgu070xzpPPZ3tmlALBA2SUGJYzwvTNHxmptXMIJR1xSpgXH
 Szq5F8k2As4VIhY/PJJURbAv1Nzr2eW5+nUDRrm2m8K6Ba0lGzha8yeREPB5NFu00wJL
 +PyIksPiBs9FRHmKE4uHZOh76tokUlldEkQoslYs/peGgHC2kqWG42Yp0wS5kLyeiLNy
 o3lkZfwl0pMj4VASLUY3ccz1+slSfKoi78ahUe88O6prkDaBTN/Vn2ZjUpFeYXPLJQUL
 Dyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745782246; x=1746387046;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vq2NZtyVOEuDGpHaesgQUonw0VF6mQCOOpBxn+1+3Tk=;
 b=hKnhxh+Ttc2Os48A3Bv9B8Y49w95imqR12wmUQ6FanNNn/vBSS8x/2pP7Qt5dNx34z
 9ec2/ab26iUJApfZMhQCVURg3EV6VeFDqN00iPVVqCxQS10y8THIYpYK8mJ2FqIbloMf
 J/ZMOhKwbqxHSRVcZ5/PPW35Ba9BZJRCznZYM2T1Eno3neusoQRAOzrlQKWF6EN0sKTV
 0Hkn/pY8z1I7bm9OMojb8QIsb6wi7Wgr9eNPTTY4QML9djOHdG7ghGZD2gr+cFuPDElY
 STOpZc30B2VOFqi7OU+x0OXKo+99e5q+sc06Bq3MuUDa4Lw8/zgmXkt2sCJnC+4wa0qU
 vn6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmHMB8WrOzMyS1ASnAL0E6YGoL779ctmX1HSRbdDV3/dxcS1SKU1237UPHejgaplgvbV82iwXf1hM=@lists.freedesktop.org,
 AJvYcCWvT8XPg4Hk0Hmtr7vftmJIlgG/jc++/zfEv5Z84x+RCHQQ1ZKjM785S1j9He/sTe9q5TgAGaPxpJHp@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxuu+B+HVahajURxqOYpFT3digyw1h8PdXK3Hev5GrU9Vft4/Yr
 FaMCvQgr1oSBHTKptsP7TWniI/fCrPhc78DTPm9afJyBp5G2XQhqZiL0VeUp1iY=
X-Gm-Gg: ASbGnctSZuE7JuTFrpqdttFyn2gqdu4GLkqi9ODRurySoJre9Anu3lD9x3HXm82Q5bP
 dhD7cP8HngnCvc6zBTDRQt0maQr9T9yqU555gJbVI3GzyE6DCd9Z5+mOL09Q8S3o1qPdfWCC58I
 U7mIGOxgC4P/Whl79zPP9ucABh0SCBt4ZDTznsGClqbMQjI6HLJB7qrtIykXw0uHp6Tw5egwF8I
 jBjsymrpkWORGVGKapPhKnR3YXBuB0+naK6NvbHOx2QJHiAs/KPnhVD++XwvjaG8dvuz9G2Vy6N
 qz3Uk+h2xM6OZ3eeIASIoRNHccLsNkyYhqnK6Cqr
X-Google-Smtp-Source: AGHT+IFqrHYYNndTHBqETij9GGWRLa1eTwCtVYc0JJoktW+J8p6FM13VUwFnm78bj89E7k/qB+FIsg==
X-Received: by 2002:a17:906:f5a4:b0:acb:b3ee:fb9b with SMTP id
 a640c23a62f3a-ace848c0153mr529006266b.1.1745782246038; 
 Sun, 27 Apr 2025 12:30:46 -0700 (PDT)
Received: from pc ([165.51.118.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edae042sm486027866b.169.2025.04.27.12.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 12:30:45 -0700 (PDT)
Date: Sun, 27 Apr 2025 20:30:42 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] drm: i915: gt: replace __ATTR() with __ATTR_RO()
Message-ID: <aA6F4mbg_sfGRXzh@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace __ATTR() with __ATTR_RO() to make code cleaner.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpu/drm/i915/gt/sysfs_engines.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index aab2759067d2..f6149167de05 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -27,8 +27,7 @@ name_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 	return sysfs_emit(buf, "%s\n", kobj_to_engine(kobj)->name);
 }
 
-static const struct kobj_attribute name_attr =
-__ATTR(name, 0444, name_show, NULL);
+static const struct kobj_attribute name_attr = __ATTR_RO(name);
 
 static ssize_t
 class_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
-- 
2.43.0

