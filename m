Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25061563329
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 14:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC9111BDE9;
	Fri,  1 Jul 2022 12:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FE511BDE0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 12:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656677286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B65LnvwVebM/Zu3VWd+syVDDl93qGF7mRqg6vAIs64g=;
 b=fxBWzWYSEb9DFSBUEOpX4y0xGbqv5HDBvFhl8WZ/mQqg2U+nLRmU+Al2+JHlKUQaaJbcBp
 /P9M9BlxxLi/MrkTexYIoSEiihNt76K1DzQphztruPuRQCjUsPwZe5vx8k/gQUXp3kc+m0
 kFPXTl8jX+lvI9qhXOXXzXBiY6WDnF8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-n7yM22MWPZG6YrEXudVfeQ-1; Fri, 01 Jul 2022 08:08:04 -0400
X-MC-Unique: n7yM22MWPZG6YrEXudVfeQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 e24-20020a05600c219800b003a0471b1904so2966972wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 05:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B65LnvwVebM/Zu3VWd+syVDDl93qGF7mRqg6vAIs64g=;
 b=PW8nKcW1UcVxcMuYwZTwE7B1EMD7dlM6Ul+HHX0g1a+YJLxJZ17LCkA+2nZ7Xb11dK
 I4KFrCZ5zoohEa601MqCkl8uLyreJQWYzun8QCDd59E2zC9YJDQC1sbtHH5OWVEaHYOu
 VwvdSoJ+2Xbd6lpNurohf6yzlanID0AXKlfzEk56/Rw3Ojhx+Endv5TvJcBL4XfbiZQT
 kJ7A6sa3xkIXc/E1YpzSDD7Grczb7Ov1iAfb/wO/O5+4RhJObveErlmr3+kwLytqDf3g
 qlDRvA6qhuI71vmSPDA5WyY0yTBWqdz9S++MzAp2INzMcobXQ02Gnoq384XOkxWo2d/5
 ftqw==
X-Gm-Message-State: AJIora8fMcYZiyK7U6I6LosrD92DteoopFcZUnSbV3NxLuaV8cFV/ONg
 ZmVWlHcjhqFF+INtFgBFhpQsTerAEumtuAVtyCiBDePvVnXnNoaHyoy17R212DSEu84DgIrYtms
 eJyYN41uDHMb81z53XfGyxVk/zo3p
X-Received: by 2002:a5d:4251:0:b0:21b:885b:2fcc with SMTP id
 s17-20020a5d4251000000b0021b885b2fccmr13751013wrr.52.1656677282621; 
 Fri, 01 Jul 2022 05:08:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sC9Tmd/ElcPrMcZ/REfD/aw5cCDOVahi1PhOsK1QGHWkyFQshHyOgr1yV8DRgNx5hGf1doqQ==
X-Received: by 2002:a5d:4251:0:b0:21b:885b:2fcc with SMTP id
 s17-20020a5d4251000000b0021b885b2fccmr13750991wrr.52.1656677282355; 
 Fri, 01 Jul 2022 05:08:02 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v4-20020a7bcb44000000b0039746638d6esm9813160wmj.33.2022.07.01.05.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 05:08:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm: Use size_t type for len variable in drm_copy_field()
Date: Fri,  1 Jul 2022 14:07:54 +0200
Message-Id: <20220701120755.2135100-2-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701120755.2135100-1-javierm@redhat.com>
References: <20220701120755.2135100-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The strlen() function returns a size_t which is an unsigned int on 32-bit
arches and an unsigned long on 64-bit arches. But in the drm_copy_field()
function, the strlen() return value is assigned to an 'int len' variable.

Later, the len variable is passed as copy_from_user() third argument that
is an unsigned long parameter as well.

In theory, this can lead to an integer overflow via type conversion. Since
the assignment happens to a signed int lvalue instead of a size_t lvalue.

In practice though, that's unlikely since the values copied are set by DRM
drivers and not controlled by userspace. But using a size_t for len is the
correct thing to do anyways.

Reported-by: Peter Robinson <pbrobinson@gmail.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8faad23dc1d8..e1b9a03e619c 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -472,7 +472,7 @@ EXPORT_SYMBOL(drm_invalid_op);
  */
 static int drm_copy_field(char __user *buf, size_t *buf_len, const char *value)
 {
-	int len;
+	size_t len;
 
 	/* don't overflow userbuf */
 	len = strlen(value);
-- 
2.36.1

