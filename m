Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAAF8BBAB9
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 13:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DC010E8CA;
	Sat,  4 May 2024 11:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tlBJTZl4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8208910E8CA
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 11:26:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-34d0aa589a4so358781f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 May 2024 04:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714821976; x=1715426776; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=acScVzoT0UgSxQf+NXyCSZ3pQCph88n8DycCWGq+e7Q=;
 b=tlBJTZl4Rl3+lhuvxwx5uRh3b9jd/4bo9bdZQl3IMeP3bqNfN0zcTqE6zhy2YL9xpt
 yyqIgmhH+xcg0VtZSTGTBAKPB9p+ySHyWh+YI1PoFQGeeRU6sa2T0ypsSfP82IAw2G63
 wZ28ebEUuNjzDmyQSi14496j9Uar8Cnj2AT+j3gusaC3/ZKEDGv+es0j6DCAHekv5Knm
 JHubgiSVa0sEhQPeD9Tf6lTkJw6krddSBx3FZIefNLAV+xmiRecS00WbXhsdmG9FP+C4
 bC4Mgn9/JBNMmHjuPHbbKr6HT7OY/gWkcif8jXEg/SrBOOMb+t79AC6suKHEKbp3q1w3
 cXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714821976; x=1715426776;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=acScVzoT0UgSxQf+NXyCSZ3pQCph88n8DycCWGq+e7Q=;
 b=f22wc5j5YDP6hI1IZjyQmD0/5qtUyl+vRkydhXFWKhDKSDeHutso5zSYKSWlh72+7z
 h6M2cJ9UcNyneZUWtNS6oVEFtcvxxEIFnNHuwQ0XcPss3yhWhyyMSHRYM4zsgKNIgRjP
 ms6geySPS4twJOE/hznC53dyXVN0xW8zyWwT+reWGXixtv/U5ZgDtm+6RDeug0QA7eek
 qwKPCro62rd3PbOIIWv0avXAx9lRspv6y84a6jwWSvlETaBg2gwZiflMiBJaEANS05Px
 4hMTF90XJ3oVxKApNskGH4E1Lq2okyh09Do1Ym13iELWDjFNxUDXJ59YPbKrpfuZyM/W
 ewuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbDXvucvkEyXJzafkSIfriBo2dZHMBhC7Ptcz5Kxi5WCdTR/TJXb5fJPXz/Hq5t2Md6jNgLkF4WsPQ3i3v8weozMLscSWU6SOC2nBnXmUU
X-Gm-Message-State: AOJu0YweuYOu6vgPMrFhtpDRg+ttAoKlhelxIUzo2Ipu9QQ1Or9L4974
 6w1BcZIQ6yk/GZZeN3yCL+yCYlxG7zxInGaYMbvm/V6iPBkjR220f3HA6V9S6Pg=
X-Google-Smtp-Source: AGHT+IFhfIrzcRrSB3PRVXEa7IfD64x3DWvrLyolPJso7AtMaTEliUXy1Di5c3Y9F+bGsvZnwecfpw==
X-Received: by 2002:a5d:5542:0:b0:34d:1d09:f06d with SMTP id
 g2-20020a5d5542000000b0034d1d09f06dmr4990315wrw.13.1714821976417; 
 Sat, 04 May 2024 04:26:16 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 p8-20020a5d4588000000b00341ce80ea66sm6013320wrq.82.2024.05.04.04.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 04:26:16 -0700 (PDT)
Date: Sat, 4 May 2024 14:26:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Tim Huang <Tim.Huang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Ruan Jinjie <ruanjinjie@huawei.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/pm: Fix error code in vega10_hwmgr_backend_init()
Message-ID: <502fda28-fde7-4851-b17f-4d48848955bc@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return -EINVAL on error instead of success.  Also on the success path,
return a literal zero instead of "return result;"

Fixes: e098bc9612c2 ("drm/amd/pm: optimize the power related source code layout")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 37c915d7723c..9b9f8615070a 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -924,7 +924,7 @@ static int vega10_hwmgr_backend_init(struct pp_hwmgr *hwmgr)
 
 	data->total_active_cus = adev->gfx.cu_info.number;
 	if (!hwmgr->not_vf)
-		return result;
+		return -EINVAL;
 
 	/* Setup default Overdrive Fan control settings */
 	data->odn_fan_table.target_fan_speed =
@@ -947,7 +947,7 @@ static int vega10_hwmgr_backend_init(struct pp_hwmgr *hwmgr)
 			"Mem Channel Index Exceeded maximum!",
 			return -EINVAL);
 
-	return result;
+	return 0;
 }
 
 static int vega10_init_sclk_threshold(struct pp_hwmgr *hwmgr)
-- 
2.43.0

