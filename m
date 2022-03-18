Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1624DDC86
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 16:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3096E10E080;
	Fri, 18 Mar 2022 15:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163DC10E080;
 Fri, 18 Mar 2022 15:12:14 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id r7so5020605wmq.2;
 Fri, 18 Mar 2022 08:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EApymkxonyMtaB/xcoZsAQd/qFJu/0+QS9XvmkXwrxI=;
 b=mD8YQO3ZV8roQM5EsHfmMfA1Gz2a2NBjUOhCUF+AJo3j7om7Z7tFlgUiNcLCmwOhHV
 obrKsizkMrUXHa+pdv3usz2JGsSiG1XUsUFMVnHN/04eXs3OhCfF/ZsNmC2L8EQC8nzb
 re6GyCBiNHEfdcZBPdvg8j8Hfaq20C2J6M6i4/RUdMcdWTijd22evbT/9PgavseY+hL1
 EVX9Yi4tO88YTMekGt38ImuQS/bcr1sXgcfk/36qIqgQ+R372KTRjlCenzofSAdC+VHl
 fxNFQDOzh//McBwJlbVTkgvueyg0/f7w+VA/bXKVOifm1BndiyPNw4OkTgUPO+7T3cHD
 leHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EApymkxonyMtaB/xcoZsAQd/qFJu/0+QS9XvmkXwrxI=;
 b=ngV9g5EVAwt5aqG4PraQtX40wXMq98uaLA+1znDjfLCj8pApjidEVLAtNsVudbOqvg
 scRfKbzCwPrswfW5pS1dF+36H8y3tpsINfbKpY4IEi12/jbzY/BemMLTEogAEXQggWyq
 Hxse8tejf7y5x+KmCQKDw2sc3SJQHUmoKB29F6kNK4TZFd+5k0i6SBKOkmCPGQGk2GYJ
 M4rR74U1ASnInhkaGmRP13Hi1X8CG9FofnarEx/m3mQq3GHJrvP73Rbi5NC0oOjl9ovW
 oO0xgkRwRlRDnCG9WdNm0oMvZB/RO7JATb0zoBA1/CiUN6sNsxZtlMOa+UkyTdbVvDUy
 ad9Q==
X-Gm-Message-State: AOAM531Ink391lFwUMcvLAhPum+4qXXt27xseM/nLzonMzHXk7AedMhx
 F95KbTPfDuZirF1NACSrQORf0NFZ/5V3jYtLDw8=
X-Google-Smtp-Source: ABdhPJyUdovwC2bAMCPewzU2+LqSE4i8NObaTjPjPGwsguJJgblEd21J1aEH0msjpFfkgwUEs0td+2xWUGnatECUv0I=
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr8554596wmh.59.1647616332576; Fri, 18
 Mar 2022 08:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
 <YjNvYmcuDKiIneDx@phenom.ffwll.local>
 <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
 <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
In-Reply-To: <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 18 Mar 2022 08:12:54 -0700
Message-ID: <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <contactshashanksharma@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 18, 2022 at 12:42 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.03.22 um 18:31 schrieb Rob Clark:
> > On Thu, Mar 17, 2022 at 10:27 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >> [SNIP]
> >>> (At some point, I'd like to use scheduler for the replay, and actuall=
y
> >>> use drm_sched_stop()/etc.. but last time I looked there were still
> >>> some sched bugs in that area which prevented me from deleting a bunch
> >>> of code ;-))
> >> Not sure about your hw, but at least on intel replaying tends to just
> >> result in follow-on fun. And that holds even more so the more complex =
a
> >> workload is. This is why vk just dies immediately and does not try to
> >> replay anything, offloading it to the app. Same with arb robusteness.
> >> Afaik it's really only media and classic gl which insist that the driv=
er
> >> stack somehow recover.
> > At least for us, each submit must be self-contained (ie. not rely on
> > previous GPU hw state), so in practice replay works out pretty well.
> > The worst case is subsequent submits from same process fail as well
> > (if they depended on something that crashing submit failed to write
> > back to memory.. but in that case they just crash as well and we move
> > on to the next one.. the recent gens (a5xx+ at least) are pretty good
> > about quickly detecting problems and giving us an error irq.
>
> Well I absolutely agree with Daniel.
>
> The whole replay thing AMD did in the scheduler is an absolutely mess
> and should probably be killed with fire.
>
> I strongly recommend not to do the same mistake in other drivers.
>
> If you want to have some replay feature then please make it driver
> specific and don't use anything from the infrastructure in the DRM
> scheduler.

hmm, perhaps I was not clear, but I'm only talking about re-emitting
jobs *following* the faulting one (which could be from other contexts,
etc).. not trying to restart the faulting job.

You *absolutely* need to replay jobs following the faulting one, they
could be from unrelated contexts/processes.  You can't just drop them
on the floor.

Currently it is all driver specific, but I wanted to delete a lot of
code and move to using scheduler to handle faults/timeouts (but
blocked on that until [1] is resolved)

[1] https://patchwork.kernel.org/project/dri-devel/patch/1630457207-13107-2=
-git-send-email-Monk.Liu@amd.com/

BR,
-R

> Thanks,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> And recovering from a mess in userspace is a lot simpler than trying t=
o
> >> pull of the same magic in the kernel. Plus it also helps with a few of=
 the
> >> dma_fence rules, which is a nice bonus.
> >> -Daniel
> >>
>
