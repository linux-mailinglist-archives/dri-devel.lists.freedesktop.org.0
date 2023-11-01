Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA97DDD9A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 09:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E775610E657;
	Wed,  1 Nov 2023 08:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3871810E657
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 08:13:42 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1d542f05b9aso1331112fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 01:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1698826421; x=1699431221; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iTrJrLiBbNpY45EDAaoUQiZijsCyasehzQFvLcrvRfE=;
 b=hRcpD8Jq4yWh88MD1rtzaaz1jeyg+t5ffEA3YPEHL5TFR8Km3iiCwzUGtJlGUw+mJa
 37qxAYBx6tc4YvIexiJ3Uj5R8GH4+wh37BDZSZ5jFPptbf5rVEk2C8X9gDmurzmDTV2N
 g3VuUBFJro7LxNSXWQ8wzgzDbl+w64gMu4hZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698826421; x=1699431221;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iTrJrLiBbNpY45EDAaoUQiZijsCyasehzQFvLcrvRfE=;
 b=EU1P3TVZuwh5PYV451Qdc81CeqA2BwD7qjx/os18T/mEWjterlgz644ty9e3l5i/6C
 8ztSTW1wtzTBht6Ta2ix7xurd9ll6n2gHUOg6mtoMXsC+J3D39CPRhkmIOERRfD5ndra
 9x9w/Ufa9RgcJ9UsARU+poBm1zXAFSajubFvMVxbsroP4Eun6t/uS/j9SssSf0qtMENN
 DrWuyUvCDlx84n+aA5S1awvaGv7jMlTiPfLiurnADhJ766YwxPtYtAC0lWPK8PfEs5sG
 8WUusuSGOPVmqcoRKnB1r3zShIf4XfEFIMMoF07vx4Vdt+UKSsTvp5piGvm0y3UHLEPZ
 fVFA==
X-Gm-Message-State: AOJu0YyfxFarmMpDSMncdJh65pu1/LeErX8ARuTgVauhAEJoDDr9A4kP
 xi1DvxZPIHIET7DPk3Q49Zb2pZeXDI9+mDAA9XLNMg==
X-Google-Smtp-Source: AGHT+IHNo6PSvmt4/ey9BXcYHKsI5T5cP/oapm7vIEpZ5K+zWs51oNxmCWeDe0/qnVahB9OScvTSqBGtBMtX0xcfODM=
X-Received: by 2002:a05:6870:af44:b0:1e9:8ab9:11ca with SMTP id
 uy4-20020a056870af4400b001e98ab911camr19772936oab.3.1698826421144; Wed, 01
 Nov 2023 01:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
 <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
 <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com>
 <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
 <daf48d76-ceee-c82d-a63a-e8e7770a9d83@amd.com>
 <f5de10fa-57d6-a3d0-1cf9-084491aa6025@asahilina.net>
 <200e9d74-7191-b1ed-e5f3-775827550853@amd.com>
 <CAPM=9txcC9+ZePA5onJxtQr+nBe8UcA3_Kp5Da3zjKL7ZB4JPQ@mail.gmail.com>
In-Reply-To: <CAPM=9txcC9+ZePA5onJxtQr+nBe8UcA3_Kp5Da3zjKL7ZB4JPQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 1 Nov 2023 09:13:29 +0100
Message-ID: <CAKMK7uG0G02ierkgAmJE1gfLto08LK5twGUEX1qN+qk9-AavYA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
To: Dave Airlie <airlied@gmail.com>
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
Cc: asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 alyssa@rosenzweig.io,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 1 Nov 2023 at 07:59, Dave Airlie <airlied@gmail.com> wrote:
>
> >
> > Well, to make it clear once more: Signaling a dma_fence from the
> > destructor of a reference counted object is very problematic! This will
> > be rejected no matter if you do that in C or in Rust.
> >
> > What we can do is to make it safe in the sense that you don't access
> > freed up memory by using the scheduler fences even more as wrapper
> > around the hardware fence as we do now. But this quite a change and
> > requires a bit more than just hacking around
> > drm_sched_fence_get_timeline_name().
>
> I really think this needs to be documented if nothing else out of this thread.
>
> Clearly nobody is going to get it right and hidden here in this
> thread, this info isn't useful.
>
> Can we have some sort of design document for the dma-fence/scheduler
> interactions written and we can try and refine it with solutions on
> the list, because I'm tired of people proposing things and NAK's
> getting thrown around without anything to point people at.
>
> The next NAK I see on the list will mean I block all patches from the
> sender until they write a documentation patch, because seriously this
> stuff is too hard for someone to just keep it in their head and expect
> everyone else to understand from reading the code.

I very much like the idea that NAK replies are counted as "you've just
volunteered yourself for some documentation patches so that next time
around you can reply with a link to the docs instead of just a NAK".

I don't think we'll get out of these discussions otherwise, since
currently we have undocumented, but very tricky semantics of the
drm/sched codebase for ringbuffer scheduling which is extended to fw
scheduling in also very tricky ways, with not entirely clear impacts
on semantics of all the drm/sched things. And as a result we just pile
up enormous amounts of threads where I think the only thing assured is
that people talk past each another.

Converting NAKs into doc patches should at least eventually get rid of
the worst confusions we're dealing with here.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
