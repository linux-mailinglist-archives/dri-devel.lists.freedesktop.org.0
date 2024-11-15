Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444059CC857
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 01:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E7710E021;
	Fri, 15 Nov 2024 00:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jTXMG2Uw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A7C10E021
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 00:28:01 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id
 6a1803df08f44-6d382677c92so6208756d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 16:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731630481; x=1732235281; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AckJs17h8oFYm8gxJqkO2zFuSFnXtXF7hHg/dwrY0hU=;
 b=jTXMG2UwuF91LVQUTQ0UPTzaYVojU6v/EgBd8ZqQCpYujubNDRpD5Ut2ntlKC71qRl
 mYqf0PFRADaIVtujCmdV1dbDp6dNcpfx3tA7BkWEIhaLJlPQozugLQqQ6ByF91OfBcwD
 zaYG3iY8U8ECJaYJ2tyBjxGajIpJ9QrCkKTgK+fHjHagrL16bxIJ0FrMLp/Tbzm3XLc5
 I2u3fMy/C9YtvfwIxBO+NhvpNMjNBF78PlIv09r0jXrMp6he+w6Fb3e6I4JrrX9xjy/t
 Jo0ziNZVzFozpvK+Sj8iPDTTXB9TVWMNHRoXWVpSm8s6OMnQue7hIyCn+es6PF+RT6Tn
 Sn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731630481; x=1732235281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AckJs17h8oFYm8gxJqkO2zFuSFnXtXF7hHg/dwrY0hU=;
 b=GJ3jC+NJs05lWEVf6oJClvNN8qfBrDZR7dWHRD24v3pDh++Cc1jv5Cps+qKVp6wOj2
 maJ1xDGi1zZqBbTvbQB5biXLby0S1oEY6SIiHgDvTAx9kbLsysfRAGEWVHIJiwCAoX2h
 3hFsabQur3K2f4J6YeiGaQrTvDcZaCoi3YC3+4oT7v7HllEVGugxHA1I1uSudqTXa9Fi
 OqlF1z/W7cMUZ5xhxnFClfSrNbUnc2WZ0bP29aHX9iT2mDP/r72giYZbi8/c2Ro2jWo9
 g3U7q0y+sJc62FtWXXCY639Cqjdh3rSu5aLUMaows4tEA+B26gwU2l/GMMdJ7o6kBb5J
 Hkew==
X-Gm-Message-State: AOJu0YwmlPQlBZUJJcEIsoFKFWfHj9dbd7poZdr3CinEsBMDkkg45T9j
 xrziZnfqR5WlJ6cHIixjpK8YP+1Pj4LZUP8P3hd2fIgu0RcfojzD
X-Google-Smtp-Source: AGHT+IE8CM8z6r6RWGEMOZtmU3M9Sl1kjXSgJfQGnc2KuyKdrIalHlMViVR1oGXXUsD9w6MBT8IvZg==
X-Received: by 2002:a05:6214:390e:b0:6d3:67df:5f97 with SMTP id
 6a1803df08f44-6d3fb734612mr10901216d6.7.1731630480766; 
 Thu, 14 Nov 2024 16:28:00 -0800 (PST)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d3f745235dsm7847666d6.94.2024.11.14.16.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 16:28:00 -0800 (PST)
From: Gax-c <zichenxie0106@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, seanpaul@chromium.org
Cc: dri-devel@lists.freedesktop.org,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] drm: Use array_size() in call to copy_from_user() in
 drm_mode_dirtyfb_ioctl()
Date: Thu, 14 Nov 2024 18:27:49 -0600
Message-Id: <20241115002748.7200-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Zichen Xie <zichenxie0106@gmail.com>

Like commit ac19c4c3d02e ("bcachefs: Use array_size() in call to
copy_from_user()"), it's a safer way to use helper array_size() in
copy_from_user() to avoid potential overflow issues.

Fixes: 7520a277d97b ("drm: Extract drm_framebuffer.[hc]")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 888aadb6a4ac..323fb194ca17 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -752,7 +752,7 @@ int drm_mode_dirtyfb_ioctl(struct drm_device *dev,
 		}
 
 		ret = copy_from_user(clips, clips_ptr,
-				     num_clips * sizeof(*clips));
+				     array_size(num_clips, sizeof(*clips)));
 		if (ret) {
 			ret = -EFAULT;
 			goto out_err2;
-- 
2.34.1

