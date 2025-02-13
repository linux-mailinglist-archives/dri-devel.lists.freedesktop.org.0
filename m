Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C18DA3512E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 23:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7080810E076;
	Thu, 13 Feb 2025 22:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D62E10E076
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 22:25:02 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-72703cba3c7so508036a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739485501; x=1740090301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ILoYyziuUnuJVlSgfSskon+uaaNzPS6ou+QE/PEWzVQ=;
 b=Juz/ZL0z3wgM/+1+jv3TpjHjEiR8cLpBPtKSLzpGBzb22VMjK9lYlGjaE73dbhi0bK
 eUKn/wSm+1Ehw/JOlNVpTTzKvpFehA859n9xdNVGty43fyGgbwh3LPl+/InVJubv9KQy
 S2ERYfIN3pRMM0ehl4pmDjQVxHrQs0TD2fH6Uh4B7ipi+dzu3w3rq0lDYnYpMZ5MiMsL
 uE8b4ad30S8qfiBOjuTu6aDFnbmNJ6ZWlUYAjg3ap8/073ndjOOU9XleKpZEeN7FAvAr
 noTbgXRK6iL39tWAuOToOSG3X/Ikr4eNwOEbHs0jZ1PBb8QKHW/3VtytChZy2L7+d8da
 Rcmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWipJATLHXlO2ozSLP32sf5PCHG7dRniINvqngh/596tqodNFrZkuwHJUAwSRr8mPbh9h3dZTz741U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxufFpwpEVYf2E5XZl6wgJSY5msl/Xgedfh8oTWfZYR+uCJtO2d
 I+SVOsG5F3CMToUerp0Yd0GGszyNJEQguf/I6G5SuGfPHtDSAooN
X-Gm-Gg: ASbGncsI8Fvavc2fSQRCaS2OapBkbEUi5CajRwnlBg6Prvw0kLYtYzF7zf6xCuSJy79
 VrZOrH3VYrr5IiARqYDOnDVLd364TC2OU37k+8hy7V7u6f0/sbp/4y/2ZOfL8AZ4CFRFgnKC81h
 mBDBxJq7iIsPidPLEUU7mFf4t5ASKF2cTGvK+weAswvuMhq3ElK6A9dtEwxq80nVg/j0oEQlMt5
 Q1ypP7OLibCBnr2q55zc9FUFTdd3vvNQS28ZXfemDUbg+WVREpwpOS2RQ6q7YH3cQ5XhJ2w4c+R
 XxJRxfRcQTkbogle
X-Google-Smtp-Source: AGHT+IHVHjm3jW5M4b4UU7lCiPVHL6mmwLCaKdUPLs7cl2wGNyM005lh9F/qHiFSQOQuLf2UkwQLqA==
X-Received: by 2002:a05:6830:6e97:b0:726:d36a:3ed0 with SMTP id
 46e09a7af769-726fe75a5dcmr2991891a34.5.1739485501314; 
 Thu, 13 Feb 2025 14:25:01 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-727001cde00sm984184a34.5.2025.02.13.14.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 14:25:00 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Handheld gaming PC panel orientation quirks
Date: Thu, 13 Feb 2025 22:24:48 +0000
Message-ID: <20250213222455.93533-1-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
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

Hello.

I am submitting a small number of patches to add panel rotation quirks for
a few handheld gaming PCs.  These patches were created by the SteamFork
team and are in daily use by us and/or members of our community.

The following devices are covered by these patches:
1: AYANEO 2S
2: AYANEO Flip DS, AYANEO Flip KB
3: AYANEO Slide, Antec Core HS
4: GPD Win 2 (with correct DMI strings)
5: OneXPlayer Mini (Intel)

Thank you for your consideration and for taking the time to review these
patches.

John Edwards

v3:
- Correct indentation errors in Flip DS/KB and Slide patches
- Include Reviewed-by tags for Thomas Zimmermann and Hans de Goede

v2:
- Minor rewording of commit messages
- Include Tested-by tag for Paco Avelar in AYANEO Flip DS/KB patch
- Add OneXPlayer Mini (Intel) patch
https://lore.kernel.org/dri-devel/20250124204648.56989-2-uejji@uejji.net/

v1:
https://lore.kernel.org/dri-devel/20250116155049.39647-2-uejji@uejji.net/

Andrew Wyatt (5):
  drm: panel-orientation-quirks: Add support for AYANEO 2S
  drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
  drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
  drm: panel-orientation-quirks: Add new quirk for GPD Win 2
  drm: panel-orientation-quirks: Add quirk for OneXPlayer Mini (Intel)

 .../gpu/drm/drm_panel_orientation_quirks.c    | 40 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 2 deletions(-)

-- 
2.43.0

