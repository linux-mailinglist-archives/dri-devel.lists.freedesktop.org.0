Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BFD4EBBC6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 09:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6395A10F5B2;
	Wed, 30 Mar 2022 07:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA6410EECD
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 22:12:09 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 f11-20020a056602070b00b00645d08010fcso13267520iox.15
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 15:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=OOoVa+V/irW/x+0wA9yzjLGHzahFLKZsDL8MQwHOdOk=;
 b=NMU+OnPdyvDEiRBC7ae7f519BCp9ktMEAdbhsqECG5ajzI6WYvBVA0va+m8fgqZgh9
 ZrKaEmzvl/uLKXIVs47M0ydGUfnHsQf/OtrRAegYUnWYcuscqxL6y3IBsl3D1k8dFvPd
 7THGCO7nP9gXvxKaXMKT0nd8ObXzMggfhsIA/w4A5i94KKGMfTw2Mt+j4lvVoTxu5Cf3
 DscKRi3voFPTbfu4G6//hApUwJ+9qJpWYUCvPnC294LZsxf0t0nR1YpM1pwK5CD3fMmY
 Avae3LygjzWOe6K4XS5cYF5mbJGG40fkVbMv9rjWZNc20OItvl7CWZQgF4lRA+BHxJ8v
 jNqA==
X-Gm-Message-State: AOAM530udJif5LRZfKfu4p5R+mv9B6uBFpAHmVNtYRA3dP3N7yp6HGCm
 9R8968DBU58mMwesDGp3SvntX3TAvfDoIYmfajSW8T6/MteK
X-Google-Smtp-Source: ABdhPJw3pahBeObtq8ZwZuFbJHHaAzDqVoMW2fRmLcGfMwRzoQkSN2/0Mynl0syuHLCkZzBNOgbVxEEbxorg8AC0mn61Oh8R+l2M
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2053:b0:31a:4907:ff65 with SMTP id
 t19-20020a056638205300b0031a4907ff65mr16979897jaj.224.1648591928519; Tue, 29
 Mar 2022 15:12:08 -0700 (PDT)
Date: Tue, 29 Mar 2022 15:12:08 -0700
In-Reply-To: <419a9bb8-cb68-8add-e7be-275a48b2126d@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000476f2c05db62b851@google.com>
Subject: Re: [syzbot] general protection fault in dma_fence_array_first
From: syzbot <syzbot+5c943fe38e86d615cac2@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, daniel.vetter@ffwll.ch, 
 dri-devel@lists.freedesktop.org, gustavo@padovan.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, paskripkin@gmail.com, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 30 Mar 2022 07:32:47 +0000
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

Reported-and-tested-by: syzbot+5c943fe38e86d615cac2@syzkaller.appspotmail.com

Tested on:

commit:         c2528a0c Add linux-next specific files for 20220329
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=88d1370cc1f241e6
dashboard link: https://syzkaller.appspot.com/bug?extid=5c943fe38e86d615cac2
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=128372e7700000

Note: testing is done by a robot and is best-effort only.
