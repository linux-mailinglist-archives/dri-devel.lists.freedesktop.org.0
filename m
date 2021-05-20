Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9AC38B23A
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 16:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67336F487;
	Thu, 20 May 2021 14:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACC46F479;
 Thu, 20 May 2021 14:50:23 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i17so17949209wrq.11;
 Thu, 20 May 2021 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Pw/S3DhRfs9hqIwXkjoQ53ij2Leive6HtbA3MFyHCVA=;
 b=hwiIauTkRs1gkN7GptgkaSNYGZrP3Ui4s0V1lP3VcpU9RdwFWgPVtzMNlwAMoyPI9s
 I3PU2aWE4CfRaH9vhiYZHL4ZGUUoS8qUrgEV10VObwtOqCMXgORXcqrLFvBKxrSZjk7U
 Qy1ReiQyV5LNQNzkjF6irBDS4DxFx32SHBvWepatsCspmxetBEaXfREFdmHe269HmmRt
 v/p+fLWYleQBkV2+rMjMpiJGHWoFBON/jYuJop49t+TmRKFFYAZccBHEeboTIKls3dmz
 Lu25yodi2wA30N77koIcqpHBweSntl6WcktpsTVQQkL4mmoicBJglBDbb9I8RA0NJFLq
 oLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pw/S3DhRfs9hqIwXkjoQ53ij2Leive6HtbA3MFyHCVA=;
 b=VrbGW+TX+zUZTS3rUKu1N6FNRmt79451iqTmW++q1oU9satUzGXSjeFtLidGoqjCth
 L+iC8c5zoW6ynoWyNh1Lz7SF5UN2jUOoFo1MNzx+KxFEo0Xi/AS9oVwG4tQItWnVkdjQ
 DNoimclPQ8dM19c4PqetmWVpOc7sVbOMrF4q3pvZ8W6LvveIMQOC3UyZJLRcsLxnJHIk
 G5m9um64BRu0GSg4S56q2keKPjjdqMMdRP8myvZlO3NnAS+A6G+d9MuPiLwrq9khtHSF
 JcSe+FdDLGIqTeMyTUlv68+YX4oIv2pIBuHDD8lsZfVbIcjmHng7mUrqRrljpQy1TFQy
 bQKw==
X-Gm-Message-State: AOAM533LwxE/eW3AWH0yrZ+v4aIcd+rwSML0gJVSE0L2Nx5BGV8REOPs
 FJG2Cb2hikhjCqo8xjIlr08kvVg+EK4msbu9Lro=
X-Google-Smtp-Source: ABdhPJyqpa5z8S7zPqUU/Sw+yjCc4qC8hKSJNQRRZDc71DjdMxDOwRF7Ke51/NMtAhuN4Tw9Wv81UvtjRWmRVbsahmU=
X-Received: by 2002:adf:fa46:: with SMTP id y6mr4810707wrr.83.1621522222321;
 Thu, 20 May 2021 07:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
 <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
 <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
In-Reply-To: <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 May 2021 07:54:05 -0700
Message-ID: <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
Subject: Re: [RFC 1/3] dma-fence: Add boost fence op
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
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 7:11 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 20.05.21 um 16:07 schrieb Rob Clark:
> > On Wed, May 19, 2021 at 11:47 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Uff, that looks very hardware specific to me.
> > Howso?  I'm not sure I agree.. and even if it was not useful for some
> > hw, it should be useful for enough drivers (and harm no drivers), so I
> > still think it is a good idea
> >
> > The fallback plan is to go the i915 route and stop using atomic
> > helpers and do the same thing inside the driver, but that doesn't help
> > any of the cases where you have a separate kms and gpu driver.
>
> Yeah, that's certainly not something we want.
>
> >> As far as I can see you can also implement completely inside the backe=
nd
> >> by starting a timer on enable_signaling, don't you?
> > Not really.. I mean, the fact that something waited on a fence could
> > be a useful input signal to gpu freq governor, but it is entirely
> > insufficient..
> >
> > If the cpu is spending a lot of time waiting on a fence, cpufreq will
> > clock down so you spend less time waiting.  And no problem has been
> > solved.  You absolutely need the concept of a missed deadline, and a
> > timer doesn't give you that.
>
> Ok then I probably don't understand the use case here.
>
> What exactly do you try to solve?

Basically situations where you are ping-ponging between GPU and CPU..
for example if you are double buffering instead of triple buffering,
and doing vblank sync'd pageflips.  The GPU, without any extra signal,
could get stuck at 30fps and a low gpu freq, because it ends up idle
while waiting for an extra vblank cycle for the next back-buffer to
become available.  Whereas if it boosted up to a higher freq and
stopped missing a vblank deadline, it would be less idle due to
getting the next back-buffer sooner (due to not missing a vblank
deadline).

BR,
-R

> Thanks,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> Christian.
> >>
> >> Am 19.05.21 um 20:38 schrieb Rob Clark:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Add a way to hint to the fence signaler that a fence waiter has misse=
d a
> >>> deadline waiting on the fence.
> >>>
> >>> In some cases, missing a vblank can result in lower gpu utilization,
> >>> when really we want to go in the opposite direction and boost gpu fre=
q.
> >>> The boost callback gives some feedback to the fence signaler that we
> >>> are missing deadlines, so it can take this into account in it's freq/
> >>> utilization calculations.
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> ---
> >>>    include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
> >>>    1 file changed, 26 insertions(+)
> >>>
> >>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> >>> index 9f12efaaa93a..172702521acc 100644
> >>> --- a/include/linux/dma-fence.h
> >>> +++ b/include/linux/dma-fence.h
> >>> @@ -231,6 +231,17 @@ struct dma_fence_ops {
> >>>        signed long (*wait)(struct dma_fence *fence,
> >>>                            bool intr, signed long timeout);
> >>>
> >>> +     /**
> >>> +      * @boost:
> >>> +      *
> >>> +      * Optional callback, to indicate that a fence waiter missed a =
deadline.
> >>> +      * This can serve as a signal that (if possible) whatever signa=
ls the
> >>> +      * fence should boost it's clocks.
> >>> +      *
> >>> +      * This can be called in any context that can call dma_fence_wa=
it().
> >>> +      */
> >>> +     void (*boost)(struct dma_fence *fence);
> >>> +
> >>>        /**
> >>>         * @release:
> >>>         *
> >>> @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct =
dma_fence *fence, bool intr)
> >>>        return ret < 0 ? ret : 0;
> >>>    }
> >>>
> >>> +/**
> >>> + * dma_fence_boost - hint from waiter that it missed a deadline
> >>> + *
> >>> + * @fence: the fence that caused the missed deadline
> >>> + *
> >>> + * This function gives a hint from a fence waiter that a deadline wa=
s
> >>> + * missed, so that the fence signaler can factor this in to device
> >>> + * power state decisions
> >>> + */
> >>> +static inline void dma_fence_boost(struct dma_fence *fence)
> >>> +{
> >>> +     if (fence->ops->boost)
> >>> +             fence->ops->boost(fence);
> >>> +}
> >>> +
> >>>    struct dma_fence *dma_fence_get_stub(void);
> >>>    u64 dma_fence_context_alloc(unsigned num);
> >>>
>
