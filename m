Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D46603D0195
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 20:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088EB6E207;
	Tue, 20 Jul 2021 18:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394C26E207;
 Tue, 20 Jul 2021 18:26:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso91301wmj.4; 
 Tue, 20 Jul 2021 11:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6pTsiDANPzE+73zIk+e131AENTpGYx6/K/T08KfKqSY=;
 b=rJHFVliEPX28A8ivueoovRHJCaPLx1JYakGI+Kltutr3lDY7jcMM0dlibAXtgsSlxx
 VNidQjxvWhTQSDem0TW46RIHJTCJfMcnIl9KgO77f4doAJuLSdJvRwR/MUaV8YWwZVJt
 Ntl1JK05U8LhxeQJwa07Deb0fyazNlHhgcjf5dyF2QMjMCrY7Elo9n+ZhP6ppBwqHrDP
 ByTvSHCMrXuF7YmWynnI2hl+1drw8/QUP2yjRR4bXZW9WschJmd3ggESfnAPMMaWShLh
 DWkp6xdJoV31GVjmyCNVYfiNAsmk2J2H14dSuoRLWqAXw4amZ1f9aE+uSocks9ogetOa
 ndug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6pTsiDANPzE+73zIk+e131AENTpGYx6/K/T08KfKqSY=;
 b=T8LNg+6LizS4/ilIX23G7l58Gv0x3ETKoE17Hc9MItCLdP9KHyM7q1b45+2FO/RD2y
 hxKtaIrnB+Qn/WZ1iY4SESJuYSkZZC8rs9XjnYrxfvkFdhO8NOE5h44MH4NjOrW8SSoh
 xPdtkuxbZXCNxop76pGt20YwoNgB8+0fRsUXo3gHt5R7zU/YYpq0csRH2WRCVx3tg6ew
 AwtgAvCZVIo7YvHTcmd+StZAwah06GlG+Q2YpaaizjR7VG0mI3oi2RU22H37ooWDHpCM
 zFVtZtpKE8UR/JqyXkVAQJyRTD7mSxGDGYdlTDdSAsFGOXHrjrHjG2QcYKnspLkpP+87
 7wzQ==
X-Gm-Message-State: AOAM532kSxaYR/tVAXOvVUtJX3S+exwk0sNjBVrNr8hQnVJW5R5xe4su
 /ULeEut46wDukqD+esQSR9kJdi2CF7tDgDeRB48=
X-Google-Smtp-Source: ABdhPJy1XY32wnst0FtwN54MJ1oMF78e5Su0jyufLkmfk9sQSnHd9sq8CidwadgCIEKN1YZgSPzBhcVIfLMz1Nyg8fU=
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr39566638wmc.123.1626805604844; 
 Tue, 20 Jul 2021 11:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210720150716.1213775-1-robdclark@gmail.com>
 <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
In-Reply-To: <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 20 Jul 2021 11:30:53 -0700
Message-ID: <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
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

On Tue, Jul 20, 2021 at 11:03 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi Rob,
>
> Am 20.07.21 um 17:07 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Somehow we had neither ->wait() nor dma_fence_signal() calls, and no
> > one noticed.  Oops.
>
>
> I'm not sure if that is a good idea.
>
> The dma_fence->wait() callback is pretty much deprecated and should not
> be used any more.
>
> What exactly do you need that for?

Well, the alternative is to track the set of fences which have
signalling enabled, and then figure out which ones to signal, which
seems like a lot more work, vs just re-purposing the wait
implementation we already have for non-dma_fence cases ;-)

Why is the ->wait() callback (pretty much) deprecated?

BR,
-R

