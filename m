Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC3A2FE73
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C10E10E3FD;
	Mon, 10 Feb 2025 23:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GOlZVI4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52DC10E3FD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 23:32:52 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7c0545a1449so212558185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739230371; x=1739835171; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hs5o7sIfj/0izaV2OsPt7FJm28HaB4LTbbVNLtta+7o=;
 b=GOlZVI4Q1uv2VRNdlokRAc/uwgK5AtG1Jv+WAgBrvpOzuj4PW+jQ2RQO33yjANXGDL
 S9p9VORinxfMZj6BQ2ReoGswck8hRRC1bfr8vZRncLQGmWVYtEIrtKfImdMWZk6oHUqG
 EMHvSuA52AyvSzCh5i8nPtUnai+VKahNWwEGbLiUGFDdzvYUkmasSXZmot9WWoJpLu25
 9mDWxphRvS2IjeMMDLgn5JsDpcffvo1En9zEjoOqe25nVd7wrgFrHTo3xRjcgOoEU64o
 YUgCU5UI/1fuXOJSDoAZx6vmgzcCoOxj1v9yEHfmgQZkyYso60ZD8T9ot4/CBscEnHvS
 bbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739230371; x=1739835171;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hs5o7sIfj/0izaV2OsPt7FJm28HaB4LTbbVNLtta+7o=;
 b=gU2emfXiARSXnEiMJbPQQP8Ggt9GtcYEqpHtths6dytPOkvR5YuwxEnwqHO0JTPxjO
 UapA7SBEX098kvW/fuSnz5dZAwQL1A+135lmouYeRuueDJZ02esd9ZQ6fepfrWPBLJZk
 YUYrAvSmSQTUAaboQ3VwcRH8dSHy1nPzb9VQ4QomM6w6m6LpkJ43pvqozCrJTVZ9S+4o
 Eh4RKRPMP0zFUF9JlO+ixFIgJU8Ey6JcENKFV8J0XQ3uixCa4ENc5PQsWasD70lO0l9E
 8m+LZss4rxp+LMi7xm5Eu67qwvDLsWkR0jVxytT2M5ZjtO547qxNFgbCyFSrd+JXOXwo
 +LFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIIE+H8/i62fJGgu4D4rAr9pPb075qNnHWqtr143CHbgE8QrVWt4f/v99khTlwLMDVT0JHFuojKiE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwU9uHo2SNKb/d7jvbFWKJ1ok9TUb6lzPO7e5s0uv8+29qebsC2
 EpY24NDoCELRmi9knck3n5evRKFCLVWOo09fIpfLy0HIadyfIzfO
X-Gm-Gg: ASbGncuk4QmKKjC2q+ua+pNqFHvk7Ia1+2FRGGs0FWi1o492RUsMDMqtq/5YyCF1faX
 7K/mTYjGhqF3y6gDsLCVk4kNRGB57CLf32DaG88hmoKWSw7cF8z/xWY9S/4nahdRE8q/Poqlo4C
 n8saDhboJTJbfwgLj08J/CYKlajskkS1jEB+vGblPYPu61GuM2MYrsSeT9iDeKDk+JJaLVUXSYI
 AAqeavR+48vEZVYNbtEm7zMRhifCQSTxK8kypiCb4AqO942sS8wKACL4t1boZzdQo3yY4fu2GMn
 7G410OdMLMftSZe8OSiXuSN5AOewI++APo9sxfDxjoDQiWAYLQF7V443Ldlo9uPf72QndG4=
X-Google-Smtp-Source: AGHT+IGgFrE/m2Y9JZDQZ/mWcc25YvWcS1fKTDlDp8O/AKd0D1m5Ap8GO/3iwAKb4YEL7StINcBjVQ==
X-Received: by 2002:a05:620a:1708:b0:7a8:554:c368 with SMTP id
 af79cd13be357-7c068f8a167mr221812685a.6.1739230371528; 
 Mon, 10 Feb 2025 15:32:51 -0800 (PST)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e43babb9e4sm52467166d6.99.2025.02.10.15.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 15:32:50 -0800 (PST)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, tzimmermann@suse.de, noralf@tronnes.org
Cc: lanzano.alex@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update maintainer of repaper and mi0283qt
Date: Mon, 10 Feb 2025 18:32:31 -0500
Message-ID: <20250210233232.3995143-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as the maintainer of the recently orphaned repaper and
mi0283qt drivers.

Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
---
 MAINTAINERS | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c5b22f00434..b5e46f23d1ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7352,7 +7352,8 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/mgag200/
 
 DRM DRIVER FOR MI0283QT
-S:	Orphan
+M:	Alex Lanzano <lanzano.alex@gmail.com>
+S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
 F:	drivers/gpu/drm/tiny/mi0283qt.c
@@ -7455,7 +7456,8 @@ F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml
 F:	drivers/gpu/drm/bridge/parade-ps8640.c
 
 DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
-S:	Orphan
+M:	Alex Lanzano <lanzano.alex@gmail.com>
+S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/repaper.txt
 F:	drivers/gpu/drm/tiny/repaper.c
-- 
2.48.1

