Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D3F7FDB1C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAD010E4F8;
	Wed, 29 Nov 2023 15:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C8110E4F8;
 Wed, 29 Nov 2023 15:23:09 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1f066fc2a2aso3432082fac.0; 
 Wed, 29 Nov 2023 07:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701271389; x=1701876189; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCUywg88tT8nR8OAzlEKxFmQomFdBEbseNCKYUwF6z0=;
 b=L4/39amR5c0zyGpc59TLGqOLk9Be596NCTRxj0aCrLx3kuQLevfSy3506/CrdQ8wPJ
 Iqi/yRRhc7RDH1JIGYPPvreQqY6kR7rhxnqm3lA6px4qfrztDGCWpwXeoN+goFOrrr5K
 oylATs+t5uOfxD7SwzpxotBzo3oYlQ0c67X6lgeiOBW9LcKHXXkM3CuvS8tsSTAIBfLZ
 x2tDvV4qwh2GQQ6/R6LxtndbWhEr1CNvhjvzVmk2PEhVAW31Xv4Smra/t0c5GuJnHv/f
 OJdq928+ZG1pO/0+U9bGM0efxucCzS5FrxmhrFMJZkfaVYYOnrHPRHOUpxCwA/jKMrc8
 zkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701271389; x=1701876189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eCUywg88tT8nR8OAzlEKxFmQomFdBEbseNCKYUwF6z0=;
 b=YMBBlJUV+lz4OHwzArrlOrl76B5N9rCrJPbh3yuoeICaYT7sMnMmcF90KiHiemYGaT
 svMeGA85tLFWsVGI66MadVcafiwMkQpkSOx06jbErhVSGug+8qq63AGf0WryUxqBApm8
 /mmuwHwhbUIyrvhG6ESquaT57QujRWA0reBDfn1RJyOnBR63HaTjklFKP+p+cdwZTAzZ
 rc9EkwbqwuopzGYyAgECmzrtsu2Dp5wnUqwZFpgD30Ht//YtP4BLY4pfbFh6MZy9rWjH
 2qnX1I3vIyj3SA10ARJxLlzwzdyGaTnB9jVcXA7IdItUO3P6fzVm7Qq8g26rtcuAkRMP
 W3wQ==
X-Gm-Message-State: AOJu0YxYj0tWykhZW/Rhs/IOoptObSkcJE8YiYsVmHwcd+k4zKlVN0JD
 KWxo7WgW4THxUpukf4y+Vj8Sa65mIgW9XaonzIc=
X-Google-Smtp-Source: AGHT+IGbi8FXFb8iIYdiAjppd2yUdKIHbDEmAip93Ro7/8+qtzvhgxIyR0+q8J5YJuIzV7KOp/r4TqyhsH8NZT9HSAc=
X-Received: by 2002:a05:6870:c45:b0:1fa:345e:5e15 with SMTP id
 lf5-20020a0568700c4500b001fa345e5e15mr15412255oab.13.1701271389082; Wed, 29
 Nov 2023 07:23:09 -0800 (PST)
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
In-Reply-To: <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 10:22:57 -0500
Message-ID: <CADnq5_OC=JFpGcN0oGbTF5xYEt4X3r0=jEY6hJ12W8CzYq1+cA@mail.gmail.com>
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 8:50=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@gmail.co=
m> wrote:
> >
> > On 2023-11-28 17:13, Alex Deucher wrote:
> > > On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesusis.=
net> wrote:
> > >>
> > >> Alex Deucher <alexdeucher@gmail.com> writes:
> > >>
> > >>>> In that case those are the already known problems with the schedul=
er
> > >>>> changes, aren't they?
> > >>>
> > >>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
> > >>> misunderstanding what the original report was actually testing.  If=
 it
> > >>> was 6.7, then try reverting:
> > >>> 56e449603f0ac580700621a356d35d5716a62ce5
> > >>> b70438004a14f4d0f9890b3297cd66248728546c
> > >>
> > >> At some point it was suggested that I file a gitlab issue, but I too=
k
> > >> this to mean it was already known and being worked on.  -rc3 came ou=
t
> > >> today and still has the problem.  Is there a known issue I could tra=
ck?
> > >>
> > >
> > > At this point, unless there are any objections, I think we should jus=
t
> > > revert the two patches
> > Uhm, no.
> >
> > Why "the two" patches?
> >
> > This email, part of this thread,
> >
> > https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
> >
> > clearly states that reverting *only* this commit,
> > 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable number =
of run-queues
> > *does not* mitigate the failed suspend. (Furthermore, this commit doesn=
't really change
> > anything operational, other than using an allocated array, instead of a=
 static one, in DRM,
> > while the 2nd patch is solely contained within the amdgpu driver code.)
> >
> > Leaving us with only this change,
> > b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> > to be at fault, as the kernel log attached in the linked email above sh=
ows.
> >
> > The conclusion is that only b70438004a14f4 needs reverting.
>
> b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14f4,
> 56e449603f0ac5 breaks amdgpu.

We can try and re-enable it in the next kernel.  I'm just not sure
we'll be able to fix this in time for 6.7 with the holidays and all
and I don't want to cause a lot of scheduler churn at the end of the
6.7 cycle if we hold off and try and fix it.  Reverting seems like the
best short term solution.

Alex

>
> Alex
