Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DB03D26D0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 17:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66BE6E8C8;
	Thu, 22 Jul 2021 15:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4D06E88B;
 Thu, 22 Jul 2021 15:36:35 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so3210623wms.5; 
 Thu, 22 Jul 2021 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b0DoJx2BsbVVJrk2vhA6kDfquGRohjbc2PM7uCJo7AQ=;
 b=qHf9OnWhVMewnBbcFMkLefFnXcpymEjYudSG0ys60GLD0Qqj29UwPxDjYRTi1bFgWE
 Of7wRgf0ZZhtR5c+swf6vMqjVKSGhM1KD6PcZnqQ+Usgp/QkLWXaC1mJaJyEYuygJt78
 Kj5/oQpBY/Z4gFgwiMrzmUEo2Ntd1oCRYdzfRiBKhy+R4QQybhfvqL/O2JZ7UudKEHh+
 uZZIStXwovcNMremIcEh5hhEMEp+pXLcscxehmhWXdj8lGVZrSAev0auU2IFnIOX3ajk
 JpaGrq3FPqzl0boPVilTPm8n9Oqllf3KvCPBOuLV/MNi32Q4iyfhpOk1NY7hMvYC4Jwr
 PLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b0DoJx2BsbVVJrk2vhA6kDfquGRohjbc2PM7uCJo7AQ=;
 b=Cl54yWljPpd352DksWV7LxFavCB0kY7DvgLm9BSp1bOLs1yNbm490nNIVbCJgZXfj/
 biwiP/czllPlUQjL7F8d2WFVTuChlaYjdaUxDMHOck4hOfIj4SSsnZhdWmoBSqTqH5DL
 PwtHSR+DrmOcbjmp7I2kITkeVe15JxiL4MPNGw556zH3aTw7640mr5zGy4hHb/cZMX9w
 gZ4bzJF3n+oMX8FIQ1or9Q7bRV3+MlpwgxuZyo5XL8YGlT6Uo+Rxigh4tANcScOKhhv7
 3VpCiOUyJMZFGM3W+oy72VB06+fe38NL9HOBNw43BHSyVe6X5tbf1WjAB7PEXTt+ci/y
 +z/Q==
X-Gm-Message-State: AOAM532ul4dbzJt/YUal127uhBquNYxK4lOr0caKFuye6f+xnGycrkVu
 ooQylGTzaDKMfFa8U8bbpBK2eC0frW0TpnnVl6k=
X-Google-Smtp-Source: ABdhPJxCkdIVm7iTrG4HCBPglTT8Jd2ruOUzfhfaiqWM3gbxHRbhBAOwJMUcdcc5JmreBWyQuVeEjCRkg5PGbQro08k=
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr9870542wmc.123.1626968193910; 
 Thu, 22 Jul 2021 08:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210720150716.1213775-1-robdclark@gmail.com>
 <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
 <YPhvein5e8do2AR+@phenom.ffwll.local>
 <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
In-Reply-To: <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 Jul 2021 08:40:42 -0700
Message-ID: <CAF6AEGuWFPway2_UThe9p=OwL1rLaADONHmt7++qC3PUX+y_SQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 1:42 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 21.07.21 um 21:03 schrieb Daniel Vetter:
> > On Wed, Jul 21, 2021 at 09:34:43AM -0700, Rob Clark wrote:
> >> On Wed, Jul 21, 2021 at 12:59 AM Daniel Vetter <daniel@ffwll.ch> wrote=
:
> >>> On Wed, Jul 21, 2021 at 12:32 AM Rob Clark <robdclark@gmail.com> wrot=
e:
> >>>> On Tue, Jul 20, 2021 at 1:55 PM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
> >>>>> On Tue, Jul 20, 2021 at 8:26 PM Rob Clark <robdclark@gmail.com> wro=
te:
> >>>>>> On Tue, Jul 20, 2021 at 11:03 AM Christian K=C3=B6nig
> >>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>>>> Hi Rob,
> >>>>>>>
> >>>>>>> Am 20.07.21 um 17:07 schrieb Rob Clark:
> >>>>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>>>
> >>>>>>>> Somehow we had neither ->wait() nor dma_fence_signal() calls, an=
d no
> >>>>>>>> one noticed.  Oops.
> >>>>>>>
> >>>>>>> I'm not sure if that is a good idea.
> >>>>>>>
> >>>>>>> The dma_fence->wait() callback is pretty much deprecated and shou=
ld not
> >>>>>>> be used any more.
> >>>>>>>
> >>>>>>> What exactly do you need that for?
> >>>>>> Well, the alternative is to track the set of fences which have
> >>>>>> signalling enabled, and then figure out which ones to signal, whic=
h
> >>>>>> seems like a lot more work, vs just re-purposing the wait
> >>>>>> implementation we already have for non-dma_fence cases ;-)
> >>>>>>
> >>>>>> Why is the ->wait() callback (pretty much) deprecated?
> >>>>> Because if you need it that means for your driver dma_fence_add_cb =
is
> >>>>> broken, which means a _lot_ of things don't work. Like dma_buf poll
> >>>>> (compositors have patches to start using that), and I think
> >>>>> drm/scheduler also becomes rather unhappy.
> >>>> I'm starting to page back in how this works.. fence cb's aren't brok=
en
> >>>> (which is also why dma_fence_wait() was not completely broken),
> >>>> because in retire_submits() we call
> >>>> dma_fence_is_signaled(submit->hw_fence).
> >>>>
> >>>> But the reason that the custom wait function cleans up a tiny bit of
> >>>> jank is that the wait_queue_head_t gets signaled earlier, before we
> >>>> start iterating the submits and doing all that retire_submit() stuff
> >>>> (unpin/unref bo's, etc).  I suppose I could just split things up to
> >>>> call dma_fence_signal() earlier, and *then* do the retire_submits()
> >>>> stuff.
> >>> Yeah reducing the latency there sounds like a good idea.
> >>> -Daniel
> >>>
> >> Hmm, no, turns out that isn't the problem.. or, well, it is probably a
> >> good idea to call drm_fence_signal() earlier.  But it seems like
> >> waking up from wait_event_* is faster than wake_up_state(wait->task,
> >> TASK_NORMAL).  I suppose the wake_up_state() approach still needs for
> >> the scheduler to get around to schedule the runnable task.
>
> As far as I know wake_up_state() tries to run the thread on the CPU it
> was scheduled last, while wait_event_* makes the thread run on the CPU
> who issues the wake by default.
>
> And yes I've also noticed this already and it was one of the reason why
> I suggested to use a wait_queue instead of the hand wired dma_fence_wait
> implementation.
>
> >>
> >> So for now, I'm going back to my own wait function (plus earlier
> >> drm_fence_signal())
> >>
> >> Before removing dma_fence_opps::wait(), I guess we want to re-think
> >> dma_fence_default_wait().. but I think that would require a
> >> dma_fence_context base class (rather than just a raw integer).
> > Uh that's not great ... can't we fix this instead of papering over it i=
n
> > drivers? Aside from maybe different wakeup flags it all is supposed to
> > work exactly the same underneath, and whether using a wait queue or not
> > really shouldn't matter.
>
> Well it would have been nicer if we used the existing infrastructure
> instead of re-inventing stuff for dma_fence, but that chance is long gone=
.
>
> And you don't need a dma_fence_context base class, but rather just a
> flag in the dma_fence_ops if you want to change the behavior.

Hmm, I was thinking dma_fence_context to have a place for the
wait_queue_head, but I guess that could also be per-dma_fence
