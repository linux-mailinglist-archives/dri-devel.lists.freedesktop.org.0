Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161C7372C01
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 16:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9AA6E239;
	Tue,  4 May 2021 14:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8930B6E239
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 14:29:14 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso8328487otb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 07:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eKIZAu6/2NdM8fHlgkE+KZQqouzZp51NLAhVcolSIcE=;
 b=ShojezARwH1uaeTtN3VENf1RsdHgYRRDzCLnqNZoJ5xANav8dLHe59dCObS3LW7oVR
 sss3ADBtYFRFC3LdfJbp7TvbT2kYTTCJE2J48jPFCRanYOjsD3kogYxwaQfpfs99pRgF
 HMK303LDXhBkXFZ32L9X2ehbfl1UWWsAuZ8P/nUUj+240fGg1DO0x6GK15dq/riwNYeb
 aafpBSYS6aQy2TrZ/HhhvsbaW0xO2iVGk1a7cvQqrEXfxVPdaaFAV7wKKfHusrCw0zaq
 lNdzMNQADc/pwkfis9vVIuyFNLjL01BesNpG6FOxQGBvywFqcfV2Y2b2o9bOE0Y05d5J
 Nv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eKIZAu6/2NdM8fHlgkE+KZQqouzZp51NLAhVcolSIcE=;
 b=oFPBOosk2hKictxwjkTZVDnujN2fZH5E6aw5uFdr+DN3mzLs2d+C58oGf8NO0DzzYx
 TyEVAJr7L8/PjrHn0QO4iUr6GpwgxvXlKrns9Zwum6HetyyFXzw/vrs0NouYHtoRbFpo
 nIJNMpbMS8zzwCH0gnJ8oX+VnWqNpWXGeZsS9gIXCd0dbv0Zp4PEqf3QocUnXFgVoMFb
 VnOx+vvH/1iAfQj4tHwQaKEnq7DxqjJAV+BT2C8f/L5Hm3m8mUSQCvnSQYupj4xtnlat
 D4RIbVC0GUCqgnLWD/rruQ4NVg//YTpetxwt+bNKkS1qqtuy99a4KUy9jsBfwtHbjEcc
 rPBA==
X-Gm-Message-State: AOAM530Ptg28hKZaVANrrOQXqp44evNHSvJoRbAkM+YEfsmc4I6RGXcZ
 U+71O1wiihexpMt5J5/3GEowdiLLLbQ=
X-Google-Smtp-Source: ABdhPJwixsPL4gUes21e2Ym9ZiEjlDDpj7aBAgzY2n98I2gq+SjsQaNx1v6L61j1SitQH65pU7hlXQ==
X-Received: by 2002:a05:6830:1f27:: with SMTP id
 e7mr19351128oth.341.1620138553582; 
 Tue, 04 May 2021 07:29:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id a15sm660543oid.39.2021.05.04.07.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 07:29:12 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] fbmem: Mark proc_fb_seq_ops as __maybe_unused
Date: Tue,  4 May 2021 07:29:10 -0700
Message-Id: <20210504142910.2084722-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With CONFIG_PROC_FS=n and -Werror, 0-day reports:

drivers/video/fbdev/core/fbmem.c:736:36: error:
	'proc_fb_seq_ops' defined but not used

Mark it as __maybe_unused.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/video/fbdev/core/fbmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 372b52a2befa..52c606c0f8a2 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -733,7 +733,7 @@ static int fb_seq_show(struct seq_file *m, void *v)
 	return 0;
 }
 
-static const struct seq_operations proc_fb_seq_ops = {
+static const struct __maybe_unused seq_operations proc_fb_seq_ops = {
 	.start	= fb_seq_start,
 	.next	= fb_seq_next,
 	.stop	= fb_seq_stop,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
