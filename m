Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A1721BA41
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 18:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE36E6E0F1;
	Fri, 10 Jul 2020 16:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F276E0F1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 16:03:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g75so6687692wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=HU7/byzDdGrFRngwJ2Ihe/2za95z2ZBIDy+mwg/mTHc=;
 b=MBl7FU/yIvBaWy3Kyuc5jYhBPOiReIKPfgPlLvR22C7n7X3DdznB9cjx/N2tusWiTx
 ediyqviCImtW/WnIxtKTDGcj1XtOcoIL3ALjFXoMeqgjfDFPTIkXOXr934Au7jXhrB1J
 swtgAkV/JMlNQG4xrMEKuCpfH1zpJa2bECdWq/ChqdGJ5O6mrgS8LLpmtHJIY8yjnOL3
 H8nEesxLsnSFscOl3I0A/D0WQRPny1dCB9oHXH11hmFfOG4tfjOLpFKaO/7ccswEhKQs
 uwHeE2kcw3xLOFIy1ttEVf56XhirUAddlN68BYFFrzIw97QeC1vQveR6wb25QwXldz+o
 wTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=HU7/byzDdGrFRngwJ2Ihe/2za95z2ZBIDy+mwg/mTHc=;
 b=nQBkeDsaVaoVs3cjkQp3KvdfvhBUnORacFaEfDaFGWzN10S4iapp/0csWCzJPUGZYp
 Krsq/UmG5KnVV6UkJbvdMfH2ELxevmEhzpIJlxxAj3vIcVRDiQBQ8Vyu28fjb9ObPSMH
 cuv+NLIikfaJywW9LynACp8dAdea2MnF06YK00LNfL1QdCdEohI+neGJYePqQM1NYBoZ
 KPGNqdxpAfJdo/2gnk96GPjcQ3eFsa8xfUmQdAVDPM34walPp8obwXKIpWBzV345EYA8
 LJXa9iJ5IzM+w6tJqzJn2mpx440yfLyyETDQrKeqEVPstwOtKO/LcTWN3H0kd3v9+ZCY
 utvw==
X-Gm-Message-State: AOAM531k2ylb3ddliimJOxIzrybq7wfKVpbN3SsH2q3pet6ux7/S+TXe
 Kts/imCDvx7H/jWNOYTrPCo=
X-Google-Smtp-Source: ABdhPJxtPtkfAREBaV21XQmaaF9G3mrjKWq0G48lEic7OZzNUaGGwPPqOJe741XamARcYyemgYeykA==
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr5741624wmd.86.1594396999997; 
 Fri, 10 Jul 2020 09:03:19 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id t4sm10529773wmf.4.2020.07.10.09.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 09:03:19 -0700 (PDT)
Date: Fri, 10 Jul 2020 13:03:13 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/vkms: change the max cursor width/height
Message-ID: <20200710160313.xjoz6ereyma5vkc3@smtp.gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-usp@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change expands the coverage for the IGT kms_cursor_crc test, where
the size varies between 64 and 512 for a square cursor. With this, in
addition to the cursor 64x64, this patch enables the test of cursors with
sizes: 128x128, 256x256, and 512x512.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 1e8b2169d834..57a8a397d5e8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -133,6 +133,8 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.min_height = YRES_MIN;
 	dev->mode_config.max_width = XRES_MAX;
 	dev->mode_config.max_height = YRES_MAX;
+	dev->mode_config.cursor_width = 512;
+	dev->mode_config.cursor_height = 512;
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
