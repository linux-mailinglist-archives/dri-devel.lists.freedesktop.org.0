Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB86A1C8B7
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7885110E38C;
	Sun, 26 Jan 2025 14:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F34C10E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 20:47:15 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3ebadbb14dcso1118155b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737751634; x=1738356434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0m8/AsGBoby5Te+i2ZrgJ09ApDbwabfFTfqcrNbVlqE=;
 b=Z1LKEWZwfHWGPLohADGaPK25V7rC3HDGBLE5pWNJsPnK7vlfVXYbHWUXRCGHQ0YAM0
 GWa7oYyw92fvnY8h604gfQ6zgVCBkDXc4x+l72qp6G0U/cjputa1px639bbK2iNzVKu9
 7n6Fvo+HeK3NQP6d7vqRa26u8xdhHdwS6HDQIOxFHEZfwgDeJ9tTKAa7dmfV671vAqiD
 fSLE4Jv5t6xg2hcKEnfTFYqibRO+p2KqF0f7fYSckIKsNhyM/dNcdGDyCnGyi7TeFRCH
 OHvWe7PlnvOvWYo9Hrd1BSuWWAs8Dk/chtZ36tg9MbbDdTm2EnYXtkCSfk7m9nkYd9gb
 pvug==
X-Forwarded-Encrypted: i=1;
 AJvYcCV90c6LA5cvK+c5UYWPMiCRhIs+Rx1AiLjqDWrCITKYealqe4hsKYJDY9Ee06z8mVEm7+Cn2FyuTAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVVMMzHZC3PUdtdGLFJfcIN6Zltbgz267SkcBD+s7IO0NPk5wm
 KyhehyHSerIn8MG2x/omlian1s97ATaFiW3bWU1uRylQRkXA8d1Q
X-Gm-Gg: ASbGncv9BO1fhLR5DlLUWhKPkxFIkrXv+C8qeEGaFY2LTPEg0S7RDnPZpf1KdQrpwDr
 hg5UmKjAmZXXz1Hvy8Zrtg/aQowRSFASYbsb01v/IIa3ehR2PecPj7E1cFKcmpykobKC4iubWBH
 XjYmWUkn35rKF+x12tZ6lxrpyX1uX0dElLIRfVBdscebsLuljxai07+tyzBCgwhZNdI4fi2q7mK
 P15b6v7vjg9F8gIjdcVVg53r5noAuLhy7X/UPUZpZgMW+OrEn9mF8k6tc5MokllWQbJyhAXGPXr
 xy2GZQ==
X-Google-Smtp-Source: AGHT+IH6tD30jAriLhASeWO17/aEKqyps+ErLplmWORaU/QwhjeoT4MNQvdJxYA2KECp7ZPtmrhAHw==
X-Received: by 2002:a05:6808:3989:b0:3e6:5f6:c2b5 with SMTP id
 5614622812f47-3f19fd30e7cmr21097841b6e.26.1737751634555; 
 Fri, 24 Jan 2025 12:47:14 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f1f0981130sm598700b6e.36.2025.01.24.12.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:47:13 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Handheld gaming PC panel orientation quirks
Date: Fri, 24 Jan 2025 20:46:42 +0000
Message-ID: <20250124204648.56989-2-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Jan 2025 14:52:19 +0000
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

v2:
- Minor rewording of commit messages
- Include Tested-by tag for Paco Avelar in AYANEO Flip DS/KB patch
- Add OneXPlayer Mini (Intel) patch

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

