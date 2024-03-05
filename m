Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13B871D05
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD3410E0E2;
	Tue,  5 Mar 2024 11:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500B510E0E2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:09:25 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-7c7857e6cb8so735459239f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 03:09:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709636964; x=1710241764;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+TvijFv5U6qCgNY1UsgnlQOfNBRfUiGnqvVLUn0F6zA=;
 b=YuqgTVSlxqRnmmeTpaH3lnK5lr+dOMRzNBtvH27GVU6IO3fJrzvjKDZOchIFTqnPdz
 5d/oQgZWuALhzJbJ3cqKkpGrKVIKdZFwKMD8rFizNS3TQ9SBVBEcvicHFH5sk5yUqA8O
 Yz+6ZfUpSPGfODeCtVh0vRr33t9IXQxlIFuyNjScd5zIetglSsumsE2o5waRfTnN7jCQ
 +lL3qEKWM2Zz77yS6pYK5nQfJCciaFzxURREoNwv5Gejot54liO1b2s2Tio45eeEaJUy
 s7REg8YDvEDMKXhUh69VoMXjzphPg1REZDM0XrUtOtEM3ubONpytHc6y3zeJx0wiY4Sk
 pbHA==
X-Gm-Message-State: AOJu0YzjmZKDSW6WG7/UgGTQdKWalJAvlsQ/8KxYhgSvoULwfLAHsVFj
 oG0VhJbS1qQR+uWvcXJ3W66y5Ma15GzHzIq6ZY2YIR3TvTXrlfgUKiVh7C17nV+Qih+L965CoL7
 vxGul9NTGti7ZAiFFYY1TPN1E0LtxwnYBK0ENPa04jlKi2L6ac84X+Y3b9w==
X-Google-Smtp-Source: AGHT+IHI1OjS8HXCP3CAxPPnVkCexzjpvrC9gtg3bA3avLzIjS4SYDuijewtEIwFRs2BdZwo46DKwbB8bmPznBrFpLTB0Ulw+xT+
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3413:b0:7c8:21ec:4dfc with SMTP id
 n19-20020a056602341300b007c821ec4dfcmr155571ioz.1.1709636964357; Tue, 05 Mar
 2024 03:09:24 -0800 (PST)
Date: Tue, 05 Mar 2024 03:09:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f4a65a0612e7df09@google.com>
Subject: [syzbot] Monthly dri report (Mar 2024)
From: syzbot <syzbot+list43753e4613c9d1d7ce5e@syzkaller.appspotmail.com>
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
In total, 21 issues are still open and 31 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  287     Yes   WARNING in drm_syncobj_array_find
                   https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
<2>  133     Yes   inconsistent lock state in sync_timeline_debug_remove
                   https://syzkaller.appspot.com/bug?extid=7dcd254b8987a29f6450
<3>  90      Yes   inconsistent lock state in sync_info_debugfs_show
                   https://syzkaller.appspot.com/bug?extid=007bfe0f3330f6e1e7d1
<4>  12      Yes   WARNING in drm_gem_prime_fd_to_handle
                   https://syzkaller.appspot.com/bug?extid=268d319a7bfd92f4ae01
<5>  10      Yes   kernel BUG in vmf_insert_pfn_prot (2)
                   https://syzkaller.appspot.com/bug?extid=398e17b61dab22cc56bc
<6>  4       Yes   WARNING in drm_gem_object_handle_put_unlocked
                   https://syzkaller.appspot.com/bug?extid=ef3256a360c02207a4cb
<7>  3       Yes   divide error in drm_mode_convert_to_umode
                   https://syzkaller.appspot.com/bug?extid=0d7a3627fb6a42cf0863
<8>  2       Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                   https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<9>  2       Yes   WARNING in drm_prime_destroy_file_private (2)
                   https://syzkaller.appspot.com/bug?extid=59dcc2e7283a6f5f5ba1
<10> 2       Yes   divide error in drm_mode_debug_printmodeline
                   https://syzkaller.appspot.com/bug?extid=2e93e6fb36e6fdc56574

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
