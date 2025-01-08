Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04255A050E4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 03:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C416510E7E1;
	Wed,  8 Jan 2025 02:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jJ8JrD6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B1B10E7E1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 02:35:02 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5d7e527becaso27472265a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 18:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736303641; x=1736908441; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MTP6siuOIN5C6BhUQhyl7nhBGaiqQegbzgaOO496xE8=;
 b=jJ8JrD6IeohFRmCL/QloCasFj90ZsLpfla3GgMPYEkYNtH+fXWTVcIg2lCmOrLWaLn
 KNiOoGu23dGpz9MNbudAKlwQl8y8JlF0/bMjiotV0FRQQ3NPmr+qdKvTeECsFbFB2xSB
 eFULhJYPzV5Pze7rwBMnu2OXJYGfh1coPC0S9YbRqn1MyEk8LscqD0rv6Nl2tI7REzAE
 p8SmsI3HncyHP9qDNNyaWji/2DbQvZcOzmDXWFN5H37zllw3TS3Ht8IgvuHkzaQ1mC5B
 C3KgsRmzDSHT0TcHbWn6ZEdNjFnJNFPWZRDeOTVcBkEmUr59KTaq7hiSzh/EkZOSg51y
 z6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736303641; x=1736908441;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MTP6siuOIN5C6BhUQhyl7nhBGaiqQegbzgaOO496xE8=;
 b=PmUuKdAT8k2q5d+1eU2j9ZygFHO2zEdEiTAm8+lKtP6428vDDUWmjCv115VqfJswSp
 0rwWLH2Oj6PtWYC/cRG/fG9ITGQdP0fBeaos04OjQkMbkwyahSWf0q8Yhs9AS6NFIpuF
 Y6NDovLAQKeElkYwMqDk47ZlEgXPy0JYPTNJalITsgUGk6VhUhBtUYBLsTE6P6caoNab
 MK/mXwnHngdXJ8U2mbXRrs/B/6HOTDfstTrAHDh2Tbb0KTnM5hIRS4rJKJQRb9MUITMT
 8BnqroDeC7wlMBT2BMJOb2f/K7UTilZxr4MmFlUaPThExeT6X9A6PYdDbNGfNJUJpSEU
 nGxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpb//MgnWBtR5wSS4hOBEVIojZnccAVoyKoMEsHEC3x7R/+LWwHw/sSCo5MWD4/Y/2UrSa9jrYUO4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/6L8wJlnMl6ZksB6LAdzaapWGtrstQ1irs2B7FqQg/hMXruef
 V2zuWGoI0nidlwFfCX7FREq3SXD501n5Eb4J//coHprZ8QjVjD/oeK5XGmiw5rL83i0rBQzG1cT
 l
X-Gm-Gg: ASbGncssJsQ49B2zmr3ExrcWxDdzsVmH9cHAocpas7p3ROwjV4xsNbz7cjdDCBbwg4a
 ubQXEecS57Cc0O+kWsgnWr6EJtep1oNWGW5chEPAaBW4OUccYhFwZKvsQSo86KPlgAuRM2H1RNf
 32ep2of9KQPBm1Us9ausnBDPRSZjfm45Ge6HZu9W/iFbLIySK8Cpp1M30cWE0IQtLnBE3xYaQIY
 M9/00j/H8XZ8H3u+A2L9v0iLAnj2fFlOAoGmSUpUJZVAACsoK4gkibdLuYXaYH1yZStXEgfz+Ql
 OVKQ6xn5vcDPS5A0+c8VUSK0hWUgBZunevnI
X-Google-Smtp-Source: AGHT+IHldfpbKaYUcoqF5K4urJDwBSTDAr2GvI+99OIfZDo1Lx3FXl89iGsmD4l64asvGVI06Hywfg==
X-Received: by 2002:a05:6512:eaa:b0:542:2871:535c with SMTP id
 2adb3069b0e04-542845bf82fmr196448e87.22.1736302160893; 
 Tue, 07 Jan 2025 18:09:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422360067esm5452932e87.99.2025.01.07.18.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 18:09:19 -0800 (PST)
Date: Wed, 8 Jan 2025 04:09:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
Message-ID: <gyskd3jye43w4flhngmnelf7zaajrcqxual4ylsy5ql4xwlacd@ndzdqx77gqsj>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
 <20241217-abhinavk-smmu-fault-handler-v2-5-451377666cad@quicinc.com>
 <mbtwyyfryvltkeicgmrzrfas3u35ocathehswi4rme5tbs6r37@plcl6gzpl2ld>
 <dbe94c6b-e981-4f40-9261-2e44b5fb73cc@quicinc.com>
 <842c9230-d95a-43b8-83ed-0bfb286ee334@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <842c9230-d95a-43b8-83ed-0bfb286ee334@quicinc.com>
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

