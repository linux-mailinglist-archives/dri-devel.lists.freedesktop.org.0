Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE743B29A27
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 08:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B050810E3C5;
	Mon, 18 Aug 2025 06:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NkUP1d8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384F010E185
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 00:00:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3b9e4148134so1712446f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 17:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755475258; x=1756080058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m1/hI4zAQpa/yacZ07Q91nQ7zDbp9gtYAaNYK2UtTyI=;
 b=NkUP1d8w1AbZo4H/Ed3DVKtZu2xIYMfyEkw+0TmKCxNr/TuwM6mDI5Lo5KFjby6LcS
 ANDybDD3kE1lMP1OQm8SejGWIqOj59+djipAv1KTjCsaQqi5Y/xZn2XS51yv3DEKxwSx
 nuypo+/ySNwxf4yExEaZ0vKa4ledIjeZLjbttW3w5nvgoxMQGBjVIdMrmWRuvuXkdryF
 cbLJchKSK9CWfRZh57q19acBu7DxssEmZEN4rRnFAwbxAOrrlx57tSiawmctLcCmax8/
 KQbos1Bzp4Lg8J0KCvQie3KTx6LNjO/7iQaVjnAgqtwGcivT6+h2Mln29Uy6+2YS01sZ
 g1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755475258; x=1756080058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m1/hI4zAQpa/yacZ07Q91nQ7zDbp9gtYAaNYK2UtTyI=;
 b=LbNib5uXRXHFANYl6FKd6KSsDrpZiGVEENjlJstIOISGXMpJWMjHIKreZiPU0lU7qw
 T/Wh4TdoWb6WLjwR11RrnUkSQ0gZ47Uqe4tadlnBrpV3awdVThqC5WbtpF31IJXI2Ezy
 4X5xOFNxopzscm/QGAcJysC9MVvtWFE3+cVVjYnI/+kjHPHi5JZ+it9l16rQ/kDVa/en
 M8yT18G9XKLEG1jeyOwJNi7LMWYy4J+pYU8oZwT/2KgbfsBcKLqMoLgz/oyQbFOdA04i
 xQupSslFawTj+wExR/zooSC6Qf4UzFqEEJQeow3FrZ6lRYUyGjwvnuYIUhfy//fQCEGf
 XGSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUCqmXPGnxCHCLyeEwjxMNzrvmE6/iCube+xJyWS6vGnRmtCgZVYeNPctAbLUYVWTlnHoQobgurrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBD7fHMq9sz0RgPS/GgcQQecrKfmvDUFdqhWmiDxiWn6fQzgeC
 +pTk7o+n4vmAtiahJuDfoZUgWYyu22O1JYVbRr8pHeNX3+MurTBkC4uu
X-Gm-Gg: ASbGncuVr7ndNofGblA2ChV58mxgahAUt+de2TkHxco7oqB2gQXV47KQvexzvSlXp/u
 PgYeskWXKfnUskGIeclTG9Uz8STz22JNwoYxx6JUSJPlec4tCrCDK281WBCy7HDo2FUL6Il889I
 OHze4WLHY0qvUVCnP4lM2ZAm1Lgnry4VY8+vZ1jJlYLm9R+5BHeqm6StR/QpquzMe3QZAw2pOBJ
 MvACgmvehPn6dk9al6bj49J9cUVjHjjRi/5xBQO4kqR24CC9YlvgHdg//hCdpJTi/oKup7taTWr
 RhUpD/YsBC71y5dN/P9MlJ5JiXTAZv3oId6fJ9WLQPYTqQvPaCEnxHTHNJwih5hbf/ZFuIFnmif
 cIGWE0EhTEzI2ESTCSciZhcJoMRmZIT0Ula8Ny7H6Ph3FyjbfZhsCLg==
X-Google-Smtp-Source: AGHT+IEAB+WLlffq7V8E4TMyf2eXBnLp5sNhzDD2NavmOoKq7fhLVZX5GaQCOGPobQS9T6QuJHPudA==
X-Received: by 2002:a05:6000:18a5:b0:3b9:10ee:6e9a with SMTP id
 ffacd0b85a97d-3bb6864061dmr5979713f8f.33.1755475257446; 
 Sun, 17 Aug 2025 17:00:57 -0700 (PDT)
Received: from stiangglanda-IdeaPad.. ([85.233.101.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb676caf79sm10734359f8f.42.2025.08.17.17.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 17:00:56 -0700 (PDT)
From: Leander Kieweg <kieweg.leander@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: "[Leander Kieweg]" <kieweg.leander@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Sean Paul <seanpaul@chromium.org>, linux-kernel@vger.kernel.org
Subject: [RFC] Plan to convert drm/tiny/bochs to drm_* logging
Date: Mon, 18 Aug 2025 01:57:48 +0200
Message-ID: <20250817235836.134286-1-kieweg.leander@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Aug 2025 06:52:07 +0000
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

From: [Leander Kieweg] <kieweg.leander@gmail.com>

Hello,

I am a new contributor looking to get started with kernel development. I found the "Convert logging to drm_* functions" task on the gpu/todo.html list.
The task description advises contacting the relevant maintainers before starting the work to ensure a patch would be welcome.
After setting up a build and test environment, I've identified the drm/tiny/bochs driver as a good, self-contained candidate for this conversion.
Would a patch to convert the remaining legacy logging calls in this driver to their modern drm_* equivalents be welcome?
Thank you for your time,

Leander Kieweg
