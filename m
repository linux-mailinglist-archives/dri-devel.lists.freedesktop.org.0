Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5908C4A7B96
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 00:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7E710E630;
	Wed,  2 Feb 2022 23:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx-lax3-3.ucr.edu (mx.ucr.edu [169.235.156.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DB410E630
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 23:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643843845; x=1675379845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XA4HzDe0AEvwI/VRCaorqRe1KBJyowOMBeCxGfa6hn4=;
 b=K/ZfVBRErzoY9NLawHkRvN5wW0qAPgLfjf/IpaEnloOMXCqafJ+S/fmc
 1B3dVPAcVOiJCAUWRYMOTe+xAxnj8XP2r8Jmk6VEQvkFz2Onv72nQIc5f
 MRyp8d56OPyNAV7Dxlp745Y/XS6NVO1keJjjrX/7Wu8AnGyrIyeM0ETPx
 sF0d1qrBjZJ9LfvXPHsmol0RqjuoW8fcGCKQ+1j68KzogCdAt1iC4lj0O
 Dw6eywM4PgOxFVPfSjWK8xbU3HSZafAI3L7nb2fbvoD8Ex3zA0fkCgC5c
 Rkg9C2QtMW/4g8dVfnSfGSzi6Uq8doDs8dsKaF/agToqemmQYUV8Kp43+ w==;
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; d="scan'208";a="105390325"
Received: from mail-pf1-f199.google.com ([209.85.210.199])
 by smtp-lax3-3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Feb 2022 15:17:23 -0800
Received: by mail-pf1-f199.google.com with SMTP id
 i8-20020a628708000000b004c8b9764ac9so398602pfe.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 15:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x0gpjDLXaul+KimMP/te05qJYZBYJvmQ+lbw67iuhZI=;
 b=iG0hqIojQ+Btn3YyfJz0zIh+ids2UdHlcdajOgKekWODbOVBE25xUjQthNVNVCYJZL
 ziLiUrKHuhoXAKfwZ6C7H0nGSqSQhiN5jcNjOymYda/yMkGSCQpR8Jg0jBCRvZRWu7Ly
 FY1UCAwviBYMivvY4GLNBbBng5j7VlxTHZzhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x0gpjDLXaul+KimMP/te05qJYZBYJvmQ+lbw67iuhZI=;
 b=xnvATPmaaZNgXn0rxzBHhnpw4Qph/FtSM0qd5inXtRm0RIuliVD/26dBQSmMuiak/1
 TgYaWhuYGSGBf14OE050pWM7tO8B1BxUrSJ00BzYGjczF+q6AK5wvXofqkFRyauUHe8k
 3sutGsKRTEeWy8fbfggflpKFCGK7eRHUxoWY7uuTvDFMy2tmtvQPM94L5uyHAxSZZzES
 Vjqs2dV08YzpJm1Q2hL3In2+Q5MckSZmsuNgCpu/+4d4fcyuwTz95Y590cGIfWb2kgt7
 o/JxH/R+0xvBSBWspMuRSLaWmsPjbdgeFGuDU+1s01YZIusH3PADaFyTr1wp1pTQUwTD
 qXPA==
X-Gm-Message-State: AOAM531BJQhaVVOCbuL9e49PgGrS3rNGgjDKe3LYfbmD/QBk1Sb+dtTy
 faso0P2SYKoTRhMK88SN7vch58BtJn5KsNybJNmeKAaLWi//NVrFmCQDaMpZ4wmYVuOOwQ53YQ3
 8fhE81PUmXKtTOe7MRaGiDoEN02S/Jg==
X-Received: by 2002:a05:6a00:114e:: with SMTP id
 b14mr32122986pfm.31.1643843838887; 
 Wed, 02 Feb 2022 15:17:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOOE+HHe74jnu6gkVO3QanT2cNSA16ZEnCIFi4F5dLBKqCPSoK9K2Dq+OswSZYFwgxrT9+zw==
X-Received: by 2002:a05:6a00:114e:: with SMTP id
 b14mr32122959pfm.31.1643843838640; 
 Wed, 02 Feb 2022 15:17:18 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id
 j14sm27383525pfj.218.2022.02.02.15.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 15:17:18 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH v4] fbdev: fbmem: Fix the implicit type casting
Date: Wed,  2 Feb 2022 15:16:33 -0800
Message-Id: <20220202231636.1433050-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <882bfe4e-a5b6-2b2c-167b-eda8c08419e3@gmx.de>
References: <882bfe4e-a5b6-2b2c-167b-eda8c08419e3@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, linux-fbdev@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 Yizhuo Zhai <yzhai003@ucr.edu>, dri-devel@lists.freedesktop.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function do_fb_ioctl(), the "arg" is the type of unsigned long,
and in "case FBIOBLANK:" this argument is casted into an int before
passig to fb_blank(). In fb_blank(), the comparision
if (blank > FB_BLANK_POWERDOWN) would be bypass if the original
"arg" is a large number, which is possible because it comes from
the user input. Fix this by adding the check before the function
call.

Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
---
 drivers/video/fbdev/core/fbmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 0fa7ede94fa6..b3352e23caaa 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1162,6 +1162,8 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 	case FBIOBLANK:
 		console_lock();
 		lock_fb_info(info);
+		if (arg > FB_BLANK_POWERDOWN)
+			return -EINVAL;
 		ret = fb_blank(info, arg);
 		/* might again call into fb_blank */
 		fbcon_fb_blanked(info, arg);
-- 
2.25.1

