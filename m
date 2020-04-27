Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9D01BBE01
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CE76E44C;
	Tue, 28 Apr 2020 12:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D274789948
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 15:02:03 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id u11so19752473ilg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=TfUPXfE+cTIMWHEFg4Dl9b/oLW/Udq/MPl9VKXgMmok=;
 b=rkaitEZqpFu0A8Kxb1xP71TEdH+vZSUDQ9I3o02rGDAD7/kGWj2R3WT8ksqAjep8ts
 KhsUHgArFrd1Ub39nocCzS/5WTdwvzpnbuOKFIOv33ixQeI0kYNsU7fJCvYEPWFk6EmB
 SB/XKLo/bw/hgrMD65tizUUylTVznqH1upb5pw9LZPCLJILea59v+7f0Z+Eet6tyUu7M
 +bH4av+NKu6clD4huXmUR5smVgxnRxMd/oiKyFSRqaaMWJ0RCooyfE8dmK/R+NFNON7/
 XJ1H06m9HZICZ0MeAYm3YA+YmbdIyIjCpkVWI995pGTtZcCmdmEgdpnFjhQGnMipLtuX
 6TwQ==
X-Gm-Message-State: AGi0PubXsQ4v5r1DFBGd3nF1ZoXqpk3fi4FAwkpOti33IUF99zx7vHBp
 Yw4d8TZbXw/iSyLIucNXqNzHB5ntLL0G44A8B4jhhDVFZ6p4
X-Google-Smtp-Source: APiQypL38u/Fn/pFodfcLRM1XK4BHxaVuMTFystRgZIhu07N9kJA6Yq8V9okZv7VSqr1LnfCu93YVrBkOZXUvBvnmUfJyxrixMPE
MIME-Version: 1.0
X-Received: by 2002:a5d:85d7:: with SMTP id e23mr21430309ios.174.1587999723210; 
 Mon, 27 Apr 2020 08:02:03 -0700 (PDT)
Date: Mon, 27 Apr 2020 08:02:03 -0700
In-Reply-To: <CAAEAJfAnMeZw3H3PJccpJTEME877i3=21CehykkSgnSnCZbOVQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000067d2de05a446ffb5@google.com>
Subject: Re: KASAN: use-after-free Read in vkms_dumb_create
From: syzbot <syzbot+e3372a2afe1e7ef04bc7@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 ezequiel@vanguardiasur.com.ar, hamohammed.sa@gmail.com, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, rodrigosiqueiramelo@gmail.com, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

syzbot tried to test the proposed patch but build/boot failed:

failed to apply patch:
checking file drivers/gpu/drm/vkms/vkms_gem.c
patch: **** unexpected end of file in patch



Tested on:

commit:         c578ddb3 Merge tag 'linux-kselftest-5.7-rc3' of git://git...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
dashboard link: https://syzkaller.appspot.com/bug?extid=e3372a2afe1e7ef04bc7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=165806efe00000

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
