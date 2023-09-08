Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02EB7990C7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4E310E947;
	Fri,  8 Sep 2023 20:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D4510E947
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 20:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694203410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7XXAxDLUmZdx81fESQwCFLbPlVQDp3wBmzbmeWO24M=;
 b=ftcERXHCY+QrbOYXa3UvtoK2vTipaVq01e0K0xdNUNW8KK/AAeRc3wHqoCcuAo7dGgKXUL
 vFApQQg9sN62otjm3/GHTTQe6Gbz/82Rug7PuqMaDeiKAAvhei61jrmFFjjPIWcIKLQExH
 SMPyccHved15Hc9NatSSPMhE6Zg+aks=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-OqYXXQ_YOFOwwp6wHCTs1g-1; Fri, 08 Sep 2023 16:03:28 -0400
X-MC-Unique: OqYXXQ_YOFOwwp6wHCTs1g-1
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-5711c85f02bso414315eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Sep 2023 13:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694203408; x=1694808208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w7XXAxDLUmZdx81fESQwCFLbPlVQDp3wBmzbmeWO24M=;
 b=vrUmuEmxxcZ7VtZomm5Z6P8SoAxDSVtoHYRqauGYXPrBTgMtHohBaCVzLCiT5cIkw7
 FpUbETP0C4m4AdaNI6MlVLiO7EQ0jMlFY+C5ZRqtHZFibqWlQ3l8Do+UGy4CwVHs8h4Z
 nS5Bb6tsfipt8Jzn1IHe+e0D5jQzz4yzkLkyW0yCpvlWhkCcWtrAm2H8VjmdhYnLC9Tu
 TDm0nIF19vnvh/Dt0LD1XcNTckGKVWEOPR3QApQu8V6DtpUSzwmAKMnKCT5pCrAz8nd6
 Ua3INO5mZaBCtxCPGHZ3PbARhFtYBU7Kw7PRiuEERUL2zmO+ED6F0c8XSBvydJtm1zKD
 pYdg==
X-Gm-Message-State: AOJu0YxGHP0VfZC4tgWMt0COLEXM/29YEbM9huOkcu3jt/D/bGnxzC6T
 Vlb+QZgTS/cdShN0bNMD/u0K93HwMioQioIV5bIpaeTH6oXqRdu63r+Zg+YL2zL8RhnfZtNayZW
 weh/oLoq3yCL8W0syeEEPW005po/p
X-Received: by 2002:a05:6358:e9c:b0:134:c407:681f with SMTP id
 28-20020a0563580e9c00b00134c407681fmr2557593rwg.1.1694203408130; 
 Fri, 08 Sep 2023 13:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4gCAzKUix7oIOcBNdjPHJEb7aCyOwwUAu2PzcC43CT3hwK4BjknICUG8MLI4Ii5zItWgaJg==
X-Received: by 2002:a05:6358:e9c:b0:134:c407:681f with SMTP id
 28-20020a0563580e9c00b00134c407681fmr2557556rwg.1.1694203407699; 
 Fri, 08 Sep 2023 13:03:27 -0700 (PDT)
Received: from fedorinator.redhat.com
 ([2001:9e8:32da:e500:513e:fbe9:e455:ae67])
 by smtp.gmail.com with ESMTPSA id
 x29-20020a0cb21d000000b0064f53943626sm971150qvd.89.2023.09.08.13.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 13:03:27 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Kees Cook <keescook@chromium.org>, Andy Shevchenko <andy@kernel.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Christian Brauner <brauner@kernel.org>, David Disseldorp <ddiss@suse.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Siddh Raman Pant <code@siddh.me>,
 Nick Alcock <nick.alcock@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zackr@vmware.com>
Subject: [PATCH v2 5/5] drm: vmgfx_surface.c: copy user-array safely
Date: Fri,  8 Sep 2023 21:59:44 +0200
Message-ID: <3d2b36a2cf7bbff1b036f474eb805e19be3c57f5.1694202430.git.pstanner@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694202430.git.pstanner@redhat.com>
References: <cover.1694202430.git.pstanner@redhat.com>
MIME-Version: 1.0
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
Cc: Philipp Stanner <pstanner@redhat.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 linux-hardening@vger.kernel.org, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there is no overflow-check with memdup_user().

Use the new function memdup_array_user() instead of memdup_user() for
duplicating the user-space array safely.

Suggested-by: David Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 5db403ee8261..9be185b094cb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -777,9 +777,9 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	       sizeof(metadata->mip_levels));
 	metadata->num_sizes = num_sizes;
 	metadata->sizes =
-		memdup_user((struct drm_vmw_size __user *)(unsigned long)
+		memdup_array_user((struct drm_vmw_size __user *)(unsigned long)
 			    req->size_addr,
-			    sizeof(*metadata->sizes) * metadata->num_sizes);
+			    metadata->num_sizes, sizeof(*metadata->sizes));
 	if (IS_ERR(metadata->sizes)) {
 		ret = PTR_ERR(metadata->sizes);
 		goto out_no_sizes;
-- 
2.41.0

