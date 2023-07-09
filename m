Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6E74C0CD
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 06:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB6910E12E;
	Sun,  9 Jul 2023 04:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB7910E12E
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 04:09:36 +0000 (UTC)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-66872889417so4155671b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 21:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688875775; x=1691467775;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R7q0J7G+yI5lmdgF+X7aufQLFQ3cYs8ipxCSvg9o7VM=;
 b=JeRlebVgcExdha3Qn17eeP2wGmSAjscpl26lMgzDx1tcQUtdRZPDMnFm6f/7K9eYrf
 c+fRIn7IM9+4Fopeu/q3A644pejHKhLVlwVfWQ1wmbSsc2xf7Q+jlgGL1kVUwHavEAbD
 Qz2EpIW5Wmr+Vac8AIYy0b7G4cdZg2SOqlWKZJBAjp47nQkHFuztaUXgIWhN8y+1QdBe
 QQqANHJLDnBM49R2uBNgmMYrEQGLBx6xpphIiFLjfcZktMDlUrFyKRc42E36c+ugpigG
 wJjmokYWgZ9TkeMeN6qrwxb/x3LFqihrADT9Nyzvcxgnqf33tccUbos97OEYOqEFGkeW
 Gnbg==
X-Gm-Message-State: ABy/qLYVbtQ45xjuYy6Ct2ihnkhiDx94JyyAYcCT6tuy/6WwweDXc3hQ
 v5fCHOvkYcAUMd3xsEfRJEIGWGeOjpts2c/UAwEEG5MlQ3Nn
X-Google-Smtp-Source: APBJJlE7ScwMHQc7rQl3m/vhOqETjF/F63AB3cxj4/jZQIaXv/SjKsRxE6pYb/Cl0DHsdYhsfVgS5VlBlphx6XYqI8GqQo9hjrg9
MIME-Version: 1.0
X-Received: by 2002:a05:6a00:2d9b:b0:678:e0b1:7f28 with SMTP id
 fb27-20020a056a002d9b00b00678e0b17f28mr12294027pfb.6.1688875775705; Sat, 08
 Jul 2023 21:09:35 -0700 (PDT)
Date: Sat, 08 Jul 2023 21:09:35 -0700
In-Reply-To: <20230709011213.17890-1-astrajoan@yahoo.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ae45de0600060878@google.com>
Subject: Re: [syzbot] [dri?] divide error in drm_mode_vrefresh
From: syzbot <syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com>
To: airlied@gmail.com, astrajoan@yahoo.com, daniel@ffwll.ch, 
 davem@davemloft.net, dri-devel@lists.freedesktop.org, dsahern@kernel.org, 
 edumazet@google.com, ivan.orlov0322@gmail.com, jacob.e.keller@intel.com, 
 jiri@nvidia.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, netdev@vger.kernel.org, 
 pabeni@redhat.com, skhan@linuxfoundation.org, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de
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

Reported-and-tested-by: syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com

Tested on:

commit:         1c7873e3 mm: lock newly mapped VMA with corrected orde..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=101196d2a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8f6b0c7ae2c9c303
dashboard link: https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10e44354a80000

Note: testing is done by a robot and is best-effort only.
