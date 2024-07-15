Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7A931B3C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 21:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC3C10E505;
	Mon, 15 Jul 2024 19:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d93pph42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0241E10E505;
 Mon, 15 Jul 2024 19:52:03 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa6c4so6264752a12.2; 
 Mon, 15 Jul 2024 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721073122; x=1721677922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vm5SMyl1SajlZ+kyo3ZiymVtffYgMWMYgUsmBEem/So=;
 b=d93pph42SUy8GKmRWSEo/OSirYYauzlv48h9EOFHQ5FpfpeM25moqE1h1w9Me5kp+N
 jctG+4PDwYd60JP7KOpvOQ70g/xRkFMHDaFHEk/g2/otqMyzzdbgZOg8FBcH+kciNgWk
 KC8eqcsFgPRfQK2Er8NDW6zhqNLOs/ezCtkjhTDh3QtuI/djq0aHJ5Z1uwSMkcViPLY2
 r9alUZoBu4z9RE8SNpRNwOaJMIcOeoCGRu7IozUi08yUdvPKHvobOd/bPuh14ob0/mBF
 o+3qx1M9lSb/pxKAXnQIm2lgO3Pg/TygxJKjzAMHk3vZDMBtf71L9ZJ9LkQwzmr7k5q2
 UAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721073122; x=1721677922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vm5SMyl1SajlZ+kyo3ZiymVtffYgMWMYgUsmBEem/So=;
 b=mKVxrwdaDl6eVMWKvAajFl+a/IJgVQBVKlYjSke2AZsPzypGun34oZd7HEfsxRnxl+
 svL44f9wVtpg47rc2Ki4YzeVRnKzAqWVtJGeVkRF77C6fWWJ5yvgoG/Wlge3G1u2f6Di
 QJJPWIvjlc7rdIKLvyS2SoYb+9o6aic7vSEr1kNIQeHd0gCfn84aa6clJEvNFZlPu3gH
 Ekbh6a/hTcR1maNToKrGSromdI88LQouBF4iaD2FdfDt3EHy3YVBPlk73SzR5a5TQ7+A
 Dg4m2NQhj6SEAFgDMKM7m9nFz1OEx1eHFO1K0JU/DGs7rWQQ1+usfCfU/qllq+UnlYIj
 O8bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr/T2ifCLIApWF8bRrS+KfOA1ck8qmAVevAZR4S7xWIW6I5RP7Nr+K1jMG5NOPvTIox/jp0JfqHpUCiTTQVs+NvUFBUWM/gK2Uxf/3if1OPWT7SjYQ+0wwnDX5MguUNNEEOYVLkD+pg39SaKnH3hCh
X-Gm-Message-State: AOJu0YxyM+q4yRuhXNL+ylbT9tY5+FvIsQTOdHpzn3myvicN4XnN3zFZ
 VAymtxpp9z8GG9Morfu56/g1iyrP63czKYsyP+IHiOgsPtMjCnEL7akT4BkED7hYt6NsQb46RZB
 Nsyay0u4tzseLrvAC7T4R6L6mSxw=
X-Google-Smtp-Source: AGHT+IF/wXFWqnVfUWfZvf1E7JQMZRd12LmsqUnmo38aQqZPVblyaMEQ+uYoZHTft5Q5Qh1vTA62+iMgkTrH6dnOCqA=
X-Received: by 2002:a05:6402:3546:b0:599:4e93:33c9 with SMTP id
 4fb4d7f45d1cf-59e9724b8admr666193a12.12.1721073121975; Mon, 15 Jul 2024
 12:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com>
 <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
In-Reply-To: <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 15 Jul 2024 12:51:49 -0700
Message-ID: <CAF6AEGtVBarvEUqgt7SHzYwXUsjY_rVQS6aMsN00G91Dr1aWAQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 1, 2024 at 12:43=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
> > There is no recovery mechanism in place yet to recover from mmu
> > faults for DPU. We can only prevent the faults by making sure there
> > is no misconfiguration.
> >
> > Rate-limit the snapshot capture for mmu faults to once per
> > msm_kms_init_aspace() as that should be sufficient to capture
> > the snapshot for debugging otherwise there will be a lot of
> > dpu snapshots getting captured for the same fault which is
> > redundant and also might affect capturing even one snapshot
> > accurately.
>
> Please squash this into the first patch. There is no need to add code
> with a known defficiency.
>
> Also, is there a reason why you haven't used <linux/ratelimit.h> ?

So, in some ways devcoredump is ratelimited by userspace needing to
clear an existing devcore..

What I'd suggest would be more useful is to limit the devcores to once
per atomic update, ie. if display state hasn't changed, maybe an
additional devcore isn't useful

BR,
-R

>
> >
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/msm_kms.c | 6 +++++-
> >  drivers/gpu/drm/msm/msm_kms.h | 3 +++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_km=
s.c
> > index d5d3117259cf..90a333920c01 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.c
> > +++ b/drivers/gpu/drm/msm/msm_kms.c
> > @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsign=
ed long iova, int flags, void
> >  {
> >       struct msm_kms *kms =3D arg;
> >
> > -     msm_disp_snapshot_state(kms->dev);
> > +     if (!kms->fault_snapshot_capture) {
> > +             msm_disp_snapshot_state(kms->dev);
> > +             kms->fault_snapshot_capture++;
>
> When is it decremented?
>
> > +     }
> >
> >       return -ENOSYS;
> >  }
> > @@ -208,6 +211,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(s=
truct drm_device *dev)
> >               mmu->funcs->destroy(mmu);
> >       }
> >
> > +     kms->fault_snapshot_capture =3D 0;
> >       msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler=
);
> >
> >       return aspace;
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_km=
s.h
> > index 1e0c54de3716..240b39e60828 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -134,6 +134,9 @@ struct msm_kms {
> >       int irq;
> >       bool irq_requested;
> >
> > +     /* rate limit the snapshot capture to once per attach */
> > +     int fault_snapshot_capture;
> > +
> >       /* mapper-id used to request GEM buffer mapped for scanout: */
> >       struct msm_gem_address_space *aspace;
> >
> > --
> > 2.44.0
> >
>
> --
> With best wishes
> Dmitry
