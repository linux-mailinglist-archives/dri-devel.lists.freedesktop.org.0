Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23BCA24B5D
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 19:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C7D10E30B;
	Sat,  1 Feb 2025 18:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SDIZ30GB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FCE10E354
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 14:52:41 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ef87d24c2dso1213925a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 06:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738248761; x=1738853561; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4t9+wR1gvYOJNHr9NeSWQRreAbXgDWXpWfnKGB8fneU=;
 b=SDIZ30GBVXqZcu0upmLpGKBOnWRxPmGYZdf56kBX5LB9vo2u9VkbgGnjJbvkL87fZ0
 pZW3aEH/Jtqbc43XqyhMoC2LKMiRjleJ1H6xQVOXkvHj/eODYEhCxgKNn6iA2Vh5Rxtk
 UeUEB5Z0Rp/uJ0NSOUbpeQ+18fef9ZLZDAbrikhp6VaucycrHIIDZik0ycv18S30QgXO
 mT/By+vqJijcHDW3OI63BbRvZSODx+SXoNonE3qlppuPpkuGNeZK/oJly3yV7MNu8/Mo
 hdp4u+wVnCQUJ8/1UvBDxBRnCnxHO0o8rckCmdoL2nDTXZKlo0vrYQqqjSNMivaXfKDD
 HDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738248761; x=1738853561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4t9+wR1gvYOJNHr9NeSWQRreAbXgDWXpWfnKGB8fneU=;
 b=cC0L2OPUwphklCmYahxaW2yy28y5ZGyH7xUpZUFeEDJSYQMFX5gasawaiGujQj+aAW
 O0gIXvyYefh6ALEYp9GjxYN3c8/OTlzFKAS4oc1YYl3PsKcf4qrj8GNm+eENCveDTL84
 YkTEWWRhRuVbNKczEpZMNqUufRZimGL4LsmdeCiMkvIu7dLaKNT2MlXA7plZYHXvtwzB
 tT8sBIaLpnfC4VX+/1Pj7Wom4mSyhgm+fezLeVvZIMhgIqZYgDuv/PzBrjD0tasy2Mxr
 mS/DEynJOYxWh13+VcdkObs8+S02+gWOkLo6vxA7kfT/iq3C7CLJAw405sbCkAJrvH13
 ebLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqncKdpxQ7iUyzqGZIs1VPdIXNaMvcn8YJ14GM4WuT5tycPNh1NWySj4EfUtw1xJzxD7Ahep8oErw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymMWBoG+axT4z+VT1RESB+Gv6FBQIaGJwpdnoa/FN8HuStV8MB
 FgHXRM6AuvtbVon52CctPrntQArCtelPn2kC8vuj8zbv8rPnKiUF1PSPwbXhNIVYGA==
X-Gm-Gg: ASbGncv0y1+g8TPhqe6CCQ2nBQhqjN07VtoQ8uCsR0ToihSm0amxS/NcZe8ZJfZCROl
 c5cNErTjUPU1GY2/DwlQVLX2SwjZWvYyXhTsEmSIqLlEQC3Z9SqaPtV84V3ROS4AILKTIMT7KW2
 ZdmRAxEL5Xg3KgCJ+f/7el9PpDMr7fsiHiJMQ4HRguCFZzl4G0TlGTyQ+xixzq5UIgo660tQYtH
 PhDOvitG3cMBPkZ0gauzFky28vIL2fjJjpXdMyH4Zq0R2f69LXBXxCK5VYnZ7PU56qkOubMnCGe
 Fa731ufTvdQ9riQHtoM=
X-Google-Smtp-Source: AGHT+IEUPs2Yt54Zvf4yqMZHMSJBVT6xqh1XSxZ6X6vGrPA3Otstapo5wNP2YkMrudnP0oxno+CS4A==
X-Received: by 2002:a05:6a00:180b:b0:72f:9f9e:5bc8 with SMTP id
 d2e1a72fcca58-72fd0c74655mr10807479b3a.22.1738248760800; 
 Thu, 30 Jan 2025 06:52:40 -0800 (PST)
Received: from ubuntuxuelab.. ([58.246.183.50])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72fe6a1a94csm1550257b3a.173.2025.01.30.06.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 06:52:40 -0800 (PST)
From: Haoyu Li <lihaoyu499@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Rob Herring <robh@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, chenyuan0y@gmail.com,
 zichenxie0106@gmail.com, Haoyu Li <lihaoyu499@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH] drivers: video: backlight: Fix NULL Pointer Dereference in
 backlight_device_register()
Date: Thu, 30 Jan 2025 22:52:28 +0800
Message-Id: <20250130145228.96679-1-lihaoyu499@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 01 Feb 2025 18:02:57 +0000
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

In the function "wled_probe", the "wled->name" is dynamically allocated
(wled_probe -> wled_configure -> devm_kasprintf), which is possible
to be null.

In the call trace: wled_probe -> devm_backlight_device_register
-> backlight_device_register, this "name" variable is directly
dereferenced without checking. We add a null-check statement.

Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Haoyu Li <lihaoyu499@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/video/backlight/backlight.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index f699e5827ccb..b21670bd86de 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -414,6 +414,8 @@ struct backlight_device *backlight_device_register(const char *name,
 	struct backlight_device *new_bd;
 	int rc;
 
+	if (!name)
+		return ERR_PTR(-EINVAL);
 	pr_debug("backlight_device_register: name=%s\n", name);
 
 	new_bd = kzalloc(sizeof(struct backlight_device), GFP_KERNEL);
-- 
2.34.1

