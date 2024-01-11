Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046D982A9AA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6016C10E84F;
	Thu, 11 Jan 2024 08:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D46D10E6AF;
 Thu, 11 Jan 2024 06:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=ehJAe3CSmeN3lDNYy/
 +b8hVNINSf7+zifOWAKLIOOx0=; b=ot0bgKDUZPCnkLRjhL1mmmjjES9ySLkLak
 xDvgDxqZhEvqHO56iRLNJFA1jVrtvUd+i/HaarGBI012sNjMefCIbVO9rEJQsyQg
 PhbGn3htWohn3ENjaN7ZGE9LzoOshnBLljCEnqSgHq7iMt4sbMr8YUzpD3Cjl06s
 eyFG++yt8=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-3 (Coremail) with SMTP id _____wD3f7nfhp9l5VwyAA--.62725S2;
 Thu, 11 Jan 2024 14:12:48 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: christian.koenig@amd.com, alexander.deucher@amd.com, Xinhui.Pan@amd.com,
 daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH] drm/amdgpu: Clean up errors in displayobject.h
Date: Thu, 11 Jan 2024 06:11:27 +0000
Message-Id: <20240111061127.8385-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3f7nfhp9l5VwyAA--.62725S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFyUGryDZF48WrW5uw47twb_yoWkCFbEkr
 17Gw4xW3yIvrnFgF1j9rZ8ZrW2kw4a9F4kXFyfJay7t3yfC3W5W34DKr4jqFZ5WF4UCF4q
 yw48XFy7XrWa9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU0tC7UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiWRdixWVLYUFHTAABst
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: spaces required around that '=' (ctx:WxV)
ERROR: space prohibited after that open parenthesis '('

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/include/displayobject.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/displayobject.h b/drivers/gpu/drm/amd/include/displayobject.h
index ddbfe122b2dc..0f9529c40496 100644
--- a/drivers/gpu/drm/amd/include/displayobject.h
+++ b/drivers/gpu/drm/amd/include/displayobject.h
@@ -159,7 +159,7 @@ CONNECTOR_SINGLE_LINK_DVI_D_ENUM_ID1 = (DISPLAY_OBJECT_TYPE_CONNECTOR << OBJECT_
                                                  OBJECT_ENUM_ID1 << ENUM_ID_SHIFT |\
                                                  CONNECTOR_OBJECT_ID_SINGLE_LINK_DVI_D << OBJECT_ID_SHIFT),
 
-CONNECTOR_SINGLE_LINK_DVI_D_ENUM_ID2 =(DISPLAY_OBJECT_TYPE_CONNECTOR << OBJECT_TYPE_SHIFT |\
+CONNECTOR_SINGLE_LINK_DVI_D_ENUM_ID2 = (DISPLAY_OBJECT_TYPE_CONNECTOR << OBJECT_TYPE_SHIFT |\
                                                  OBJECT_ENUM_ID2 << ENUM_ID_SHIFT |\
                                                  CONNECTOR_OBJECT_ID_SINGLE_LINK_DVI_D << OBJECT_ID_SHIFT),
 
-- 
2.17.1

