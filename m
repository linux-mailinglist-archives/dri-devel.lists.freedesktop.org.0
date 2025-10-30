Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44108C1E27F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 03:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F9D10E230;
	Thu, 30 Oct 2025 02:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JEM0LZ63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D0E10E230
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 02:43:33 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-340324d333dso558756a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761792213; x=1762397013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMlK83sRn+VhWWIH2W0HcuZUd6ezZqUJ2SDuOnakwiw=;
 b=JEM0LZ63m32McQFjZEHbwNB53AbpyIZzN1qVaotXWRo0etnQ+/fSSSVpGokHlRPwvF
 3EaHSH2/AkXCl/ey3LbfkGoJPtNV7XOUq7U1r9VJFOKlQznigXr8Rx3SmLZV9YK+5Ell
 0R5IlwMZTXPPydvO/LMmqY/9uzygP7nTMtVBfsEiMC2LSgDiVhZHOz5KeAuV6fnv6PgN
 bGa/99Um9BBF+POQOFVWwriam6ZnRqQ2pE03dmY0WIdJsdEpVDdy4d8dDRqMdfcB+6My
 0KPlufnMD8GUulgM9QaNyeFYXmBV8DL9iG2euo+btt6ekSvq+sYSNrwGZnFO+GHb6bIk
 jyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761792213; x=1762397013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yMlK83sRn+VhWWIH2W0HcuZUd6ezZqUJ2SDuOnakwiw=;
 b=duq1x9g0fGsSMEP/ZNBO1PrJ2t0u1OQshnzUSfWqklBe9P8XOFCcpnZTCUn6TGLkvH
 krKxsqYLKerLRebnE0CE0JT64S5V3zsjdtzkStvO2Z4CVTv+D06PB1E5cm6g23m3StiX
 jCDJlyuuc7RwAWDivy9HLLlg4O4fbc1DTzY6xMlAalxE43cknSVUxMF4aG881h1QTzLf
 etGkdQfxGqkkyWTq7HQDXWcF8qxP67zaSwZlet+18AA6mcS8LtRyjuK8iRblVmdvIZrb
 7YQ8tYD/JUqclFlvSFIozOMEA2gCToKj6n3vZy6JDTmZwog8g8//s4lN7fNKHofazXnk
 +xew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXSHt+LjJ56/pczgv4MZRhxZuALJMd/VJdxNyjzcnUTns1d96AOZgDUgzHnXE8+V3+V21YKLuXwpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9/+qz1iV6yR4wi3IO6Ov/eZVJeeANiN0mLs38JeD1sbfoM+0U
 tHK/K1UMZ4L3P/RVH8ocUF6kR+BK3VymXTJT/SLjUQ9HJcnn9nDVZqY4
X-Gm-Gg: ASbGncv3qFVNJpIPyqcO2OuPyQDszmYCTWGnnbt05r1rFoYtjrivBsQRTZxVfotYoTZ
 v6f7OfNRGX/Wd0IH5ovWahY70kH+C31PpXp0RALJ0ZWf7wJjVIAqWB2UHq41EoKvSSTkeiX0lh4
 8/wpH5scT8pZzmgly9/bMhkLcSaQQZ9cnGyckqdvEGV5R1mFqvKjoDMOLf0UTOsGsdaxGGL/jw+
 qyE44xajLtO9UZUlKNzL97/2mNNXE2XFldDA5AWBNzinhVTRGtOD/Hn1B4P3AMPItLx8Wn6VOoz
 ad9ra0LjioPAKUVwgZQsgETUauXMytrj4bcHwHW4UHgUipyJ0Hs7anSR50bW5vODiahr8tu0CVE
 JY92nHdrhEEDwDCARIb5VOaQTmhKo9NCKKtz9IvfLc9vqWY31F0tLNadIx2H5XOYzhPu6NuhdO2
 zrvKIG9nkCqHSU41Af4G7Tjcpe56JD5MUkODZulLWv7xEoVfgpu1IJxQ==
X-Google-Smtp-Source: AGHT+IExv/DfyFEe0/KnqocTMb0QEh7+FjTlnoU1+P9V8ugsonVuZLZLwQLITUfoXbaYEdE8xwJO/A==
X-Received: by 2002:a17:90b:57ee:b0:340:2a16:9b4a with SMTP id
 98e67ed59e1d1-3403a25bc09mr5824732a91.6.1761792212976; 
 Wed, 29 Oct 2025 19:43:32 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (211-23-39-77.hinet-ip.hinet.net.
 [211.23.39.77]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3405c363205sm143686a91.2.2025.10.29.19.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 19:43:32 -0700 (PDT)
From: lcwang <zaq14760@gmail.com>
X-Google-Original-From: lcwang <lcwang@ieiworld.com>
To: tzimmermann@suse.de
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tiny: pixpaper: add explicit dependency on MMU
Date: Thu, 30 Oct 2025 10:43:29 +0800
Message-Id: <20251030024329.482105-1-lcwang@ieiworld.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bd93498e-749c-4e85-9c63-918aa8f2d6f3@suse.de>
References: <bd93498e-749c-4e85-9c63-918aa8f2d6f3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi Thomas,

Thanks for the clarification.

Just to confirm my understanding — are you suggesting that this issue
should ideally be fixed in the RISC-V Kconfig (specifically the PORTABLE
logic that ensures MMU is selected), rather than adding a local
"depends on MMU" here in DRM_PIXPAPER?

If that’s the case and the root cause will be addressed in the RISC-V
side, I’m happy to drop this patch to avoid redundant dependencies.

Best regards,
LiangCheng
