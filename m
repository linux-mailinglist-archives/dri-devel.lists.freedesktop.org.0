Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBAD1D2162
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201466EA8D;
	Wed, 13 May 2020 21:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849316EA86
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:46:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f134so15955573wmf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJi5eMHwAqzUe2i3jUFYaA8xST3/sOL5U08KB2I3T4g=;
 b=rO3yc4WHAm3l05vSdlARVUnLXK95J2qlUiA4WDLwPUJENF18/YcfSvDZUegRU04XRm
 vBtu9zIFe4bD2hgd9QTULm8biR5bgXnGTh9InWANNuITuru0/z5vJu1Uognp7JSMx3pr
 8P3IXd/HOiDgEW8utGnSsiNoY2aF6SyGHq2ZGfQO2C67+KS87LgeeU9aICdC9HtcGptb
 Sv319/TJ5Z/0KAPdstm/aIyZeWaZforbuTfNxI/fChFR/r08Ag//hS1NvRSPUtxQPcRl
 Z2/NqtUtNsI8TQZu6Fg++9ThhlEm3wDnMjGRp0BuHFoWmPb7Tey5IVSvxvdhosybx7an
 VX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJi5eMHwAqzUe2i3jUFYaA8xST3/sOL5U08KB2I3T4g=;
 b=oTSi0UOp8sc09+Evmz0tV7jart8+1YbdBGJiYISt9wDBWUb5gjxDqtlvJv+ZZ17NnP
 Qh0XbC9PnbDGcdC0nS8oUnbZfVqlv1qfsBSWm8irxJ233odK2Z6CsSPqCummDdqhPndK
 zifgug4WGQ0mMWgX6JIzIymDXtXjXRFT00kVIXiggQ2kHDSmwJT/lGNVFFSc3/Z7kAUm
 eK20kZ44X5oWsnUNYZ8eM+qMVZhmeE87kijj5HHGtFYEjXybiemaJ0srt8oC7Vu1G5em
 6fjJko1GgwubuAj5XmhTrk4lJnaB2WoPD/T6x4SkEnixXtR7kzS+Q41yt4iYFmwFMYjL
 l4Cg==
X-Gm-Message-State: AOAM531EbMiQRcZ0ZDEk0vRQtkb+ymVrYqaBwE2SIFxSdBnQJy/vWtZW
 fjMs71wakjG2xxO70tzxTADjyIpv
X-Google-Smtp-Source: ABdhPJzAK3hSFQX3+iM2UijCSN/gp9M2/ZbzDliAJRi1ONBhnKazyOD1fNH1Svsw+VYzYAvf1rabIg==
X-Received: by 2002:a1c:ba83:: with SMTP id k125mr11288465wmf.20.1589406405887; 
 Wed, 13 May 2020 14:46:45 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:45 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/11] drm: constify sysrq_key_op
Date: Wed, 13 May 2020 22:43:48 +0100
Message-Id: <20200513214351.2138580-8-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, emil.l.velikov@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With earlier commits, the API no longer discards the const-ness of the
sysrq_key_op. As such we can add the notation.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 drivers/gpu/drm/drm_fb_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index a9771de4d17e..533767100efe 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -307,13 +307,13 @@ static void drm_fb_helper_sysrq(int dummy1)
 	schedule_work(&drm_fb_helper_restore_work);
 }
 
-static struct sysrq_key_op sysrq_drm_fb_helper_restore_op = {
+static const struct sysrq_key_op sysrq_drm_fb_helper_restore_op = {
 	.handler = drm_fb_helper_sysrq,
 	.help_msg = "force-fb(V)",
 	.action_msg = "Restore framebuffer console",
 };
 #else
-static struct sysrq_key_op sysrq_drm_fb_helper_restore_op = { };
+static const struct sysrq_key_op sysrq_drm_fb_helper_restore_op = { };
 #endif
 
 static void drm_fb_helper_dpms(struct fb_info *info, int dpms_mode)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
