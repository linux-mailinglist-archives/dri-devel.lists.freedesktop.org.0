Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C349043E6D8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 19:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8D86E062;
	Thu, 28 Oct 2021 17:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5E66E062
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 17:09:04 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i5so3748856wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WAbjpyNIObv3EEIclB7WzO568kwMWV709p1f4VyN03I=;
 b=kzJoBwUj75tmOyGdgEWGWeJC/zW1azIvNhWlxNLeOv+FJztui/qwA9oJFKba8Zgwju
 lOJ9mlqKZM05iC9i/muGJHNs7VvI5FJsDvy57Mb96WLB0OmqGyW3qDMIjUbpXTgvkVqa
 YCqalGNsxNzxGrPE8ECsNzzmvTaIsTInbo6dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WAbjpyNIObv3EEIclB7WzO568kwMWV709p1f4VyN03I=;
 b=1GkZ3pKfNct2O8TGyc8kjLkwWvTRhcPjl4IkSRnd5ousF1FLS1RvdGJgT/v8RRqyf9
 Enym9oXgCBPs8qWP3viqzAvIpDT34dIZxolZbLjIefR9IRgoa82QgjZVGwJ1iien+xHq
 J9WgFHDHhgUEO2G3Yl6ahwV3q6mcWBvsw29RFjCyOZnrj75GT0GJuKUuuHokgGGOxDuG
 W/gmEKiD3QLPD5VgoYJvSZc7xzm4YAxaacQ2y5RFpPUXAx0QcjY/su0dgCZtOm+WYiF5
 QUVcUzHLv4Toy1scy0vPjJZ4fDWs7AohIZgkNdItYqj5WwvB0tp9P2Gdg4UvkfnXvqWq
 ukIw==
X-Gm-Message-State: AOAM531jvZSAb2CkoxyqcY0YKpEeeaqLAHI0X0zpfif0zsLi6D++UiXA
 lC5lYv6BPrd1wQNuBupyTe2u4RL8jcfTbA==
X-Google-Smtp-Source: ABdhPJygHAaR9PKwb+LccpCL05rpStbMFTd3a4DTBPRYAMwbm8l046pINc5EsTf4ZfMgNdLOEXHtcQ==
X-Received: by 2002:adf:cc8d:: with SMTP id p13mr2800373wrj.274.1635440943367; 
 Thu, 28 Oct 2021 10:09:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o23sm3447087wms.18.2021.10.28.10.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 10:09:02 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] MAINTAINERS: dri-devel is for all of drivers/gpu
Date: Thu, 28 Oct 2021 19:08:57 +0200
Message-Id: <20211028170857.4029606-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
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

Somehow we only have a list of subdirectories, which apparently made
it harder for folks to find the gpu maintainers. Fix that.

References: https://lore.kernel.org/dri-devel/YXrAAZlxxStNFG%2FK@phenom.ffwll.local/
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Steven Rostedt <rostedt@goodmis.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98aa1f55ed41..fdb1f91c6bb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6153,8 +6153,7 @@ T:	git git://anongit.freedesktop.org/drm/drm
 F:	Documentation/devicetree/bindings/display/
 F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
-F:	drivers/gpu/drm/
-F:	drivers/gpu/vga/
+F:	drivers/gpu/
 F:	include/drm/
 F:	include/linux/vga*
 F:	include/uapi/drm/
-- 
2.33.0

