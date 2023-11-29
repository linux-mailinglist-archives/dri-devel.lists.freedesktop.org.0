Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678037FD8A0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 14:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33A510E1DE;
	Wed, 29 Nov 2023 13:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7A010E1DE;
 Wed, 29 Nov 2023 13:51:09 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1f055438492so3887670fac.3; 
 Wed, 29 Nov 2023 05:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701265868; x=1701870668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KD1muJiPB8+lXdz9QAzcQerA6N3IurpNa/FCWjvcTTA=;
 b=CKzhVE3V05daVzk5j6TyLZ91gGi2pQJggehZj1Pl1fg+KJYyT/5VD2ZUwFjC0BfydG
 wxDzit6DhTP+XPR+R+JQSsHZo21sxXDMoz300cul6MXBN1c56wHncHZOizawElK7NZ35
 7vc/QlAV1+rFn6uxEnDaRd1mJ+O2k9S12FrLeZQTmaNuv28xTaLVD0sfPEXYG2xoKML5
 VCrdyoYTJzWT5+mjKKE+epEHoyMC5+iTO/sceYsXt3s6GYXkwCFZLk63HFHN5AO4n+tt
 NFoEopLBHFLvrxRCyclDKiCf2rWAzTGI8SYoBVNTb1BnTcezjnLXM6FR8hLqU4JCmS54
 JI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701265868; x=1701870668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KD1muJiPB8+lXdz9QAzcQerA6N3IurpNa/FCWjvcTTA=;
 b=YWspyT/W/Ds9aotdhTOY5o62ox64lIEEjArzDOoI+ZEy28kzPYDbI3h0P4jYh+S7qX
 lSwhvRs1rFXXg1tfbQNZk8l+T3T8rDswrHKBggtYuKy6y6y9JvTh+09F+DmtPw70d939
 Me+XRAQLD0tP6CgWwwj/WCnoP48kiahErLfuS6z6dkIyEHCSCqGB/7ladN1LtJQjR1+S
 dwaxu9kCPmyVZCQ/2+3BFfkpmFu8L/GO0cHzeLCzPvnPRUbSaA2fS57wd0S6R1O722dg
 03RKP7lgqJL5QSV85OZUA52lxG7Kvv7KENCXHx4WaQSbB2O4mJMSREppziZmvmoepBrS
 rpeg==
X-Gm-Message-State: AOJu0Yx8MKSD8l5I8IQT/tdt1CLaz2MMCdt8v3BHIlJ5alQ7QbbiYQwU
 t9R0KLBeBPnuP9OFarETh9JKuwJPwUzMn1Ny5ZFB/CW4cHg=
X-Google-Smtp-Source: AGHT+IF/P408lEGrdFVoOU8I1AP/p9OaFI9E1g6cnVNM5pbGGA7QD9y6ObERwISbTugNJXoU+G8fLgVOFsGaG1BgagU=
X-Received: by 2002:a05:6870:e99a:b0:1fa:126:2b27 with SMTP id
 r26-20020a056870e99a00b001fa01262b27mr20000238oao.50.1701265868318; Wed, 29
 Nov 2023 05:51:08 -0800 (PST)
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
In-Reply-To: <95fe9b5b-05ce-4462-9973-9aca306bc44f@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Nov 2023 08:50:56 -0500
Message-ID: <CADnq5_MYEWx=e1LBLeVs0UbR5_xEScjDyw_-75mLe8RAMnqh6g@mail.gmail.com>
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

On Tue, Nov 28, 2023 at 11:45=E2=80=AFPM Luben Tuikov <ltuikov89@gmail.com>=
 wrote:
>
> On 2023-11-28 17:13, Alex Deucher wrote:
> > On Mon, Nov 27, 2023 at 6:24=E2=80=AFPM Phillip Susi <phill@thesusis.ne=
t> wrote:
> >>
> >> Alex Deucher <alexdeucher@gmail.com> writes:
> >>
> >>>> In that case those are the already known problems with the scheduler
> >>>> changes, aren't they?
> >>>
> >>> Yes.  Those changes went into 6.7 though, not 6.6 AFAIK.  Maybe I'm
> >>> misunderstanding what the original report was actually testing.  If i=
t
> >>> was 6.7, then try reverting:
> >>> 56e449603f0ac580700621a356d35d5716a62ce5
> >>> b70438004a14f4d0f9890b3297cd66248728546c
> >>
> >> At some point it was suggested that I file a gitlab issue, but I took
> >> this to mean it was already known and being worked on.  -rc3 came out
> >> today and still has the problem.  Is there a known issue I could track=
?
> >>
> >
> > At this point, unless there are any objections, I think we should just
> > revert the two patches
> Uhm, no.
>
> Why "the two" patches?
>
> This email, part of this thread,
>
> https://lore.kernel.org/all/87r0kircdo.fsf@vps.thesusis.net/
>
> clearly states that reverting *only* this commit,
> 56e449603f0ac5 drm/sched: Convert the GPU scheduler to variable number of=
 run-queues
> *does not* mitigate the failed suspend. (Furthermore, this commit doesn't=
 really change
> anything operational, other than using an allocated array, instead of a s=
tatic one, in DRM,
> while the 2nd patch is solely contained within the amdgpu driver code.)
>
> Leaving us with only this change,
> b70438004a14f4 drm/amdgpu: move buffer funcs setting up a level
> to be at fault, as the kernel log attached in the linked email above show=
s.
>
> The conclusion is that only b70438004a14f4 needs reverting.

b70438004a14f4 was a fix for 56e449603f0ac5.  Without b70438004a14f4,
56e449603f0ac5 breaks amdgpu.

Alex
