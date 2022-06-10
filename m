Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926954608C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 10:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C55710FF89;
	Fri, 10 Jun 2022 08:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8E310FF89
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 08:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654851296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CVVKI4thPicYfGWEh0/VZSA/WgrtJPotaQ3dMufekN0=;
 b=P+YzhO4yFv9z/QkPwgE+/pg1Alj4bxWIwUfwSMfzFzaNPsVQGPspHOSN1EtegnUv2yHSvV
 kUDkh20aW2tjVaiEFoOTeB6yUvlNQ88fiZR4+byNeL1XP1jf7eXf7xTsfhV4GrCKnw4T1f
 pCYGWUyaK81bcYhTj+wbDKXnO7lCgWo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-BYVzzJD7OZWsBIHTleF7dw-1; Fri, 10 Jun 2022 04:54:55 -0400
X-MC-Unique: BYVzzJD7OZWsBIHTleF7dw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v14-20020a5d610e000000b00213b51a0234so5357070wrt.11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 01:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CVVKI4thPicYfGWEh0/VZSA/WgrtJPotaQ3dMufekN0=;
 b=sJYOo/Ro1nsM5i61GzQw/9Ao5xxFNqsh1OF5vnXqeuWie87Gm31CHvef+RHpfKyl0P
 ZBr+s5q+KFQjMAYvWe0DVQR812+GV5U17puceacY+jwMh3G5EkW4F4KWoys+fsnlWhax
 VyxbrmMuJeuMzuVZMvJ6jq375NoWI6Fm84C0us7Ntj/FpgL4S9b6DxcOaW300nxR8z+K
 zQmH5pEN+mUhNYfTODyNBQn5gg6SEy5u0EZ1VXf1VAcXqZwo0ZPUTontc3UJV62eMvNa
 oENXW225E+55bpWJDOorZcdqKNNuGhM9E+e0MAfo7cVGQLqoi2+IfOsZ8t354AAtj2eX
 vD1A==
X-Gm-Message-State: AOAM533i8Kq1K/djURyUmCYduFVBnS0jPIyHmGhigqansBhMNugjwO7o
 iHcIcc6HMY7/eAtajCXRzqMgUF9XP4rD/ycV3sLCwd/2vzr3FQYya0YhOf+rnu7NAKUtrNmkPX/
 Gx35Erhozj8JJs7nICCX3N30fhRfd
X-Received: by 2002:adf:e70e:0:b0:210:2b0f:723 with SMTP id
 c14-20020adfe70e000000b002102b0f0723mr42414569wrm.47.1654851294390; 
 Fri, 10 Jun 2022 01:54:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRaUo7tvKddPeRO3iR2vMIJXWPBMkMuQ1f5xqNCYbyRxuzm4GDWk8ljLiP3gvkDwiWfLSALw==
X-Received: by 2002:adf:e70e:0:b0:210:2b0f:723 with SMTP id
 c14-20020adfe70e000000b002102b0f0723mr42414548wrm.47.1654851294148; 
 Fri, 10 Jun 2022 01:54:54 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h7-20020a7bc927000000b0039740903c39sm2267836wml.7.2022.06.10.01.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 01:54:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "fbdev: vesafb: Allow to be built if COMPILE_TEST is
 enabled"
Date: Fri, 10 Jun 2022 10:54:50 +0200
Message-Id: <20220610085450.1341880-1-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit fa0e256450f27a7d85f65c63f05e6897954a1d53. The kernel
test robot reported that attempting to build the vesafb driver fails on
some architectures, because these don't define a `struct screen_info`.

This leads to linking errors, for example on parisc with allyesconfig:

  hppa-linux-ld: drivers/video/fbdev/vesafb.o: in function `vesafb_probe':
>> (.text+0x738): undefined reference to `screen_info'
>> hppa-linux-ld: (.text+0x73c): undefined reference to `screen_info'
   hppa-linux-ld: drivers/firmware/sysfb.o: in function `sysfb_init':
>> (.init.text+0x28): undefined reference to `screen_info'
>> hppa-linux-ld: (.init.text+0x30): undefined reference to `screen_info'
   hppa-linux-ld: (.init.text+0x78): undefined reference to `screen_info'

The goal of commit fa0e256450f2 ("fbdev: vesafb: Allow to be built if
COMPILE_TEST is enabled") was to have more build coverage for the driver
but it wrongly assumed that all architectures would define a screen_info.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/video/fbdev/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index bd849013f16f..f2a6b81e45c4 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -616,7 +616,7 @@ config FB_UVESA
 
 config FB_VESA
 	bool "VESA VGA graphics support"
-	depends on (FB = y) && (X86 || COMPILE_TEST)
+	depends on (FB = y) && X86
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
-- 
2.36.1

