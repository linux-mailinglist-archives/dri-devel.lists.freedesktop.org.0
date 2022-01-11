Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D135348B06C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 16:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109CE10E632;
	Tue, 11 Jan 2022 15:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626F610E575;
 Tue, 11 Jan 2022 15:08:23 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id x193so614007oix.0;
 Tue, 11 Jan 2022 07:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zo32VZLxMS3zJXGjj1I1zmEGC+mu6YnSTq3H93JaVfE=;
 b=Heyv3jK4mICHGAg012fN5bLm0U8J43bySG6C7i3qEmYU3W4v4K5T/HU6QotlZPmNtM
 3NjOHZXk6+tEHOBl1/MeNi2wiIYOlY8+nucM+gl8WjsFxunOsfIq070wf08UxVvTomvm
 BnmR8diWkLVSL2wMK8Cx3w0Gu1yo7kFftTON5/pJOOhfShySbIQV6JvlCVnvx3ZgSb4Z
 kj8hmfT2kivsxcL85x9rZVmdR/DmbogPyRa6TrekwHnzj+h7Ev4MgcYQPGV1NXfvIo+I
 bdOTh2/FrCw8k66dyFo6TIZeU8Jdb82+Pr0QVjTVpORBqUb9e9qTdx56DG3RSBHTilh3
 j9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zo32VZLxMS3zJXGjj1I1zmEGC+mu6YnSTq3H93JaVfE=;
 b=4q4EVHeXoC1DHYMZheUCQcbB8zJtQDLK+i19fbZggCEPcjkvhRgrm95LeSNdz+iiLM
 1TmZ7xvXzfC/NepzTZmreHg8wHyaenL2wMC5ShFK+b8scqfveVMKeN3HLkg1NdywkJeW
 HK/XJ0JJSE6FHgqmM6xDGJ5iDB8WEkzg00PpU8YXC3UVHjDHdhgpCyo/HWRcZ0bhjHgR
 n0ntti8bYYEaBCOQlG2zUJXOGUZwodm5nyBzmSM+ck4BlDk47AUSBoTZFFzRNbEvt386
 rx+5RwjPCymVnDK3XLifuzslIUxkS1MwrrNRIOU0lJCdPZnPVL1nqrKNQ6L2BcZ+ikGs
 AuqQ==
X-Gm-Message-State: AOAM531wdmkEGOs+zT7/hTNaVUu7Jq9dJYIWqtAuj1TqY5x4mq1ssP/p
 MkIVEAlGFOCVgMKc+MaT7dUCtyJvgdVRnKZChkpDydpv
X-Google-Smtp-Source: ABdhPJwWtVP4MUZ1ZhbDstAftVZRtLtF9Yj4Z9a9nCZ3XslWL/zrmxNq9Mr+sGuurWu+NDiAulzfV+j3KakpH8XjWCI=
X-Received: by 2002:a05:6808:4c3:: with SMTP id
 a3mr2123816oie.123.1641913702634; 
 Tue, 11 Jan 2022 07:08:22 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz=_hRpQV1V3M-=KmVVEbr1K166qeb-ne64PHk9Sn-ozg@mail.gmail.com>
 <CAHk-=wg9hDde_L3bK9tAfdJ4N=TJJ+SjO3ZDONqH5=bVoy_Mzg@mail.gmail.com>
 <CAKMK7uEag=v-g6ygHPcT-uQJJx+5KOh2ZRzC2QtM-MCjjW67TA@mail.gmail.com>
 <CADnq5_P9n39RQ5+Nm8O=YKXXvXh1CEzwC2fOEzEJuS2zQLUWEw@mail.gmail.com>
 <CAHk-=wgDGcaRxUwRCR6p-rxDVO78Yj4YyM6ZsPRGiT2JOCoQ6A@mail.gmail.com>
 <CADnq5_OYO7kq+9DBnDvbSfpouFvdLB0LPSL6+f1ZPRBsV=qEqA@mail.gmail.com>
 <CAHk-=wiCCRG9Lwzr+Cur=K1V2GJ9ab_ket7EnG4RZhJ8jJM7xQ@mail.gmail.com>
 <CAHk-=wi8b-YKHeNfwyYHMcgR2vJh4xpSZ0qjkv8E8Y9V8Sv2Tg@mail.gmail.com>
 <CAHk-=whnWnB9yjVaqWNKjavSJxDOEbTAPwef=O7qjL8nKZgV6A@mail.gmail.com>
 <CAHk-=whSAYiO_TkKut6XckdQigFj39ft1Kcs2qJe5niHWPGdwg@mail.gmail.com>
In-Reply-To: <CAHk-=whSAYiO_TkKut6XckdQigFj39ft1Kcs2qJe5niHWPGdwg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Jan 2022 10:08:08 -0500
Message-ID: <CADnq5_OZR9Ft=WVVbpM_WUpFZurni4yVxGPpa4nDkhupmod_ag@mail.gmail.com>
Subject: Re: [git pull] drm for 5.17-rc1 (pre-merge window pull)
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 meenakshikumar somasundaram <meenakshikumar.somasundaram@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Koenig,
 Christian" <christian.koenig@amd.com>,
 Mustapha Ghaddar <mustapha.ghaddar@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 10, 2022 at 9:53 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Jan 10, 2022 at 6:44 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I'll double-check to see if a revert fixes it at the top of my tree.
>
> Yup. It reverts cleanly, and the end result builds and works fine, and
> doesn't show the horrendous flickering.
>
> I have done that revert, and will continue the merge window work.
> Somebody else gets to figure out what the actual bug is, but that
> commit was horribly broken on my machine (Sapphire Pulse RX 580 8GB,
> fwiw).

Thanks for tracking this down.  We are investigating the issue.

Alex
