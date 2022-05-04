Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5EE51B162
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 23:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB0E10F1C3;
	Wed,  4 May 2022 21:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0459810F1C3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 21:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651701129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tx5EF/oHY4MnR+1kAy1pN1/nvTcQ0mL5kPtxJFa0zjA=;
 b=LPE5FtPMU5MbL11bIjY2etHzUxJ+BzzR24Cub6LBMEbV2phYbpUYA5WIEaIwxwWvdzCElM
 8f2Ny5ahSsw96KbQ8dtVPjj29qHUa+YsEh0L0HSBEVX5J2isYkFlggkay0JKiG3BOkMhdn
 SyUmYCuFpFB2kHNcinR7/8KMqVu0XeE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-2EsCnWD5PxG9CDsd62s_GA-1; Wed, 04 May 2022 17:52:06 -0400
X-MC-Unique: 2EsCnWD5PxG9CDsd62s_GA-1
Received: by mail-wm1-f71.google.com with SMTP id
 d13-20020a05600c3acd00b0038ff865c043so3576204wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 14:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tx5EF/oHY4MnR+1kAy1pN1/nvTcQ0mL5kPtxJFa0zjA=;
 b=K6vaaw7cytBVgOsO0aArO886qFuLMoDV6Ivo1cLXdwsouHEqyrF0xxUNAkKRtv1xUv
 qV9Eej8ai+cRRLgw2u2yjiXv/X8syL5Fyib9kyIGY8rf3oZMhIgRpu9EsVPRqMw8deVS
 uKw02vdWdRnU/iVWPwpYdmQYAXS19759PtPiZS/QYFkaelTpK48si3nP5VS57F26kkgp
 7uqK1IVnup60NyRuctRrLk/M2XRqdgVFDMfxp3F/qR0UxhUKJpvjNeeKPl6/HdA2kZ63
 x68pnclG0D00P2Rc/vqJfl6fTSqDuT658oP1MIywICMnG2Y2UoFGzDuGsrRPP3kLhzne
 kfzw==
X-Gm-Message-State: AOAM531DamCY94WchHCDVLF++1P5fxSdJgRFkRuNvcuqETkGUbxrtagp
 tDHNFWEtX9Dto0Mf3dyXSQhdloYytOfvbF+/zF4lPIb1DNX2I1gdWq6BLwmeDCB+gPaxsMqbwMf
 DnF606JCJBqZfzlG+en1Rc+ZmJZVd
X-Received: by 2002:a5d:4307:0:b0:207:8e25:6cfa with SMTP id
 h7-20020a5d4307000000b002078e256cfamr18100075wrq.434.1651701124560; 
 Wed, 04 May 2022 14:52:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXSDPAjTAE9apOh0uk1c6QEqTiB3+5xlkiYFpJB/o+TcAsRLgUFfpZkBdZBhnJzHSrHqLJZA==
X-Received: by 2002:a5d:4307:0:b0:207:8e25:6cfa with SMTP id
 h7-20020a5d4307000000b002078e256cfamr18100060wrq.434.1651701124337; 
 Wed, 04 May 2022 14:52:04 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q14-20020adfaa4e000000b0020c5253d91fsm12822310wrd.107.2022.05.04.14.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:52:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] fbdev: Fix use-after-free caused by wrong fb_info cleanup
 in drivers
Date: Wed,  4 May 2022 23:51:48 +0200
Message-Id: <20220504215151.55082-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series contains patches suggested by Daniel Vetter to fix a use-after-free
error in the fb_release() function, due a fb_info associated with a fbdev being
freed too early while a user-space process still has the fbdev dev node opened.

The is cuused by a wrong management of the struct fb_info lifetime in drivers,
but the fbdev core can also be made more resilient about it an leak

This can easily be reproduced with the simplefb driver doing the following:

$ cat < /dev/fb0 &
$ echo simple-framebuffer.0 > /sys/bus/platform/drivers/simple-framebuffer/unbind
$ kill %1

[  257.490471] ------------[ cut here ]------------
...
[  257.495125] refcount_t: underflow; use-after-free.
[  257.495222] WARNING: CPU: 0 PID: 975 at lib/refcount.c:28 refcount_warn_saturate+0xf4/0x144
...
[  257.637482] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  257.644441] pc : refcount_warn_saturate+0xf4/0x144
[  257.649226] lr : refcount_warn_saturate+0xf4/0x144
[  257.654009] sp : ffff80000a06bbf0
[  257.657315] x29: ffff80000a06bbf0 x28: 000000000000000a x27: 000000000000000a
[  257.664448] x26: 0000000000000000 x25: ffff470b88c6a180 x24: 000000000000000a
[  257.671581] x23: ffff470b81706480 x22: ffff470b808c2160 x21: ffff470b8922ba20
[  257.678713] x20: ffff470b891f5810 x19: ffff470b891f5800 x18: ffffffffffffffff
[  257.685846] x17: 3a725f7463656a62 x16: ffffbb18c6465fd4 x15: 0720072007200720
[  257.692978] x14: 0720072d072d072d x13: 0a2e656572662d72 x12: 657466612d657375
[  257.700110] x11: 203b776f6c667265 x10: 646e75203a745f74 x9 : ffffbb18c58f6c90
[  257.707242] x8 : 75203b776f6c6672 x7 : 65646e75203a745f x6 : 0000000000000001
[  257.714373] x5 : ffff470bff8ec418 x4 : 0000000000000000 x3 : 0000000000000027
[  257.721506] x2 : 0000000000000000 x1 : 0000000000000027 x0 : 0000000000000026
[  257.728638] Call trace:
[  257.731075]  refcount_warn_saturate+0xf4/0x144
[  257.735513]  put_fb_info+0x70/0x7c
[  257.738916]  fb_release+0x60/0x74
[  257.742225]  __fput+0x88/0x240
[  257.745276]  ____fput+0x1c/0x30
[  257.748410]  task_work_run+0xc4/0x21c
[  257.752066]  do_exit+0x170/0x370
[  257.755288]  do_group_exit+0x40/0xb4
[  257.758858]  get_signal+0x8e0/0x90c
[  257.762339]  do_signal+0x1a0/0x280
[  257.765733]  do_notify_resume+0xc8/0x390
[  257.769650]  el0_da+0xe8/0xf0
[  257.772613]  el0t_64_sync_handler+0xe8/0x130
[  257.776877]  el0t_64_sync+0x190/0x194
[  257.780534] ---[ end trace 0000000000000000 ]---

Patch #1 adds a WARN_ON() to framebuffer_release() to prevent the use-after-free
to happen.

Patch #2 and patch #3 fixes the simplefb and efifb drivers respectively, to
free the resources at the correct place.


Daniel Vetter (1):
  fbdev: Prevent possible use-after-free in fb_release()

Javier Martinez Canillas (2):
  fbdev/simplefb: Cleanup fb_info in .fb_destroy rather than .remove
  fbdev/efifb: Cleanup fb_info in .fb_destroy rather than .remove

 drivers/video/fbdev/core/fbsysfs.c | 4 ++++
 drivers/video/fbdev/efifb.c        | 9 ++++++++-
 drivers/video/fbdev/simplefb.c     | 8 +++++++-
 3 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.35.1

