Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774E0986E46
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D193410EA9F;
	Thu, 26 Sep 2024 07:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QUByJcbS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AC910E04C;
 Thu, 26 Sep 2024 00:26:52 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3a1a7c0f612so1765155ab.3; 
 Wed, 25 Sep 2024 17:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727310412; x=1727915212; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4h71KNl97QvEZ5noXaz7sknDoxojg3IEoQ/oR2jE0tY=;
 b=QUByJcbSoGQ00bL+sYxU4lDcGPvp0g4+i15AbLC2hVdkZZf7GQVYpKVgsZZDopbD6E
 1Q+ghdb1jhXXXGHFpjDsxEiRv+uKW2jZTesWNaQgm9SPcZn9eWAsyMZxKludJ7z7mMct
 nfPP4k7boQ7H1sq02svDANEzCLf3iZcMxsaKe9Jlbg/xrkTPe7LkCOE62Z5LBxdZTafD
 N2HqKy8EddChhjEfU0GWRWVgsqcJCFMFVinpyDkzmlRvenm4b+0COviNvG/9sW4yVk/+
 4FXbNlXhvu9qVdU8gkQY6yOW8soinzUJpFtMDYF8W3P7ksPBTb/DBty3ABgkpz5RrW8Z
 nGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727310412; x=1727915212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4h71KNl97QvEZ5noXaz7sknDoxojg3IEoQ/oR2jE0tY=;
 b=MwFAwf3bam4NVtF6zflOczetWIZkLD1BZQMUjJRT69BfljGGzRdS6aOcikxvxKvnV+
 /EJ84E33FqU1pf+G1bRjb7bGEmVuyr+Z1rhho01HUuqy37Z5DcSZmq5JOxfQgC/YgQwQ
 xb2Xb6K3POi/0D0IEU/3c54nu3znKKFBjt5JYeGhUfNitDEqFwz+CCXcV5MzCu4cIxtL
 kpJuysU/PL44So0gSmTGTVXALGpwQtPnjgWH98wXoXxc0Vo1SzPz+gehSvU1XecnVRMs
 fOvdvzpFfGWhN5cY6I7zhPRKFL8I4Y72inHpTnJNi8+Y1kGrUyJ7QPZClbGET29fQn9G
 xriQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkCuX/ezcPetrms0Zd00LLZdPmS5ExzTLmh9V3iAuSK5BXeNiFun65ROoUCo+jbNEGXu7U9nfCY5VR@lists.freedesktop.org,
 AJvYcCXa9MPQ+k+BIYbCSSjjFQt593KzJDk9X3gClg6iDTphTc9XhkNjFEhaiJMKxGT/0ne6QsudwQ6WYro=@lists.freedesktop.org,
 AJvYcCXcHmoL4YDHJ0xnsAelWCeF2CrKry/7VKZ0aubEeUpWMMyzFqGe6/9Dy4N8v7U41BAbDsSVIjZ2LNY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ4QL+cUBcTckVVzhi4BgjueZeQiBFKku/H7Ox248Ll6MDMXTN
 b+cnqyPFnJynSMaKCun5Z3lZoqdVK4c3Z9hCTjAjicVzuA571bCa
X-Google-Smtp-Source: AGHT+IHgTXutoVNi8aDqPPP/+KgfDCgrksJCESMS/68BZDMFkdIdxvC3YnaBA0YfWndNPVbYHVlGDQ==
X-Received: by 2002:a05:6e02:164d:b0:3a2:6cd7:3254 with SMTP id
 e9e14a558f8ab-3a26d78f4c9mr48930055ab.14.1727310411822; 
 Wed, 25 Sep 2024 17:26:51 -0700 (PDT)
Received: from localhost.localdomain (24-220-248-19-dynamic.midco.net.
 [24.220.248.19]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d40ed005a8sm1407875173.0.2024.09.25.17.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 17:26:51 -0700 (PDT)
From: Benjamin Hoefs <bendhoefs@gmail.com>
To: jani.nikula@linux.intel.com
Cc: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Benjamin Hoefs <bendhoefs@gmail.com>
Subject: [PATCH] i915: Fix HBLANK Expansion Quirk Causing Modeset Failure on
 Dell WD19TB Dock at 3440x1440@100Hz
Date: Wed, 25 Sep 2024 19:25:34 -0500
Message-ID: <20240926002533.10153-2-bendhoefs@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Sep 2024 07:54:54 +0000
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

Hello,

I am using a Dell WD19TB dock with a 3440x1440 monitor. Using it at
100Hz used to work but recently I tried it again and discovered it no longer
did, specifically the modeset seems to silently fail with no error message in
userspace utilities like kscreen-doctor and xrandr and no output in dmesg.
I found the problematic commit using git bisect to be
55eaef164174480df6827edeac15620f3cbcd52b "Handle the Synaptics HBlank
expansion quirk".

I found the issue to be the hblank_expasion_quirk_needs_dsc function which uses
the following comparison in the current kernel tree:

if (mode_hblank_period_ns(adjusted_mode) > hblank_limit)
	return false;

with hblank_limit being earlier set as

int hblank_limit = is_uhbr_sink ? 500 : 300;

However, my monitor's HBLANK period in the 3440x1440@100Hz mode is
exactly 300 ns as verified by this printk immediately before the
problematic comparison.

printk(KERN_INFO "Hello, kernel world! %i\n",
	mode_hblank_period_ns(adjusted_mode));
[   38.429839] Hello, kernel world! 300

With the attached change the modeset works as expected at 100Hz. Would it be
acceptable to modify the comparison from > to >= here?

I'll do my best to provide any additional details you may need although
that printk and '=' sign is the only kernel code I've written, so my best may
not be great :).

Signed-off-by: Benjamin D. Hoefs <bendhoefs@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 15541932b809..052c5a67df93 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -446,7 +446,7 @@ hblank_expansion_quirk_needs_dsc(const struct intel_connector *connector,
 	if (is_uhbr_sink && !drm_dp_is_uhbr_rate(limits->max_rate))
 		return false;
 
-	if (mode_hblank_period_ns(adjusted_mode) > hblank_limit)
+	if (mode_hblank_period_ns(adjusted_mode) >= hblank_limit)
 		return false;
 
 	return true;
-- 
2.46.2

