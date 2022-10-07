Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD9F5F72DD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 04:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1A210E6D0;
	Fri,  7 Oct 2022 02:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3554510E6D0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 02:45:46 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id o21so8417686ejm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 19:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ivyaq7Zdbnsd0LwI0QA38s0k4M1IqIXnuitGACfqB9k=;
 b=bzFrq8wdea7xDwYZs0RAQ24bbRSX8VcLP9T5BKZxhrCx3Uz9b8LaQn/kiACgUxsGJO
 OXaNDtefBFsWuashZDwx6B8Pr0Pz5MM1LsbM/Z9WnEBA/5YV9404CT6lf8QWh6rBSse4
 Gq2a1Ga/98MxfJMP7VOkdth94yFqwq4AlLOg9LgaK5QSBghQ/nNPyTRxmsL2ZaFN6PDB
 GvqSgzqZPl+oeRmYWJYKqa/Gd216GWXdMRyTDGG9SJpNROFqQiLB/VCM2RELnwPw3sbG
 2P3THmEsvMnfHbTVNj3Npm8KVDUtfyxIvqRlTlbkY7Kvg0J2ztYhKgYoNCesoc2zSHQK
 +orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ivyaq7Zdbnsd0LwI0QA38s0k4M1IqIXnuitGACfqB9k=;
 b=PcHNgMGU/fTVVPRu66I5fN704qr4yUGeLSTgW86VbAgLoA/j+TTKL4XOdQyP287A7r
 G487KGNIZkBKUZz5d3aPAXDkhtPqJYJXnwPBGwz+UZcROkDQLr9466cOZgAvE54RUnik
 PsVe6xDGt2E7y7KTfGrRGYND5PkNLiS6p3LSp1ntzqj32zMLbNLsGnZ72vKuex1nLemE
 aJbykK41vgU867dgVkPdaaJ2nliH4FDR1MpQmkiaxmbin5+/jBeDEN2aGWAeGA+SN93W
 SekAmGhNOMRA0clV8dw4VUL3LfugL4oSTBS+gVV+2gVOhc7TfHaOfv6PoDcy0v8tjXuh
 Zddw==
X-Gm-Message-State: ACrzQf1swRGTzdzux6fBSeqkhblUmbT5mA7ykHativBolTClH25ZrxEr
 DH6Ua/oTeql1jtgjuTx7KD2qbSFV+YlBsXIw9JUFlaE7DrE=
X-Google-Smtp-Source: AMsMyM6ZGfHXX4tnm3sbFfUmH7+FXiBdS4uSaaCbjic61nBpTDo17A/Czhtq0ORlyQ0XNdPGduA6taEF1aLeNVapW2U=
X-Received: by 2002:a17:906:eec7:b0:733:189f:b07a with SMTP id
 wu7-20020a170906eec700b00733189fb07amr2382947ejb.230.1665110744602; Thu, 06
 Oct 2022 19:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
 <CADnq5_Of-8ZyBxee0fZ=0x-eV-2NX_+e9sd-9nmuHdLugSHp2g@mail.gmail.com>
 <CAHk-=wi43xD06UgO2McDT3R=ze_aHgOGjcDOoggSwmQRv2kA+A@mail.gmail.com>
 <CADnq5_N0Ef+1VUoDLdpHfJXqZFuPYbx5Lq+94NWciHcQC+VrMg@mail.gmail.com>
 <CAPM=9tyAOnzwXyyPuoceZ1mimAkzxR-63YmKfVtcQX=swywNvg@mail.gmail.com>
 <CAHk-=wgghR4N-4XWjoK18NDkvjBL7i00ab8+otQg955pNGG_dQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgghR4N-4XWjoK18NDkvjBL7i00ab8+otQg955pNGG_dQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Oct 2022 12:45:32 +1000
Message-ID: <CAPM=9txE+0EH2Tv_0toDD52j0JO7iDZoJap6qmvMAnRaDRwJNg@mail.gmail.com>
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

On Fri, 7 Oct 2022 at 09:45, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Oct 6, 2022 at 1:25 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> >
> > [ 1234.778760] BUG: kernel NULL pointer dereference, address: 000000000=
0000088
> > [ 1234.778813] RIP: 0010:drm_sched_job_done.isra.0+0xc/0x140 [gpu_sched=
]
>
> As far as I can tell, that's the line
>
>         struct drm_gpu_scheduler *sched =3D s_fence->sched;
>
> where 's_fence' is NULL. The code is
>
>    0: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
>    5: 41 54                push   %r12
>    7: 55                    push   %rbp
>    8: 53                    push   %rbx
>    9: 48 89 fb              mov    %rdi,%rbx
>    c:* 48 8b af 88 00 00 00 mov    0x88(%rdi),%rbp <-- trapping instructi=
on
>   13: f0 ff 8d f0 00 00 00 lock decl 0xf0(%rbp)
>   1a: 48 8b 85 80 01 00 00 mov    0x180(%rbp),%rax
>
> and that next 'lock decl' instruction would have been the
>
>         atomic_dec(&sched->hw_rq_count);
>
> at the top of drm_sched_job_done().
>
> Now, as to *why* you'd have a NULL s_fence, it would seem that
> drm_sched_job_cleanup() was called with an active job. Looking at that
> code, it does
>
>         if (kref_read(&job->s_fence->finished.refcount)) {
>                 /* drm_sched_job_arm() has been called */
>                 dma_fence_put(&job->s_fence->finished);
>         ...
>
> but then it does
>
>         job->s_fence =3D NULL;
>
> anyway, despite the job still being active. The logic of that kind of
> "fake refcount" escapes me. The above looks fundamentally racy, not to
> say pointless and wrong (a refcount is a _count_, not a flag, so there
> could be multiple references to it, what says that you can just
> decrement one of them and say "I'm done").
>
> Now, _why_ any of that happens, I have no idea. I'm just looking at
> the immediate "that pointer is NULL" thing, and reacting to what looks
> like a completely bogus refcount pattern.
>
> But that odd refcount pattern isn't new, so it's presumably some user
> on the amd gpu side that changed.
>
> The problem hasn't happened again for me, but that's not saying a lot,
> since it was very random to begin with.

I chased down the culprit to a drm sched patch, I'll send you a pull
with a revert in it.

commit e4dc45b1848bc6bcac31eb1b4ccdd7f6718b3c86
Author: Arvind Yadav <Arvind.Yadav@amd.com>
Date:   Wed Sep 14 22:13:20 2022 +0530

    drm/sched: Use parent fence instead of finished

    Using the parent fence instead of the finished fence
    to get the job status. This change is to avoid GPU
    scheduler timeout error which can cause GPU reset.

    Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
    Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20220914164321.2156=
-6-Arvind.Yadav@amd.com
    Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

I'll let Arvind and Christian maybe work out what is going wrong there.

Dave.

>
>                  Linus
