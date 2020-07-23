Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4A922B093
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 15:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007526E087;
	Thu, 23 Jul 2020 13:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCE86E087
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 13:34:53 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p14so4616279wmg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zZ5AbTmRi6SKRjj5jh6jgspAZ8rlBVrCJiQnAL/REKc=;
 b=d8jN0+bLE7DW9ROZe/xGQcyl45MyiLs5bAqePU0cxQUpbV5sUx2Exr4doXTWBj9NRF
 dZCrzZeLTWa/xhrb+UlwSMK5QAZiZBuWhAFH24H9nMac+YuXHlbsamRL5vsjx4Q4yaM8
 ZNGkXapNAu/PAiOCK1mxAlX2uuXKK3QD1MrB5vUWdHB8KG2Qg6g9aaA0yD+kpwa3WrkI
 eqYJZR8/oep/KXvVumH+Uufjky+VnIoVjiJRKflGkhbtva/JryX6rhvx5zaNpzkzWqzp
 YiN0inWSvVsG2nHAD1DEbylUI5hzHq+0H/ekg7sKQ4xE9wBqMiegGgHpL8M5tFhTT/9y
 H8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zZ5AbTmRi6SKRjj5jh6jgspAZ8rlBVrCJiQnAL/REKc=;
 b=jeAtsEzm3w3Sx3CNbAZs1XVYDWJcUL9q8MpO4BbrJaP+oHWHUQHlJR1+vZ+bqn2Jd+
 sSlEnpVvPLsUj1tF6R601jysrRWqJMqzi5BhQN+XgdNzqGI+DqG+rFRZLR9Tp/jUADtO
 pynDYgyuCc4h/tQCVpeEmUFChmK1EoCGEeqYyyDF5VbCsv47fPpJ2AhFgIMgAHt9Spds
 uiPvB6NPVtHFPPyctiJ9vi5OhyQrR21wwl5zYx1U5mN7N5QMIKa7za6v8u4l3Vo6pKbT
 soVWQRIB0x+MdsPROUV3ZRkxYBD74vod5DHDjYtEKy/xRk2gyZ4Ro40eRtdKdG5sjApo
 F/+A==
X-Gm-Message-State: AOAM530R4CBgpKsUN3Ww91umsUhdgBGKYrKNPQSsor2WZ59uwhyFLsrr
 c93E81+3/WyIJ9vdMFgeyphVQfrye0/k5B7DIcQ=
X-Google-Smtp-Source: ABdhPJxSQ5Rc5LXMXXqQgZOhc78GrmT88M9AV/Oyw196T+QQbWFOWsH3ZrYwCKGRHKbR9w2pZwrVj1aRey4/YgZ/fqo=
X-Received: by 2002:a1c:2:: with SMTP id 2mr4266406wma.79.1595511291877; Thu,
 23 Jul 2020 06:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200722143417.42b52c73@canb.auug.org.au>
 <CAKMK7uGZ4qdtkD6r_RzRUiEXrumkdAwENuKfKmfsuscQZtkWqA@mail.gmail.com>
In-Reply-To: <CAKMK7uGZ4qdtkD6r_RzRUiEXrumkdAwENuKfKmfsuscQZtkWqA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Jul 2020 09:34:40 -0400
Message-ID: <CADnq5_PFfVONDAQLYLpkOzL5yxdA-0zisN7xdEt6pJmP6ZfQaA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with Linus' tree
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Dave Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 4:01 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jul 22, 2020 at 6:34 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > [I can't find a previous email about this, sorry ...]
> >
> > There is a semantic conflict between Linus' tree and the amdgpu tree
> > between commit
> >
> >   d7a6634a4cfb ("drm/amdgpu/atomfirmware: fix vram_info fetching for renoir")
> >
> > from Linus' tree and commts
> >
> >   fe098a5d6443 ("drm/amdgpu/atomfirmware: fix vram_info fetching for renoir")
> >   836dab851903 ("drm/amdgpu/atomfirmware: update vram info handling for renoir")
> >
> > The automted git merge leaves two "case 12" labels.  I have been
> > reverting commit d7a6634a4cfb since July 3 ... This will need to be
> > fixed up when the amdgpu tree is next merged into the drm tree, or a back
> > merge of d7a6634a4cfb could be done into the amdgpu tree and the older
> > "case 12" label removed in that merge.
>
> Yeah this is a bit nasty, I just crashed over it too (btw moved to
> drm-next now). Alex is this the right conflict resolution for -next? I
> think we should bake this in with a backmerge ...

Yes, you can drop either d7a6634a4cfb or fe098a5d6443.  I just
cherry-picked the commit from -next back to 5.8 and stable since it
was a bug fix.

Alex

> -Daniel
>
> >
> > --
> > Cheers,
> > Stephen Rothwell
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
