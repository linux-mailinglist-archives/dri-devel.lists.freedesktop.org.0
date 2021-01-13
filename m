Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E72F4D89
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383D66EA59;
	Wed, 13 Jan 2021 14:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDBA6EA4A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id c124so1836506wma.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z+Wneugk0qlue2K4+v5y/OOFUzDsbbip7TVziVpxlQg=;
 b=IrAuQ7STah/wSU3pxyHJvgSYn2RFJdHG53sANMcOvFWEelHr6MWbdgH0ILose47Zot
 Z7KuINVRHXAMOA906n8OR8iFtf4Nj4LcjAyitSzAalDlz9HRtVPGlTQdbmekRtEQvGci
 mwZQ7Bb/HQ3c6/5luRJ3paeeu2VckReWTpFW7IRFzHAedOHDtIquldPM8aztOfgvKxxD
 s6M1i1MfLLNqZIHLouLNp+LTtcAhj/vFkE7Sl4+oIe3REJUFHIDtu/tkOMeXBy2FAK74
 x/2MlHNNGii/IG81iFi1rPP9oiZBxGa2SQxXcMDTHrLT+hIaHOP1bEfVoE+Viqsap5Ze
 aNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z+Wneugk0qlue2K4+v5y/OOFUzDsbbip7TVziVpxlQg=;
 b=Sa7Dx0sE0nvL/pdNPqjSgl02/nu6GikR44NWlltx6b/qN9b8rwo8Yqo0qOd8Bz5Az8
 VCRWd1ogkP2kTIjMxKe5Vs0SZkzPG0BjlOMsnFJvSu31/+THVa48QS4vTd/HU28TkrG1
 s/uCEqh+OSj56c7KFicU77YzNx2hK/uWDCc+LckSzM9QQCKKHcpthEfyEHzlNS4XQS5i
 907D3noMSIYD7/pz6BsTZddIjXAjXhBwTSmZqLgO79euGqNWCLM4s/J2sJ+BlD3sbxa4
 Js4nsM+LdhoUo+IX2HOkRX/eGPhXkSg+rIOSzmH4mXzc7ZilRr0pJ+NAl0SV7v4FcAdz
 TW9g==
X-Gm-Message-State: AOAM531BAIoGUD4oUTv2exYyXELR4PhiAskZaOJGPeWg+1eWK/u5KVAQ
 VUxnoUS3jgKpR7EKliyPzg7Qeg==
X-Google-Smtp-Source: ABdhPJwjKCL09Sc77kIICMVKTnbILEqHPsQQ1uMvyk6hJHaNqRVyJKhV6HK5PA5SegcO2ZY3WnDx2Q==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr2562890wmj.168.1610549417412; 
 Wed, 13 Jan 2021 06:50:17 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:16 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/31] video: fbdev: aty: atyfb_base: Remove superfluous code
 surrounding 'dac_type'
Date: Wed, 13 Jan 2021 14:49:41 +0000
Message-Id: <20210113145009.1272040-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: "Eddie C. Dost" <ecd@skynet.be>, linux-fbdev@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Alex Kern <alex.kern@gmx.de>,
 Anthony Tong <atong@uiuc.edu>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If used, 'dac_type' is overwritten in the '#ifdef CONFIG_ATARI' clause.

It's also not used after the last assignment, so we'll rid that too.

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Alex Kern <alex.kern@gmx.de>
Cc: "Eddie C. Dost" <ecd@skynet.be>
Cc: Anthony Tong <atong@uiuc.edu>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/aty/atyfb_base.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index c8feff0ee8da9..11c328f0585ce 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -2365,8 +2365,6 @@ static int aty_init(struct fb_info *info)
 		par->bus_type = (stat0 >> 0) & 0x07;
 		par->ram_type = (stat0 >> 3) & 0x07;
 		ramname = aty_gx_ram[par->ram_type];
-		/* FIXME: clockchip/RAMDAC probing? */
-		dac_type = (aty_ld_le32(DAC_CNTL, par) >> 16) & 0x07;
 #ifdef CONFIG_ATARI
 		clk_type = CLK_ATI18818_1;
 		dac_type = (stat0 >> 9) & 0x07;
@@ -2375,7 +2373,6 @@ static int aty_init(struct fb_info *info)
 		else
 			dac_subtype = (aty_ld_8(SCRATCH_REG1 + 1, par) & 0xF0) | dac_type;
 #else
-		dac_type = DAC_IBMRGB514;
 		dac_subtype = DAC_IBMRGB514;
 		clk_type = CLK_IBMRGB514;
 #endif
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
