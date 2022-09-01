Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7625A92F2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 11:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD67890BB;
	Thu,  1 Sep 2022 09:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354FC10E665
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 09:16:58 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id r17so1345427uat.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 02:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=0DavK3tZEl9/gW1tvRuU8853rjZL9v3RtTzVrdO9jBs=;
 b=CLwtF0ktF1zQqhWHkRI/Q6SDdY2uwAO14CtmVnuN7Kxp130VgBgOurQXRX7jbw3xy9
 VQYPsqq/zKxzf/2dC1DgRpDhp8dN2wpsYL/wxTTOa6L1+3gMbfFjtHQeq+fwNFDT8JvY
 aBaBTk8sfHj8Z8KjpkLyBVjGI7TUrw4GNPLGA+jYcLxyOsozVgOsarJCSCONa3wc/egL
 oqfrhZxgOOCsVWcPhj1zn87ROHjStDGP2r9tuOcYJWJuaLqCqfVr7/Ulgr0oOSRwqzzE
 ebFGHtiHsZaYjqgYlEdNwYTPHFXvCJhpL6GB9IjQzMJe2Um6n6YpL1PYykqUx3rCczZq
 Crbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=0DavK3tZEl9/gW1tvRuU8853rjZL9v3RtTzVrdO9jBs=;
 b=bPlQwuiJa4StCkyBxMV2ctjisY2obvMsiflDiFXo2q6LqwKMwQxB0Safz2jjULq9EO
 mIUi1hLMhefq+v3hqCdUxg7WI0WuR7bSeyCipCHIt+bYuKIZbz3K9lyj6WCwzF9bi6hg
 zYgxfplu/M0+N32XJuFYwcCNV6PBNcll/Dxh6zbLxZ/Rn8/ET5po5io4HJpmPCaV4TZy
 Iedd0jVG0FwG2+XRBHKoe9Jf0emdfBu9voY6ZkPdLfgQXsCA+jUu+Gw4FTnyJ8rn2gKa
 /lu0K4YyBZ2Ne09IPSIGXy+6tj7zXK/OizCescDZStdBNPqvd/OJ9PuNcmzaGtvzDJ39
 Krww==
X-Gm-Message-State: ACgBeo2nLZP6Tlmt/NP8G6hF/kjI/to9xgEKJyx2CfrxaX46y3AsgBgN
 a6vbo0dFzEULys0AveCugRNsQIxXrtiKJfNHaN2VWw==
X-Google-Smtp-Source: AA6agR4VHP6N0f2EIlgnEiWiCBfG8MZ+FiFFMODbGmcaj/Rm7oimUzkQgxkV0CmdsfvACZ76VkiuzborI4hQ90Pj2YA=
X-Received: by 2002:ab0:70c6:0:b0:39e:ed14:806b with SMTP id
 r6-20020ab070c6000000b0039eed14806bmr8753856ual.82.1662023817019; Thu, 01 Sep
 2022 02:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000043579605e6d0ce41@google.com>
 <87czcscvlf.wl-tiwai@suse.de>
In-Reply-To: <87czcscvlf.wl-tiwai@suse.de>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 1 Sep 2022 11:16:46 +0200
Message-ID: <CANp29Y6cq0+3SBxQLWvtcsmQ-Pw0RqtEKDUSM2JV1R2no3gOsw@mail.gmail.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in udl_get_urb_timeout
To: Takashi Iwai <tiwai@suse.de>
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
Cc: tzimmermann@suse.de, airlied@linux.ie,
 'Aleksandr Nogikh' via syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, sean@poorly.run,
 syzbot <syzbot+f24934fe125a19d77eae@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's tell syzbot about the series

#syz fix: Revert "drm/udl: Kill pending URBs at suspend and disconnect"

On Mon, Aug 22, 2022 at 2:26 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 22 Aug 2022 11:09:31 +0200,
> syzbot wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    5b6a4bf680d6 Add linux-next specific files for 20220818
> > git tree:       linux-next
> > console+strace: https://syzkaller.appspot.com/x/log.txt?x=12341a3d080000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=ead6107a3bbe3c62
> > dashboard link: https://syzkaller.appspot.com/bug?extid=f24934fe125a19d77eae
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12731867080000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=165b64f3080000
> >
> > The issue was bisected to:
> >
> > commit e25d5954264d1871ab2792c7ca2298b811462500
> > Author: Takashi Iwai <tiwai@suse.de>
> > Date:   Thu Aug 4 07:58:25 2022 +0000
> >
> >     drm/udl: Kill pending URBs at suspend and disconnect
>
> FYI, the fix including the revert of this commit was already
> submitted, waiting for review & merge:
>   https://lore.kernel.org/r/20220816153655.27526-1-tiwai@suse.de
>
>
> thanks,
>
> Takashi
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/87czcscvlf.wl-tiwai%40suse.de.
