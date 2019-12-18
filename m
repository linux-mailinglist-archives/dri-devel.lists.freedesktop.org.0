Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F2125C67
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 09:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7F96EAC5;
	Thu, 19 Dec 2019 08:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAF06E87C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 16:15:13 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 47dKq361Pxz9vZKY
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 16:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0t5vDGJsFk6K for <dri-devel@lists.freedesktop.org>;
 Wed, 18 Dec 2019 10:15:11 -0600 (CST)
Received: from mail-yw1-f69.google.com (mail-yw1-f69.google.com
 [209.85.161.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 47dKq34ksmz9vZKR
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 10:15:11 -0600 (CST)
Received: by mail-yw1-f69.google.com with SMTP id q130so1645715ywh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 08:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qOckGjyMkemghi3Y5ghPJ9HepPoz/TI4eTpGQv8uuB0=;
 b=LBGI1dSL721DXiRMdlxO9OgIC+cHa4/bWDIWiGuVIsT9SfjGy0VWgwRkdoaO77FrRk
 kjevZwS20wMMcfEN20PAYvJW2YQeRONsrBRBtYO0XtSYHVYkNlxfgDHzXUQArkqQHStA
 lYclFosKI7BEg3XeENJCDP1nAD9G3FRBAu/fM70AukXjilg141GzlehLzKwUPOW6xHxv
 mXbFx+I4D1C0YITIcmwCFM82yUQiOY4DMj9u8gaHO7GdDgQ3E9cbSSIKc9C0SE8M+G9N
 9PUAPWPEdhJLBESLDgy9ddw6/RUav14ZuinIuXrCUxemaXie9FsYBGEwjdahpeIXcetP
 xx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qOckGjyMkemghi3Y5ghPJ9HepPoz/TI4eTpGQv8uuB0=;
 b=LXdX1uPQxY990rX+AMms6dp7SeIoI6nuYnL7ulvFknC5SoTQlZFFk2xNEvS7lazNUe
 PEc3kMWq8QpUd5pBK6r+eGKeIYQgXgi9YBWrOFoSE9mwuocmaxZYDx5+7L6dYpvCVHBi
 M9rGynkIq+UzunJJwNCG81VwXi04BczzP8Jh8pKdNZZUFH4sKXyydXL0qryYk0tZvGcP
 nEK8IMfjc5ZE4HXqfEE278l7VkBMeJlXqD7K5aeFVE6DH6HfpYv/RBC8LOzFSkV8VGND
 mbRAK/dK79Jzn/ebsRFN7KTu9Y/Foh1I1yxwPNXvKBIi6xmW/P9BJ4M1u7V9IAQpVPtu
 3CUA==
X-Gm-Message-State: APjAAAXsCNrBl88+BoKa4wpxGkz/8pgHxnJOdSLxbUgNtJhdp/7lLzw+
 8kY3i55c+LvWvwaMdxe12w9QhsK4lHidBxJ/+ycAh9DC2hAM0+Aw16FiM1JMQjhE1xuzft0NE+3
 x/46QPbrod2Fpw5/VYFJplYBURveSkKhq
X-Received: by 2002:a25:33c2:: with SMTP id z185mr2694544ybz.477.1576685710890; 
 Wed, 18 Dec 2019 08:15:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqwXNkytcdMy0zBtt0dCkZST2hQpkfH7TiOeIocMwvlZuJgokwWfh/oIOnlpTBiFOFnKN+CPNQ==
X-Received: by 2002:a25:33c2:: with SMTP id z185mr2694522ybz.477.1576685710626; 
 Wed, 18 Dec 2019 08:15:10 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu.
 [128.101.106.66])
 by smtp.gmail.com with ESMTPSA id m16sm1034836ywa.90.2019.12.18.08.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 08:15:10 -0800 (PST)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/amd/display: replace BUG_ON with WARN_ON
Date: Wed, 18 Dec 2019 10:15:03 -0600
Message-Id: <20191218161505.13416-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:11:13 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Francis <David.Francis@amd.com>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In skip_modeset label within dm_update_crtc_state(), the dc stream
cannot be NULL. Using BUG_ON as an assertion is not required and
can be removed. The patch replaces the check with a WARN_ON in case
dm_new_crtc_state->stream is NULL.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7aac9568d3be..03cb30913c20 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7012,7 +7012,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 	 * 3. Is currently active and enabled.
 	 * => The dc stream state currently exists.
 	 */
-	BUG_ON(dm_new_crtc_state->stream == NULL);
+	WARN_ON(!dm_new_crtc_state->stream);
 
 	/* Scaling or underscan settings */
 	if (is_scaling_state_different(dm_old_conn_state, dm_new_conn_state))
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
