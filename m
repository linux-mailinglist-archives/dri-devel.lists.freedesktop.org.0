Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8001893C2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 02:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842566E85A;
	Wed, 18 Mar 2020 01:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909C789B60
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 21:06:03 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id f3so35155466qkh.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vdiK/K3dvfcLjdBU9Aq5+NpRaZi8TfMUsERWtzgU2PQ=;
 b=rDrvcQttb28q0tTTlvqT69dEpcKnrP7/n43mH+rN34dBE4N4qT0eI0FVg+3A8n8L4D
 5nB+dUQMnllx+AJb0sukZ4ybEFYmr+yostsv8qfCOuyeE3a/+JX+qDtEmMhjzfH7dqsM
 mhrwy6kQw51dU41GgWWIDaj1IlIu4JgKT/pFTFdtUKUzAQwsjiOiTffAR2UTSPgdiTeF
 SGRSWCfq5sZUd2QYY+8fZ+CknAsiGkJ+urq5zZnf/LY3uplcbaBjJ/JeMh9AEEN0BV+s
 LqnesuLCrUt6/VHkNobWJqzeUlergomSx+hICPFDCatLACtXeyONlb5HrY8VwCKRGlIB
 1xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vdiK/K3dvfcLjdBU9Aq5+NpRaZi8TfMUsERWtzgU2PQ=;
 b=X/14G0MF6xfGPNDnJsF0xuFEggqtrx6ZBIaeuO2mP8LgcQqJJsyhGaDMFnIrYE8DcC
 DLq9zPIqhT1mYjfOo3l+Ll+iUTAzOaPd/6aCxXhxMTNt9vmhAvbVYOgMzug6FAwl2guz
 8vS8mmVnzKcII8304WHpjzbEHjizUb7JqUXHcopBC/mfbRP4FYEkSFsr7nk0cMdwKfgE
 /S0nhZ49RbLKm0bnQVw3qpF2f8tcvxpclLmLwZUzGKFHDJINO7wI3lLWMA2Dpi4E6Va0
 O69LQhbFvhWYpq0YkdjOfNpAvBK34SOMZUoUINHgd9uCGsIOMaa8ZubwMi/TACvWxUaW
 UHBQ==
X-Gm-Message-State: ANhLgQ0tYaJ3Kkh1AJtMWOvszlVTJpsK4YEDDYuANJkMG2jMUVKMCNcY
 oQNuuXT5g3Z9kbqmq+KDyvQ=
X-Google-Smtp-Source: ADFU+vu/MfSxDYIvdrPpn7R600MIh8U0c6YMpF/wV+Xeg2HAChVwbBbQ9wbloHp5NOw/pGzR8JUxmw==
X-Received: by 2002:a05:620a:124d:: with SMTP id
 a13mr867875qkl.278.1584479162648; 
 Tue, 17 Mar 2020 14:06:02 -0700 (PDT)
Received: from localhost.localdomain ([179.159.236.147])
 by smtp.googlemail.com with ESMTPSA id s195sm2696891qke.25.2020.03.17.14.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 14:06:01 -0700 (PDT)
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: Correct a typo in a function comment
Date: Tue, 17 Mar 2020 18:03:39 -0300
Message-Id: <20200317210339.2669-1-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Mar 2020 01:38:24 +0000
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

Replace "pionter" with "pointer" in the drm_gem_handle_create description.

Changes in v2:
- Change subject text

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 6e960d57371e..c356379f5e97 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -432,7 +432,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
  * drm_gem_handle_create - create a gem handle for an object
  * @file_priv: drm file-private structure to register the handle for
  * @obj: object to register
- * @handlep: pionter to return the created handle to the caller
+ * @handlep: pointer to return the created handle to the caller
  *
  * Create a handle for this object. This adds a handle reference to the object,
  * which includes a regular reference count. Callers will likely want to
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
