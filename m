Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5F3801099
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 17:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D829310E8DA;
	Fri,  1 Dec 2023 16:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315EF10E918;
 Fri,  1 Dec 2023 16:55:49 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6ce2ea3a944so459846a34.1; 
 Fri, 01 Dec 2023 08:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701449749; x=1702054549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NWhV56djU95aQfLVNm7Soh/hXtQRCsN2ft0VIHAER8A=;
 b=L65dTN2F1nj40cIfV6PQY1YUJWy2md1OLCCgluXsN18+1HIyyCZ72ds6DyL2ZvS6hm
 Z4bouw/JJ4sqBb44NtvgDSbyhVIKlsjM/z4YQgl7DZrypjg1skUZbVDp+ZUuOdTVBVxa
 ULVIaYTyi2pzXaJiw7CsUmueBR+qVnQH6jqo6WAguxwiW23RARbepi8RRtOX2Mt3RtQX
 3FwBIERa7RN+PW2LEfK5VMA0kTHZAoXOtBZdWG9KmPxtFtLiyUbD0imgFddC/tJzfTIo
 SDoz7J5mwY63QQM+K3xsKh3Mna5dEgPFxSRPGo5AL9JOApOV9n4UWl6EOEMJXcNG34Zr
 ngxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701449749; x=1702054549;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NWhV56djU95aQfLVNm7Soh/hXtQRCsN2ft0VIHAER8A=;
 b=gr4zIfl9ObTQvbWh/i7yL3Q0N792UM1bTqhbxeNRpngtycvXauSPIUgDm0NWUGHaqJ
 rRCDdw5HPNYRXKRuLWOF0IDXro21WLKn0FpvFpldMxxUmBXpxYyNeL37KNYKIZSzBE3V
 td9UNOdjU5lJ1BKWbvhi9XyZlTBC/SMpG40Ef5aXJsBkrDtZTh/dWBHjJPJjBzYEcYdK
 al9o4aJ7CjGhH8sdm1ssR2KC3VrFUtUnbwdDPSYnahE7uDG2Ot2pmS8scmoPzL72t0E+
 nBfq21z7yhXc23d3lZHu3SQA4rE8QHG0HQjrb1McbNyvwFeoZ5N37rnGYF48R4UcEigi
 eT4A==
X-Gm-Message-State: AOJu0YwZiNNd6iukIvch87bX4IZjjWbDxMGDAjAEmHSr35dDPHIyJZEq
 7EIsYiLbrJlwRRMCODFdcy6X3GIBbWiJEhn4FYCzHson
X-Google-Smtp-Source: AGHT+IFcxTbgF9xXKMxzTnObK/CQ9MvvfivvyKXOzVzXQNvJW4i8otQvmBPx8yuN1coi/2TEmdpNoBi0J9sKp8BZ7gk=
X-Received: by 2002:a05:6870:2182:b0:1f9:8f1b:86f7 with SMTP id
 l2-20020a056870218200b001f98f1b86f7mr29208291oae.42.1701449748697; Fri, 01
 Dec 2023 08:55:48 -0800 (PST)
MIME-Version: 1.0
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
 <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
 <CADnq5_NVGS1XykxGxpcu_bpPbzboCUJQkcCF3r+0N9a23KUgiQ@mail.gmail.com>
 <96e2e13c-f01c-4baf-a9a3-cbaa48fb10c7@amd.com>
 <CADnq5_NBfeAXEyQw0gnSd67=tR-bUKg8w=10+4z9pGGuRnP9uw@mail.gmail.com>
 <87jzq2ixtm.fsf@vps.thesusis.net>
 <CADnq5_Ou-MVVm0rdWDmDnJNLkWUayXzO26uCEtz3ucNa4Ghy2w@mail.gmail.com>
 <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
 <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
 <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
 <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
 <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
 <CADnq5_PgMxoW=4iabtgeHydwye-6DvwvCyETdfBToEpuYWocmA@mail.gmail.com>
 <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
In-Reply-To: <CADnq5_P0S7Jem0e4K6mG2+bboG8P56nELaGC1p4Pfx-8eV-BjQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 1 Dec 2023 11:55:36 -0500
Message-ID: <CADnq5_Oy6RMyJ52TbsxVjZ=0p=wYJHduE4X8B3DiYnqHYJUAvw@mail.gmail.com>
Subject: Re: Radeon regression in 6.6 kernel
To: Luben Tuikov <ltuikov89@gmail.com>
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Phillip,

Can you test this patch?  I was not able to repro the issue on the
navi2x card I had handy, but I think it should fix it.

