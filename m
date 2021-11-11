Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A092244DE05
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 23:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05A86E2C7;
	Thu, 11 Nov 2021 22:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2654B89F73;
 Thu, 11 Nov 2021 22:57:08 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so5780503pja.1; 
 Thu, 11 Nov 2021 14:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p0ib5mh0m9IgYQvAbwkxu2Vd7F/N58zy9lwbLSe3RPQ=;
 b=Ck7r2yklLFFbeh+El7AOfStAtNR1McHufDCIj1lNpnxb4iC9a+Zi7zIbawxSOoS0yj
 C+0TqFNmVPIP+Dn/6IcBxuRksJY/F5A+t29G27UwPUzPVxh42r4xRkQiBGH16ylT4DXP
 ev2H9WhPhuyrdVSUde1Z86pVvL3CPgdIONyzFWYHnz8LsYy6bBycCH/xS/Chn8sRp5dv
 zkizdbi4TaINVMB0Qv2qY+oB7Jy41nGT08OwT0xCohBhZUPLxdoWfB0yHpahkkk+dNcf
 7TA9jseEAVir9Z6OsR5mnixg7vWaWwY0gzkSzXtI0RsHljCRJG+t8dvJb4MwccSPFRQD
 xy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p0ib5mh0m9IgYQvAbwkxu2Vd7F/N58zy9lwbLSe3RPQ=;
 b=VUqheBIWlaBjyKGfOnA5OWaFdYoTyOB9S4lW9636SyqDpKsdE6PdZiF/gJjOd3UiCH
 stdVAM/4RWO/eEy5wiANR2Aaa3JnTAePqO+/IMhsqQunwCYpF8WS8GZfxbrs2e/xZfFK
 s1IxYI9F5lIx8rE6ObJls4jiuASzm7PvpMyONfyNW+3gfLH2VufRQAI5NffLc5Y78w0H
 mdSkbNAkrSyduXZUp0igBXEfIYKYarNalweH/ehM/qfQ0r3MBNopIqAWcDLwMgkskbdd
 sArYFmdGX8WuW4vURza7bsQYBJNDd5+/Q2LWrrqNeS7DNZRtzaAJA9zccKQ+RdTH/Vzd
 ZStQ==
X-Gm-Message-State: AOAM533MtXQLyk++wBGMUdEyjqanUv3CVdCGnfzbCF2XP4VsdPlxKfeZ
 xdjor6d1hZF1cZRc+/ocdGVRxzut8dA=
X-Google-Smtp-Source: ABdhPJwXxuqHiQ7wn6wlrhogFUw/YurkDkkM2WprlH3tc0LxKT/qyGi84rHA8R+cDX5t11sdnb3H0g==
X-Received: by 2002:a17:90b:3850:: with SMTP id
 nl16mr30708953pjb.10.1636671427093; 
 Thu, 11 Nov 2021 14:57:07 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 c5sm3165352pjm.52.2021.11.11.14.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 14:57:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Demote debug message
Date: Thu, 11 Nov 2021 15:02:14 -0800
Message-Id: <20211111230214.765476-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Mesa attempts to allocate a cached-coherent buffer in order to determine
if cached-coherent is supported.  Resulting in seeing this error message
once per process with newer mesa.  But no reason for this to be more
than a debug msg.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 6b03e00cc5f2..27c3ece4d146 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1121,7 +1121,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 			break;
 		fallthrough;
 	default:
-		DRM_DEV_ERROR(dev->dev, "invalid cache flag: %x\n",
+		DRM_DEV_DEBUG(dev->dev, "invalid cache flag: %x\n",
 				(flags & MSM_BO_CACHE_MASK));
 		return -EINVAL;
 	}
-- 
2.31.1

