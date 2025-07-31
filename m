Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8FBB16D57
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 10:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8468110E725;
	Thu, 31 Jul 2025 08:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dJrKHdzQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B5810E25C;
 Thu, 31 Jul 2025 08:19:31 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4561a4a8bf2so6392295e9.1; 
 Thu, 31 Jul 2025 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753949970; x=1754554770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PkEegUpZ9ZzAqOYrg/wkR0sKWBlbmTquOxH2q3dqSXQ=;
 b=dJrKHdzQTX7mDK1K+Dj6qNS2thoThjJvDwOrpGnsi3ECDh0gbFzwSRRQG3zffis/GS
 0YPccQotrOXTfx1YPX73SXYHe/2y3DVoKdfX87F34Vdh/KNnmkzoyFofcvR278AjEeBl
 vSaXR2vLUUtsmkLhq2bFpsNopwUEwRpqHpKVlCKg4ODPxYsjWLelQC+O7gqbzxeNMzho
 q21Wqr5xpJFnScAtKh7cDzwA2YMRH8kXMjsb0ni7DsZDJiKHZMwYWGlCc+3ajP/mn4wZ
 yjE6llCj3d5VnJk+X/Qev62PC38NFN1AXjpWN0K4JoWFAe6fxk32oHJuatL+wmhNrtM8
 Zy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753949970; x=1754554770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PkEegUpZ9ZzAqOYrg/wkR0sKWBlbmTquOxH2q3dqSXQ=;
 b=bjC2AnN3WyOLJ4ds0LSsZ+/NqF/CyZciC2HtvX6+wmpVX3fFc1dgmK3KOHT8CX7Y+n
 /gT0cQGWSd/I9tjjaKAa3lU5eNWzwN9Azr3w0gKc4g+LmQx9IfxN/TF3hk0YsXl77X7L
 Csj4jN9jgizm0P9JVAY2qeUEZhrgSLDz0FXo3cGzaZ178S62E/VO7TotqO7kQJSSbnlD
 yCZZmuZlLXZLqEb4D8GJHRz99t2lve81UGWn1E69gPmMDLNWmkoJK7hUjcJ9yIQtQBTI
 0XO+ylNPkUuQC4JmJMkhQKKDhJQlM+tJu0MCmej/F1NlKu0E7Isp4pSH53pfOt30S4vv
 6dmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiaw9Lj85GlgBeX6PxCPZQiZ/OVoEWNccumLPRPuBftmyi52P59MHrrkYzj1ZHQfRWFQRC8wbBhhA=@lists.freedesktop.org,
 AJvYcCV06MAQme4F6Toca4jMtbllo2e9UZa+FOIiLWFq1ok9JD4Oez/kbu7a7+op9qViHxsoaZ33Rr/Gwjfi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFIWTwgNKyQp3IKRp2nr5SmbR+DvTOwh8ImofajXtjLd/ahmob
 oSselG4Oem3WHy3k01z8gDyUDKZ3sw7VtwjcbidfE0+exCEhP4G/3mBK
X-Gm-Gg: ASbGnct7Ap9cP0zb55UBunXrCstK1ku16HwWbxud1B4+i0t1X3AR4v9oeNWu6t8bJkL
 Lvfbv3KVVkvaaS3RHdaWkF8nzpEuHMtYctUTV9IjVxQA3cbYX+DcTthtN4mF4YMxAvtW6jCsDOG
 /DdxV4uOb+PMf/6qtvLOqkD/Ss75Clq9UYmNIdr8sqeLkrFnPwB0awuSUwMf1SxSlYear2Lu7O7
 4FrDCs7h0g611D+11exuqsHk6GoOph+aw9ibGOjWpYVcwsl1rzbAlSSUKk9m9xpkOjOsIsNuPx5
 sG2HrZcJGyPURkd+KWBhCqMMjp9rYB8OJYb2YEURGmNmYAGAZAIrTvgMh7ds3oebiR4fWJsNzEY
 Xycw2MAsGienn+TgPckAv
X-Google-Smtp-Source: AGHT+IEPDaMVhWW2n1WGfzfBPNzx+lnFtPTcM8Lln0dXEBRsQakWJcRvnKqucP1A7XtQmDuBApddnQ==
X-Received: by 2002:a05:600c:1d23:b0:453:483b:626c with SMTP id
 5b1f17b1804b1-45892bd06e6mr45659025e9.23.1753949969880; 
 Thu, 31 Jul 2025 01:19:29 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4589ee578e4sm16780525e9.26.2025.07.31.01.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 01:19:29 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/msm: Fix pointer dereference and use dev->dev
Date: Thu, 31 Jul 2025 09:18:52 +0100
Message-ID: <20250731081854.2120404-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Fix a potential null pointer dereference issue and replace
minor->dev->dev with dev->dev in error messages.

Colin Ian King (2):
  Fix dereference of pointer minor before null check
  drm/msm: replace minor->dev->dev with dev->dev

 drivers/gpu/drm/msm/msm_debugfs.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.50.0

