Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB1F82CDEC
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jan 2024 18:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCCC10E102;
	Sat, 13 Jan 2024 17:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41C210E102
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jan 2024 17:29:04 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-35fc6976630so62169975ab.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jan 2024 09:29:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705166944; x=1705771744;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ICsUNI7Afo1PaF9JpZaaVdJbx+JyaYF4RtdCTjtQr2E=;
 b=wYUN9hihDOPDrVSDBYLqwZOrp7TsDe8W1k+sVdbez86AZYxkppbKg/016AU5+vzupM
 Vf+PaRhDDUDCUNJPZbxaDK2mORWvOXXobWYl2vRxTsOYh3aQ44HMf1DTp0+80pr19I4o
 FqhbAg6Fty5aaQEMEWJ4qe/rCW2XEfUojTCCsPShLr4zZlyPDZGyoyoyh8cK0Hlr+74D
 O/F17Rmfu8RDL5cKZ2P0lqEpm+Ni0hNVK8O0kpp8xkZ269D5yeTtcWwmfcEkBClv0Gta
 lIbb8IbrajZkZP10ayfMap5zCCV0rCwzeSuNhVXVtOPSgLcax3FX/UoozA5H0ADxlGSh
 4G2Q==
X-Gm-Message-State: AOJu0Yxd3J4qzbBnxLEVAwlP7b2vIPTWPZMDy+v1LKOqzO27Ru/K/8/8
 cj7KZvtwFMq+p3ZHI9joebo+W97XPa3DxM/e6hPVCM4lWnin
X-Google-Smtp-Source: AGHT+IHcLfzVAyzvzQwfkVETCBuZ267lqDZoU9EjATlm1vKKLELh2mnr630YV9hDNu5o4qUMvxVVbcfwfndUYj9z7niA2zqVDvIP
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e0c:b0:360:5cc5:8ded with SMTP id
 g12-20020a056e021e0c00b003605cc58dedmr387058ila.3.1705166944013; Sat, 13 Jan
 2024 09:29:04 -0800 (PST)
Date: Sat, 13 Jan 2024 09:29:03 -0800
In-Reply-To: <00000000000026100c060e143e5a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fb160f060ed71da5@google.com>
Subject: Re: [syzbot] [net?] [nfc?] INFO: task hung in nfc_targets_found
From: syzbot <syzbot+2b131f51bb4af224ab40@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, davem@davemloft.net, 
 dianders@chromium.org, dri-devel@lists.freedesktop.org, edumazet@google.com, 
 gregkh@linuxfoundation.org, hdanton@sina.com, jernej.skrabec@gmail.com, 
 krzysztof.kozlowski@linaro.org, kuba@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, mripard@kernel.org, netdev@vger.kernel.org, 
 pabeni@redhat.com, penguin-kernel@i-love.sakura.ne.jp, samuel@sholland.org, 
 stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, 
 torvalds@linux-foundation.org, u.kleine-koenig@pengutronix.de, wens@csie.org
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

syzbot has bisected this issue to:

commit d665e3c9d37ad31aec2d0d9d086e7c903ddd7250
Author: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Date:   Sun May 7 16:26:06 2023 +0000

    drm/sun4i: Convert to platform remove callback returning void

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D146b91f5e800=
00
start commit:   acc657692aed keys, dns: Fix size check of V1 server-list h.=
.
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D166b91f5e800=
00
console output: https://syzkaller.appspot.com/x/log.txt?x=3D126b91f5e80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5c882ebde8a5f3b=
4
dashboard link: https://syzkaller.appspot.com/bug?extid=3D2b131f51bb4af224a=
b40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D103698bde8000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1617e0fbe80000

Reported-by: syzbot+2b131f51bb4af224ab40@syzkaller.appspotmail.com
Fixes: d665e3c9d37a ("drm/sun4i: Convert to platform remove callback return=
ing void")

For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n
