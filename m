Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 329654D86E5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 15:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B00410E363;
	Mon, 14 Mar 2022 14:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9DA10E363;
 Mon, 14 Mar 2022 14:23:39 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id v75so8640069oie.1;
 Mon, 14 Mar 2022 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xF07GBvNsDKZxDOnovUnHtxe1sndXhs1dh2yzO+TG2g=;
 b=ie8i4YGvgkAJ10d6UiCx/7ym5yohytYxOVqnOFdki0RCLDqUinz/AIelM3Tov0Qmxa
 INTzHY73bwMDD5UCeYxop4lasoYNenihfclaC495ebtPJNT0O+OLHFYV71ZsQQAqsgFN
 cH4vDR7DF8MoFX/Cg6NZIFTqvNXSVHTEh1UR6MbZct+rg77cNU/MpaqdYlBCEEk2cNnv
 QS4TLs9947cBhahijJS3blrE+DrdGe0LApkwR6C/USvZtDH3H2mZVqBcv5YcPzDdKmBA
 RZsdJVTc3YX0rqRs24tkOWtwerinKP/y8A2SpuPWc24fVSxUFSWtJrtg0EgvO1rDir+3
 G01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xF07GBvNsDKZxDOnovUnHtxe1sndXhs1dh2yzO+TG2g=;
 b=SkdzbTbphrSpb/lEw5005rvJ+H7zydVIUq8rfS9mM19KGHdimIsxinYu3hTDWl3c9I
 PuMw2ZrFxXmEwze2PFpYSWgH0TzQYl1wFipq+boza8i2tycLoNPQKLsQBUKa47ICNwXi
 /tYeXhy5oMPYouDhaPkI+sE8KAIZ0sgYcnho8eUZP2fBrNxXQBFbJxZIX1H6+O9iyxge
 YbtCYGKPYvAAryg+nyPm/96xhKwJj8WGs5pt5yZeZmZOhKnX6+BdyjXxWdLxCRk95Xb0
 uJ4H1HxHcXP8uBPbrlezGo7sl8Lh0R6RsVgKqjcGf6i4xAedRFA/rPPdAaMaDIVUg66i
 OyZw==
X-Gm-Message-State: AOAM532NDMhoghBrGka7uH3FN+J0ySZ0CFecqpTbIhFowfJVPG0P18Id
 XJbNDhBEmkQXhL2gfc5dljTtd0H3dGVHKRecR7E=
X-Google-Smtp-Source: ABdhPJwLSI5xmnEiGug8b0duX2xixtrtzl8Lq/4QkCr+G/tDG4gqnFufyj/3W+FkoxogU1exegKkMyTLVoFbu53DEVs=
X-Received: by 2002:aca:d07:0:b0:2ec:eaaf:a036 with SMTP id
 7-20020aca0d07000000b002eceaafa036mr2957884oin.253.1647267818562; Mon, 14 Mar
 2022 07:23:38 -0700 (PDT)
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
In-Reply-To: <20220311102709.225616cf@eldfell>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Mar 2022 10:23:27 -0400
Message-ID: <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
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

On Fri, Mar 11, 2022 at 3:30 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 10 Mar 2022 11:56:41 -0800
> Rob Clark <robdclark@gmail.com> wrote:
>
> > For something like just notifying a compositor that a gpu crash
> > happened, perhaps drm_event is more suitable.  See
> > virtio_gpu_fence_event_create() for an example of adding new event
> > types.  Although maybe you want it to be an event which is not device
> > specific.  This isn't so much of a debugging use-case as simply
> > notification.
>
> Hi,
>
> for this particular use case, are we now talking about the display
> device (KMS) crashing or the rendering device (OpenGL/Vulkan) crashing?
>
> If the former, I wasn't aware that display device crashes are a thing.
> How should a userspace display server react to those?
>
> If the latter, don't we have EGL extensions or Vulkan API already to
> deliver that?
>
> The above would be about device crashes that directly affect the
> display server. Is that the use case in mind here, or is it instead
> about notifying the display server that some application has caused a
> driver/hardware crash? If the latter, how should a display server react
> to that? Disconnect the application?
>
> Shashank, what is the actual use case you are developing this for?
>
> I've read all the emails here so far, and I don't recall seeing it
> explained.
>

The idea is that a support daemon or compositor would listen for GPU
reset notifications and do something useful with them (kill the guilty
app, restart the desktop environment, etc.).  Today when the GPU
resets, most applications just continue assuming nothing is wrong,
meanwhile the GPU has stopped accepting work until the apps re-init
their context so all of their command submissions just get rejected.

> Btw. somewhat relatedly, there has been work aiming to allow
> graceful hot-unplug of DRM devices. There is a kernel doc outlining how
> the various APIs should react towards userspace when a DRM device
> suddenly disappears. That seems to have some overlap here IMO.
>
> See https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#device-hot-unplug
> which also has a couple pointers to EGL and Vulkan APIs.

The problem is most applications don't use the GL or VK robustness
APIs.  You could use something like that in the compositor, but those
APIs tend to be focused more on the application itself rather than the
GPU in general.  E.g., Is my context lost.  Which is fine for
restarting your context, but doesn't really help if you want to try
and do something with another application (i.e., the likely guilty
app).  Also, on dGPU at least, when you reset the GPU, vram is usually
lost (either due to the memory controller being reset, or vram being
zero'd on init due to ECC support), so even if you are not the guilty
process, in that case you'd need to re-init your context anyway.

Alex

>
>
> Thanks,
> pq
