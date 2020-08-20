Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7AA24AD65
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 05:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B7C6E895;
	Thu, 20 Aug 2020 03:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173B06E894
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 03:41:04 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id d19so497904pgl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 20:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=J8YVoHBmhP7CwdTtvl1VuAAC1kupCb0CJ2Q7eWIL2Qg=;
 b=AU6pOAFyZUuERVPlUGgQ633WDZ41yAxyiPrfn91iU3wpnAPmf83Atkl0hdBSgRmmQS
 ZRjcfQxA+fFqXOfJY/CcH1Ey1UJnYB374q6Zg6zrY+vQldYy40Sq3WpW19jFKM8kncFR
 sICeqEb93KmCfIlNkBuLhO8EXviVMyxL/narlfzvxjt2d31fXtUTgkxALNvyVPFSkDHY
 OarfKqjNid+4wytiNixG0wOlTER+obDITTobrWnFtWAUxICEccsVp6YtHtGlzaclXw0p
 fCUB5NbFnDne0+bgV9UZe9umxJtdTCRMjusN2+Cd3dsrweZQhQZ3M+LzPKkPw0aZKOzB
 M9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=J8YVoHBmhP7CwdTtvl1VuAAC1kupCb0CJ2Q7eWIL2Qg=;
 b=ni6UVLuZ2x1Yx/SPnD1QpcXHii5/Gywls1Z++CB0id/v+Sq94uLmDlvTaVZKzcWRMw
 NRUh5S6l0qfgy9RfQ8h4bsJoZurEyJMLojRYl8uTg+eG9jAF80eKoppEnqbweUbuOzGJ
 XtmB1zsiMYylYaP066cKTWoxExkGz7NVFgVSaMubjj0D6KXf8XpgSaGNZ9+G5KtoUAAa
 rn0I1hlCMn6VV7v92kaN9L5Q1+DzXNc5JiNxd+0hXqbTbk9SQRGhf3oVBDaDTce1rjvU
 90khMkiFKuGHgeBr143NOqxHQ0C8REFnnlQ8J3i7qCt0m4MLHRNwSNSkKpsYrcm1gAKU
 eyQA==
X-Gm-Message-State: AOAM533SVyVs4A7rLCLSQDmIZmqnoCAXZ/mKset3wWCf/pAIBelX/jYB
 ssQDTEqKDQTX6XIF109C8A/Acw==
X-Google-Smtp-Source: ABdhPJyhB2GNDaHZkcuGGQCn+7emHrUxCM2nzwttMrYziKfs722BrdQHw/nqTvpSU6n6JeP5+jhfIw==
X-Received: by 2002:a62:5cc4:: with SMTP id q187mr799823pfb.95.1597894863592; 
 Wed, 19 Aug 2020 20:41:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y126sm786477pfy.138.2020.08.19.20.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 20:41:02 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] drm: kirin9xxx: Add additional color formats
Date: Thu, 20 Aug 2020 03:40:59 +0000
Message-Id: <20200820034100.128062-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200820033939.127932-1-john.stultz@linaro.org>
References: <20200820033939.127932-1-john.stultz@linaro.org>
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
Cc: Liwei Cai <cailiwei@hisilicon.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen Feng <puck.chen@hisilicon.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is against Mauro's tree here:
https://gitlab.freedesktop.org/mchehab_kernel/hikey-970/-/commits/master/

Add support for two color formats (ARGB and ABGR) needed for use
with drm_hwcomposer and AOSP.

NOTE: I see Red/Blue swapped colors with this (and yes I did try
the obvious swap of formats here, to no luck :), so I need to dig
more on whats different from the other driver on this.

But with these formats supported drm_hwcomposer no longer crashes

Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Liwei Cai <cailiwei@hisilicon.com>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Chen Feng <puck.chen@hisilicon.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index e3a1f85bdbd2..f2e99c766927 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -55,14 +55,15 @@ static const struct dss_format dss_formats[] = {
 	{ DRM_FORMAT_XBGR8888, HISI_FB_PIXEL_FORMAT_BGRX_8888 },
 	{ DRM_FORMAT_RGBA8888, HISI_FB_PIXEL_FORMAT_RGBA_8888 },
 	{ DRM_FORMAT_BGRA8888, HISI_FB_PIXEL_FORMAT_BGRA_8888 },
-	/*{ DRM_FORMAT_ARGB8888,  },*/
-	/*{ DRM_FORMAT_ABGR8888,  },*/
+	{ DRM_FORMAT_ARGB8888, HISI_FB_PIXEL_FORMAT_RGBA_8888 },
+	{ DRM_FORMAT_ABGR8888, HISI_FB_PIXEL_FORMAT_BGRA_8888 },
 };
 
 static const u32 channel_formats1[] = {
 	DRM_FORMAT_RGB565, DRM_FORMAT_BGR565,
 	DRM_FORMAT_XRGB8888, DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_RGBA8888, DRM_FORMAT_BGRA8888
+	DRM_FORMAT_RGBA8888, DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ARGB8888, DRM_FORMAT_ABGR8888,
 };
 
 u32 dss_get_channel_formats(u8 ch, const u32 **formats)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
