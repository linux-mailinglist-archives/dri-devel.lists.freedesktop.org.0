Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C04AB11C89E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845C06ECC6;
	Thu, 12 Dec 2019 08:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B44E6EB7B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 15:49:18 +0000 (UTC)
Received: by mail-qv1-xf49.google.com with SMTP id r9so9154874qvs.19
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 07:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=L3bqEDJc/83H6XSH4dKpp4Sz+uUocCwUuCh066ZPD24=;
 b=T7tmarUt73QPvvzsmlX8joprU84Bgn+q+g3Bub5VpNuPOkJ2OMgW/GR2NfK7AzKClC
 TVaQfOgipbhJkxSaBENCKqcs/xBqhcht6ipt8vpVxU8N0K7LDCJSrRC/1rsFS9tb+m1i
 xrDG46KfHWOx7stN/zivVYevObR3Lt28+6MPEh3++sYAWKHfWyyPtHWT99FEvqBwKUsk
 /2L6mMknwQVjBCXY2SHvUs9Tq7wghQ+mqZ1/jCay1ViVuWUsLkq7UxOQEwPovdQGJZDZ
 bvwP7rUww+runAY6qHX8Fl4Plmaut9fSbirsX6AWRHXQ1HGlqeCzE2/4WMjMeqTZd74Z
 Ssjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=L3bqEDJc/83H6XSH4dKpp4Sz+uUocCwUuCh066ZPD24=;
 b=DAarHB13ty17n7evqjubUkVCDkValTF/BVz1ZTjP1vsxYkiHIqp+KOMUY/2NUyBQJz
 YfBxPNBLR945+lrgQ/C9EAETesWQmad8FoJKdnmgy6WEUVOAotRjaeidbdrs6C2Y+QMa
 jfG8gj5uJo9s77DZ8hYAk902tulH/xV2PCEsubMzcZw1TXe6I8lBUTiBNCreidR9Cwq+
 iIQ5HFUxgzUZGRRS60vICPpR7rNN6BmCL8+aVR51XXpY6VP2IhPv0Nl9zi3sLuqQHi9N
 EhA18uFKqOBVSb7Hrh45fz/9kXX4MgF7V/4t8TXe9qZpMsFe304xYoO7i1F8WxNJx1jV
 qHuQ==
X-Gm-Message-State: APjAAAXhxRkQF8EFeUUE8tdfVBok+ca2f1ZLbXuq32WINQd+iI058rn4
 cWZwDhdJWQrrwmtJvpLmsm1lIHtOFaQdzRXv
X-Google-Smtp-Source: APXvYqzWVPRzbCutVlIWkKgo8ZdWbTIe/i8BsJDaINwYPE1tnMGWPJw4+4d/x/wDNk8QtVgjgmAdkZUNDVCj/ebY
X-Received: by 2002:a0c:d0f1:: with SMTP id b46mr3637071qvh.188.1576079357145; 
 Wed, 11 Dec 2019 07:49:17 -0800 (PST)
Date: Wed, 11 Dec 2019 10:49:01 -0500
In-Reply-To: <20191211154901.176256-1-markyacoub@google.com>
Message-Id: <20191211154901.176256-2-markyacoub@google.com>
Mime-Version: 1.0
References: <20191211154901.176256-1-markyacoub@google.com>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
Subject: [PATCH 2/2] Turn off Alpha bit when plane format has no alpha
From: Mark Yacoub <markyacoub@google.com>
To: CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: Daniele Castagna <dcastagna@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm/mediatek: Add OVL_CON_ALPHA only when the plane format has_alpha.

This change enables XR24 format to be displayed as an overlay on top of
the primary plane.

Suggested-by: Sean Paul <seanpaul@chromium.org>
To: CK Hu <ck.hu@mediatek.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniele Castagna <dcastagna@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 526b595eeff9..a7851756dddf 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -266,7 +266,7 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	}
 
 	con = ovl_fmt_convert(ovl, fmt);
-	if (idx != 0)
+	if (state->base.fb->format->has_alpha)
 		con |= OVL_CON_AEN | OVL_CON_ALPHA;
 
 	if (pending->rotation & DRM_MODE_REFLECT_Y) {
-- 
2.24.0.525.g8f36a354ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
