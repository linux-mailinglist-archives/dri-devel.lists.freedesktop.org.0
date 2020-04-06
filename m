Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD14219F5F4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 14:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5552189B9F;
	Mon,  6 Apr 2020 12:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F04B89B9F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 12:41:32 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id a6so15091710otb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 05:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sr72t4r7lxhc/Q3B1vivttix8afMzynpg5rTdMjQSoY=;
 b=entol2rHnqykEsDN6YkZxSuwSctDqAnKsid7hRR+PoqC5lMipLmtfJhXeba6wjsCWm
 rfaehblGx+Me4JYjbyW4WDcJeNAIw072KujfJUYa5Ld5UR+7o3ji9LNAJu4QZHm7mDfm
 U9KG1jjMrh/5skPTpZMtN9W1LtYTC7V9W6cd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sr72t4r7lxhc/Q3B1vivttix8afMzynpg5rTdMjQSoY=;
 b=Jm4s/9sv5uExLj11hFJq7FxyxXz+oPoCIBWURYOS3KI3tF+RwbC2vKfbY3D/395tu8
 G793nYWNRA5TKAnSoC9juv1+zIM6MCGK2LvS32pk+i9dHsfnQGKAokpPrWV5wI4k5UMS
 xid3j/ywLEtjloDi0ZG6rw2wzaWMv90rF1v0XfLPVgT3o+SZjf3Y2Gvn3/sG9MIQdRwK
 SZ3/qGjj3CQxM9JNbQgP/ylWFPrgEUbKr6ZiSLIIKF4pdhDuTSiYyv++65EQDnXO6nHy
 iDRcAFKFUvSHYZqrw+RbPOgDvz6l3RbMwnTeAazfWolCJhKTGdC3YXMHmKkUaa2RZ/bo
 Y9CA==
X-Gm-Message-State: AGi0PualgX4XBprSAbsGIq1P/xtS6RTFMjMrAd0ljgBtAu+aWZ1HbcRr
 uORcaztSxq2TBFlCsdo9dkN700EWlHxfHGFpHEGuag==
X-Google-Smtp-Source: APiQypJhwSTomdaZtFjbOnK4dQzBkSIMoNjO/uvTMoS9iCK7mUxexLxDXb1kSUc2EnvnB9OZEl1Z8vmKzFMuNZf8nBs=
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr18136881otr.188.1586176891766; 
 Mon, 06 Apr 2020 05:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000091056b05a2999f1e@google.com>
 <CACT4Y+b4RcgG_GrcpaghmqhX47zUVsAcGGd6vb6MYJT=6gf89g@mail.gmail.com>
 <20200406080612.v5ubxvyliuso6v5h@sirius.home.kraxel.org>
In-Reply-To: <20200406080612.v5ubxvyliuso6v5h@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 6 Apr 2020 14:41:20 +0200
Message-ID: <CAKMK7uE9uQ_YCXfDOH9zQBu_ffoz546hqRd1R_r1+L-T072Lew@mail.gmail.com>
Subject: Re: upstream boot error: KASAN: slab-out-of-bounds Write in
 virtio_gpu_object_create
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>,
 syzbot <syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 6, 2020 at 10:06 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Apr 06, 2020 at 09:07:44AM +0200, Dmitry Vyukov wrote:
> > On Mon, Apr 6, 2020 at 8:46 AM syzbot
> > <syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    ffc1c20c Merge tag 'for-5.7/dm-changes' of git://git.kerne..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=1690471fe00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=d6a1e2f9a9986236
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=d3a7951ed361037407db
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > >
> > > Unfortunately, I don't have any reproducer for this crash yet.
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com
> >
> >
> > +drivers/gpu/drm/virtio/virtgpu_object.c maintainers
> > Now we have both mainline and linux-next boot broken (linux-next is
> > broken for the past 40 days).
> > No testing of new code happens.
> >
> > >  virtio_gpu_object_shmem_init drivers/gpu/drm/virtio/virtgpu_object.c:151 [inline]
> > >  virtio_gpu_object_create+0x9f3/0xaa0 drivers/gpu/drm/virtio/virtgpu_object.c:230
>
> Ah, that one.
>
> broken patch: f651c8b05542 ("drm/virtio: factor out the sg_table from virtio_gpu_object")
> fixed by: 0666a8d7f6a4 ("drm/virtio: fix OOB in virtio_gpu_object_create")
>
> Both are in drm-misc-next.  I suspect the fix was added after
> drm-misc-next was closed for the 5.7 merge window and thus should
> have been submitted to drm-misc-next-fixes instead.
>
> So, what to do now?  Should I cherry-pick 0666a8d7f6a4 into
> drm-misc-next-fixes?  Or should it go into drm-misc-fixes instead?

Yup cherry-pick it over, with -x, to drm-misc-next-fixes.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
