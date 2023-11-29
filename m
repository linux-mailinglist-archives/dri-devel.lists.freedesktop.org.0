Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33037FDFB5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 19:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0202610E337;
	Wed, 29 Nov 2023 18:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF2110E237;
 Wed, 29 Nov 2023 18:52:38 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1fa235f8026so348fac.3; 
 Wed, 29 Nov 2023 10:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701283958; x=1701888758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GKCMdliecR8K3FRKmMsgrRyyz7+kEtWPm4FIJ7dTiTY=;
 b=X6gFAvQAy46oMGwOXsbPV2+o20Qcsd1ueGCtBfH6F9ZpAaEuz1MDI7hvc5adme60bR
 +Gw2SbLY2AtT3dZX5T5onU6v0JsBugrVqurkIjw/sMOpRdvji/NpNC8h/LZcSiRKV8J1
 Gth/qkUcNQIfWtFm8iH8srmFDEwUkEN1JSRMADF4TgJJds8/6zXRcqG+jbc2mkFg512+
 EOQBsR5CLw8MKn5pxJN+PNqk4uTk3fZcPKogEBrctWOSgrkFdz5GlD9UzePIctFjaUKb
 BIsKACRi1EnNr4eWOIjJToCcAmzdvp7X+lJRGf9c6A2bBDzSO62rUL0sm9F00yv1ndr+
 M1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701283958; x=1701888758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GKCMdliecR8K3FRKmMsgrRyyz7+kEtWPm4FIJ7dTiTY=;
 b=HH0rPo9GjWQNM0rCPxWtWZ76Q5bI7P6fXRjkqlTdZPbF6NxKeIrc2QM22SUz8/J4Dh
 c8aAgPBdAZpHqseBLTZLKVp449T2pnUzCzZHpANrQC9VcieYsDWx5oDx2Sy1WgcAd7mp
 S1PYp3E4WROJCmoMwASQp+SK+ijwwhMe90naFMymkiwnPFN+mtWhOxEaiDun/ZfKtz85
 ynX7HhCl68JMiIscuTaZ5mkt92EGmvXM08YWiVuTi3pF2jQik5f36D5ZOqIG+IB+Vy0A
 L1GuaNnz2ZJPf8yN05V9zIIistNboL091mK0uKXNUp+6lsVEbMDCRXDHbc+5vi8HG49p
 EhPg==
X-Gm-Message-State: AOJu0YyCEUNHR87Ux/NHTOlFP2YUP3NiKzL39VDRHpHSzW0SZi25ZTw1
 p2j3SDyySSLGEaW6JU7DCNUY/ghIDpvoQydqyLs=
X-Google-Smtp-Source: AGHT+IF3oOywhpirX3+AP8XTM3+9p+TwpPLHbDmBIZTRg15hZZxmdOFhzj4n/rOsFaUbFqEpr1x9fgbgQl7aRBPDypc=
X-Received: by 2002:a05:6870:7a09:b0:1e9:f0fe:6ba4 with SMTP id
 hf9-20020a0568707a0900b001e9f0fe6ba4mr28988964oab.11.1701283957735; Wed, 29
 Nov 2023 10:52:37 -0800 (PST)
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
In-Reply-To: <9595b8bf-e64d-4926-9263-97e18bcd7d05@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 13:52:26 -0500
Message-ID: <CADnq5_N6DF-huOzgaVygvS5N_j_oNUEC1aa4zRsZTzx8GOD_aw@mail.gmail.com>
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

On Wed, Nov 29, 2023 at 11:41=E2=80=AFAM Luben Tuikov <ltuikov89@gmail.com>=
 wrote:
>
> On 2023-11-29 10:22, Alex Deucher wrote:
> > On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> >>
> >> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@gmail=
.com> wrote:
> >>>
> >>> On 2023-11-28 17:13, Alex Deucher wrote:
> >>>> On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesusis=
.net> wrote:
> >>>>>
> >>>>> Alex Deucher <alexdeucher@gmail.com> writes:
> >>>>>
> >>>>>>> In that case those are the already known problems with the schedu=
ler
> >>>>>>> changes, aren't they?
> >>>>>>
> >>>>>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'=
m
> >>>>>> misunderstanding what the original report was actually testing.  I=
f it
> >>>>>> was 6.7, then try reverting:
> >>>>>> 56e449603f0ac580700621a356d35d5716a62ce5
> >>>>>> b70438004a14f4d0f9890b3297cd66248728546c
> >>>>>
> >>>>> At some point it was suggested that I file a gitlab issue, but I to=
ok
> >>>>> this to mean it was already known and being worked on.  -rc3 came o=
ut
> >>>>> today and still has the problem.  Is there a known issue I could tr=
ack?
> >>>>>
> >>>>
> >>>> At this point, unless there are any objections, I think we should ju=
st
> >>>> revert the two patches
> >>> Uhm, no.
> >>>
> >>> Why "the two" patches?
> >>>
> >>> This email, part of this thread,
> >>>
> >>> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> >>>
> >>> clearly states that reverting *only* this commit,
> >>> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable numbe=
r of run-queues
> >>> *does not* mitigate the failed suspend. (Furthermore, this commit doe=
sn't really change
> >>> anything operational, other than using an allocated array, instead of=
 a static one, in DRM,
> >>> while the 2nd patch is solely contained within the amdgpu driver code=
.)
> >>>
> >>> Leaving us with only this change,
> >>> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> >>> to be at fault, as the kernel log attached in the linked email above =
shows.
> >>>
> >>> The conclusion is that only b70438004a14f4 needs reverting.
> >>
> >> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14f4,
> >> 56e449603f0ac5 breaks amdgpu.
> >
> > We can try and re-enable it in the next kernel.  I'm just not sure
> > we'll be able to fix this in time for 6.7 with the holidays and all
> > and I don't want to cause a lot of scheduler churn at the end of the
> > 6.7 cycle if we hold off and try and fix it.  Reverting seems like the
> > best short term solution.
>
> A lot of subsequent code has come in since commit 56e449603f0ac5, as it o=
pened
> the opportunity for a 1-to-1 relationship between an entity and a schedul=
er.
> (Should've always been the case, from the outset. Not sure why it was cod=
ed as
> a fixed-size array.)
>
> Given that commit 56e449603f0ac5 has nothing to do with amdgpu, and the p=
roblem
> is wholly contained in amdgpu, and no other driver has this problem, ther=
e is
> no reason to have to "churn", i.e. go back and forth in DRM, only to cove=
r up
> an init bug in amdgpu. See the response I just sent in @this thread:
> https://lore.kernel.org/r/05007cb0-871e-4dc7-af58-1351f4ba43e2@gmail.com
>
> And it's not like this issue is unknown. I first posted about it on 2023-=
10-16.
>
> Ideally, amdgpu would just fix their init code.

You can't make changes to core code that break other drivers.
Arguably 56e449603f0ac5 should not have gone in in the first place if
it broke amdgpu.  b70438004a14f4 was the code to fix amdgpu's init
code, but as a side effect it seems to have broken suspend for some
users.

Alex
