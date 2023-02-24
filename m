Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CBF6A227A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 20:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DF510ECEE;
	Fri, 24 Feb 2023 19:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3467D10ECEE;
 Fri, 24 Feb 2023 19:45:06 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-17227cba608so714156fac.3; 
 Fri, 24 Feb 2023 11:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PQCZaZas4mqF/1u+TgDl0aSZ4MQFsAGNxdsc85EAVk0=;
 b=Rpzv5VL/XkyIgQFdemPBbfvDO/1gMNZ3HMQhxgQxNdmMNmPzkxut553WsamW5XvYWC
 vi14lPcVIOjBkmzEKY6PXYrIfJvow0a78dDPP7IXdnVwVjL4PtvbDqzgvZcabMM+PN9r
 7dJBqtmRMQwkw+jtZSpUAfCXIhOGyz5QE9m9KWHYhrAg88AIunMXHAC6gqkvC9Pg54h+
 kba1adcNaoKK96dOuNaisIRegNgARYxIoqGQDLnQq/2gBQiH8QSU97iv0Ik1eFn5+2D9
 IoxqsWZqOJ/r7rpOQ5RIs9EIWK2Q6EjYPw/4ZzwqOfyx3m3sYt5hgtdWn3PFawNF5DSA
 pEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PQCZaZas4mqF/1u+TgDl0aSZ4MQFsAGNxdsc85EAVk0=;
 b=FgBadYK7Lim5dvNLVuqpGXuQViXO9YCrvrq55+JYKk/a+5CW964Jm+3lI8MB6ICZ7y
 jMF9Twcn1DpcFLA8YDI1l04UwHlcsPNsN/rmeWCWpThejF084/WJJ+TUt8YVebtAiUFg
 TnV6NHBpTf1xKprBVsrVYMGUdY50h3U6EjN1TGwyOMl0Bz6VuJJty8mgcobONmjw+YTu
 hTcjdsQrNoTvhOnoStsuKNGtNmtOVNh0tmp0rA4xfmW6ofJDkyDxzvKe4WcsV76SzPMx
 n+89daHq3D1Zs1Gx20KBrBfZzlksvo8cvVuMEu19n/CW1iQgVmoiqMRpR5ndXGInlEO2
 NPtQ==
X-Gm-Message-State: AO0yUKXoUzRxAiIZvVkYniJCSI5b3c2xZwHukREpaXIm1lx7rNvLvhgg
 O1bbORF7qwRQqWi0x5brPbC7Vl0F9eNgiYDpTCk=
X-Google-Smtp-Source: AK7set9q2ohE3ZIifWyCC+1q/2RI02UqDt8ADEh7SuBnNmXb/XptMvL0iwy9VsudXAL/RM3Gb8wn2wLxeAKMIu6DPvA=
X-Received: by 2002:a05:6870:5b0a:b0:172:6f4:dcdf with SMTP id
 ds10-20020a0568705b0a00b0017206f4dcdfmr1447187oab.3.1677267905254; Fri, 24
 Feb 2023 11:45:05 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-7-robdclark@gmail.com>
 <20230220105345.70e46fa5@eldfell>
 <CAF6AEGv9fLQCD65ytRTGp=EkNB1QoZYH5ArphgGQALV9J08Cmw@mail.gmail.com>
 <cdd5f892-49b9-1e22-4dc1-95a8a733c453@amd.com>
 <CAF6AEGuMn3FywPkEtfJ7oZ16A0Bk2aiaRvj4si4od1d3wzXkPw@mail.gmail.com>
 <20230222114900.1b6baf95@eldfell>
 <CAF6AEGs1_75gg+LCBj6=PH8Jn60PXiE+Kx_2636nP-+pajN8Hg@mail.gmail.com>
 <20230223113814.3010cedc@eldfell>
 <CAF6AEGuE89kuKTjjzwW1xMppcVw-M4-hcrtifed-mvsCA=cshQ@mail.gmail.com>
 <20230224112630.313d7b76@eldfell>
 <a47e2686-1e35-39a3-0f0c-6c3b9522f8ff@linux.intel.com>
 <20230224122403.6a088da1@eldfell>
