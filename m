Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C94A017D6
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2025 03:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE7A10E0BC;
	Sun,  5 Jan 2025 02:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D7210E0BC
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2025 02:39:02 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3cdd61a97easo9967315ab.2
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jan 2025 18:39:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736044742; x=1736649542;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3ZGaQpDHwn+kOMqbOdrqyXdKStj/3L/DfaBUkPACsk=;
 b=QcIjjrmSgtrsnP5hs+BaSUzjIy0ZcZnrjBzVRdBaOJT400zw4SB3OE4a3j+OSqZFmC
 T/foMcL6iAtmhx53ZoYqBw0gJ4ELAHk/YD0JPVRIjb0nhIFNnrGc7EKpe+/z3p75eF2A
 t6j37pKEj0A1lrllSdUc7erCZ+BOet/jr1pnDs2bMB92lRWu23l1Y5VZmEGRvjn0qt56
 w8a9ZqF8QBTcvU8AkqdCOUa/XlkfgFSvMmwLFWhGZAMuP5H4oV82TLdiZo4y4MnEkEAh
 PYxCMrGkcqLbrV/EKtL4Y519qxXHG2Di2YiNjGHFbtiUipQEztzAC7pvwp4XdYqj/LaH
 Dlgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+5Xv/R9XWBkVmB3r39SgZBtWLlCUri1ysKe+4HcZ00sM+y7xJAR4sgf1p9u9q4PRJRdu7Ht0gFec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHj5GE29a5gV62V75TGv//tft9P/GD9SWux6B3Mi3zW30zWZ/A
 eiKK02vh1dWwiI3PztLb46Ybv8RcLPbJ9h8+BKWvcFI2wHpq8XbkJ/QBbZmLv1lfKXUcFKaEQj5
 NmWAkT1TXCeeItbL7IyGtL3GTMin9R9Q9UmHnNQ4d8GJ6UE4D8GnjdcI=
X-Google-Smtp-Source: AGHT+IGnZQOxn+K0xQnAjjUzBs70/r4G8o3Xv/2v82PaCqlxzzhP3EbJVOzOkoKhAAPKinkTD4Vamp9pqzR+HMmbUeEbFbLIR4BB
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20ed:b0:3a7:e592:55ee with SMTP id
 e9e14a558f8ab-3c2d5724dbemr450957865ab.20.1736044741972; Sat, 04 Jan 2025
 18:39:01 -0800 (PST)
Date: Sat, 04 Jan 2025 18:39:01 -0800
In-Reply-To: <000000000000587e0f06112cd973@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6779f0c5.050a0220.380ff0.0008.GAE@google.com>
Subject: Re: [syzbot] [dri?] divide error in drm_mode_convert_to_umode
From: syzbot <syzbot+0d7a3627fb6a42cf0863@syzkaller.appspotmail.com>
To: airlied@gmail.com, airlied@linux.ie, daniel.vetter@ffwll.ch, 
 daniel.vetter@intel.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 eadavis@qq.com, jani.nikula@intel.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com, mripard@kernel.org, 
 simona@ffwll.ch, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de, 
 ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

syzbot suspects this issue was fixed by commit:

commit 9398332f23fab10c5ec57c168b44e72997d6318e
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Date:   Fri Nov 29 04:26:28 2024 +0000

    drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1296f8b05800=
00
start commit:   1c892cdd8fe0 Merge tag 'vfs-6.8-rc6.fixes' of git://git.ke.=
.
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Deff9f3183d0a20d=
d
dashboard link: https://syzkaller.appspot.com/bug?extid=3D0d7a3627fb6a42cf0=
863
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17f2fbc218000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D177bda8a180000

If the result looks correct, please mark the issue as fixed by replying wit=
h:

#syz fix: drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()

For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n
