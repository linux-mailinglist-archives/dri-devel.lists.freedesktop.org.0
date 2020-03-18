Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1031896E2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 09:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CDF6E883;
	Wed, 18 Mar 2020 08:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF2B6E1F6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 07:19:04 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id c12so19139174ilo.15
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 00:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=AhaXelTb4CkDuWTiPyTo3C6D6QQ6q7mstwM/dklynRM=;
 b=cW/bXlCSbA/44IW7SsLrJQ0E4DIyMqi5RLsFbyVxp8fsHyScZgegqppEoSH7K7I0KM
 cLnnWEXaumvH3jzdJ5gSDxHHBUfT+aYv/Kqx2D1sa9KciXUbjF7ib08ZxZzMnBHcwNE6
 M+IK4Mvk71GWyIqa7Xxvl2uTc+iaYxNB8A+4ZlI+y6jC2Aa6FsIvkQw1m2EQI4U6wmSp
 7lhDe7RrJgcClrw/Y65BXMRQQRlcYVNl66Ist0vngO5xpfXvSXNIaJrIUQ5/QSbj2crq
 eJFQyI3najQpkrVv2i/26YjU428u8Q9g1uqTB6nfr254ApdNd2GYUakPAj3nNwToEb65
 tDlQ==
X-Gm-Message-State: ANhLgQ22NxS9iD1VgkEhrpApdI38nWMNlJXUwje2W8333UcZ+6NKx87J
 2dL/4jo1up/dGyb8s7Zp8Fk0teJ+Mnq4ndlVAZ+92hXTOJEa
X-Google-Smtp-Source: ADFU+vuXK52KHuMfmWijNinm0A+H+Z1mmON3xD7KqXvwSfekdWJ6PLmyjoWTtC0fVh7NoCYO+AVnsxlcmnTlynOwKfHZTfC72zP6
MIME-Version: 1.0
X-Received: by 2002:a6b:c045:: with SMTP id q66mr2517997iof.10.1584515943764; 
 Wed, 18 Mar 2020 00:19:03 -0700 (PDT)
Date: Wed, 18 Mar 2020 00:19:03 -0700
In-Reply-To: <CADG63jBhCBf6r8vfT6kCwh7shYHKsuGH=Mx8D+hDxO0C3Urjqw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f81d5b05a11bddac@google.com>
Subject: Re: WARNING in idr_destroy
From: syzbot <syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com>
To: airlied@linux.ie, anenbupt@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Wed, 18 Mar 2020 08:24:31 +0000
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

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com

Tested on:

commit:         b1289238 drm/lease: fix WARNING in idr_destroy
git tree:       https://github.com/hqj/hqjagain_test.git idr_destroy
kernel config:  https://syzkaller.appspot.com/x/.config?x=cec95cb58b6f6294
dashboard link: https://syzkaller.appspot.com/bug?extid=05835159fe322770fe3d
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)

Note: testing is done by a robot and is best-effort only.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
