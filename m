Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF573673B1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 21:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233716E9F5;
	Wed, 21 Apr 2021 19:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925066E9F3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 19:47:06 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h4so33475185wrt.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wbsSVt7sDZG21p+Jtcnqvu0ncqhD0atmQImaH5s0bwk=;
 b=hXaSUZBKWs848qfeVqeV28s7ipAbNsGnYXpFqoWKSh0AnfRNyYL30Deb2TIxaQ8+Nw
 tzEq1y6VELyipK+ZTpYupeR2+lrbf5ECMqXiYmMTM2xkzXWunYg6QtMOsoI1RuM1INE0
 UAhmv+cWERrrCpP8mf6xAJVFjPIW6D1bUPMROipmAPIGQUc91IJbCxBjwdtvVDxXGZy1
 0iwxfI5yh2SDdpC852X1JzgmRqa9+sjhne1b9i4R+hsR6Sy07EN+opOjoQiNjuQaLxku
 zshAtna2LUOwHcf0Xwg4CoJJU5ZpIANS2v+idVRH3Ni6UlucvoMhP/Yq5K3boJOCb8q/
 QgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wbsSVt7sDZG21p+Jtcnqvu0ncqhD0atmQImaH5s0bwk=;
 b=evvA51xu11g34yIlAxNYpqlLVn5mYGUBw/+fnBPB4Pv3+IckdNhiaKgcWbAD42aZme
 husjgK9F84xq7mlqgf4oUg0mHlI9B1pWdyFe3WwQ6ZYIzm2GqrJGptzmNLvdVaiFJ9qs
 sVdnqo+L091ODfbXHm98DL+q+1pV3d/oxCya4lQ+77iK2Jmpjh4tQVsPzcW8mfpw0O63
 5t+qClO8fIzSPmelTTFFv/nsK3OIf3RRtY8EOyDBTjzHZSbY3UeSPei8Jk/gKWW1GRkY
 ppejvbC+lQ+j7lpy04LMzFK/UjrpKicMtZa8Dvq9DKfrCjAyujBYwENrgGUHk6I/gmz6
 RO/g==
X-Gm-Message-State: AOAM530VrYsN7oBvJk4GIooG+0U41QW1+DXwveMzXhLZg0DLFOrO5FRu
 5mxCWQIwvUTVKm1czjcvqc0=
X-Google-Smtp-Source: ABdhPJxP1aXh5dtJXaC5CzIhfHBRCWzADTDBq/drjfza2c9pNgFdMscavfFKqAewtHOEZ2qU6u0Kyg==
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr27714506wrq.161.1619034425291; 
 Wed, 21 Apr 2021 12:47:05 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:6d3d:2d8b:5417:831c])
 by smtp.gmail.com with ESMTPSA id
 c6sm13004217wmr.0.2021.04.21.12.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 12:47:04 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/5] drm: drm_auth.c: Adjust end of block comment
Date: Wed, 21 Apr 2021 20:46:55 +0100
Message-Id: <cd1e8f6637b914825ee4b9643a4e9d9eba49f276.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
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
Cc: melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new line with */ on the last line of a block comment to follow the
Linux kernel coding conventions.
Problem found by checkpatch.

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/gpu/drm/drm_auth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f2d46b7ac6f9..f00e5abdbbf4 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -300,7 +300,8 @@ int drm_master_open(struct drm_file *file_priv)
 	int ret = 0;
 
 	/* if there is no current master make this fd it, but do not create
-	 * any master object for render clients */
+	 * any master object for render clients
+	 */
 	mutex_lock(&dev->master_mutex);
 	if (!dev->master)
 		ret = drm_new_set_master(dev, file_priv);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
