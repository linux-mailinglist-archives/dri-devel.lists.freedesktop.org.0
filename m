Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C241390644F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 08:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E262110E20F;
	Thu, 13 Jun 2024 06:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B7710E20F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 06:46:03 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-7ebd2481a89so54160139f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 23:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718261163; x=1718865963;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2xgF8ibcEaldCk43yXegeJSCV4DTuCuF5ATotbVCUuQ=;
 b=UPKow7SPwgT01qDm1jSTaAlx9RsaSAsPa8758kbu/bI7pQbbOGOONb9ESC50xzUdHe
 NTFNI1CrRfpvF0OaVDTNZtP5dyj/ctx0Nkc7LigWNb/14clxPsNY3GUCEVMCgfPafQNL
 0hZUwruGalMC7dI2pZ3Ncb/FgRJlXmhR0+GI7UKLDyf+2V226thW1KQ2jI8tJxMfCbL7
 KY39OmzaIwHcF6p8M6oMMQC0XamplPQNbqt3L8KuhvhtfT6x5wv7sgEWkO7RXYXmk6VS
 JxQih1aPmn36qUCTU8ghXk4ZmLSZ5+oxGNaYkOPzQ4kH62wJaEifadlNU3yHs/ufBlda
 rQYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIEc4pX65E267IsPkD6KdiDniF/7cTI1uqAIvySgyKtY+FcUSJL/nmuFDDCilwQeawnheR8qzIn9tMMRfmTXGQsI3WtxI669Jmb4VpeObo
X-Gm-Message-State: AOJu0Yx9VIpgXzwp0G4wSGbRhaaSmCW0cVg3s4VEpAC4C935c7eeF+54
 +zkj8JfrKnQqDujQLH6r6s36uVpGHpp7fLSF6dXBCoM2l/3tdL/TZBdLBhZIRMxrY12velXY9b0
 mV7H7Qi2x4PDThwjZJbd9OMaN1matkLH1X01aAgD3U74jz/7nA0XH4j4=
X-Google-Smtp-Source: AGHT+IHVV4ammGC2f4+AGyBTE1+VDmo87HUmoApb8C4WDpycZnv406L1ZJ6bIafm6AgJf15GrH+StIi7CY1fsJAsDhp7cO8L/eZo
MIME-Version: 1.0
X-Received: by 2002:a05:6602:641f:b0:7eb:9f62:3370 with SMTP id
 ca18e2360f4ac-7ebcd19eff6mr21065439f.4.1718261162696; Wed, 12 Jun 2024
 23:46:02 -0700 (PDT)
Date: Wed, 12 Jun 2024 23:46:02 -0700
In-Reply-To: <IA0PR11MB718550C7137E8341C7D54A71F8C12@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003bfa48061abfda41@google.com>
Subject: Re: [syzbot] [dri?] [media?] general protection fault in
 udmabuf_create (2)
From: syzbot <syzbot+40c7dad27267f61839d4@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 kraxel@redhat.com, linaro-mm-sig-bounces@lists.linaro.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
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

Reported-and-tested-by: syzbot+40c7dad27267f61839d4@syzkaller.appspotmail.com

Tested on:

commit:         c7db1220 fixup! udmabuf: pin the pages using memfd_pin..
git tree:       https://gitlab.freedesktop.org/Vivek/drm-tip.git syzbot_fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=133a93e2980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58a2adb83f90b327
dashboard link: https://syzkaller.appspot.com/bug?extid=40c7dad27267f61839d4
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
