Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1033BB5D9B
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 05:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A4110E0A6;
	Fri,  3 Oct 2025 03:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UHOGf3iT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3AE10E0A6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 03:23:27 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-77f1f29a551so2404665b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 20:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759461807; x=1760066607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4MpfPEc8P9b4L2GNCySEMZpVOERhqW8EFBw6DoknkFk=;
 b=UHOGf3iTIs/j7Mb+ruxlcaVVBImG4WnY23rObMIw792O7JCBMF1SaQIBQIuNrtYy3G
 Fz7X9VkX1cGNHc8dBwVLDPe1VfUy1FBGXnNs2lssJ3fCBUYYWk1WBmuYe0BdTrgykFPo
 unB1PPsheZkWBd2ETzt9fljlg4o/veIQCf/DdEUYjpPoovKBpVu5iNpCOVgsGpKKKNb6
 ktXppsOx+D/omW1Zaht31SyzU4grQfvHj5JYPdmPDW5bynjXBNykVSYjEGsW0ETwhs9U
 up+YQmu0yqq6IgIoBzkPJ/JQw7R2bv4zCwtmbj1k0RZ6fcE27MTW8/X+dmr3W59DxIVv
 +s0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759461807; x=1760066607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4MpfPEc8P9b4L2GNCySEMZpVOERhqW8EFBw6DoknkFk=;
 b=FYTd7GjDelTrYWvbe80sBGQrqyGbRoQy/9ax6lyhvd3jGkVu2OpKyzIc8zRFTvW+YN
 mEcp6bg4Vl8Llx4Hv4jDsLTQLHZphEP0De8AShJfA/tzOkaYokHnEkPc5ojzlQbxAamQ
 YfnEA6Anrf/N/hAShmS7LNn6FKj/fQpFOnCPjFwQspwq/fgNcaiiXTPGIn+o6aKs68iP
 UhQfOCqWjWoKitwH5l7ONEEiQl0oJu6as4mnejvGru+OsDNMzULRlJSySVo4WamhGFC7
 llqP0o9C5s6wEXX6/bFo5BXMWMflN0/7Z/e7EbwcUQSg24T2/GpI+RxMNLmju5oSXq/S
 j9Sg==
X-Gm-Message-State: AOJu0Yxy/Y7CCADRBJ40Yfvc72cGcy6A/vnyjePZpmNa6uZDZ42tem+Z
 60DE7YGumjxGiadEskogJfYVVeSNgFOAFylbhisowuyDOTcJP7cJa7qE
X-Gm-Gg: ASbGncu8wN4UfbT1acBqbNfyetRQbYA9PBKLjJEvT3ExYmwqwmTEYpnlqA1nn1zhHnU
 VfPOG8RqOiXubSgKZfGk8qt7v0h4o+w23nf/xagthw1/TjC+2GYuiW1vdw8mmAdKCgHMzUSbEAR
 F1Pz6hbFdasCxbwQbscbSZYm3ovmrEftsChb34ye10xBiycOXDOtNViL1S0GbUofsHO8p/hgcTV
 NIzuniBH5UEcQGJRYfw90GU0J2wzee+00B/6K6gX11bGp7ky5c5opy8EhYXu8h/I2J9u84bK+Ko
 dqLYBHSv4kR8nz3Ct8f2afz1yJpcw5iAFHfAHMTp+Z6U3vfrcYpkj1e0Q6HUo9ODwlFKYkxYZBT
 4mBVhsQ9PZocBtdUFJw8GP2KZEHtTHLTJ0IXxbgPxBG1+xVvY3J+SuBEzuNWG3Ymj6F+0WI3nw6
 TEjoc=
X-Google-Smtp-Source: AGHT+IHVZ5V7HiW9Rkw0s33+w+cQO1spnlPihGJa+P8ngoTWf74O/b6uIrMzfDZNNheYb8e6iNEHnA==
X-Received: by 2002:a05:6a00:230b:b0:781:1dc6:4e69 with SMTP id
 d2e1a72fcca58-78c98a89454mr2351558b3a.14.1759461807296; 
 Thu, 02 Oct 2025 20:23:27 -0700 (PDT)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:326a:8939:a05c:b9d5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b0206e81fsm3460145b3a.70.2025.10.02.20.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 20:23:26 -0700 (PDT)
From: Chintan Patel <chintanlike@gmail.com>
To: maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com,
 Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v3] drm/vblank: downgrade vblank wait timeout from WARN to
 error
Date: Thu,  2 Oct 2025 20:23:03 -0700
Message-ID: <20251003032303.16518-1-chintanlike@gmail.com>
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

When wait_event_timeout() in drm_wait_one_vblank() times out, the
current WARN can cause unnecessary kernel panics in environments
with panic_on_warn set (e.g. CI, fuzzing). These timeouts can happen
under heavy scheduling pressure or in rare cases of delayed vblank
handling, and are not always a kernel bug.

Replace the WARN with drm_err() messages that report the timeout
without crashing the system. Developers can still enable drm.debug
to diagnose genuine problems.

Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

v2:
 - Drop unnecessary in-code comment (suggested by Thomas Zimmermann)
 - Remove else branch, only log timeout case

v3:
 - Use drm_err() instead of drm_dbg_kms() (suggested by Ville Syrjälä)
 - Remove unnecessary curr = drm_vblank_count() (suggested by Thomas Zimmermann)
 - Fix commit message wording (“invalid userspace calls” → “delayed vblank handling”)
---
 drivers/gpu/drm/drm_vblank.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 46f59883183d..0664aea1b924 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1305,7 +1305,8 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 				 last != drm_vblank_count(dev, pipe),
 				 msecs_to_jiffies(100));
 
-	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
+	if (!ret)
+		drm_err(dev, "vblank wait timed out on crtc %i\n", pipe);
 
 	drm_vblank_put(dev, pipe);
 }
-- 
2.43.0

