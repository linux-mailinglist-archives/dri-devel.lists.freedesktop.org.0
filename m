Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A00539FF7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B611910E1D3;
	Wed,  1 Jun 2022 08:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351B410E092
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:59:25 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id f34so1736210ybj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=niJHAkU1vNEQQEduQzg9ScF8FBt/3ulFhyJs7r+jqTY=;
 b=g8eQgKFfHy0B6R9nViTKdPwZIDIT+BKAlJYiA7Ja8rkZ+Gb1nECntmVAydwARHkU9z
 X/EzrCVdIWAVdsKP4xZiriO8Fn9pwHh1OvK62LEsjHPQrjtU5Rbc75pVHDUYlx5shddW
 vzUobMtc0MCiS0AeHjy5pROK3mJxtupXzbK8GAtEKgEtX1B62PoX21z2ld9t6POFcKNX
 coFQKwUW/O1uFUb/Mn70z6xNndKoZMuRFPUhsjw+iN6UwyOEZb1WvVFNj25FdTn9foHC
 WbVlF8vHK+FlLAKUnXJPfx3CRNdTkFZirzpl0ijovnJ3FPCoforZAt46afxyeFU41FcN
 WDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=niJHAkU1vNEQQEduQzg9ScF8FBt/3ulFhyJs7r+jqTY=;
 b=q6YAGbCULAIAvS5OSWIwwpq24kwqMuHrfhNnh5AaFsP9vuhOjR+/tlz5uiJbQDR/Jb
 evhAE5m/sMV2NO7oI7FL9BkO5CPs1zZnmV+o7LlHDjxX2ac3oGIQ9RIc4/GvmSExvatr
 c2b2KzXS4f/x+w0NTyxEvpk3v09vsQ4QEXHhWIjZYoeL79SY8swAADX+6XB9g+TvEffs
 U1as1THWcQEE1YrsguFsy0Ys4/p/uWmssXs/l2x58+uqlk/fkJ7FkBumk+8JjYYzpqSG
 Jvj1L6m9qGg86M4tQCm61TNH3OuPTEJqxyJS30UuFzfzJ3sB+1tEhmPR0Mi4nk/aeZIV
 GizQ==
X-Gm-Message-State: AOAM530LDH9JztJpj4sGyMuwG2nzX2AxppBeRlxijSWsXKiWPR27As56
 2OxmMHa7MHqNrSVxnrGysXyE8UpTao9QJjwTfJtfTg==
X-Google-Smtp-Source: ABdhPJz8tB6d4Fa7GYLH2czZiXFhCnuw6JM66CBC2g0uT/EP0IegfzR1pQHThOQbziFJABimx/Z83KvyB6+97BWpymI=
X-Received: by 2002:a25:d044:0:b0:65c:b987:d884 with SMTP id
 h65-20020a25d044000000b0065cb987d884mr17729926ybg.399.1654073964390; Wed, 01
 Jun 2022 01:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
 <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
 <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
 <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
In-Reply-To: <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 1 Jun 2022 10:59:13 +0200
Message-ID: <CAP+8YyFcCdtJhjbBoh0dZUqivYtaCD-p7vypYM_KGe6Gx6BvYw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="000000000000147d4405e05f1b94"
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000147d4405e05f1b94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 1, 2022, 10:48 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
wrote:

