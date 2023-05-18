Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA8F708A23
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 23:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D61E10E0DA;
	Thu, 18 May 2023 21:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA7710E0DA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 21:08:27 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-333eb36e510so20571105ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 14:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684444106; x=1687036106;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oCJmZhikEGgvshSFtgr79kh24UyNzZUnmc8l6fNAyog=;
 b=HpDacQPuO6biJpL2tZOnQ2R9tOUrNkwC87nsVR/UchlLPhMEFjBs70F3VImbnan3No
 QnXBrbAZBopCICb4Q3zJVzRSM1XE7cytecRgEbhW90/ZOuJXOo+ALA70MUMRzh6b8X/D
 vG6yC3FX1c0O4E0T9u8teibXfGO59PWXXYDbHeW7nx50iG6e/7fZWlGiaxNdc0VHB6zb
 xbvovenZe5R65Cio1h38Up+Va1bSXBfRwS2ucvInLPNsLpd3QM+wrF1ATnNYN/b8jxwW
 wtblr1f8190xyYb1y63343ONsvuQLeNU3fSJrqyrgPshFAW0LgwQxvW1ktTE5GrvJT+D
 4EXw==
X-Gm-Message-State: AC+VfDx++97i97tpoEFri21nHs+CGqhSGKXkhTUCf3t+C0RQfGFIzGZg
 Vj38toNXuFE8Dk8XZZupTNwj3VHZf3TBypbeGZHre7CRzWW2
X-Google-Smtp-Source: ACHHUZ6O+AwC9jQ6/HWx9bF4gsIW4ateeFT9tlEiAvl6X0cm+bMtLLafLfqIApH9fHqyJCPWOSItmHrhVXZe54RUpchQdppkkfQY
MIME-Version: 1.0
X-Received: by 2002:a02:93c7:0:b0:416:5d0f:f494 with SMTP id
 z65-20020a0293c7000000b004165d0ff494mr1952410jah.5.1684444106608; Thu, 18 May
 2023 14:08:26 -0700 (PDT)
Date: Thu, 18 May 2023 14:08:26 -0700
In-Reply-To: <c7b8e69a-cabe-4e17-a511-66179259d1d7@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009e5a1c05fbfe34c5@google.com>
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in dlfb_submit_urb/usb_submit_urb
 (2)
From: syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>
To: bernie@plugable.com, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
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

Reported-and-tested-by: syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com

Tested on:

commit:         a4422ff2 usb: typec: qcom: Add Qualcomm PMIC Type-C dr..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10b6b9a6280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2414a945e4542ec1
dashboard link: https://syzkaller.appspot.com/bug?extid=0e22d63dcebb802b9bc8
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1374e5a6280000

Note: testing is done by a robot and is best-effort only.
