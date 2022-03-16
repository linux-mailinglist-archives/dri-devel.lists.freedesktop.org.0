Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F774DB546
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 16:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E00E10E7C8;
	Wed, 16 Mar 2022 15:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797B810E7C8;
 Wed, 16 Mar 2022 15:48:24 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 z9-20020a05683020c900b005b22bf41872so1664030otq.13; 
 Wed, 16 Mar 2022 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cEPpT5g3jd4SGwraYV61mwD+efqqEI+0jr3lnpKYy2I=;
 b=SugF9I5FDpjrl+n+VjdAd2eyTcQGIseSgPrbDGqHRzNeNo8B6j4INKmmMh7uTdoXpj
 2iv8b7jN1n7Clm73hmPEd+jYlctFKB3QuKnyZ7rVApyVnREfOnEXLi+9o/Fs3aQU9Zu5
 SDtH0XhTIu+mflbZw/EDmMIMSXPlF1H2LEPia83C3JaMqjkSH8tbpGPYXaxiigs7yrDs
 hhiC0KRn57hBp14a9hP62tvCPyAlBhTHPQfUY/IykKQzN6+mBDttKy8dHxtZaJdDQoXx
 JX9Ow31dNs03XCPRkvaKdMJkk9adlJLiusbV2j1QS4yea0EcstgkRTvd5EbR5fyCX6ZT
 nigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cEPpT5g3jd4SGwraYV61mwD+efqqEI+0jr3lnpKYy2I=;
 b=SofpBagkWM23bjmK1tT6vjibfjkWGQoodOirax+g6OW1/mUMprUW3/5BQ96EO0LQbq
 PErKw8R7BxiWei2r7zWp9hAmK6I4vl5hK5a1aKxMGZt5NuGSNKvkGfizJgCVnzPJ7IGy
 HHv39G21EY09ocft8SfQcrieaI3yFL5NrcN2Eo/x6nd4z4rYKgSzJc6fZvkeNPLGgjR6
 7LaZrrDpfwHPypQ3FEvu0h0MalrrWEPPSadOPzraq62oRenZ3RxkNu6jhQR6a1443/4S
 HVtbT6kP5wSK7l3HVf1KofjYJEgGY77j5gJZYXFe2Jw3vbPOGlUDEhEoHpJAy7LXcbT9
 DaqQ==
X-Gm-Message-State: AOAM530frYRgZvQniBURwvL79IBsVWQ2HbJn5nmFGvjmToOpSYzwIfL6
 jwyWRWxIn1xgVrENiASSF/I+M6OwoMLSMMSDcr8=
X-Google-Smtp-Source: ABdhPJzxN94wrdcTabQPUtfGWZeX5wyEWDKOecoH28wPndMpZtVDz8nj/wTyuJiE5BjEnmU13CyVNBPcIzxrRNeRav4=
X-Received: by 2002:a05:6830:2709:b0:5b0:196:dcf with SMTP id
 j9-20020a056830270900b005b001960dcfmr212008otu.357.1647445703751; Wed, 16 Mar
 2022 08:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <CAF6AEGsmectHSmW-Y6rf+AksXTkges7rukeiYd4yDm-xwdb1=Q@mail.gmail.com>
 <55629bd8-9fb4-2ee7-87f0-6c4c77cf06fc@gmail.com>
 <CAF6AEGsgDTphUm7ET+RuMmh2aTn-Ho5gJdUJ4kwJ3iOh7+HGvw@mail.gmail.com>
 <4f2b2329-3c57-3895-6732-875db2f98b5a@amd.com>
 <CAF6AEGvvskobh6YOUx55_4rtXJJjPO0PxWY8+EKiVqntT3k+ug@mail.gmail.com>
 <6b400b8b-1b5c-a339-2345-f317f197b4a6@amd.com>
 <CAF6AEGt0XhqzkyEhbNcNVQO_A_Lo4qcsPRZRL6QqYn+NWAfv9A@mail.gmail.com>
 <bf6922f0-da8e-eef6-8217-26c1f50f3c48@quicinc.com>
 <2980e6a0-624e-2b80-c5d0-c40dfce76fb8@amd.com>
 <CAF6AEGvC=k4xLA-0iTSf660X2o04E+ivjnThZA-=WANKzLSvpA@mail.gmail.com>
 <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
In-Reply-To: <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Mar 2022 11:48:12 -0400
Message-ID: <CADnq5_O2CVSLxShPFCzMxiXmnHXYbW1vFLJ5K=oigtXshULvqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 16, 2022 at 11:35 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Mar 16, 2022 at 7:12 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Wed, Mar 16, 2022 at 4:48 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> [snip]
> > > With new UAPI comes the demand of userspace proof, not hand-waving. You
> > > would not be proposing this new interface if you didn't have use cases
> > > in mind, even just one. You have to document what you imagine the new
> > > thing to be used for, so that the appropriateness can be evaluated. If
> > > the use case is deemed inappropriate for the proposed UAPI, you need to
> > > find another use case to justify adding the new UAPI. If there is no
> > > use for the UAPI, it shouldn't be added, right? Adding UAPI and hoping
> > > someone finds use for it seems backwards to me.
> >
> > We do have a use case.  It's what I described originally.  There is a
> > user space daemon (could be a compositor, could be something else)
> > that runs and listens for GPU reset notifications.  When it receives a
> > notification, it takes action and kills the guilty app and restarts
> > the compositer and gathers any relevant data related to the GPU hang
> > (if possible).  We can revisit this discussion once we have the whole
> > implementation complete.  Other drivers seem to do similar things
> > already today via different means (msm using devcoredump, i915 seems
> > to have its own GPU reset notification mechanism, etc.).  It just
> > seemed like there was value in having a generic drm GPU reset
> > notification, but maybe not yet.
>
> just one point of clarification.. in the msm and i915 case it is
> purely for debugging and telemetry (ie. sending crash logs back to
> distro for analysis if user has crash reporting enabled).. it isn't
> used for triggering any action like killing app or compositor.

Sure.  you could use this proposed event for telemetry gathering as
well.  The important part is the event.  What you do with it is up to
the user.

>
> I would however *strongly* recommend devcoredump support in other GPU
> drivers (i915's thing pre-dates devcoredump by a lot).. I've used it
> to debug and fix a couple obscure issues that I was not able to
> reproduce by myself.

Agreed.  I think devcoredump makes sense and we'll ultimately enable
support for that in amdgpu.  I think there is value in a GPU specific
reset event as well for the use case I outlined, but maybe the
devcoredump one is enough.  We'd just need to rely on the userspace
side to filter as appropriate for events it cares about.  I'm not sure
how many other devcore dump events are commonly seen.

Alex
