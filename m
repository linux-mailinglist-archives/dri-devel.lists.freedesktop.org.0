Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E3738B0E2
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 16:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87EB6E328;
	Thu, 20 May 2021 14:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FB96E328;
 Thu, 20 May 2021 14:03:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id y14so15721802wrm.13;
 Thu, 20 May 2021 07:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wWjeE0yDrv2UVFU4YoPSFaA0vhNUTHMUSkW7tAm+lZs=;
 b=ha7DmMKmstTm/IDxLEPXsbLzHyWMhRnVBCfrz51luXRcG4CKj9+G9h0k0C8hd+9yS/
 ImcveRVof+ngVFu9eHMBpwMFjz3IYHSnTGB1B27R9Oi4Q5evsD9+XH7khVCSZ8Nn6udI
 UbPXRTi9Nf2kcoXX2Mz1mEAVk44H4TgHTAjPo1GYJ4kNQAwPKQr1Jycbu8VqaeyXhzPd
 7mWwEUR6AzTVpOqaw7o7O/bcLium6UuGw3PGO2OWaZGqY2zUCuYLyTuXbEjXam5CuX0g
 l0Lx2dGU04NXm/PvcmRarNEEdxyfj4UxxfFTLs6/ljeSaojFzMnZabLJHT3khgcF7Q4R
 CuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wWjeE0yDrv2UVFU4YoPSFaA0vhNUTHMUSkW7tAm+lZs=;
 b=VMbZoUi/C7fP7QwA/zZ5GHcGhjbMSyylCqooyrgOq9nyZrL/KjAAxUPRgu1rED6ctg
 2H9oekJ0tgzwIvWErodkzX9u6Y2SSQUV+Ck+txQI5hGa7yU8VR1rHAm/CEuPXk+sBnvb
 ykaYsyK+iBMS22wVc5VvK/T/OO7H9zD9otiMmKYvpRMKdIANz7pK35AQVrrgzFTxTSeQ
 2DoaH06qLdATmzpc8woeWVMeSOssxa+AsTNRmr6/F3gzujJMPZaDQE1BVT2YFrZ2t2QI
 AnQyuu3Y2ZnkLK3yvqnmDf4Oiuf0ms6/2DOHF0CPV25Hut8XtEY+1qrf6zxOPRFHJX4B
 LGsQ==
X-Gm-Message-State: AOAM532kJOqL4PQL5VWYbIwFzOwrnw86IAh4ZQRce80D8cOP5AhhJ3Oi
 d2byATJWcXSm3pcDlLUuSlS9B7nStDRCw1N8Jo4=
X-Google-Smtp-Source: ABdhPJxjXALW1vMWjwAXW/Cmm+rVRo5vX07MNVEQRUVTn8pdBE2VaStNbfqIkw0AI2cjwAl8vCb+jPm5+0sn+geLWPQ=
X-Received: by 2002:adf:fa46:: with SMTP id y6mr4570532wrr.83.1621519407880;
 Thu, 20 May 2021 07:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
In-Reply-To: <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 May 2021 07:07:10 -0700
Message-ID: <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
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

On Wed, May 19, 2021 at 11:47 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Uff, that looks very hardware specific to me.

Howso?  I'm not sure I agree.. and even if it was not useful for some
hw, it should be useful for enough drivers (and harm no drivers), so I
still think it is a good idea

The fallback plan is to go the i915 route and stop using atomic
helpers and do the same thing inside the driver, but that doesn't help
any of the cases where you have a separate kms and gpu driver.

> As far as I can see you can also implement completely inside the backend
> by starting a timer on enable_signaling, don't you?

Not really.. I mean, the fact that something waited on a fence could
be a useful input signal to gpu freq governor, but it is entirely
insufficient..

If the cpu is spending a lot of time waiting on a fence, cpufreq will
clock down so you spend less time waiting.  And no problem has been
solved.  You absolutely need the concept of a missed deadline, and a
timer doesn't give you that.

BR,
-R

> Christian.
>
> Am 19.05.21 um 20:38 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add a way to hint to the fence signaler that a fence waiter has missed =
a
> > deadline waiting on the fence.
> >
> > In some cases, missing a vblank can result in lower gpu utilization,
> > when really we want to go in the opposite direction and boost gpu freq.
> > The boost callback gives some feedback to the fence signaler that we
> > are missing deadlines, so it can take this into account in it's freq/
> > utilization calculations.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> >
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index 9f12efaaa93a..172702521acc 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -231,6 +231,17 @@ struct dma_fence_ops {
> >       signed long (*wait)(struct dma_fence *fence,
> >                           bool intr, signed long timeout);
> >
> > +     /**
> > +      * @boost:
> > +      *
> > +      * Optional callback, to indicate that a fence waiter missed a de=
adline.
> > +      * This can serve as a signal that (if possible) whatever signals=
 the
> > +      * fence should boost it's clocks.
> > +      *
> > +      * This can be called in any context that can call dma_fence_wait=
().
> > +      */
> > +     void (*boost)(struct dma_fence *fence);
> > +
> >       /**
> >        * @release:
> >        *
> > @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct dm=
a_fence *fence, bool intr)
> >       return ret < 0 ? ret : 0;
> >   }
> >
> > +/**
> > + * dma_fence_boost - hint from waiter that it missed a deadline
> > + *
> > + * @fence: the fence that caused the missed deadline
> > + *
> > + * This function gives a hint from a fence waiter that a deadline was
> > + * missed, so that the fence signaler can factor this in to device
> > + * power state decisions
> > + */
> > +static inline void dma_fence_boost(struct dma_fence *fence)
> > +{
> > +     if (fence->ops->boost)
> > +             fence->ops->boost(fence);
> > +}
> > +
> >   struct dma_fence *dma_fence_get_stub(void);
> >   u64 dma_fence_context_alloc(unsigned num);
> >
>
