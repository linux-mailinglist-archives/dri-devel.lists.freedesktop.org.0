Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E8FA15E78
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2025 19:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E054E10E02A;
	Sat, 18 Jan 2025 18:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402A810E02A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2025 18:25:03 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-844d5c4a27fso496947039f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2025 10:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737224702; x=1737829502;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0HJ5W0kZMJIQYU70k9zjOsn00gywfDA+PBSDDRePKw=;
 b=EvKLmKcYMhN4sqsmgTqHzjf7vLX3bkxyXfNXG17lXmz+YtgpX0x924+9xrrBnEH4y+
 Y2p0KkoITNciqrJLjjHgB7/TBhuUDNK6kJKSIrHXyOTRw2bGBeKGfgNvSBlqOqNjmpH7
 o6duLfuZ9KEzZxnS1fcTOLWxRvV2XFjqLUF2MBs69GqCARczakW62kXrKKNYbTeiIzJ0
 r+wtYOF4a68bhtVgNQu04X7xQAAYqMf5cokqy0EmJdhwYa/iNQT/qJLxSr9JSto9Bdzp
 dqVzzgWGTO+iF43HiQ/kWcYAQ6wZKQ3/mhOIj99sRCFpB4clYTzqsS2FXC0BRwSuV8Y5
 Oetw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtqg/a+NpeqAaFgdJvY7H0vPb1A23cFhx/GIY4+1wkjC5crD+Iu+oeex/n6k2sumOBW69tkpeTz8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyncl9KuGlj8Lr99pdslFB4ZS/HslBhvLzO38hjnxiZHBUR3WLW
 kUVLK79el5JtvDSBeCuApzGaHZzDDlNjSiCOQtskIcaDPL+5533znusXPTWLoJ6Xa5gkYVEr6pS
 i8Kjm+snl53DyfFWBcSAOD3F6W+8YWySIp8KV7uLtHmnc8EBXEkaSjz8=
X-Google-Smtp-Source: AGHT+IHH2UZ24a1vVSc4JnsX0rFy8xiob1jrG+ea8/xUTIzY/BFM7f7FTUMe1TTcaEfeS6i/dhKbK5rGu1tBCpusren4QEUxjOh3
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13a8:b0:3ce:7cf3:27be with SMTP id
 e9e14a558f8ab-3cf743e096amr62226885ab.4.1737224702243; Sat, 18 Jan 2025
 10:25:02 -0800 (PST)
Date: Sat, 18 Jan 2025 10:25:02 -0800
In-Reply-To: <000000000000bf0b1f060a2d9bea@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <678bf1fe.050a0220.303755.002c.GAE@google.com>
Subject: Re: [syzbot] [dri?] divide error in drm_mode_debug_printmodeline
From: syzbot <syzbot+2e93e6fb36e6fdc56574@syzkaller.appspotmail.com>
To: airlied@gmail.com, airlied@linux.ie, dakr@redhat.com, 
 daniel.vetter@ffwll.ch, daniel.vetter@intel.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, eadavis@qq.com, jani.nikula@intel.com, 
 jani.nikula@linux.intel.com, kherbst@redhat.com, linux-kernel@vger.kernel.org, 
 lizhi.xu@windriver.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com, 
 mazinalhaddad05@gmail.com, melissa.srw@gmail.com, mripard@kernel.org, 
 nouveau@lists.freedesktop.org, simona@ffwll.ch, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de, 
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D11797a185800=
00
start commit:   ac347a0655db Merge tag 'arm64-fixes' of git://git.kernel.o.=
.
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D88e7ba51eecd9cd=
6
dashboard link: https://syzkaller.appspot.com/bug?extid=3D2e93e6fb36e6fdc56=
574
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D11252f9768000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D10fd2498e80000

If the result looks correct, please mark the issue as fixed by replying wit=
h:

#syz fix: drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()

For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n
