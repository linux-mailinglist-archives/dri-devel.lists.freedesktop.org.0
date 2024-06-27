Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA21591B10B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 22:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD3110EB3D;
	Thu, 27 Jun 2024 20:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="agD0L/71";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDF510E364
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 20:31:27 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7066c9741fbso5634486b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 13:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1719520287; x=1720125087;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u+Rrq4z5wBKoFsylLRmebiYlJRSKIFHwRm0eKDi4f2k=;
 b=agD0L/71SWobGjL82t75s4OkjxrJ2a/OW2DwATec84co4+jnpCkW/2tk/O/kf7wxB+
 Z0F6cbnrNUpFSVXOLocr2YA+R57efoFwImY7DzqNSC3JKgXyNKH4oLLBRdQqGph7tsme
 EleJrRNmENWZTTi9uGeD8IyoFJJlfxxkGd18FthYAkhZ+WcVYY84mL3xZEOP7u1uXwac
 r2VijNtzDRXpVLCAuWrugGaX39J3kGDLRIh2BLE2WhTs8+4o2ZPYD66126+yLyg48dIr
 d31OBdvIkmSH9ioMQTnFr1RujVS96Y7tu5LELQH4NbEwxd/xNTBJaB7240BkJlhYxBHf
 sBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719520287; x=1720125087;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u+Rrq4z5wBKoFsylLRmebiYlJRSKIFHwRm0eKDi4f2k=;
 b=I9H/RiTI43lThjDNGalq9SoGUM4SPaknnYRx3S0fYssbcf1+6p5zkmA5vwXcM1HRrz
 GqOzOABh8EOawy73uAvOFM/3uPeGLja0MbFgkVxHMyTT/0ERVkXZjYNrsFQOiQvrms8O
 kGKcpw0gDbo9oEfJJTCmrdbypX2MA6c7RbeOOsfR1U7qzWTsQiE4GoYAYzZqhvvwt9jV
 DcjfxuYdtxmWpFdXbyCLncK4mzbAwtkUtJzbVyJ6hdLgOCNM2rqW2YUDSKjuXfK1JaaP
 1RuAehSzqugRdql5MWAHivnYgxiBEyDdEVR98R/49f+ItMw0jprRX9DBnAtSw6QlLBs8
 2c+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW42aE/J4WTd60UIqhCz+KZMdraUTU7+N4TIjLF/evyuhVffraG3wBX79F1ZEiPosjy9vEUPQtnU/AMNmJdbBFUOLLKr7SlF8oNpB0rktL5
X-Gm-Message-State: AOJu0YyEScFtoOikl9ppZN8rOx6IWOUWV1tnUwY6hN9yFs8lB6H1NDjx
 tcVqmo4BQVryXA0Nqcbqh7rQ3PnWSZhQvQ8qiBF9wjXNGO3gWHfn52FivfhOKA==
X-Google-Smtp-Source: AGHT+IFMJXadLHQE+Cb+jpmMYrytbtyKyWJkkx8KqsgFqeRNohho9BiJ1+P5+/28K0M9UUx7cARIVA==
X-Received: by 2002:a05:6a00:3c5c:b0:706:7943:b9aa with SMTP id
 d2e1a72fcca58-7067943bb33mr14396933b3a.5.1719520286768; 
 Thu, 27 Jun 2024 13:31:26 -0700 (PDT)
Received: from aw-m18-r1.. (syn-023-241-237-137.res.spectrum.com.
 [23.241.237.137]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70801e63250sm140514b3a.29.2024.06.27.13.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 13:31:26 -0700 (PDT)
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
X-Google-Original-From: Matthew Schwartz <mattschwartz@gwu.edu>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Schoenick <johns@valvesoftware.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
Subject: [PATCH v3 0/2] drm: panel-orientation-quirks: Add quirk for Steam
 Deck Galileo revision and re-label the Deck panel quirks to specify hardware
 revision
Date: Thu, 27 Jun 2024 13:30:55 -0700
Message-ID: <20240627203057.127034-1-mattschwartz@gwu.edu>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Jun 2024 20:53:57 +0000
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

This is a series of 2 patches. 

The first patch is from Valve's publicly available kernel 
source tree. It adds a panel rotation quirk for Valve's Steam Deck Galileo
revision, which has an 800x1280 OLED panel. The previous Steam Deck panel
orientation quirk does not apply to the Galileo revision's DMI.

The original commit is missing a Signed-off-by: from the original author, 
although the source tree is available publicly in a compressed package 
https://steamdeck-packages.steamos.cloud/archlinux-mirror/sources/
under the linux-integration-65 name in Jupiter-Main. 
It is also on the public mirror 
https://gitlab.com/evlaV/linux-integration/-/commit/d2522d8bf as the
official SteamOS GitLab instance itself is private.

I was told this could be submitted without the original 
author's Signed-off-by: if I used Suggested-by: and Link:
Please let me know if this is incorrect.
I added my own Signed-off-by: to the first patch as I was the one who
added a commit message explaining the change. I did not change any
functional part of the patch. 

The second patch is one that I authored to clarify which
device version each panel quirk applies to now that there are
multiple Steam Deck revisions. 

---
v3: fixup inconsistent patch versioning across patches in v2
v2: fixup patch 1/2 commit message

Link to v1: https://lore.kernel.org/all/20240627175947.65513-1-mattschwartz@gwu.edu/

---
John Schoenick (1):
  drm: panel-orientation-quirks: Add quirk for Valve Galileo

Matthew Schwartz (1):
  drm: panel-orientation-quirks: Add labels for both Valve Steam Deck
    revisions

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.45.2

