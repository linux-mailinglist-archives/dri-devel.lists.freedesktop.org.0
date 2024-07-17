Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746C39341B4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 19:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8D910E31A;
	Wed, 17 Jul 2024 17:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T3xy/HzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72E110E33E;
 Wed, 17 Jul 2024 17:52:53 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70b703eda27so3425259b3a.3; 
 Wed, 17 Jul 2024 10:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721238773; x=1721843573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rna1ycVmGq1fLlGbs8yKWKJ2/BIlmM0qUkUIHG8aceI=;
 b=T3xy/HzSa2HE3zs39Ej4/d4aE7WFLVEUziweG7HuyqvTH76wxOaOEyR/XDgPSWOcm+
 oKo9THsb46Q+8ekO7ErSGwZGxJ5Sp1Paq82FL2gUYs1kiXclKNmcshqt1bbKoL5xkhtp
 SnjRqglyfgzlqqLfm+AFjsfGiU2sUtyFhfQZnZNZUTt8bN/UYCGUdXW2ZuUVAI5sSWbD
 q3H+QT0/H2mMDF5kZk0JEFZPMupxt/lmy4Gyfd3PIWKD5uRFYqZP5C7TaBQaA6wB8CsN
 hyvk6/jhr4H+5vNpp4d9P81dTj87cmo68SMr43trXnUUq2sPuGgolJljAJJU+VAaXl6x
 dj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721238773; x=1721843573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rna1ycVmGq1fLlGbs8yKWKJ2/BIlmM0qUkUIHG8aceI=;
 b=TvMdmv1qqDhPIXcDsVrm1KhXV9W5DCkCIL3aqbkE88HdruNsvGEaYUrdarKzaflADO
 6ZyNGnsMA/u9Ai9+/F+vH3GlMypxZiCxhPDwPo5ML6QFR3aTxYG2T/YRnLlYgZllWILF
 MwsaqXUbo24ZVlBvFF/RmCfGzA4vItwctnKmkJGy3neY9XKGmGsLUWrZO7nO63xxkhCh
 2NAeuR5hk0C6Aoc69Rga9bja43DA8MpKVBgqxDJygQqBfEdhtysDfHPk0UE02BaWSHhz
 yjw/WfLsZ15MHhJZ9irT8v7dpVKP9v559Xs+IDpAxRERRa8TW7v2ZCR8TrQM+EbnLmTa
 ZuKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7+7xeQJIK6ut0mfMhg5jfJ3WSm2TSsdrH8LiqAwXpWpQnhL/k1N+HRPTKxyM2YfTItVG0vRraAy6/Bh7EbLSvlzsepX/VYk2ntv1l7Q5Wteul4ZgVl9O0nYB6E11Wyn5aFwfj24WAjfHbQIakMmPd
X-Gm-Message-State: AOJu0Yyy9Twy7VxvFoW4wZxhPyVeYxM15onBfY6LG6hDaA5sdjlWX61H
 5+m5pnX4WLQq0RzEPDjyTEqwo5rFx543sTfLZxKpgozaKy9vzKTbu760OhOFCERDiEGEt4fcpM/
 UhcucyoFQRWG1OEk5GbaeZ6FJxM8=
X-Google-Smtp-Source: AGHT+IGf2woxKzbXZ1jb3lLtB+1KozyeXPrGVuFDolnHnJC8V1hfI9Od69EnykI1/InG8n6/gtTJXrmZR7c6vNRvqsk=
X-Received: by 2002:a05:6a20:729a:b0:1c2:8cf4:766c with SMTP id
 adf61e73a8af0-1c3fdcafebcmr3235744637.33.1721238773094; Wed, 17 Jul 2024
 10:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <CACu1E7HROtx1Zgyy0EJuHj_HWE8Nd6OtFnxTcrDrHP+2HA5o6A@mail.gmail.com>
 <Zpfx_xnRmwoMkSFw@trashcan>