Thanks,

Alex

On Wed, Nov 29, 2023 at 3:49=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Wed, Nov 29, 2023 at 3:10=E2=80=AFPM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > Actually I think I see the problem.  I'll try and send out a patch
> > later today to test.
>
> Does the attached patch fix it?
>
> Alex
>
> >
> > Alex
> >
> > On Wed, Nov 29, 2023 at 1:52=E2=80=AFPM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> > >
> > > On Wed, Nov 29, 2023 at 11:41=E2=80=AFAM Luben Tuikov <ltuikov89@gmai=
l.com> wrote:
> > > >
> > > > On 2023-11-29 10:22, Alex Deucher wrote:
> > > > > On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher=
@gmail.com> wrote:
> > > > >>
> > > > >> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89=
@gmail.com> wrote:
> > > > >>>
> > > > >>> On 2023-11-28 17:13, Alex Deucher wrote:
> > > > >>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@th=
esusis.net> wrote:
> > > > >>>>>
> > > > >>>>> Alex Deucher <alexdeucher@gmail.com> writes:
> > > > >>>>>
> > > > >>>>>>> In that case those are the already known problems with the =
scheduler
> > > > >>>>>>> changes, aren't they?
> > > > >>>>>>
> > > > >>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Ma=
ybe I'm
> > > > >>>>>> misunderstanding what the original report was actually testi=
ng.  If it
> > > > >>>>>> was 6.7, then try reverting:
> > > > >>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
> > > > >>>>>> b70438004a14f4d0f9890b3297cd66248728546c
> > > > >>>>>
> > > > >>>>> At some point it was suggested that I file a gitlab issue, bu=
t I took
> > > > >>>>> this to mean it was already known and being worked on.  -rc3 =
came out
> > > > >>>>> today and still has the problem.  Is there a known issue I co=
uld track?
> > > > >>>>>
> > > > >>>>
> > > > >>>> At this point, unless there are any objections, I think we sho=
uld just
> > > > >>>> revert the two patches
> > > > >>> Uhm, no.
> > > > >>>
> > > > >>> Why "the two" patches?
> > > > >>>
> > > > >>> This email, part of this thread,
> > > > >>>
> > > > >>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> > > > >>>
> > > > >>> clearly states that reverting *only* this commit,
> > > > >>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable=
 number of run-queues
> > > > >>> *does not* mitigate the failed suspend. (Furthermore, this comm=
it doesn't really change
> > > > >>> anything operational, other than using an allocated array, inst=
ead of a static one, in DRM,
> > > > >>> while the 2nd patch is solely contained within the amdgpu drive=
r code.)
> > > > >>>
> > > > >>> Leaving us with only this change,
> > > > >>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> > > > >>> to be at fault, as the kernel log attached in the linked email =
above shows.
> > > > >>>
> > > > >>> The conclusion is that only b70438004a14f4 needs reverting.
> > > > >>
> > > > >> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a=
14f4,
> > > > >> 56e449603f0ac5 breaks amdgpu.
> > > > >
> > > > > We can try and re-enable it in the next kernel.  I'm just not sur=
e
> > > > > we'll be able to fix this in time for 6.7 with the holidays and a=
ll
> > > > > and I don't want to cause a lot of scheduler churn at the end of =
the
> > > > > 6.7 cycle if we hold off and try and fix it.  Reverting seems lik=
e the
> > > > > best short term solution.
> > > >
> > > > A lot of subsequent code has come in since commit 56e449603f0ac5, a=
s it opened
> > > > the opportunity for a 1-to-1 relationship between an entity and a s=
cheduler.
> > > > (Should've always been the case, from the outset. Not sure why it w=
as coded as
> > > > a fixed-size array.)
> > > >
> > > > Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and=
 the problem
> > > > is wholly contained in amdgpu, and no other driver has this problem=
, there is
> > > > no reason to have to "churn", i.e. go back and forth in DRM, only t=
o cover up
> > > > an init bug in amdgpu. See the response I just sent in @this thread=
:
> > > > https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmai=
l.com
> > > >
> > > > And it's not like this issue is unknown. I first posted about it on=
 2023-10-16.
> > > >
> > > > Ideally, amdgpu would just fix their init code.
> > >
> > > You can't make changes to core code that break other drivers.
> > > Arguably 56e449603f0ac5 should not have gone in in the first place if
> > > it broke amdgpu.  b70438004a14f4 was the code to fix amdgpu's init
> > > code, but as a side effect it seems to have broken suspend for some
> > > users.
> > >
> > > Alex
