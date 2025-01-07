Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D295CA04E2B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 01:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA6F10E41B;
	Wed,  8 Jan 2025 00:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XkEU5gE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C55410E3F4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 11:08:48 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2162c0f6a39so231978735ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 03:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736248068; x=1736852868; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+gpidHg4ZEv86QzDzlKxlsaugZmzV8W/+flQ1q2lIWg=;
 b=XkEU5gE3QjYv+P34iH+XriDKNaYpj0wJiyOvLTPbsp2S2O4Z+vJHwOjbWRTQeI9FQi
 0xdgNU7ojh9ybU9sW/8ir74X0cbhx6Fkuuru5QytV3YBW7SSSz/ibOBT0ei/uiX4+O+P
 aIh9iue7u4wIMRbcWEjqZdqAJaKebmrFL+FcZxGxp9HX0RNtUIdNce8C45YY65pywNWF
 1opsabGGiY3EypPkaIizstUkpCyX273wfm768aVVFWYbGJI9qg2U0ueTMM5/ye1sIwpu
 iuy/Ch+g8Y6T2Ld2Ni/faO7EJtnUCxyOWo92CaJ6rmX7R8OhyOOo5pa6hBEvBTKA/Rp5
 +dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736248068; x=1736852868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+gpidHg4ZEv86QzDzlKxlsaugZmzV8W/+flQ1q2lIWg=;
 b=s5nDbo0LpaNOzL+/hywpSXW11hBwq+Q+a9EplaUH3NmkSJh77+oXY6pMZsr/bwep9v
 SeuXtETpt1435FqZpYnER5/ge1nlH+q5Bpi/WGuZRyfettAX4FSq+6Ak4kkvlK6L4Z87
 8+wYOmRMesiTd4XxZ8Y397FA5X8J2lgpwTM8Y02AGe7ZJc2Q3IGYBOlXpOMY68RbefAt
 6JYgxoUiafKq4mSB4b0vJztXG9CI7hZOz1q7e6HKH/Z23pJ47ifemDQadL02kQrF4GYI
 5W81dYxGeMCHNVM3Lh68rFPiMjYhNs8nh/EgWgChQSXbD/Idybqj7QbM0W52wN3TL7Gf
 sEgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjjge2yQoxPkGwXEFtB1Ej3YCksqlBHRc0wxs5/up1YJmU9Jl1xb6Cy5DcjZrk0zixoWlT9NaQaAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHNmW1knPCKADvHGxFjEPuYQtEkH4qnhxGwTgFzEXPxNq8Lbvq
 4QaOvZF4Cp1gkldlSQ9Mwod8YhwbkeRvjRlj68dskju7mlTijpbh
X-Gm-Gg: ASbGncvxXLHD5tLM3AF0QCmErMwNpj2/EEA4ZY4jzbiwy/HW5jDJHng4o5uz/CDXcvt
 rS0wX19F4Ee3hOkXK6kdvYx+BLEkP4iEya9lI1RNW4fNdCoNL+tDXJ2C0xm0hImQf9UygEQH0yk
 YYLYgdly0q6dzG/O26lhaiQtoXhrn/5TvKEO+4PkyxKUQPtLIo81MbdsVOOC8keBM5YYGFR979g
 3xOcK3f9M9Tu4oDPJfjmfQhkxDQJceSM53YsHQ541tbF2E4yj0EB1jvEyQU
X-Google-Smtp-Source: AGHT+IFnKr0prDsnls7vITkSRyba2ySXzsUmxWywh/xtaoNVIj9jHc51Feo+dXAMeTo2HxpTo+cGRA==
X-Received: by 2002:a05:6a21:150a:b0:1e0:d5be:bf75 with SMTP id
 adf61e73a8af0-1e740119c52mr3471384637.17.1736248068019; 
 Tue, 07 Jan 2025 03:07:48 -0800 (PST)
Received: from HOME-PC ([223.185.133.12]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad815804sm33148964b3a.32.2025.01.07.03.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 03:07:47 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH drm-next] drm/bridge: it6505: Fix unreachable loop increment
 in KSV list check
Date: Tue,  7 Jan 2025 16:37:40 +0530
Message-Id: <20250107110740.42892-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Jan 2025 00:34:40 +0000
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

The inner loop in it6505_hdcp_part2_ksvlist_check had an unreachable
increment due to returning true before the loop could continue.
Restructure the loop to only return after verifying all 5 entries
match, making the loop increment reachable.

Fixes: 0989c02c7a5c ("drm/bridge: it6505: fix HDCP CTS compare V matching")
Closes: https://scan7.scan.coverity.com/#/project-view/52337/11354?selectedIssue=1602785
Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6..2ff2245abdeb 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2255,8 +2255,10 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 			    av[i][1] != av[i][2] || bv[i][0] != av[i][3])
 				break;
 
-			DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d", retry, i);
-			return true;
+			if (i == 4) {
+				DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d", retry, i);
+				return true;
+			}
 		}
 	}
 
-- 
2.34.1

