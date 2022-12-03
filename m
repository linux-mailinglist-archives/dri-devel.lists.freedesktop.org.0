Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B246415F1
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 11:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C989B10E1E4;
	Sat,  3 Dec 2022 10:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B774410E1E4
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 10:36:08 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1670063767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAo4keShZ18WFessSvhSTot4vT88z0d7rr9jhcq1OZw=;
 b=ij8nAfsVPxIscTKxwoTk7o9XGW+a6g+cTqcGR5IdokztBaDQ4hub0VvhmRlUaB8SzZrKj3
 4ePR/U21/shv/4di8McT/IgcDIbfosg4gC+o7+dXlKQiEaIi/YNer7zyidR/RC+Jb+khNh
 LEfKWm70U9RjV9ZWYn3Hrrahx1/Q7ow=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: tzimmermann@suse.de
Subject: [RESEND PATCH linux-next v2 08/10] drm: Add comments to Kconfig
Date: Sat,  3 Dec 2022 18:22:59 +0800
Message-Id: <20221203102502.3185-9-cai.huoqing@linux.dev>
In-Reply-To: <20221203102502.3185-1-cai.huoqing@linux.dev>
References: <20221203102502.3185-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Cai Huoqing <cai.huoqing@linux.dev>,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add comments to avoid removing DRM_LEGACY config menu,
because DRM_LEGACY menu could list other legacy drivers.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 96d73208995a..520633a1e706 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -391,7 +391,7 @@ menuconfig DRM_LEGACY
 	  Unless you have strong reasons to go rogue, say "N".
 
 if DRM_LEGACY
-
+# leave here to list legacy drivers
 endif # DRM_LEGACY
 
 config DRM_EXPORT_FOR_TESTS
-- 
2.25.1

