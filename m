Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9FE683452
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 18:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844D010E2CA;
	Tue, 31 Jan 2023 17:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5FC10E2A5;
 Tue, 31 Jan 2023 17:52:16 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-142b72a728fso20334583fac.9; 
 Tue, 31 Jan 2023 09:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LvRJCjwGaPsO0VZxQljVxd6po8uJKlXdXleC1Xrg8AA=;
 b=LFKbpq1IN0POl7ZGXZTHCHX2Trh/qn7GO54tGnkgut1ZSsVHiLCvSy8fXuTARn7BLz
 qG5iYto6kOm5fv/nFqOT9FLPT7FmGwy10EvcrhcnPh7pPOzoJcxILBZE0Alxsu0QapO6
 AdbYZCufSJQgC4kL3NymUqWS+/Wgv4pONLg4zMtJCI1ZK6XnxdPNBQF/oUogrn6+KRB4
 qFZziAL6qlMHCBKZ2ZxZW9rdzoV4C4N7E2Iw68+N7xmgTfEZHci1s6Tyj1HecNPfr4mm
 pCOQFNGRR7soWRXO/tFFrpD/29FYfNJIDjCwJdrGv5v3RusyeuD6B0W+BgiTF6CJUxPp
 3l/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LvRJCjwGaPsO0VZxQljVxd6po8uJKlXdXleC1Xrg8AA=;
 b=V5ooEjCOuUvLTiLz4EdytqeJrt4vqR+TOsDRpRyd4dQQjx/o9MqPB2pevi40jGcfPF
 WugsG6dWwfV3Zr5CbMDHopXHWTtnkGLRtqZH9Kk/XpFsY2cHbaU9uCZl9A15mRwom+wP
 NZrEmGdoYoyDTFGBVZW7wkl8F+61FgFei2IRH1qD9Ouu/0LLH+WtrcCyvQSmdsI+cxyv
 2GQ2PFXMeJ+yR/Y/DmrkQdnvMzXs3bxjrGpKPtfzVKeztTL4/3yrCq4KtOzzrD6ckWiG
 qixfynknHHAETTGZNPqUKCrDTLWtUxgO5hIm6C92szKyO0Za3cJj+a6KVFHnDgvtxq3v
 n7bw==
X-Gm-Message-State: AO0yUKXkAukky4pk7OrBmhlxvL9ozcqID4sy3QNzyPjWxG7BS5CCvZ/j
 uChPBEKUnjN983MQGQtD7rgusPJMJxkvb/mLk3g=
X-Google-Smtp-Source: AK7set9TCDaM82Ou2xXpyh1Z8Ws19WoPF5dhx6uL7BSRA3p9Snt4Kdo9vGv7pSffavzUMtV2u4ZfotohCSsBTxpu+Ck=
X-Received: by 2002:a05:6870:580e:b0:163:a303:fe2f with SMTP id
 r14-20020a056870580e00b00163a303fe2fmr975836oap.96.1675187534670; Tue, 31 Jan
 2023 09:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
 <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
 <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
 <DM5PR12MB24693E815CAB63FE2DE06E4CF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <DM5PR12MB24696F955FF95A7AB00E1956F1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <984ee981-2906-0eaf-ccec-9f80975cb136@amd.com>
 <DM5PR12MB246930987580ACA15EA44C2BF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <6a5bea62-b711-6f2e-b366-a1083bc7327f@igalia.com>
In-Reply-To: <6a5bea62-b711-6f2e-b366-a1083bc7327f@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Jan 2023 12:52:03 -0500
Message-ID: <CADnq5_OdBJiDa9Y2s6orJu7Ez0Lkx37xceHhfDCDnKNKdvpT7g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 9:32 AM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> On 31/01/2023 10:58, Chen, Guchun wrote:
> > Hi Christian,
> >
> > Do you think if it makes sense that we can set 'ring->sched.ready' to be true in each ring init, even if before executing/setting up drm_sched_init in amdgpu_device_init_schedulers? As 'ready' is a member of gpu scheduler structure.
> >
> > Regards,
> > Guchun
> >
>
> Hi folks, thanks a lot for the feedback so far, much appreciated!
>
> I'm feeling a bit confused specially since there seems to be 2
> orthogonal (yet related) topics being discussed; let me try to summarize
> my understanding and we can then further discuss better:
>
> (a) The first problem is the one addressed in the patch - how to prevent
> drm_sched_fini() to get called if drm_sched_init() wasn't called?
>
> I've proposed sched.name, seems Christian prefers sched.ops, correct?
>
>
> (b) We can't use sched.ready, which would make sense...but amdgpu
> overrides its meaning, the driver manipulates this value for its own
> purposes of tracking ring init, or something like that.
>
> This is the tangential topic: what should we do here? My understanding
> of Alex's message is that we could have a "ready" field in the ring
> structure and stop messing with sched.ready - does it make sense Alex?

Yes, I think so.  The tricky part will be figuring out which current
sched.ready checks are checking for the scheduler being ready vs.
whether the ring itself is ready.

>
> Guchun / Christian, does it also make sense for you?
>
>
> Regarding (a), I could re-submit having s/sched.name/sched.ops, no
> biggies, I tested both to be fair, before sending...I just chose name
> but any field that is proper initialized on drm_sched_init() would work.

Yeah, I think ops is fine.  You could even use sched.ready after we
clean up the use of that in the driver.  There are already a bunch of
places where we check sched.ready to check if the scheduler really is
ready.

Alex

>
> Thanks,
>
>
> Guilherme
