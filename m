Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8451B38C01D
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 08:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426CF6F49D;
	Fri, 21 May 2021 06:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D3D6F5B3;
 Fri, 21 May 2021 04:16:39 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 b9-20020a17090a9909b029015cf9effaeaso6626611pjp.5; 
 Thu, 20 May 2021 21:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:user-agent;
 bh=WRc2dTi2j0cBWfnXOzygB7tUMf1PqONoKF2ltQXZk5A=;
 b=IK/scQupUFUmZjR7WuCGM6VOzTsQumSseCKgqsBz8Xe1hZs8LqKU6eJJK5/JbOi795
 31SOmQ/u1ZzVMIgSLlt48shW/KmfwvZZtpuj/Ak3XRva/PWAiJZNkBA0ytIj3SAus8t3
 r9h/9XecJ0H64ZTpw6hiNM0eHkCt6DiXZf2UeFPp76kYGBR9e82PPMG9FBb3pSXj2QVv
 DUIxBQstCsvASLkpBBFWy1p7/G+SvGn4wwzAYPeP9h2NAly84bTvRVfCE6x7jBI6GLot
 Jcrr2+bnrGsLIfb/48vg1jWMgN3uu04o/8+KgAFmuqszZmuXgwtVPO/yCShsqxjlkZ/U
 gz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:user-agent;
 bh=WRc2dTi2j0cBWfnXOzygB7tUMf1PqONoKF2ltQXZk5A=;
 b=FfzQkhfHU8aGjnz4phNRtryxv3KaiRNOyJ99LMCknHZ3MFs2DFx+ZH3CbQt2Yzwu+c
 h7kAmdeZTwpMhxXfAByUPHBMG2aIPFAGLylzdJLjOuu6fN82lCVfL9Iu8D6b4rdK1wY1
 tRF9YVIMsWTeMo/p2aVfXiIOZx4vcbjdl/2hXIYrJGNxdkiJoPTGjvCPUas9lWon4Ald
 sf8UB7u8KHz2IZ36plaAGCFzsuhyJ2vLPYGIiM5LoFrO0VWgt7vHfhFh2OVLcP+ukn28
 jmDsx/hl3vXknEkPQGtMK6aZFLI6RsMYXs+yzEAotta/nOIibXWOQI7FQ0225YogXETj
 yrFQ==
X-Gm-Message-State: AOAM53104K5Jsdwc/8aBcDc5FZL75b3ul7BeJzsjtbPttxl4KE1F/wn6
 piQY0FfmjwEHk3D9Z1gkdR4=
X-Google-Smtp-Source: ABdhPJx3niu1eWdFCijc4XeXW5ERpS0VFjddRYJZU8IqE4xiyvqKJatzCvGlkGOew4J3H+ZvEKGw9A==
X-Received: by 2002:a17:902:da86:b029:ef:70fa:7b39 with SMTP id
 j6-20020a170902da86b02900ef70fa7b39mr9780905plx.81.1621570599116; 
 Thu, 20 May 2021 21:16:39 -0700 (PDT)
Received: from raspberrypi ([125.141.84.155])
 by smtp.gmail.com with ESMTPSA id y64sm3103960pfy.204.2021.05.20.21.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 21:16:38 -0700 (PDT)
Date: Fri, 21 May 2021 05:16:33 +0100
From: Austin Kim <austindh.kim@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 angelogioacchino.delregno@somainline.org, dmitry.baryshkov@linaro.org
Subject: [PATCH] drm/msm/dpu: remove unused variable cmd_enc
Message-ID: <20210521041633.GA1747@raspberrypi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 21 May 2021 06:56:34 +0000
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
Cc: autindh.kim@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-team@lge.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After the call to to_dpu_encoder_phys_cmd() is made,
'cmd_enc' is not used. Where to_dpu_encoder_phys_cmd() is simply replaced with
container_of(x, struct dpu_encoder_phys_cmd, base) by compiler.

So it had better remove W=1 kernel build warning(s):

  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c: In function
 ‘dpu_encoder_phys_cmd_wait_for_commit_done’:
  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c:688:31: warning:
  variable ‘cmd_enc’ set but not used

Signed-off-by: Austin Kim <austindh.kim@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b2be39b9144e..088900841bf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -685,10 +685,6 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete(
 static int dpu_encoder_phys_cmd_wait_for_commit_done(
 		struct dpu_encoder_phys *phys_enc)
 {
-	struct dpu_encoder_phys_cmd *cmd_enc;
-
-	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
-
 	/* only required for master controller */
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
-- 
2.20.1

