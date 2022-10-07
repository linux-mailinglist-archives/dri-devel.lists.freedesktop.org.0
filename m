Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481155F72EA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 04:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239DB10E6E7;
	Fri,  7 Oct 2022 02:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6067F10E6E7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 02:54:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id b2so8517384eja.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 19:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BJ07pRcl3Avz2E4m50XKKiT+ukopIQlySSEUmmOfEU=;
 b=ptsM2nV2M4uID1Lfj6HLPex4AKPvzirzSvIvIuKf+nyli2tnYh+udB9FoNMOv1etVN
 v8kor8R4nK3otQMxVyo8+jKzZQsE/ifap27c0dineLz4InDu1SBWKrDU5EuFQLxViQjt
 2Aylh3V2doU6WkCzn2D/lzqCuoe0EBLg3CE3zniPxSSSOLAK/ntE/NKF/KXwQSuRTBGB
 6BTkN12wO7t4J4Mra/7JX+hSnILW6al1e8yvNY9Wr/YURacTdG/qk58mKt49xuGrMMpY
 6aU+sjMxBbaM+nJOFg/Duvk5UuY+igj92zdWjtV39KptlF8SFSIpffLJpUAgGR2H9TMd
 eXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BJ07pRcl3Avz2E4m50XKKiT+ukopIQlySSEUmmOfEU=;
 b=mvnOiIcEtBZ51OmwR21J0YXa6KBxYF5ad+Tgi0All9QXyd5fb7SY8HArgmcPPVQS0g
 BJc9fAI1EH5nNQkJAYbly6IAMz6RBbprb8u+bPT79SI4Vv0AOCytTs/gv8cy0rliG6Xm
 xBVArxLPpTvXDkE9Hc84IO8Kivh67D2oBMQsNNvU8MXl4JrXok7LMx2X6aAeKZzs/Hmp
 a4MIG4PzMcC8F8JvOAc5fc8bCgKHGhIMFvaTJ6cfNj68UVqMKn8h66c4iGliizx5Y8eM
 g9xM3on4ELTKtARd6vREuDbEPqtcXhVKqtxCGfYWaK+dy5EOJ9jRbJRo2vOoekK9rYIk
 4X6Q==
X-Gm-Message-State: ACrzQf2hdEI3SrMhBYMljJVtFjtI1IH+9Hfhh3+1h+8sGL2X0Isf39yP
 28QlqatX07u8IAojoiLKVQ/OuZfkL8v6U7Pm0ME=
X-Google-Smtp-Source: AMsMyM7ZbtDGIl/pclBrS5W0uk2udidiYGccQscUBEzV8uZ78TM3vPDLITx95+JkHn4fc1iTqX2fczwY0EXHgbIkm94=
X-Received: by 2002:a17:906:eec7:b0:733:189f:b07a with SMTP id
 wu7-20020a170906eec700b00733189fb07amr2400505ejb.230.1665111254605; Thu, 06
 Oct 2022 19:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
 <CADnq5_Of-8ZyBxee0fZ=0x-eV-2NX_+e9sd-9nmuHdLugSHp2g@mail.gmail.com>
 <CAHk-=wi43xD06UgO2McDT3R=ze_aHgOGjcDOoggSwmQRv2kA+A@mail.gmail.com>
 <CADnq5_N0Ef+1VUoDLdpHfJXqZFuPYbx5Lq+94NWciHcQC+VrMg@mail.gmail.com>
 <CAPM=9tyAOnzwXyyPuoceZ1mimAkzxR-63YmKfVtcQX=swywNvg@mail.gmail.com>
 <CAHk-=wgghR4N-4XWjoK18NDkvjBL7i00ab8+otQg955pNGG_dQ@mail.gmail.com>
 <CAPM=9txE+0EH2Tv_0toDD52j0JO7iDZoJap6qmvMAnRaDRwJNg@mail.gmail.com>
In-Reply-To: <CAPM=9txE+0EH2Tv_0toDD52j0JO7iDZoJap6qmvMAnRaDRwJNg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Oct 2022 12:54:02 +1000
Message-ID: <CAPM=9tyjMUxAQnJJBVnXXc0tQTjywiK8PLxbJ_Jz4T_pcEospA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Arvind.Yadav@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 Oct 2022 at 12:45, Dave Airlie <airlied@gmail.com> wrote:
>
> On Fri, 7 Oct 2022 at 09:45, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Thu, Oct 6, 2022 at 1:25 PM Dave Airlie <airlied@gmail.com> wrote:
> > >
> > >
> > > [ 1234.778760] BUG: kernel NULL pointer dereference, address: 0000000=
000000088
> > > [ 1234.778813] RIP: 0010:drm_sched_job_done.isra.0+0xc/0x140 [gpu_sch=
ed]
> >
> > As far as I can tell, that's the line
> >
> >         struct drm_gpu_scheduler *sched =3D s_fence->sched;
> >
> > where 's_fence' is NULL. The code is
> >
> >    0: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
> >    5: 41 54                push   %r12
> >    7: 55                    push   %rbp
> >    8: 53                    push   %rbx
> >    9: 48 89 fb              mov    %rdi,%rbx
> >    c:* 48 8b af 88 00 00 00 mov    0x88(%rdi),%rbp <-- trapping instruc=
tion
> >   13: f0 ff 8d f0 00 00 00 lock decl 0xf0(%rbp)
> >   1a: 48 8b 85 80 01 00 00 mov    0x180(%rbp),%rax
> >
> > and that next 'lock decl' instruction would have been the
> >
> >         atomic_dec(&sched->hw_rq_count);
> >
> > at the top of drm_sched_job_done().
> >
> > Now, as to *why* you'd have a NULL s_fence, it would seem that
> > drm_sched_job_cleanup() was called with an active job. Looking at that
> > code, it does
> >
> >         if (kref_read(&job->s_fence->finished.refcount)) {
> >                 /* drm_sched_job_arm() has been called */
> >                 dma_fence_put(&job->s_fence->finished);
> >         ...
> >
> > but then it does
> >
> >         job->s_fence =3D NULL;
> >
> > anyway, despite the job still being active. The logic of that kind of
> > "fake refcount" escapes me. The above looks fundamentally racy, not to
> > say pointless and wrong (a refcount is a _count_, not a flag, so there
> > could be multiple references to it, what says that you can just
> > decrement one of them and say "I'm done").
> >
> > Now, _why_ any of that happens, I have no idea. I'm just looking at
> > the immediate "that pointer is NULL" thing, and reacting to what looks
> > like a completely bogus refcount pattern.
> >
> > But that odd refcount pattern isn't new, so it's presumably some user
> > on the amd gpu side that changed.
> >
> > The problem hasn't happened again for me, but that's not saying a lot,
> > since it was very random to begin with.
>
> I chased down the culprit to a drm sched patch, I'll send you a pull
> with a revert in it.
>
> commit e4dc45b1848bc6bcac31eb1b4ccdd7f6718b3c86
> Author: Arvind Yadav <Arvind.Yadav@amd.com>
> Date:   Wed Sep 14 22:13:20 2022 +0530
>
>     drm/sched: Use parent fence instead of finished
>
>     Using the parent fence instead of the finished fence
>     to get the job status. This change is to avoid GPU
>     scheduler timeout error which can cause GPU reset.
>
>     Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>     Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20220914164321.21=
56-6-Arvind.Yadav@amd.com
>     Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> I'll let Arvind and Christian maybe work out what is going wrong there.

I do spy two changes queued for -next that might be relevant, so I
might try just pulling those instead.

I'll send a PR in next hour once I test it.

Dave.