> Regards,
> Christian.
>
> >
> > Note that this removes the !timeout case, which has not been used in
> > a long time.
>
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_fence.c | 59 +++++++++++++++++++-------------=
-
> >   1 file changed, 34 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_=
fence.c
> > index cd59a5918038..8ee96b90ded6 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.c
> > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > @@ -38,11 +38,10 @@ static inline bool fence_completed(struct msm_fence=
_context *fctx, uint32_t fenc
> >       return (int32_t)(fctx->completed_fence - fence) >=3D 0;
> >   }
> >
> > -/* legacy path for WAIT_FENCE ioctl: */
> > -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > -             ktime_t *timeout, bool interruptible)
> > +static signed long wait_fence(struct msm_fence_context *fctx, uint32_t=
 fence,
> > +             signed long remaining_jiffies, bool interruptible)
> >   {
> > -     int ret;
> > +     signed long ret;
> >
> >       if (fence > fctx->last_fence) {
> >               DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (=
of %u)\n",
> > @@ -50,33 +49,34 @@ int msm_wait_fence(struct msm_fence_context *fctx, =
uint32_t fence,
> >               return -EINVAL;
> >       }
> >
> > -     if (!timeout) {
> > -             /* no-wait: */
> > -             ret =3D fence_completed(fctx, fence) ? 0 : -EBUSY;
> > +     if (interruptible) {
> > +             ret =3D wait_event_interruptible_timeout(fctx->event,
> > +                     fence_completed(fctx, fence),
> > +                     remaining_jiffies);
> >       } else {
> > -             unsigned long remaining_jiffies =3D timeout_to_jiffies(ti=
meout);
> > -
> > -             if (interruptible)
> > -                     ret =3D wait_event_interruptible_timeout(fctx->ev=
ent,
> > -                             fence_completed(fctx, fence),
> > -                             remaining_jiffies);
> > -             else
> > -                     ret =3D wait_event_timeout(fctx->event,
> > -                             fence_completed(fctx, fence),
> > -                             remaining_jiffies);
> > -
> > -             if (ret =3D=3D 0) {
> > -                     DBG("timeout waiting for fence: %u (completed: %u=
)",
> > -                                     fence, fctx->completed_fence);
> > -                     ret =3D -ETIMEDOUT;
> > -             } else if (ret !=3D -ERESTARTSYS) {
> > -                     ret =3D 0;
> > -             }
> > +             ret =3D wait_event_timeout(fctx->event,
> > +                     fence_completed(fctx, fence),
> > +                     remaining_jiffies);
> > +     }
> > +
> > +     if (ret =3D=3D 0) {
> > +             DBG("timeout waiting for fence: %u (completed: %u)",
> > +                             fence, fctx->completed_fence);
> > +             ret =3D -ETIMEDOUT;
> > +     } else if (ret !=3D -ERESTARTSYS) {
> > +             ret =3D 0;
> >       }
> >
> >       return ret;
> >   }
> >
> > +/* legacy path for WAIT_FENCE ioctl: */
> > +int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> > +             ktime_t *timeout, bool interruptible)
> > +{
> > +     return wait_fence(fctx, fence, timeout_to_jiffies(timeout), inter=
ruptible);
> > +}
> > +
> >   /* called from workqueue */
> >   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
> >   {
> > @@ -114,10 +114,19 @@ static bool msm_fence_signaled(struct dma_fence *=
fence)
> >       return fence_completed(f->fctx, f->base.seqno);
> >   }
> >
> > +static signed long msm_fence_wait(struct dma_fence *fence, bool intr,
> > +             signed long timeout)
> > +{
> > +     struct msm_fence *f =3D to_msm_fence(fence);
> > +
> > +     return wait_fence(f->fctx, fence->seqno, timeout, intr);
> > +}
> > +
> >   static const struct dma_fence_ops msm_fence_ops =3D {
> >       .get_driver_name =3D msm_fence_get_driver_name,
> >       .get_timeline_name =3D msm_fence_get_timeline_name,
> >       .signaled =3D msm_fence_signaled,
> > +     .wait =3D msm_fence_wait,
> >   };
> >
> >   struct dma_fence *
>
