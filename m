Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E241FB4A39A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A78E10E641;
	Tue,  9 Sep 2025 07:33:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D+qtqmN8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7372610E650
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 07:33:57 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-55f6186cc17so4747315e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757403236; x=1758008036; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xq6lrwqlKY7jmEcraWEq2ZZGATych6Aj+/2wtksXo/4=;
 b=D+qtqmN8yaUuueyWmAWUBkpCsnLWwfUXEyabqp57BOokG2cGrp723frMaknp3Xsx4C
 SvFVUb3rI6kPDnjnjogUdW17AovUQ4xe4XOvC6GdJcb3pl5z+NMNFlYnX+bxcFxUSOLE
 8ivYg0UFk6ifYT0hUrAgSPJgxyarjYAA3K7t6GKZ84ikciree1b54aYm1gGO4Nd372Wr
 UY7u4Hnos5zXfSdSqVT/YORQSObFAH1Q9dEuqkqWas+q1SxjwjvaOcl8IEnpyOBkbPvj
 QO7HgE3eHstV1yU+eT/y3z2uObGmPoJOMdkiANho6caG1go6fMm4P5CwWlOhEGClJS4h
 sADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757403236; x=1758008036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xq6lrwqlKY7jmEcraWEq2ZZGATych6Aj+/2wtksXo/4=;
 b=mC9nMtVi5hrLav9giw3TIHzNbD6MbnxaSr0IcMJ2d2avocAh8LChEf6ghbUjHsCUuK
 XM99dsN0Gumck9gGjc8tlFBIyK+iZbBZ/QPO6IjJcLUcQoqawOBbLilEvp0ZDITBc0Xb
 RtFyFpRl3vaIj1+4oNU/ykSIG7AUDIEqdCisnRC8CnCX5Tq86O+UoiyMCXum+1bxk6U7
 5p/lGY9VzSP7PhSQvLHo/m5VGHapeUAsLIStaaQAl7J6jVeUQX4ZaWO+6VqZflHehses
 K8w+z3VLW04cC25qtTqJzZptEvTZj06ScwpEHdR2BH/gdW6nF/2ff+magIH3tREyoGBi
 IIxA==
X-Gm-Message-State: AOJu0YwO0gM+AFxftiiiRm6xi9ue4efBmoPqSbY3MLZ7z8kp8d+BOhXU
 tABqpF24JfsQbLuYcGPZXe6YDokqNVfVA9JQTBGTNGJ4ET8HMcR29Qz3
X-Gm-Gg: ASbGncskyh0+z13rqssZqoyZmjiJS3+B8ZNaclqBiJug6umgrwwy2c8TGJjyN3G3RKY
 qu4FvHr5JL9MwUFN+zR0O1+ijMWkKHrLZkz+KFs32b9vmQysFgO65i9VvezMwrXkUB0arzqFsEO
 j0kHNR+RSoHpa89bseqLKYnLWTZ4MrvXG5u0S6AIt/s6GUbC5Otzf4mvsxj4GiMP0q6KITi8AFM
 0P4lM9g6hZRXBzSFxvZN1smmwOhW6uz2xQLSbiyP3bgERhAzodaY4CKQ/faAZyi45ybOrKWQ0Sb
 QgOip++rgklDZ7x8+KqxEyURjTG1ErE4vGThb5B6gM1gA4C6VEEEcW8fmphFeVP3+94HkBF4vuj
 0FHbJ9OToUj95YIWPcttkCXgi
X-Google-Smtp-Source: AGHT+IGjMMjfkQ0CKqDPHSfr3u5gr4MAKDQeP3g72Tz6X/H7nTPmWyuKEWbcJLScvZ8uzCudkkqSXQ==
X-Received: by 2002:a05:6512:b90:b0:55f:3996:4f82 with SMTP id
 2adb3069b0e04-56261314783mr3256215e87.1.1757403235364; 
 Tue, 09 Sep 2025 00:33:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c91a6bsm37542721fa.21.2025.09.09.00.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 00:33:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] tegra: dsi: improvements for video mode ganged panels
Date: Tue,  9 Sep 2025 10:33:33 +0300
Message-ID: <20250909073335.91531-1-clamor95@gmail.com>
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

Expand SOL delay and packet parameters calculations to include video mode
ganged panels. At the moment only command mode ganged panels are supported.

Svyatoslav Ryhel (2):
  gpu/drm: tegra: dsi: make SOL delay calculation mode independent
  gpu/drm: tegra: dsi: calculate packet parameters for video mode

 drivers/gpu/drm/tegra/dsi.c | 54 ++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

-- 
2.48.1

