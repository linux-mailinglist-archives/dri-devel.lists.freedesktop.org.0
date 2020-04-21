Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4913A1B2818
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEBA6E0CD;
	Tue, 21 Apr 2020 13:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2276E0CD;
 Tue, 21 Apr 2020 13:37:22 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id f8so5259025plt.2;
 Tue, 21 Apr 2020 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=q99F72xfQQRlvFdNx8KaIRgOqIlkfnsXVwfUZ6na6vI=;
 b=N99sejvwL84+Cfqmpyzkr+XyXSdpzeBpZEUQrhhatRwGc5CVdlr4yX782OIva/clg9
 P1G72rYoxbYgdnRNbqfgj0XZFG8X3WYm1NA+h76swZDAKzm8CMiqd+ioH8WO+ftF68Df
 otB75Ge1sT/XkV429ITEypmLensbpHvvdxEoBzlNX4HdRvQdnnQSoCoQCiesJxWvr0e2
 tV0cJESgVJjZvCS6Y1cSpImKbiCSMH/6OdUFs7SJYJMNCCtGSA8ZvZYXTZVps6URPXiD
 e7TsmYylyNYqp3SMlqrdAl+xNU+TWN3TVUGxyU9FA9gIriEVW2EXatzn5tWXpEx2AD3y
 dXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=q99F72xfQQRlvFdNx8KaIRgOqIlkfnsXVwfUZ6na6vI=;
 b=uI1sGU70bjLDW/1a+0xnNak4poUx5/5P5/t+JRe0xwUtfot38uis09FmwGmrY/iWFE
 qtUrTcyBrPacBiKV+n2bk8wU9qSb87i8qUXFHvAjg1ZhlXh9SGjPN9gkD1jMB4Z4nkKC
 AHdbEK5JiUP3GMFz2fIay+P4AukXnGk4sSoAfaH2btW8c8vmQNtWVkNkDmKV4rSFxsfy
 IhfetamnX8Bo090BeryhCAqvzsGdaC8MtFa+9bAdzBBbvDYUKhA8Xv3WdRbyRAY8VPrW
 b0wqwKh6UAEVPfvwLlWj9I85g06EnYuGMslaDZimEYhrpQrXuDU9ga8SkDF3x7NqHXML
 HIzg==
X-Gm-Message-State: AGi0PuZgN2HXQv8tEwjYt1UNRS5GoU6A1MV1kh4msSTg4cSQp4TjlxnO
 otQxk3ARY03d9cqafWvaKknOTUENGzGI8g==
X-Google-Smtp-Source: APiQypJ2v3TnDaVvpkl2yCoUDFrY0uFDQZkUiNs2wKpyqWYauMt6P+IQ9E5KdduaY8ddZvqThUcBvg==
X-Received: by 2002:a17:902:7793:: with SMTP id
 o19mr14488328pll.107.1587476241967; 
 Tue, 21 Apr 2020 06:37:21 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id r23sm2551327pfr.64.2020.04.21.06.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:37:21 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/10] drm/lima: use module_platform_driver helper
Date: Tue, 21 Apr 2020 21:35:42 +0800
Message-Id: <20200421133551.31481-2-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421133551.31481-1-yuq825@gmail.com>
References: <20200421133551.31481-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify module init/exit with module_platform_driver.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_drv.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index bbbdc8455e2f..91bf5b305e9d 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -461,17 +461,7 @@ static struct platform_driver lima_platform_driver = {
 	},
 };
 
-static int __init lima_init(void)
-{
-	return platform_driver_register(&lima_platform_driver);
-}
-module_init(lima_init);
-
-static void __exit lima_exit(void)
-{
-	platform_driver_unregister(&lima_platform_driver);
-}
-module_exit(lima_exit);
+module_platform_driver(lima_platform_driver);
 
 MODULE_AUTHOR("Lima Project Developers");
 MODULE_DESCRIPTION("Lima DRM Driver");
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
