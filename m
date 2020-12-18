Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E317C2DF517
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454F66E138;
	Sun, 20 Dec 2020 11:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77B16E1A4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 15:28:06 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id y15so1502477qtv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 07:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j3vBoddoAjf0IFyLATEzp2b+bWulu7D90uXUHegOXUg=;
 b=Si3oD44qeMyvjKcsH1+EDZWe5MQCPYs0WMqv6g7C6ZiGuj/z/vCP+x3cm/dPnUF2gw
 xz6pzCYoLKvC5uJBGAdDenkv029H1YsBVHcb4wDJVVQLlDYGrUPrciWoo/pb6jF22IN3
 v3hPs4FMysZym/YA71fhD38dRDVOJL7opsh2hIEIV2Qk5qGZyv/SP8+8065Ah230mK61
 T7RI1yQORhwXjgbifG0VISdHByeo6z1aW2vbFcFQZMufqjDPe4QHbRlEZExb0BbzaaEO
 2ncCXZgk2KfCkwTk9CuE5nTxRwKHDobAsHeb+XkBpCLb8BWEtmBZ7x4CbjTNQKC5Cz3+
 f//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j3vBoddoAjf0IFyLATEzp2b+bWulu7D90uXUHegOXUg=;
 b=BJ4GLQiRlZCprm0ycnZOGFdXTTDvOOmo0ZSQmVNSHqvDDilaGIMmerPRWucl5WvdF6
 LS4jzeLRf52ICpwzNO93C2vhzcQ17T/VJFq1bOPRxu3im973bjBN46/zOCIYs+sYk1qL
 aR9kBm3h1vOHsrLpVOpxGCC14oUaBjHEbJQ6Ta/2MRCQHhjH50NF7NCaASHulEG3CBck
 rU4twCCtgcnocbFd2JsskafoVe8cblHGUTVwgKbYvovurghJewKlHyOb734QFBIOhSwx
 yMwADrqDVnbT1v76XzHkJh/cgtFeY/Ama5fa+tdJPSh7wl7maaemjTpEf4m/tJGgWsCh
 tWPQ==
X-Gm-Message-State: AOAM530J8btL1Xk/Z+OFQ3mN/Q6+AbC3OhEXkgFRAy6QZ5+nC9xb76jY
 aDj9lbCZJcFF/mijhJ9cIXJmO4OIXK3Qtt8sqtN8jw==
X-Google-Smtp-Source: ABdhPJwW7m310B422NM+6uj5jd7lHxdtuQKuwhcqifNW0uu9yiOzNdR5vQRKoj3vZDABn1uaGcu1OlzjycvZ6jx9qzg=
X-Received: by 2002:ac8:4e1c:: with SMTP id c28mr4466988qtw.67.1608305285772; 
 Fri, 18 Dec 2020 07:28:05 -0800 (PST)
MIME-Version: 1.0
References: <000000000000b30cad05b0fc3d74@google.com>
 <000000000000fbf57305b6beb939@google.com>
In-Reply-To: <000000000000fbf57305b6beb939@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 18 Dec 2020 16:27:53 +0100
Message-ID: <CACT4Y+bgROPPaiah0S0N8Ju9cpj9xkeQ9FrMCfQeAuRdJy1Qqg@mail.gmail.com>
Subject: Re: BUG: unable to handle kernel paging request in cfb_imageblit
To: syzbot <syzbot+dfd0b1c6705301cc4847@syzkaller.appspotmail.com>
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 George Kennedy <george.kennedy@oracle.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 18, 2020 at 4:26 PM syzbot
<syzbot+dfd0b1c6705301cc4847@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit a49145acfb975d921464b84fe00279f99827d816
> Author: George Kennedy <george.kennedy@oracle.com>
> Date:   Tue Jul 7 19:26:03 2020 +0000
>
>     fbmem: add margin check to fb_check_caps()
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1149f30f500000
> start commit:   22fbc037 Merge tag 'for-linus' of git://git.kernel.org/pub..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4e672827d2ffab1f
> dashboard link: https://syzkaller.appspot.com/bug?extid=dfd0b1c6705301cc4847
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ba9a5d900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17cfd4af900000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: fbmem: add margin check to fb_check_caps()
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz fix: fbmem: add margin check to fb_check_caps()
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
