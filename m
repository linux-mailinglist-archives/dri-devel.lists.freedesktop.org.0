Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204ECA27A3
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B455C10E844;
	Thu,  4 Dec 2025 06:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ou06rLg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A726910E843
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:14:47 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b735ce67d1dso64694866b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764828886; x=1765433686; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xq6lrwqlKY7jmEcraWEq2ZZGATych6Aj+/2wtksXo/4=;
 b=Ou06rLg3jpnOTtvaU97RXgDq3bGPHMPsgZspNNZw3j+pN8x+hh0jV6lKJpri5s97H9
 Yr2Yj/XKcolrgArP42EtuxNirg5Fs/CPfPCtT8naq4pRMWNRinytWyCVnyydYS+J7kBx
 Cl5v7cItFqmc3G7B0ujaZccNmVGs82ptyY9OWFpwmYxFAxz5exXyTBrw3dCCRbMME6yL
 3tPyuZGOlqEtpSa+90y7sAFflYpi4SeFqVTa9VYtvY/oKLXANb6jvxowgB3FxiS25Pw1
 1Yq/iZ3o655xZi0tewDAn2ICTIESSSAxpl5Qu6NtkXl8AdLyZFCnmob050mABzdvJFAD
 F9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764828886; x=1765433686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xq6lrwqlKY7jmEcraWEq2ZZGATych6Aj+/2wtksXo/4=;
 b=oO1P4LGM7wBCR4L2HJJDO6QmH5RAc/+z06xtBjvXSEPyKHALQCjp0VhxPNOmhTC+UY
 B6qNm/cWn/5IJgpGUSswH5cgZgdwxtD/fDiWUh+WgKwBVOOUxXrNphC+Ru0TVGsP+nA4
 dSdyppUUSlYLuqQcNmxNUxYEA0HjmW0o9N8Lbcd8IXtPYq3tHhecHYtXzaW+mNa0tE3l
 skX+h0hD2zO0afy8U8J4lIqxWr7ouOYxZbLVZosjkYX9REKhOu5HJes2d8WJ7nyf5ONG
 PxaurwpAgrY4Nd9y2jj1M4nW+SHqSyD2B6mX5dNu1qEwpBBYp0a4aoMtxCRtRR3gWKuh
 3ofg==
X-Gm-Message-State: AOJu0YzLxgCJ4aESsYaatnl7O96f7GRKw8qTRT1h+tzk97DDlGxHa+tb
 R0iLy4McW+IWGO3t2FFx87F9+mmv9ts7jro7uuYuon0dxvbDSXs+qHCB
X-Gm-Gg: ASbGnctUryDvTsDgqM/RPQGyUrY3r3shteG9i3tqaQj0Gx00TYLu5FpqlwXxy8I16ut
 E/vwsvDTuAD7uUkJ0O9GvYPLdGyIl9CkxbhP82rV6OyHRkRMRGhWuDDu08x97PW5F6yGWKrkRp5
 plky7QpcgQvEPNA+JCXUfIdgnallSGzkRw0Te0z/8N51AmICgdrZChMxlIrideGvmduOHYO+V7l
 BKkBoLZFbyvH4rf2ZMTzDBOXeW/PVgsnWrvIIymdxsMTEkGTzAoDvr3ifhjUdTs0qH0iqTOQNKr
 QAFxomuHBW0f+W52Z//UjP52zki66/gS2WHvUG4eM8PKrzb9sP0/wDE4PICndYgJTJkybATEPhg
 Kwt5Lx+h9NF/7FU/Etar/S6dhe7RMxlcvEcW7X3+I4+oCBDy9aPDvzQNUzvM7nyQyZGhZQjwlZw
 c=
X-Google-Smtp-Source: AGHT+IHX/aAJO7lhZAMTIBgpnvH0r8cqR/h+/J0o7DwRw7NK+YI/qMGFLjVbAIUUAbi++n3shAilOQ==
X-Received: by 2002:a17:907:5c8:b0:b73:21af:99d4 with SMTP id
 a640c23a62f3a-b79ec473903mr181931266b.24.1764828885950; 
 Wed, 03 Dec 2025 22:14:45 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f445968asm50607866b.3.2025.12.03.22.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:14:45 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2 RESEND] tegra: dsi: improvements for video mode ganged
 panels
Date: Thu,  4 Dec 2025 08:14:34 +0200
Message-ID: <20251204061436.5401-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Expand SOL delay and packet parameters calculations to include video mode
ganged panels. At the moment only command mode ganged panels are supported.

Svyatoslav Ryhel (2):
  gpu/drm: tegra: dsi: make SOL delay calculation mode independent
  gpu/drm: tegra: dsi: calculate packet parameters for video mode

 drivers/gpu/drm/tegra/dsi.c | 54 ++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

-- 
2.48.1