> On Wed, Jun 1, 2022 at 10:40 AM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 01.06.22 um 10:16 schrieb Bas Nieuwenhuizen:
> > > On Wed, Jun 1, 2022 at 10:03 AM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > >> Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
> > >>> This should be okay because moves themselves use KERNEL usage and
> > >>> hence still sync with BOOKKEEP usage. Then any later submits still
> > >>> wait on any pending VM operations.
> > >>>
> > >>> (i.e. we only made VM ops not wait on BOOKKEEP submits, not the oth=
er
> > >>>    way around)
> > >> Well NAK again. This allows access to freed up memory and is a
> complete
> > >> no-go.
> > > How does this allow access to freed memory? Worst I can see is that
> > > the unmap happens earlier if the app/drivers gets the waits wrong,
> > > which wouldn't give access after the underlying BO is freed?
> >
> > To free up memory we need to update the PTEs and then flush those out b=
y
> > invalidating the TLB.
> >
> > On gfx6, gfx7 and gfx8 and some broken gfx10 hw invalidating the TLB ca=
n
> > only be done while the VMID is idle.
> >
> > Only gfx9 can reliable invalidate the TLB while it is in use and even
> > there it comes with quite some performance penalty (at TLB invalidation
> > can take multiple seconds).
> >
> > Because of this what we do in the kernel driver is to sync to everythin=
g
> > when we unmap entries:
> >
> >          if (!(flags & AMDGPU_PTE_VALID))
> >                  sync_mode =3D AMDGPU_SYNC_EQ_OWNER;
> >          else
> >                  sync_mode =3D AMDGPU_SYNC_EXPLICIT;
> >
> > This acts as a barrier for freeing the memory. In other words we
> > intentionally add a bubble which syncs everything.
> >
> > I'm working for month on a concept how to do all this without causing
> > the stalls you observer, but so far didn't came to much of a conclusion=
.
>
> That might cause an unmap operation too early, but for freeing up the
> actual backing memory we still wait for all fences on the BO to finish
> first, no? In that case, since BOOKKEEP fences are still added for
> explicit sync, that should not be a problem, no?
>
> (If not, that sounds like the obvious fix for making this work?)
>

As an aside this is the same hole/issue as when an app forgets a bo in the
bo list on submission.

