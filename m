Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C441418E480
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 21:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBD06E364;
	Sat, 21 Mar 2020 20:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB096E364
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 20:37:48 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w26so5220584edu.7
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Mar 2020 13:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=MAv9nYA+EA8sQl+oTebsnJpHm15vlJ946YYDhPPH8Ag=;
 b=PIyxJthK+hKVhHkV7DNb9tnBekj1Mm8kPvfdZQZygyJR7pBcGLrIK6iN18cvt7CQYv
 TJIpET5h3dTZSjkraa5sQpn2lt0qus/fFspnU3UEim8fc9/mChTzZ8pt0VyhGBUn4lv9
 Sy3DZOEIRmaa/3Wbh3eTm8arhmxhrqyHDx2svwv/kXFQwJnKwm4IOzVJBRaySFaBKny3
 SeuVUnAaYC0KPsVBsVMkfexM9/qoM1N728SI6sfwgr6K0O4bIsa/twWw0swZSo15d3g6
 4Uyn7Gdzx3JPNFzS2n6c7ohoJ90tXiE38yonPC/Q1QdiDWNnPyUiWecJmg+Vtu9CsXOP
 7y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=MAv9nYA+EA8sQl+oTebsnJpHm15vlJ946YYDhPPH8Ag=;
 b=gl5Dg9gdrp/7G/pUMDVI7VJbnhFezIFOKXL0CiaGcL8yUgq16GOiokOpdkdpJCn5jJ
 t1s0YIGCHE7ebFVqKIkXaGTO91J9bcqdxBbhrDoekkpwy9iPhPhUGrk2VmHX5yXSFItC
 XXmUT1KkIeoDlZTGXCJ5NH0IXELP1CDWYELa133B8E05jf3ncp7qgZXN6PgKG+MN1/hf
 GLwvwJ0dG4E8XlFJeeGmQFShZOz1IyCWBrW7MsAYfNgcClVVd0mIp+sXBt3KwqDaozCi
 3Cc+VzZI4+tO0ANyk3vMUSJ3IpLnk/6UjO2rf7X+oyXLuZhwq9EOLNy1tGXfImOnf4IM
 DIrQ==
X-Gm-Message-State: ANhLgQ17GgGrWoyfy3vg6xBkg6GScnh1GLBHuW+AkDhsts4b6apY04LK
 mdohWpWxYqXwaYHM7Wjblfw=
X-Google-Smtp-Source: ADFU+vuYvDjWH4U0N7xvR70zyMG7JDP3kL/4N/gFVXeM6Sx2ajf8vISRp+9ESGYjiQs41fFi3HFCeA==
X-Received: by 2002:a17:906:a28d:: with SMTP id
 i13mr1872058ejz.166.1584823067347; 
 Sat, 21 Mar 2020 13:37:47 -0700 (PDT)
Received: from smtp.gmail.com ([2001:818:e238:a000:51c6:2c09:a768:9c37])
 by smtp.gmail.com with ESMTPSA id t19sm634333ejc.55.2020.03.21.13.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 13:37:46 -0700 (PDT)
Date: Sat, 21 Mar 2020 17:37:40 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo.Siqueira@amd.com
Subject: [PATCH] drm/vkms: enable cursor by default
Message-ID: <20200321203740.pg3r7f4vybruowox@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch proposes a change in the behavior of the cursor to enable it as
soon as the vkms module is added. Enabling the cursor by default appears
to be an expected and more friendly behavior, especially when running IGT
tests.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 860de052e820..6e6feecf7f20 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -34,7 +34,7 @@
 
 static struct vkms_device *vkms_device;
 
-bool enable_cursor;
+bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