On Tue, Jan 07, 2025 at 05:34:20PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/18/2024 1:33 PM, Jessica Zhang wrote:
> > 
> > 
> > On 12/18/2024 3:20 AM, Dmitry Baryshkov wrote:
> > > On Tue, Dec 17, 2024 at 04:27:57PM -0800, Jessica Zhang wrote:
> > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > 
> > > > There is no recovery mechanism in place yet to recover from mmu
> > > > faults for DPU. We can only prevent the faults by making sure there
> > > > is no misconfiguration.
> > > > 
> > > > Rate-limit the snapshot capture for mmu faults to once per
> > > > msm_atomic_commit_tail() as that should be sufficient to capture
> > > > the snapshot for debugging otherwise there will be a lot of DPU
> > > > snapshots getting captured for the same fault which is redundant
> > > > and also might affect capturing even one snapshot accurately.
> > > > 
> > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > ---
> > > >   drivers/gpu/drm/msm/msm_atomic.c | 2 ++
> > > >   drivers/gpu/drm/msm/msm_kms.c    | 5 ++++-
> > > >   drivers/gpu/drm/msm/msm_kms.h    | 3 +++
> > > >   3 files changed, 9 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/msm_atomic.c
> > > > b/drivers/gpu/drm/msm/msm_atomic.c
> > > > index 9c45d641b5212c11078ab38c13a519663d85e10a..9ad7eeb14d4336abd9d8a8eb1382bdddce80508a
> > > > 100644
> > > > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > > > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > > > @@ -228,6 +228,8 @@ void msm_atomic_commit_tail(struct
> > > > drm_atomic_state *state)
> > > >       if (kms->funcs->prepare_commit)
> > > >           kms->funcs->prepare_commit(kms, state);
> > > > +    kms->fault_snapshot_capture = 0;
> > > > +
> > > 
> > > - Please move it before the prepare_commit().
> > > - You are accessing the same variable from different threads / cores.
> > >    There should be some kind of a sync barrier.
> > 
> > Hi Dmitry,
> > 
> > Ack, will add a lock for the snapshot capture counter.
> > 
> > Thanks,
> > 
> > Jessica Zhang
> > 
> 
> We cannot have a mutex lock because msm_kms_fault_handler cannot hold a
> mutex. So we need an atomic variable in this case.

Or a spinlock.

> 
> > > 
> > > >       /*
> > > >        * Push atomic updates down to hardware:
> > > >        */
> > > > diff --git a/drivers/gpu/drm/msm/msm_kms.c
> > > > b/drivers/gpu/drm/msm/msm_kms.c
> > > > index 78830e446355f77154fa21a5d107635bc88ba3ed..3327caf396d4fc905dc127f09515559c12666dc8
> > > > 100644
> > > > --- a/drivers/gpu/drm/msm/msm_kms.c
> > > > +++ b/drivers/gpu/drm/msm/msm_kms.c
> > > > @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg,
> > > > unsigned long iova, int flags, void
> > > >   {
> > > >       struct msm_kms *kms = arg;
> > > > -    msm_disp_snapshot_state(kms->dev);
> > > > +    if (!kms->fault_snapshot_capture) {
> > > > +        msm_disp_snapshot_state(kms->dev);
> > > > +        kms->fault_snapshot_capture++;
> > > > +    }
> > > >       return -ENOSYS;
> > > >   }
> > > > diff --git a/drivers/gpu/drm/msm/msm_kms.h
> > > > b/drivers/gpu/drm/msm/msm_kms.h
> > > > index e60162744c669773b6e5aef824a173647626ab4e..3ac089e26e14b824567f3cd2c62f82a1b9ea9878
> > > > 100644
> > > > --- a/drivers/gpu/drm/msm/msm_kms.h
> > > > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > > > @@ -128,6 +128,9 @@ struct msm_kms {
> > > >       int irq;
> > > >       bool irq_requested;
> > > > +    /* rate limit the snapshot capture to once per attach */
> > > > +    int fault_snapshot_capture;
> > > > +
> > > >       /* mapper-id used to request GEM buffer mapped for scanout: */
> > > >       struct msm_gem_address_space *aspace;
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 

-- 
With best wishes
Dmitry
