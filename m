Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D21C56DF223
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 12:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F4610E0C2;
	Wed, 12 Apr 2023 10:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C3110E0C2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 10:45:20 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 i4-20020a6b5404000000b0075ff3fb6f4cso18590557iob.9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 03:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681296320; x=1683888320;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=phEY5JrOJ7bL5ArsZNO3g5AGRU38lwvq/bBXqMuMhoE=;
 b=pllVgXa3ZB9dkVF4ACNseljDcKaPuaxiL0LNj52IalAqXMu/RD15X//LAElNbgqXU5
 yEcKq2eYDHslBHO5IIzvYF3g84k8mMINJ4i69sbXKVrR/yBQRnSr8hMUv6ubrUpJSuTE
 rBIRFOoUkW3CR7z+R1uLN7MOPSaUKn7Fl+A5rc7Q1oK6ZzmdAZ6Sj9ZgzAinkIZB8juR
 IZp4Ywmk4NiRsLR7zFi9IdUmCt8JF7A2+xzeqmeEBRWbRubKp4DBTxIWvCspBdE8PndE
 xKK0CdOOSmQEv3vaqh+HhEEN7yKFJvBouvRL/J11/vGqJHjdAXZOlp05JGf/DRsmGyab
 pReA==
X-Gm-Message-State: AAQBX9eruJg4ayiUwl4KTCjf2cEq16LiPXgK1Hri+HgD6QfS+L7H1uKo
 woNtBqvjVx5es+KUJWTSuqKz+xbDL6JtikXRNr7HFBdQkHNe
X-Google-Smtp-Source: AKy350aR0QR/aDQVYs8GizD8CoW+L/wGtwuimNdmVHFR7PfEhhEkF8gxpwLZewDyHDj+7GWzYDufYaJm4Wg70QLjap7CPIAaIUKm
MIME-Version: 1.0
X-Received: by 2002:a5e:8905:0:b0:744:f5bb:6e60 with SMTP id
 k5-20020a5e8905000000b00744f5bb6e60mr5494942ioj.1.1681296319962; Wed, 12 Apr
 2023 03:45:19 -0700 (PDT)
Date: Wed, 12 Apr 2023 03:45:19 -0700
In-Reply-To: <CANp29Y4V7LsaJk0h3GyWV-chE8YkwM2qX33_hy9ZF5si8ZLdDg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e9e5a905f9214d8c@google.com>
Subject: Re: [syzbot] [dri?] WARNING in vkms_get_vblank_timestamp
From: syzbot <syzbot+75cc0f9f7e6324dd2501@syzkaller.appspotmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, melissa.srw@gmail.com, 
 nogikh@google.com, rodrigosiqueiramelo@gmail.com, 
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

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+75cc0f9f7e6324dd2501@syzkaller.appspotmail.com

Tested on:

commit:         7d8214bb Add linux-next specific files for 20230412
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1387763dc80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=923e20c1867d7c1c
dashboard link: https://syzkaller.appspot.com/bug?extid=75cc0f9f7e6324dd2501
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