In-Reply-To: <Zpfx_xnRmwoMkSFw@trashcan>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 17 Jul 2024 18:52:41 +0100
Message-ID: <CACu1E7GiEDF_uspowmAQKNiBqLX4RZjP6obL2YLOFA9-ctroRQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] fixes for Adreno A5Xx preemption
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 17, 2024 at 5:33=E2=80=AFPM Vladimir Lypak <vladimir.lypak@gmai=
l.com> wrote:
>
> On Wed, Jul 17, 2024 at 10:40:26AM +0100, Connor Abbott wrote:
> > On Thu, Jul 11, 2024 at 11:10=E2=80=AFAM Vladimir Lypak
> > <vladimir.lypak@gmail.com> wrote:
> > >
> > > There are several issues with preemption on Adreno A5XX GPUs which
> > > render system unusable if more than one priority level is used. Those
> > > issues include persistent GPU faults and hangs, full UI lockups with
> > > idling GPU.
> > >
> > > ---
> > > Vladimir Lypak (4):
> > >   drm/msm/a5xx: disable preemption in submits by default
> > >   drm/msm/a5xx: properly clear preemption records on resume
> > >   drm/msm/a5xx: fix races in preemption evaluation stage
> > >   drm/msm/a5xx: workaround early ring-buffer emptiness check
> > >
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 18 ++++++++++----
> > >  drivers/gpu/drm/msm/adreno/a5xx_gpu.h     | 12 ++++++---
> > >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 30 ++++++++++++++++++++-=
--
> > >  3 files changed, 47 insertions(+), 13 deletions(-)
> > > ---
> > > base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
> > > --
> > > 2.45.2
> > >
> >
> > Hi Vladimir,
>
> Hi Connor!
>
> >
> > While looking at preemption on a7xx, where the overall logic is pretty
> > much the same, and I've been seeing the same "soft lockups". However
> > even after porting patch 3, it turns out that's not enough because
> > there's a different race. The sequence of events is something like
> > this:
> >
> > 1. Medium-prio app A submits to ring 2.
> > 2. Ring 0 retires its last job and we start a preemption to ring 2.
> > 3. High-prio app B submits to ring 0. It sees the preemption from step
> > 2 ongoing and doesn't write the WTPR register or try to preempt.
> > 4. The preemption finishes and we update WPTR.
> At this point with patch 3 applied it should switch to ring 0 right away
> because of trigger call in the end of a5xx_preempt_irq. Didn't you
> forget it? Downstream has such call too. Even though it makes preemption
> a little more aggressive it doesn't work without it.

Yes, I didn't apply that bit because it didn't seem necessary to fix
the original issue you described and it seemed like just an
optimization to make preemption more aggressive, however it does seem
to fix the issue. I can't verify that the issue you describe (the
retire IRQ arriving before preemption IRQ) is what's actually
happening because adding a tracepoint on retire seems to change the
timing enough so that the lockup doesn't happen, though. So I guess
I'll just have to assume that's what it was.

Given how subtle this is, enough that I missed it, maybe it's worth a
comment and an extra commit.

Also, I forgot to mention that while I was reading this over I found
another (theoretical) race - we could flush a submit in between
calling update_wptr() and set_preempt_state(PREEMPT_NONE) in
a5xx_preempt_irq() and never update wptr. I would fix it by renaming
PREEMPT_ABORT to PREEMPT_FINISH and pulling out the ABORT ->
update_wptr() -> NONE sequence in a5xx_preempt_trigger() into a
separate function that also gets called in a5xx_preempt_irq().

Connor

>
> > 5. App A's submit retires. We try to preempt, but the submit and
> > ring->cur write from step 3 happened on a different CPU and the write
> > hasn't landed yet so we skip it.
>
> I don't think this is possible on modern CPUs. Could it be that retire
> IRQ appeared earlier (while it was switching from 0 to 2) and you are
> looking at msm_gpu_submit_retired trace event which is called from
> retire work later.
>
> >
> > It's a bit tricky because write reordering is involved, but this seems
> > to be what's happening - everything except my speculation about the
> > delayed write to ring->cur being the problem comes straight from a
> > trace of this happening.
> >
> > Rob suggested on IRC that we make retire handling happen on the same
> > workqueue as submissions, so that preempt_trigger is always
> > serialized, which IIUC would also make patch 3 unnecessary. What do
> > you think?
>
> In this patch series i have tried to do least amount of changes so it
> could be easily back-ported. It isn't pretty but it works reliably for
> me. Otherwise it would be fine to just disable preemption like it's done
> on LTS before 5.4 and rework preemption in new kernel releases.
>
> Kind regards,
>
> Vladimir
>
> >
> > Best regards,
> >
> > Connor
