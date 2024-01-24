Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892E9839DF0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 02:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEA910F4BE;
	Wed, 24 Jan 2024 01:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A4C10EC8A;
 Wed, 24 Jan 2024 01:05:14 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-55c932f7fcbso1227666a12.3; 
 Tue, 23 Jan 2024 17:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706058253; x=1706663053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oq5Oc44lN6Y/fdmZbA+lICY4LBnbi9LJB6fS0kTmo50=;
 b=ULGPQRt1E6GNf+OtlSK4WrZnHcN6x7+gDPprZvmmT5XEGXLO+HCR15lCLbxTplSMJW
 APtZ/Z68100Ew098ndXl/Ami3/VPlcsb5A4rNIECoPIM5N80SgpF7kc1BoaWGGJ0hCeX
 2Gg6DECWRWnbuQcBnXtXMUNBZeoG/1I6ecPudELSpiVEGETT51AuItzDK14UPQJwaHm0
 kJ75gjC7DLVLRJrfiW2RHCgn++xXMYhLck/g5mOdCH67Fxevg+vSMg58oe1IypV0qyuL
 pFME6jlHu3qNok5jDfcgJXMfYhjyL6ydMXpHSqGNYnilMkl56PhX7tErJT7Jom+ai9J6
 0i0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706058253; x=1706663053;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oq5Oc44lN6Y/fdmZbA+lICY4LBnbi9LJB6fS0kTmo50=;
 b=t0QZxAVMHUFgat+6aK8e23uNgEU+s9WdmRdK96LUB4IR19ps7lo7VExEdpXo6ebOZq
 tI9OcDozbVHeBnkGk2D2WTxMkKRuyJJ4JBWjCg4El5IHole4gDH/FD43dv8R36IMge3B
 LZuA8fNg8mF62XGIAn03fgbpAlZLJPizoHANX1s/j2mTc9v4eqL5GA2LWMCrwsURbg3G
 CNz04sYDqKM4E2oT0GX9x8mM/4MM5gxXnNSICJDqWmrPqxyqC1u1SVD8eH66Ks73IRRW
 2tr8BA90Ksf0vMXLAaRdTha0mcPEPeWiGzj4CAURxUxs2wihO3hYwe7kYawTHdUd6bye
 +pIw==
X-Gm-Message-State: AOJu0Ywbntc2YDLEVhbbBgYFvc7fOj6f60LwPCvw1jP0t0Tu7YJh+B8/
 z8xT1yTYe3FWmRKa0mHhmnCwxRBFeWFYVA23de+0Pi27+1dwY8xS+w450GbLwCgHsEGEzzlS0Lb
 /oI6nIr7MQAdNEqSVDiYJBhov+do=
X-Google-Smtp-Source: AGHT+IEInUKF+6tZk6TsgyVVN7h6LAF89fWaSLdEWwIidNLYKA6PQx6rGaHVRXnYyIl2i/OhkyDb7gSTxH/atAAjDI4=
X-Received: by 2002:aa7:db59:0:b0:55a:5608:8bb3 with SMTP id
 n25-20020aa7db59000000b0055a56088bb3mr1352541edt.57.1706058252729; Tue, 23
 Jan 2024 17:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-2-nunes.erico@gmail.com>
 <CAKGbVbsydzXyKuhN8VyW9zYwuOMWzvz192WKKReHVX1XCnuXGQ@mail.gmail.com>
 <CAK4VdL2PnWTZ+M2eQqF22+VuF-YGKb_WjG=168BcuBDqD8+9kA@mail.gmail.com>
 <CAKGbVbvWAM64T+a6_VRL99araN_2dubu4vO=mqzCoC1p2m_X-g@mail.gmail.com>
 <CAK4VdL3Tp33Wi5fmsh92XFWP8GE3TZMa473a=FeZajgnHn2mbA@mail.gmail.com>
In-Reply-To: <CAK4VdL3Tp33Wi5fmsh92XFWP8GE3TZMa473a=FeZajgnHn2mbA@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Wed, 24 Jan 2024 09:03:59 +0800
Message-ID: <CAKGbVbsw+19VFJXmeYsk6SPP+uZtwXHrvxuQuebRFnTGdFuBFQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] drm/lima: fix devfreq refcount imbalance for job
 timeouts
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, anarsoul@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 7:19=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> On Fri, Jan 19, 2024 at 2:50=E2=80=AFAM Qiang Yu <yuq825@gmail.com> wrote=
:
> >
> > On Thu, Jan 18, 2024 at 7:14=E2=80=AFPM Erico Nunes <nunes.erico@gmail.=
com> wrote:
> > >
> > > On Thu, Jan 18, 2024 at 2:36=E2=80=AFAM Qiang Yu <yuq825@gmail.com> w=
rote:
> > > >
> > > > So this is caused by same job trigger both done and timeout handlin=
g?
> > > > I think a better way to solve this is to make sure only one handler
> > > > (done or timeout) process the job instead of just making lima_pm_id=
le()
> > > > unique.
> > >
> > > It's not very clear to me how to best ensure that, with the drm_sched
> > > software timeout and the irq happening potentially at the same time.
> > This could be done by stopping scheduler run more job and disable
> > GP/PP interrupt. Then after sync irq, there should be no more new
> > irq gets in when we handling timeout.
> >
> > > I think patch 4 in this series describes and covers the most common
> > > case that this would be hit. So maybe now this patch could be dropped
> > > in favour of just that one.
> > Yes.
>
> After dropping the patch while testing to send v2, I managed to
> reproduce this issue again.
> Looking at a trace it seems that this actually happened with the test wor=
kload:
> lima_sched_timedout_job -> (fence by is not signaled and new fence
> check is passed) -> irq happens preempting lima_sched_timedout_job,
> fence is signaled and lima_pm_idle called once at
> lima_sched_pipe_task_done -> lima_sched_timedout_job continues and
> calls lima_pm_idle again
>
> So I think we still need this patch to at least prevent the bug with
> the current software timeout. If we move to the hardware watchdog
> timeout later we might be able to remove it anyway, but that will
> still require separate work and testing.
>
Then you do need to solve the IRQ and reset race by disabling GP/PP
IRQ and sync irq after drm_sched_stop(). I mean you may keep the
patch 4 for spurious timeout, and add a new patch for solving the IRQ
and reset race.

Disable pm idle does not solve the race completely, other reset logic
may also conflict if not sequence the IRQ and reset .
