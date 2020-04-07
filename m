Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E21A1C28
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6078C6E961;
	Wed,  8 Apr 2020 06:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0D96E804
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 09:58:06 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y25so2172115qtv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XlRrtk04Drccp1IaTlKa1DPuRVn27tHDYLsET4EpF9I=;
 b=wA6RVWrGZsTvyQtipGlQPkx/zUrMle6j/PotPS/Ubl+1rUlzDuQJHGGTaWn9pBGS94
 16eiWdiG0Uj54QLqStMqvzt0Vrq+V/aGzVTBBEKpa6GoDtAtJ3Nwfa2MD4il9MQsiZu0
 +0YaAJkHWlROCy7YvKoMm3EGWcRaXOX3FgiFrZJ99qtqsJEnvq7c99tBL02yA0kMadQJ
 3gMAPBRwaQi4ggynes7NGTM0NIeFUdLAuw0OMg+zsQaJgY/v9/KSEqpLpWFaBdYbDldX
 JLo5MsaJ9O2qScwUxYoer4R5IylAMN5UZ5C0/vp0fPMln72xoMrG/HMyoY/yznxhyxS6
 iz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XlRrtk04Drccp1IaTlKa1DPuRVn27tHDYLsET4EpF9I=;
 b=oVyDUKNd7n5Auwd5vkHxlci1q0MdzktnFFeoSZkiu14ci6BzSjWut6nRpTleFm7kwQ
 ZMb+u4txzTR73KBkPehgrTDzJBdkdC84mBprjGMasd8TtXyhWX7H4yjV2Owl8j9bZY+2
 1xtqo3+aortiS1Es2Pz1yFha/Nd2gzMU8tzFUxSOu4xmHeTMJ+VsfsiDqskiznADUofb
 mhQkZ552uel5DJ226zAR97FSMd8n1PvulHxx7RfyxafBpSk9Xb9PU0vgLve+T8kwSVUt
 L7Ihi5waDD0DNwpyGuCTtgQ4fXHr0aBwcmMOV/q8HwfcC45sFYtBjQ1wHV6L6DGFZYvE
 oPSQ==
X-Gm-Message-State: AGi0PuZF1Yjq/aUknJGR3Nlg6b9Kli/jSzxGQKD2Gl7ra1O3DBhlZ8Qa
 tkd9CxiyQ2fq+Ecj8l7DBKOHFY9HHBwivb1SUR+O4g==
X-Google-Smtp-Source: APiQypIVkup6lPiinv10OxautZSlD/0H+G8ygJP+Y1zlmhVZq44N0hs/Atb3q7hlgMorG94PI0Jdbec7sG00UJjWQWk=
X-Received: by 2002:ac8:370c:: with SMTP id o12mr1366857qtb.380.1586253485793; 
 Tue, 07 Apr 2020 02:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000091056b05a2999f1e@google.com>
 <CACT4Y+b4RcgG_GrcpaghmqhX47zUVsAcGGd6vb6MYJT=6gf89g@mail.gmail.com>
 <20200406080612.v5ubxvyliuso6v5h@sirius.home.kraxel.org>
 <CAKMK7uE9uQ_YCXfDOH9zQBu_ffoz546hqRd1R_r1+L-T072Lew@mail.gmail.com>
 <20200406131602.ggugjwkm36r4zvkr@sirius.home.kraxel.org>
In-Reply-To: <20200406131602.ggugjwkm36r4zvkr@sirius.home.kraxel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 7 Apr 2020 11:57:54 +0200
Message-ID: <CACT4Y+aF1fNRgq_1a2NnVdy9epQvy5TzRF8VQ8OUSSkh6HAc0g@mail.gmail.com>
Subject: Re: upstream boot error: KASAN: slab-out-of-bounds Write in
 virtio_gpu_object_create
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Approved-At: Wed, 08 Apr 2020 06:59:23 +0000
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
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 6, 2020 at 3:16 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > > +drivers/gpu/drm/virtio/virtgpu_object.c maintainers
> > > > Now we have both mainline and linux-next boot broken (linux-next is
> > > > broken for the past 40 days).
> > > > No testing of new code happens.
> > > >
> > > > >  virtio_gpu_object_shmem_init drivers/gpu/drm/virtio/virtgpu_object.c:151 [inline]
> > > > >  virtio_gpu_object_create+0x9f3/0xaa0 drivers/gpu/drm/virtio/virtgpu_object.c:230
> > >
> > > Ah, that one.
> > >
> > > broken patch: f651c8b05542 ("drm/virtio: factor out the sg_table from virtio_gpu_object")
> > > fixed by: 0666a8d7f6a4 ("drm/virtio: fix OOB in virtio_gpu_object_create")
> > >
> > > Both are in drm-misc-next.  I suspect the fix was added after
> > > drm-misc-next was closed for the 5.7 merge window and thus should
> > > have been submitted to drm-misc-next-fixes instead.
> > >
> > > So, what to do now?  Should I cherry-pick 0666a8d7f6a4 into
> > > drm-misc-next-fixes?  Or should it go into drm-misc-fixes instead?
> >
> > Yup cherry-pick it over, with -x, to drm-misc-next-fixes.
> > -Daniel
>
> Done.  So the next linux-next build should be green again.

Linux-next is boot broken with 2 or 3 other bugs for a month. This
won't fix linux-next.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