In-Reply-To: <20230224122403.6a088da1@eldfell>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 24 Feb 2023 11:44:53 -0800
Message-ID: <CAF6AEGsu666v9iOy2H20-JNkzi4Av0+OtrLBo_3CjRGByUPD0A@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 2:24 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Fri, 24 Feb 2023 09:41:46 +0000
> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>
> > On 24/02/2023 09:26, Pekka Paalanen wrote:
> > > On Thu, 23 Feb 2023 10:51:48 -0800
> > > Rob Clark <robdclark@gmail.com> wrote:
> > >
> > >> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >>>
> > >>> On Wed, 22 Feb 2023 07:37:26 -0800
> > >>> Rob Clark <robdclark@gmail.com> wrote:
> > >>>
> > >>>> On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > >
> > > ...
> > >
> > >>>>> On another matter, if the application uses SET_DEADLINE with one
> > >>>>> timestamp, and the compositor uses SET_DEADLINE on the same thing with
> > >>>>> another timestamp, what should happen?
> > >>>>
> > >>>> The expectation is that many deadline hints can be set on a fence.
> > >>>> The fence signaller should track the soonest deadline.
> > >>>
> > >>> You need to document that as UAPI, since it is observable to userspace.
> > >>> It would be bad if drivers or subsystems would differ in behaviour.
> > >>>
> > >>
> > >> It is in the end a hint.  It is about giving the driver more
> > >> information so that it can make better choices.  But the driver is
> > >> even free to ignore it.  So maybe "expectation" is too strong of a
> > >> word.  Rather, any other behavior doesn't really make sense.  But it
> > >> could end up being dictated by how the hw and/or fw works.
> > >
> > > It will stop being a hint once it has been implemented and used in the
> > > wild long enough. The kernel userspace regression rules make sure of
> > > that.
> >
> > Yeah, tricky and maybe a gray area in this case. I think we eluded
> > elsewhere in the thread that renaming the thing might be an option.
> >
> > So maybe instead of deadline, which is a very strong word, use something
> > along the lines of "present time hint", or "signalled time hint"? Maybe
> > reads clumsy. Just throwing some ideas for a start.
>
> You can try, but I fear that if it ever changes behaviour and
> someone notices that, it's labelled as a kernel regression. I don't
> think documentation has ever been the authoritative definition of UABI
> in Linux, it just guides drivers and userspace towards a common
> understanding and common usage patterns.
>
> So even if the UABI contract is not documented (ugh), you need to be
> prepared to set the UABI contract through kernel implementation.
>
> If you do not document the UABI contract, then different drivers are
> likely to implement it differently, leading to differing behaviour.
> Also userspace will invent wild ways to abuse the UABI if there is no
> documentation guiding it on proper use. If userspace or end users
> observe different behaviour, that's bad even if it's not a regression.
>
> I don't like the situation either, but it is what it is. UABI stability
> trumps everything regardless of whether it was documented or not.
>
> I bet userspace is going to use this as a "make it faster, make it
> hotter" button. I would not be surprised if someone wrote a LD_PRELOAD
> library that stamps any and all fences with an expired deadline to
> just squeeze out a little more through some weird side-effect.

Userspace already has various (driver specific) debugfs/sysfs that it
can use if it wants to make it hotter and drain batteries faster, so
I'm not seeing a strong need to cater to the "turn it up to eleven"
crowd here.  And really your point feels like a good reason to _not_
document this as anything more than a hint.

Back in the real world, mobile games are already well aware of the fps
vs battery-life (and therefore gameplay) tradeoff.  But what is
missing is a way to inform the kernel of userspace's intentions, so
that gpu dvfs can make intelligent decisions.  This series is meant to
bridge that gap.

BR,
-R

> Well, that's hopefully overboard in scaring, but in the end, I would
> like to see UABI documented so I can have a feeling of what it is for
> and how it was intended to be used. That's all.
>
>
> Thanks,
> pq
