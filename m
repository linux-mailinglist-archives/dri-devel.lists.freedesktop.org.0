Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC604AECBD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A58210E4F2;
	Wed,  9 Feb 2022 08:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A790E10E331
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 14:51:08 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 h2-20020a92c082000000b002be1a462793so4680820ile.18
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 06:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=gyoR7YM+mgvf6gynog/ilFRl/dnvDf1mCVSF3t4qaro=;
 b=Pf9PWCEcDHQAaaQTy43oHhlteftZAONHQehzMbbZGrzi1XNsM8GUq94bIn8s9sM04m
 kA2X5/3cle4WRVWfakw+IBd2w96nxdeR8DgN8noj6aPP1YU5AAvzG/eGTnL6amJy1CLP
 KmOmvGaT760vdwL6bAQqi66ELL+5T5oCUoNMPhHBc06oMFLJq3Lb3Sy7LHl721v+aLbA
 YLR5P775nHUYakfp9o49KShCHQ2za9/T6s5VmRerqIBfhvNeugRut07UJeaYySDOoc3V
 wSYlTOC4WcNoQx/+4s1nxhoL3wDbVeYcZUkVYbkCTZVSjxyuP5CNKXYMjaq31C+Az7Ld
 US/A==
X-Gm-Message-State: AOAM532ZmSu7G48WW0oV5fLGTxxAztWTEqQtW0iU3w+HhWxpY3VvAOve
 WEFa3MLP6hx/4u9Pn3Hvp8XX5JVrZ+PR5GALmNZTpxaFK4dM
X-Google-Smtp-Source: ABdhPJyrUpevVYRtKHnpJMXJjRCIBtEle9LkYgAgiZm93aCVhOQ2Ko/U9yzPvwo4+Gb4ic59T/FQlqCtLdjX1jXFHAD2iLfsIHlG
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1ea:: with SMTP id
 t10mr2189767jaq.77.1644331867846; 
 Tue, 08 Feb 2022 06:51:07 -0800 (PST)
Date: Tue, 08 Feb 2022 06:51:07 -0800
In-Reply-To: <2114181.C4sosBPzcN@leap>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e03f4e05d782d886@google.com>
Subject: Re: [syzbot] WARNING in component_del
From: syzbot <syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, fmdefrancesco@gmail.com, 
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, rafael@kernel.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 09 Feb 2022 08:39:54 +0000
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

Reported-and-tested-by: syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com

Tested on:

commit:         555f3d7b Merge tag '5.17-rc3-ksmbd-server-fixes' of gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=266de9da75c71a45
dashboard link: https://syzkaller.appspot.com/bug?extid=60df062e1c41940cae0f
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=111f7428700000

Note: testing is done by a robot and is best-effort only.