> >
> > Regards,
> > Christian.
> >
> > >
> > >> Regards,
> > >> Christian.
> > >>
> > >>> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > >>> ---
> > >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  | 2 +-
> > >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 2 +-
> > >>>    2 files changed, 2 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> > >>> index f10332e1c6c0..31bc73fd1fae 100644
> > >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> > >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> > >>> @@ -51,7 +51,7 @@ static int amdgpu_vm_cpu_prepare(struct
> amdgpu_vm_update_params *p,
> > >>>        if (!resv)
> > >>>                return 0;
> > >>>
> > >>> -     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode,
> sync_mode, p->vm, true);
> > >>> +     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode,
> AMDGPU_SYNC_EXPLICIT, p->vm, true);
> > >>>    }
> > >>>
> > >>>    /**
> > >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> > >>> index 63b484dc76c5..c8d5898bea11 100644
> > >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> > >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> > >>> @@ -75,7 +75,7 @@ static int amdgpu_vm_sdma_prepare(struct
> amdgpu_vm_update_params *p,
> > >>>        if (!resv)
> > >>>                return 0;
> > >>>
> > >>> -     return amdgpu_sync_resv(p->adev, &p->job->sync, resv,
> sync_mode, sync_mode, p->vm);
> > >>> +     return amdgpu_sync_resv(p->adev, &p->job->sync, resv,
> sync_mode, AMDGPU_SYNC_EXPLICIT, p->vm);
> > >>>    }
> > >>>
> > >>>    /**
> >
>

--000000000000147d4405e05f1b94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jun 1, 2022, 10:48 Bas Nieuwenhuizen &lt;<a hr=
ef=3D"mailto:bas@basnieuwenhuizen.nl">bas@basnieuwenhuizen.nl</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Wed, Jun 1, 2022 at 10:40 AM C=
hristian K=C3=B6nig<br>
&lt;<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blank" rel=3D"no=
referrer">christian.koenig@amd.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Am 01.06.22 um 10:16 schrieb Bas Nieuwenhuizen:<br>
&gt; &gt; On Wed, Jun 1, 2022 at 10:03 AM Christian K=C3=B6nig<br>
&gt; &gt; &lt;<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blank"=
 rel=3D"noreferrer">christian.koenig@amd.com</a>&gt; wrote:<br>
&gt; &gt;&gt; Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:<br>
&gt; &gt;&gt;&gt; This should be okay because moves themselves use KERNEL u=
sage and<br>
&gt; &gt;&gt;&gt; hence still sync with BOOKKEEP usage. Then any later subm=
its still<br>
&gt; &gt;&gt;&gt; wait on any pending VM operations.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; (i.e. we only made VM ops not wait on BOOKKEEP submits, n=
ot the other<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 way around)<br>
&gt; &gt;&gt; Well NAK again. This allows access to freed up memory and is =
a complete<br>
&gt; &gt;&gt; no-go.<br>
&gt; &gt; How does this allow access to freed memory? Worst I can see is th=
at<br>
&gt; &gt; the unmap happens earlier if the app/drivers gets the waits wrong=
,<br>
&gt; &gt; which wouldn&#39;t give access after the underlying BO is freed?<=
br>
&gt;<br>
&gt; To free up memory we need to update the PTEs and then flush those out =
by<br>
&gt; invalidating the TLB.<br>
&gt;<br>
&gt; On gfx6, gfx7 and gfx8 and some broken gfx10 hw invalidating the TLB c=
an<br>
&gt; only be done while the VMID is idle.<br>
&gt;<br>
&gt; Only gfx9 can reliable invalidate the TLB while it is in use and even<=
br>
&gt; there it comes with quite some performance penalty (at TLB invalidatio=
n<br>
&gt; can take multiple seconds).<br>
&gt;<br>
&gt; Because of this what we do in the kernel driver is to sync to everythi=
ng<br>
&gt; when we unmap entries:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(flags &amp; AMDGPU_PTE_VALID))=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sync_mod=
e =3D AMDGPU_SYNC_EQ_OWNER;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sync_mod=
e =3D AMDGPU_SYNC_EXPLICIT;<br>
&gt;<br>
&gt; This acts as a barrier for freeing the memory. In other words we<br>
&gt; intentionally add a bubble which syncs everything.<br>
&gt;<br>
&gt; I&#39;m working for month on a concept how to do all this without caus=
ing<br>
&gt; the stalls you observer, but so far didn&#39;t came to much of a concl=
usion.<br>
<br>
That might cause an unmap operation too early, but for freeing up the<br>
actual backing memory we still wait for all fences on the BO to finish<br>
first, no? In that case, since BOOKKEEP fences are still added for<br>
explicit sync, that should not be a problem, no?<br>
<br>
(If not, that sounds like the obvious fix for making this work?)<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">As an aside=
 this is the same hole/issue as when an app forgets a bo in the bo list on =
submission.</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
&gt;<br>
&gt; Regards,<br>
&gt; Christian.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; Regards,<br>
&gt; &gt;&gt; Christian.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Bas Nieuwenhuizen &lt;<a href=3D"mailto:ba=
s@basnieuwenhuizen.nl" target=3D"_blank" rel=3D"noreferrer">bas@basnieuwenh=
uizen.nl</a>&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c=
=C2=A0 | 2 +-<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c =
| 2 +-<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 2 insertions(+), 2 deletion=
s(-)<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b=
/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c<br>
&gt; &gt;&gt;&gt; index f10332e1c6c0..31bc73fd1fae 100644<br>
&gt; &gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c<br>
&gt; &gt;&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c<br>
&gt; &gt;&gt;&gt; @@ -51,7 +51,7 @@ static int amdgpu_vm_cpu_prepare(struct=
 amdgpu_vm_update_params *p,<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!resv)<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re=
turn 0;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0return amdgpu_bo_sync_wait_resv(p-&g=
t;adev, resv, sync_mode, sync_mode, p-&gt;vm, true);<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return amdgpu_bo_sync_wait_resv(p-&g=
t;adev, resv, sync_mode, AMDGPU_SYNC_EXPLICIT, p-&gt;vm, true);<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 /**<br>
&gt; &gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c<br>
&gt; &gt;&gt;&gt; index 63b484dc76c5..c8d5898bea11 100644<br>
&gt; &gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c<br>
&gt; &gt;&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c<br>
&gt; &gt;&gt;&gt; @@ -75,7 +75,7 @@ static int amdgpu_vm_sdma_prepare(struc=
t amdgpu_vm_update_params *p,<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!resv)<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 re=
turn 0;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0return amdgpu_sync_resv(p-&gt;adev, =
&amp;p-&gt;job-&gt;sync, resv, sync_mode, sync_mode, p-&gt;vm);<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return amdgpu_sync_resv(p-&gt;adev, =
&amp;p-&gt;job-&gt;sync, resv, sync_mode, AMDGPU_SYNC_EXPLICIT, p-&gt;vm);<=
br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 /**<br>
&gt;<br>
</blockquote></div></div></div>

--000000000000147d4405e05f1b94--
