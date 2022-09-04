Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C75AC705
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2BC10E2CD;
	Sun,  4 Sep 2022 21:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D3110E1BE;
 Sun,  4 Sep 2022 21:42:35 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id h78so5628349iof.13;
 Sun, 04 Sep 2022 14:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=6ZAp0SLSNepdkM6caeO4skWDicbHMA8OFY8bo87a1Nc=;
 b=DfX4/ghpRrLMvEAxpwWwPbtD5a1dkzxKOUPp2TD6F2q29vGGj/18IHkmJJpqNGED84
 ReA0JJE5AA9AlXq8pGzPQjVUBQcsMR8EpnSbOuKD6tojGRRoX3dI2Ud0v22DsMUX8opI
 d3JQlwkymuNoAqrccLE9gDUMCmRsZkunqKR2XFWr2KptUsf2TiLlIieQnWztzPo6ZUgh
 MiQCOt2dHNm9l4z5HrlM5ImqTPv0SubrVLnrEYTh/r1aKOa0fhVY5VE/iog4DwbkB60l
 BBQjI90yzoxv+hYSTdUZRg31WO5JZtO0Ko4fDN3r4WVdZF42swnnS3An562cNwwtMv5i
 lx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6ZAp0SLSNepdkM6caeO4skWDicbHMA8OFY8bo87a1Nc=;
 b=cNjaPVvd2wPXIYN6p/YWUlDA/jhmBuURdiZjiNpoQl6hTnEP+AA+u5BZBjQdlKalFz
 S9qBxe8zJBkOD/Vbx4vSamjDtkMb+MiXQaWIbhzTHLYTGxU//468Ka2V3tS/nnTj6JJk
 Etj9uxLzfnJxnbaOucylVC5+iFxndsngkWGZZzjBy7ZNzrA/1ugH0OD7sNXdl2fJZOYl
 vHThDAXexabGtmtdyNeRhdU52eGoAX9eSdBnBRaGTx0+jQ1VzlEyXPLTmGI73bCd+oJH
 o54vGMAXa+ktaKAMSWj6QJ0seHp9mTHI+95/lugVu5hnZK3vFX475g+xiGatBFo6kE7J
 4rmA==
X-Gm-Message-State: ACgBeo21uExkBWbQsR9KozchOjm7eHQ9Yxgrt5MbqG/gx0aWSRn4nsyH
 ojnd5HEC6FSzpjJShGJBwEo=
X-Google-Smtp-Source: AA6agR7xT5UcbaaPMupHq74aD54OF9ftmAPlIhpkXGE6kw4lTSCQlvdL0+PZQyRTjzyip0WI8xfCIg==
X-Received: by 2002:a02:3f20:0:b0:342:c96d:2f8 with SMTP id
 d32-20020a023f20000000b00342c96d02f8mr25501456jaa.74.1662327754895; 
 Sun, 04 Sep 2022 14:42:34 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 26/57] drm-print.h: include dyndbg header
Date: Sun,  4 Sep 2022 15:41:03 -0600
Message-Id: <20220904214134.408619-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

lkp robot told me:

  >> drivers/gpu/drm/drm_ioc32.c:989:2:
  error: call to undeclared function '_dynamic_func_call_cls';
  ISO C99 and later do not support implicit function declarations
  [-Wimplicit-function-declaration]

           DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",

Since that macro is defined in drm_print.h, and under DRM_USE_DYN*=y
configs, invokes dyndbg-factory macros, include dynamic_debug.h from
there too, so that those configs have the definitions of all the
macros in the callchain.

This is done as a separate patch mostly to see how lkp sorts it.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 2d2cef76b5c1..f8bb3e7158c6 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -31,6 +31,7 @@
 #include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
 
-- 
2.37.2

