Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1371C6D7F38
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B13F10E991;
	Wed,  5 Apr 2023 14:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7560310E991
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:21:55 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-4fd1f2a0f82so60291a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 07:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680704513; x=1683296513;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0hEm3Bu1ajK6bUPoSCMbJz7g4+4dYw9soC8zApe4hMc=;
 b=dpunbt78Nu2bqL1/MCP1Yrvt88iEad8oMRiJF84xlTSiCngaKtk5FA3RBCcFzIOsOt
 kgwObyB+ED+hE6Et0bKNge+WJMib2ruloC80JurL5XZQySHnCnIA1r4RRQrkxWk4kT7m
 nMs2nmS1mHd/Ruhd8U1HtKNlbUAe6jhQh1GtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680704513; x=1683296513;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0hEm3Bu1ajK6bUPoSCMbJz7g4+4dYw9soC8zApe4hMc=;
 b=C93NSAwG//bGFRKAJYsBv+HtqNviEhTo4maXd+q4df+z5GKarLXNzMDwihc/K5hpl/
 6DODvjerGOYmi+/GMGoXaEJvDTtUjFqRHbIlP5vgYBu5RuG3iOCYZWVRdBeEdfU9/1uz
 zWy9+X1xZqbEnOVMf7zZHAmh6el4zYCtHZb3lif0zksPRcTOXqzqf/RHS01xpg8q0kim
 VwDg43hkVC/ocq8Jkdda0LO7V6oiS3NO7DyJ2CvIoKvA7HQDbir6F1YZFf1W1l3OnwQP
 r+qqRhM2X3Q6/hrYsOtQQB5wT7jSllGqpxb4onSKaoRNS81CcSAeAzh42eLQQ7bDL8Yt
 AzoQ==
X-Gm-Message-State: AAQBX9flmEEjYWMeF8FmXL+sdmVFdXsROC6hpFsGdAqLQjyuUWb+PTmI
 pBD9iAiXojQMhnYsAml+YXiXzw==
X-Google-Smtp-Source: AKy350bxxApiu6QlBT7LFjNT5HOmCcGl6WDZP6khnW7b0dJcrSCSEyjhjNy22KbR8irHrR8fUaM/Aw==
X-Received: by 2002:a17:906:2093:b0:933:2e79:4632 with SMTP id
 19-20020a170906209300b009332e794632mr2053178ejq.1.1680704513565; 
 Wed, 05 Apr 2023 07:21:53 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 r6-20020a1709064d0600b0093034e71b94sm7467929eju.65.2023.04.05.07.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 07:21:53 -0700 (PDT)
Date: Wed, 5 Apr 2023 16:21:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Message-ID: <ZC2D/pQsNgaoSzzh@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Karol Herbst <kherbst@redhat.com>,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <ZC16Q8MhHEcutX1b@phenom.ffwll.local>
 <20502c4c-c987-3117-119a-2fd38ae5f607@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20502c4c-c987-3117-119a-2fd38ae5f607@amd.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Karol Herbst <kherbst@redhat.com>, Asahi Lina <lina@asahilina.net>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 04:14:11PM +0200, Christian König wrote:
> Am 05.04.23 um 15:40 schrieb Daniel Vetter:
> > On Tue, Mar 07, 2023 at 11:25:35PM +0900, Asahi Lina wrote:
> > > Some hardware may require more complex resource utilization accounting
> > > than the simple job count supported by drm_sched internally. Add a
> > > can_run_job callback to allow drivers to implement more logic before
> > > deciding whether to run a GPU job.
> > > 
> > > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > Ok scheduler rules, or trying to summarize the entire discussion:
> > 
> > dma_fence rules are very tricky. The two main chapters in the docs are
> > 
> > https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#dma-fence-cross-driver-contract
> > https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#indefinite-dma-fences
> > 
> > Unforutunately I don't think it's possible to check this at compile time,
> > thus far all we can do is validate at runtime. I've posted two patches for
> > this:
> > 
> > https://lore.kernel.org/dri-devel/20201023122216.2373294-17-daniel.vetter@ffwll.ch/
> > https://lore.kernel.org/dri-devel/20201023122216.2373294-20-daniel.vetter@ffwll.ch/
> > 
> > Unfortunately most drivers are buggy and get this completely wrong, so
> > realistically we'd need to make this a per-driver opt-out and annotate all
> > current drivers. Well except amdgpu is correct by now I think (they'd
> > still need to test that).
> 
> There is still one potential memory allocation in the run_job callback in
> amdgpu which I wasn't able to fix yet.
> 
> But that one is purely academic and could potentially be trivially replaced
> with using GFP_ATOMIC if we ever have to.

I think the modeset in the tdr code was more scary, and I'm not sure you
really managed to get rid of absolutely everything in there yet.
-Daniel

> 
> Christian.
> 
> >   And Rob Clark is working on patches to fix up
> > msm.
> > 
> > I think best here is if you work together with Rob to make sure these
> > annotations are mandatory for any rust drivers (I don't want new buggy
> > drivers at least). Would also be great to improve the kerneldoc for all
> > the driver hooks to explain these restrictions and link to the relevant
> > kerneldocs (there's also one for the dma_fence signalling annotations
> > which might be worth linking too).
> > 
> > I don't see any way to make this explicit in rust types, it's really only
> > something runtime tests (using lockdep) can catch. Somewhat disappointing.
> > 
> > For the other things discussed here:
> > 
> > - Option<Dma_Fence> as the return value for ->prepare_job makes sense to
> >    me.
> > 
> > - I don't see any way a driver can use ->can_run_job without breaking the
> >    above rules, that really doesn't sound like a good idea to me.
> > 
> > Cheers, Daniel
> > 
> > > ---
> > >   drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++++++
> > >   include/drm/gpu_scheduler.h            |  8 ++++++++
> > >   2 files changed, 18 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 4e6ad6e122bc..5c0add2c7546 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1001,6 +1001,16 @@ static int drm_sched_main(void *param)
> > >   		if (!entity)
> > >   			continue;
> > > +		if (sched->ops->can_run_job) {
> > > +			sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> > > +			if (!sched_job) {
> > > +				complete_all(&entity->entity_idle);
> > > +				continue;
> > > +			}
> > > +			if (!sched->ops->can_run_job(sched_job))
> > > +				continue;
> > > +		}
> > > +
> > >   		sched_job = drm_sched_entity_pop_job(entity);
> > >   		if (!sched_job) {
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > index 9db9e5e504ee..bd89ea9507b9 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -396,6 +396,14 @@ struct drm_sched_backend_ops {
> > >   	struct dma_fence *(*prepare_job)(struct drm_sched_job *sched_job,
> > >   					 struct drm_sched_entity *s_entity);
> > > +	/**
> > > +	 * @can_run_job: Called before job execution to check whether the
> > > +	 * hardware is free enough to run the job.  This can be used to
> > > +	 * implement more complex hardware resource policies than the
> > > +	 * hw_submission limit.
> > > +	 */
> > > +	bool (*can_run_job)(struct drm_sched_job *sched_job);
> > > +
> > >   	/**
> > >            * @run_job: Called to execute the job once all of the dependencies
> > >            * have been resolved.  This may be called multiple times, if
> > > 
> > > -- 
> > > 2.35.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
