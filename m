Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17088707B3F
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 09:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D46110E03F;
	Thu, 18 May 2023 07:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6DA10E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 07:40:39 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-76c6ba5fc22so78058739f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 00:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684395638; x=1686987638;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zdaBrx490s8k6dX8A9bwP75JHCsfXxu79WG1YDEQ+kU=;
 b=KzexrlP9/7E9rlRgUhGuB9h59h1nL1gHZVZvcAJv5xDVc+YngWI/zHZZHdVgBHG8hs
 RNEnXWPU2vScz9ZZI6x2FTPMX94da4Sgcssv279Bl3w3f38nABSZASAzAcgFSXFMXbla
 5WDFM7sMeKaXGgvNeqzQi7WBPk9kDB3Qen6EiqZ1XFcxQTFzzhAFpSUnJLeZ5vj2OWhr
 gW+WSZV791JEJZWOUIcTlGk/HQTpv1pD9rgqqg2jbY7IxjIi0fPscGpQkJ1ZEKNt1hob
 adGp8cVuN+e++0dqh/BcGDWafghv+yMd4EAsllRDVEQ757kK8ZX7gPOCNYk3ZQP5OCIM
 7fng==
X-Gm-Message-State: AC+VfDyK9vZEG0ao/S0rXva3+65pInNyqgPt4uBSIyDt0xvB6A+NIhoP
 ehJOoP18X5D3ZE8WGWzPtPWWu6Bqk3gOn+QddMJ+Xq98o44a
X-Google-Smtp-Source: ACHHUZ5BSeJHwBlPAtnaWhHK6T9xhV3CzN1B/t33fjNEVVmiVfyZvhdq2Z74TG5jGUaYrDwcTXUEVGJx1XKuD6JL9ZzR1kLPfSI0
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3713:b0:40f:8f07:e28e with SMTP id
 k19-20020a056638371300b0040f8f07e28emr790444jav.1.1684395638617; Thu, 18 May
 2023 00:40:38 -0700 (PDT)
Date: Thu, 18 May 2023 00:40:38 -0700
In-Reply-To: <ZGXVANMhn5j/jObU@ls3530>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b3803905fbf2eb97@google.com>
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in dlfb_submit_urb/usb_submit_urb
 (2)
From: syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>
To: bernie@plugable.com, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 torvalds@linux-foundation.org
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

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/usb/core/urb.c
patch: **** unexpected end of file in patch



Tested on:

commit:         a4422ff2 usb: typec: qcom: Add Qualcomm PMIC Type-C dr..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
dashboard link: https://syzkaller.appspot.com/bug?extid=0e22d63dcebb802b9bc8
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1524090e280000

