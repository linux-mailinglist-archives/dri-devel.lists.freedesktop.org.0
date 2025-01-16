Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE82A14B65
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B25810E3A6;
	Fri, 17 Jan 2025 08:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C3010E1B0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:52:27 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-3ebc678b5c9so707947b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737042746; x=1737647546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wpvx/TmAJuUkx7vl3eT/PpXgqpXmJa4/JNQHxi8lJEk=;
 b=cYYM80Ep371ayP8/VUHlKXEh1g1xeHizEfO0XoXTB+62O2F0Sx6NC3fiZTy41ibpNN
 D5QFQl9vaiIUSQCKYidS45w2+Wg66Od9sc3VM8GWz/Nd1s8pO2Fxgn/pPUd+TaQgHBVR
 QGIXZaiqLhjxcLcr6Ot7ENSHxRhL/PQe1hltuP7lqVs7KlkdBuarUo3q0gBMIg2pxGp5
 8LgIqH/w2jU+uldtZ8CT4Lrw1cut84ZX4lXFaTBt/FENlI6HmBdt2XKQAXiNiV5943qX
 lVrYEWZqNlueHer4kx9M33vdXaqRTZYcAtCQ3YVyc4WHsMub5JQS+PieDIWbswVTT4ku
 jLeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRJ5WqvkODrJ5ilSdPAWLfYazl+hCj8oe5sgchTtB0hN+MqUDmQLX+IhFn34fssAn0zjdQvFczB0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlnlTAEFxzwqFU6a4nLeQboou2Jxq3Al2DQp2TWvxj6UNflL5T
 Ftyb6BHqeVikNmBhyaF5pDQDvcZvcNMggljhAbLcxxYS8FsJbduX
X-Gm-Gg: ASbGncsX47I0CXmC4T6XWRVUWfPrRZoQCDJfi4qutvA/mkGl4SkRJ6xL5pqLCdwGe1C
 Y1dAJlXJ9T4KfxlpA+r9XVFJ7Js+1XiyJoogr5NrRGbGCZ1wSwIMKu0oFNj7ejhHQ73onOj6Lgo
 5lV4Mj5lU52C81NYFiRFvDG5U0gM/89I0/yPjbt9QevJvEJyz1ufJFnwF6pIlGYjOLZitaQqIp9
 R4vwNWLvSGzT58jfvdKu6KhFQi3h7dVRtMV63ylknmV7xdM8oNJM0YFiA==
X-Google-Smtp-Source: AGHT+IH5p3vrPfSvZqJb06RBVK20wnIX2n2UHf8qU3FniAeRTQ0Ha0BH4RAbf17JP34xBFLopQmg+g==
X-Received: by 2002:a05:6808:d48:b0:3e6:5522:b333 with SMTP id
 5614622812f47-3ef2ec96cfemr22201198b6e.22.1737042746447; 
 Thu, 16 Jan 2025 07:52:26 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5fa35f05bbdsm70538eaf.13.2025.01.16.07.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 07:52:25 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Andrew Wyatt <fewtarius@steamfork.org>, John Edwards <uejji@uejji.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Handheld gaming PC panel orientation quirks
Date: Thu, 16 Jan 2025 15:50:43 +0000
Message-ID: <20250116155049.39647-2-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 17 Jan 2025 08:46:14 +0000
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

Hello.

I am submitting a small number of patches to add panel rotation quirks for
a few handheld gaming PCs.  These patches were created by the SteamFork
team and are in daily use by us and/or members of our community.

Thank you for your consideration and for taking the time to review these
patches.

John Edwards

Andrew Wyatt (4):
  drm: panel-orientation-quirks: Add support for AYANEO 2S
  drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
  drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
  drm: panel-orientation-quirks: Add new quirk for GPD Win 2

 .../gpu/drm/drm_panel_orientation_quirks.c    | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

-- 
2.43.0

