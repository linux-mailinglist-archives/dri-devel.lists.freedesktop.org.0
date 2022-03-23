Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506644E5781
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 18:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B1F88AEF;
	Wed, 23 Mar 2022 17:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5695C10E70D;
 Wed, 23 Mar 2022 17:29:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 m26-20020a05600c3b1a00b0038c8b999f58so5820117wms.1; 
 Wed, 23 Mar 2022 10:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ASDoUJ3zeAVR04Hixyii2s4ZDLZ2ghGAUyq7O6FrkxY=;
 b=TDNYBCw/cCIArki9szXV1FqDpwdvdJNlVucSpP5vCvgvvD92i/pDNKgVvgNKDtu/ee
 y90exrz+rhYj+sYDfouQxL3blpGgeEfUouZe5gWo7v3WKpqFb/XotCm7H9vkgv50/02M
 +P77WvlhSTAW5g8KW38d3SkNBasBYeW7rntT7CFHqer4R8fimvwPiEouofsZw5ZMu7mN
 YD6eqFlUGDl6jbiywa014sESyCZtMd77pIJDXqgy3fkxoA1qSk4YZFsKWlLzOjLTA7RR
 GOarWZ1ikDfL0lb47+7gbH1wIEj6YJDmkFExLVbKhxdBBmf+t3d+tGIyLwMewE1xkWAY
 XUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ASDoUJ3zeAVR04Hixyii2s4ZDLZ2ghGAUyq7O6FrkxY=;
 b=JK43Lcn/mCNQ4iN2oJNDTadpGxX4+mCNHPy2sszIfgb8Ew8dyTRq9Dc5frroXfjTaQ
 p9xMTKkXNSmvgFq07/dkPCDArqP4KZQPt4m8a/zrrcQyIE6mBrzLmo/I+qX8EiWV9R7u
 WHUTx27iL57XIn1B+51UMoVrRvOSu3ukInBT74nyH7+D8Hy9Vp1gB+vU7Zg68wmYBpyd
 WThbUnhDhoq2h1Roy5wPpld2+yQShfR8+X4fumYum9Tc61anvAMMbd4ZZNrjfTsxkX+J
 wWsHKaMpppbRUwQeg5uErsD8WVfZAvrXroDX4/oaK1ycRLDDtT0/H47DP2IbAwGcxW9Z
 jq6g==
X-Gm-Message-State: AOAM532BMaR3/8nZJAkqur7/wzlRA4jou/qGA0edqoK4aQziHVklA83I
 WUgER83oc520Y1WF8wG2tASTygtxM3QiXKfpf/E=
X-Google-Smtp-Source: ABdhPJxSbzXfdm/xuHMVTRy75OZau51y/wMSV5nfyZDx/oIMGNMivR8bYhFY/JPoJZ3MlgFcGWvJttQ8HyunTdCsSZ8=
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr1037472wmh.59.1648056553524; Wed, 23
 Mar 2022 10:29:13 -0700 (PDT)
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
 <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
 <3f0b7273-4562-7a55-e52a-bd64334886fd@amd.com>
 <CAF6AEGu6FabmcWE+NsPgnPU0=MpbA6bmO1KkJ2hrVDBLFY92xA@mail.gmail.com>
 <CAPj87rOx1uogqqKX8XZEnzpcKKY6W9TWHQFr-bgZyEU0-ftjVw@mail.gmail.com>
 <CAKMK7uFMmLLRQeONDOMpOg12p7moyrC-+hxVEqpa4hSFopbGtA@mail.gmail.com>
In-Reply-To: <CAKMK7uFMmLLRQeONDOMpOg12p7moyrC-+hxVEqpa4hSFopbGtA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 23 Mar 2022 10:30:00 -0700
Message-ID: <CAF6AEGt79YOVj7p5oupRsCEV+7mNmTqvNgKTa1S2NPnx5zgX1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 8:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, 23 Mar 2022 at 15:07, Daniel Stone <daniel@fooishbar.org> wrote:
> >
> > Hi,
> >
> > On Mon, 21 Mar 2022 at 16:02, Rob Clark <robdclark@gmail.com> wrote:
> > > On Mon, Mar 21, 2022 at 2:30 AM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > > > Well you can, it just means that their contexts are lost as well.
> > >
> > > Which is rather inconvenient when deqp-egl reset tests, for example,
> > > take down your compositor ;-)
> >
> > Yeah. Or anything WebGL.
> >
> > System-wide collateral damage is definitely a non-starter. If that
> > means that the userspace driver has to do what iris does and ensure
> > everything's recreated and resubmitted, that works too, just as long
> > as the response to 'my adblocker didn't detect a crypto miner ad'  is
> > something better than 'shoot the entire user session'.
>
> Not sure where that idea came from, I thought at least I made it clear
> that legacy gl _has_ to recover. It's only vk and arb_robustness gl
> which should die without recovery attempt.
>
> The entire discussion here is who should be responsible for replay and
> at least if you can decide the uapi, then punting that entirely to
> userspace is a good approach.
>
> Ofc it'd be nice if the collateral damage is limited, i.e. requests
> not currently on the gpu, or on different engines and all that
> shouldn't be nuked, if possible.
>
> Also ofc since msm uapi is that the kernel tries to recover there's
> not much we can do there, contexts cannot be shot. But still trying to
> replay them as much as possible feels a bit like overkill.

It would perhaps be nice if older gens which don't (yet) have
per-process pgtables to have gone with the userspace-replays (although
that would require a lot more tracking in userspace than what is done
currently).. but fortunately those older gens don't use "state
objects" which could potentially be corrupted, but instead re-emit
state in cmdstream, so there is a lot less possibility for bad
collateral damage.  (On all the gens we also use gpu read-only buffers
whenever the gpu does not need to be able to write them.)

For newer stuff, the process isolation works pretty well.  In fact we
recently changed MSM_PARAM_FAULTS to only report faults/hangs in the
same address space, so the compositor is not even aware (and doesn't
need to be aware).

BR,
-R

> -Daniel
>
> > Cheers,
> > Daniel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
