Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CE89021BF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 14:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8389E10E36B;
	Mon, 10 Jun 2024 12:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBC510E36B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 12:41:32 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-7e8e5d55441so468441239f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 05:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718023291; x=1718628091;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WA7CbT2GeS+VoIChUYRDpZPjnEpS9X9+0FDiSdP3wow=;
 b=SrfMKX4pUAn965IKzaj0sbG9caad7JZ2QB6xymAaEICKUjd2VO1Z/0OqfKs36Q03Nk
 NFMZDzB8cb7tfvHZeIdsLAI/razytxOgdq83ETMxv+hLJC8CTq84e/YiJmaqIszuIM+a
 0qa6butoVzHQHDO3WxLJE2YH8UYygnymQLjTOw9TrjjMOHz2JoEwqRUpvN6IflGFBEUd
 4t6xfrPkoB4lYObFgDp4DY92M+Y5VFf6QmasC2G09wY34RaL+2cKKPeV4KkQQkijm47z
 NcIvFFz8RlJyJYb4Wu8jW9q6tK63/1Xr//Q8+c/YQ5quoS9EW6ou5VLX9hH82x854/fI
 Gm5w==
X-Gm-Message-State: AOJu0YwTDMAf+ppEoVLuGsVRsbrHyyHbPp8y/osH9qF8ttDaN7BaxDDO
 kveQ0K4T8XrWy4N24fDGc86qgSzJBQ9olunxaHseeFWyt9r1rkUY9PR59R7uRZGRbcCdUu+7zkh
 +tsvve2IY8v6o/oojgJRGdu2e8UY56oRJIwW2rwktqMptaBXYjDLtFOM=
X-Google-Smtp-Source: AGHT+IE/szJDvjRFoP+iOxRSIYxsZAy/fRvJRJ8zV9zkfPmRib5LLKkFoNrFfgfYcCabm5kWrMhbFsf+KU/cuk5dz5IfSAvsSMV4
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8527:b0:4b9:fb0:fd43 with SMTP id
 8926c6da1cb9f-4b90fb1070emr219303173.3.1718023291348; Mon, 10 Jun 2024
 05:41:31 -0700 (PDT)
Date: Mon, 10 Jun 2024 05:41:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ff3857061a8877b7@google.com>
Subject: [syzbot] Monthly dri report (Jun 2024)
From: syzbot <syzbot+list9e784dfd03fd1005cfe1@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
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

Hello dri maintainers/developers,

This is a 31-day syzbot report for the dri subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dri

During the period, 2 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 31 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 462     Yes   WARNING in drm_syncobj_array_find
                  https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
<2> 335     Yes   inconsistent lock state in sync_timeline_debug_remove
                  https://syzkaller.appspot.com/bug?extid=7dcd254b8987a29f6450
<3> 277     Yes   inconsistent lock state in sync_info_debugfs_show
                  https://syzkaller.appspot.com/bug?extid=007bfe0f3330f6e1e7d1
<4> 265     Yes   WARNING in vkms_get_vblank_timestamp (2)
                  https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
<5> 17      Yes   WARNING in drm_gem_prime_fd_to_handle
                  https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<6> 10      Yes   divide error in drm_mode_vrefresh
                  https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
<7> 9       Yes   general protection fault in udmabuf_create (2)
                  https://syzkaller.appspot.com/bug?extid=40c7dad27267f61839d4
<8> 6       No    WARNING in drm_atomic_helper_wait_for_vblanks (3)
                  https://syzkaller.appspot.com/bug?extid=0ac28002caff799b9e57
<9> 3       Yes   divide error in drm_mode_convert_to_umode
                  https://syzkaller.appspot.com/bug?extid=0d7a3627fb6a42cf0863

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
