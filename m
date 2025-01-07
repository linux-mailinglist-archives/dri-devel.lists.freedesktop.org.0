Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264D8A04E29
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 01:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CEE10E417;
	Wed,  8 Jan 2025 00:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="CMarliQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC4310E72B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 15:55:05 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-21675fd60feso36376745ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 07:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1736265245; x=1736870045;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0nivssl+sHZq5b9yqogA7jCYuijt9YH0VPWTfPKyGr8=;
 b=CMarliQBf/lwroGuYTp3ttI4GSbd+b1gja0I4ZLhsNkaeqiRhDiqqwll1EFPlaeoOZ
 w+nxIHff+1vlTHDl1CXRHFd9rf112oxzXjusgz2rnfKcnS/MPDBnJkZHInuNNcCsyLMt
 6mBMWpGz4IQK6Y+wDAxtrrLjK/QEKYLXG89sTE2ZWQQEMrpTnqE27+TGjxScjo6EI4jX
 bBgymiBHUmwVAGMacumDy1jzZm2VPVTy3Y6K2pf7XIi0Hs0Ha4krDl0JYUPLcmZzx3o2
 cmEGaJEu9s1fUHgjn/qTqzJNRsynH1CedvVBThlfkxUbUylpdesTiQzrOdqCpq7KNg4F
 V2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736265245; x=1736870045;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0nivssl+sHZq5b9yqogA7jCYuijt9YH0VPWTfPKyGr8=;
 b=XGQvMpo6RsbF8etxUCVU/kLDm520cjCQ0p7PQBbAh+hnFoas8IfR/eqZNJUVQfqxbl
 JpCUNbHJkVABLpVJDVev+/e77ZrYpIUfoBZ7gT0QddTCXNbr8Oy5RsY6imCq1teNe75y
 +1KSvlYTVCBWbRwX6bGvynchYBGvgBcT35e7T+HiaE2e9ruQhjpmHnJbhzBiJDJWjH2/
 0mICgXx/g9gc3TT5u9bXcF0F9U2pCprf67pIwhfgw8L5VkS4SXGKjD602Ik9bmQEGYew
 OExnqTxOuOOsUlhERoTrgc/deIz3tQ69m2868FChsFmsaV08w3r/gvtnF6gDIzLZqq7Q
 DM2Q==
X-Gm-Message-State: AOJu0YwTjx8eFOMORA5l7SLqo7UPyzKcFJIATAbpJUSWaPKFU8scZJNu
 kIDRvFoL3dHMy01Xw2uYZnqbSdgjNs2b29wzIj9gSpTbTpy1kC9jivy4mnTPPWbgUJ5lMVn/2j6
 Lb9u52lOtEcjaXAhYOd4nZ37hdqS2O5m5UkMBAR/uDy8H5DS0n/8=
X-Gm-Gg: ASbGncvsvt0G/6LqPZQTWQm2pYX/cizwvelgRpKYjV4mivhEqQq0wJ0dJD/w/JhkmQP
 tqsRLWk4Id4YdcZUo1ooT/W3mLSSV1+/Eo47yozo=
X-Google-Smtp-Source: AGHT+IET6r9izmH/Ac50ykv09O+dNs93uR5hstTvHzxKIRG4XqrCQPp1Q1EgnYhQVJPj3p3KmuaFGjcE6ZihlSyfpJs=
X-Received: by 2002:a05:690c:4a12:b0:6ef:a9da:f4b3 with SMTP id
 00721157ae682-6f3f8241eb0mr440442207b3.39.1736263327888; Tue, 07 Jan 2025
 07:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
In-Reply-To: <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Tue, 7 Jan 2025 16:21:57 +0100
X-Gm-Features: AbW1kvZXrrsg2XfN7BRglB7mDYWFo9c4lKynzhnGMvRs3BEkoRcMHKBXyWO1hAw
Message-ID: <CADGDV=U_7CdkdEiLX9kj9yHsXhwb5zP_eGXpwmrj20cmgzMAtA@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 08 Jan 2025 00:34:40 +0000
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

[...]
> > The OOPS happens because the rq member of entity is NULL in
> > drm_sched_job_arm() after the call to drm_sched_entity_select_rq().
> >
> > In drm_sched_entity_select_rq(), the code considers that
> > drb_sched_pick_best() might return a NULL value. When NULL, it assigns
> > NULL to entity->rq even if it had a non-NULL value before.
> >
> > drm_sched_job_arm() does not deal with entities having a rq of NULL.
> >
> > Fix this by leaving the entity on the engine it was instead of
> > assigning a NULL to its run queue member.
>
> Well that is clearly not the correct approach to fixing this. So clearly
> a NAK from my side.
>
> The real question is why is amdgpu_cs_ioctl() called when all of
> userspace should be frozen?
>
> Regards,
> Christian.
>

Could the OOPS happen at resume time? Might it be that the kernel
activates user-space
before all the components of the GPU finished their wakeup?

Maybe drm_sched_pick_best() returns NULL since no scheduler is ready yet?

Apart from whether amdgpu_cs_ioctl() should run at this point, I still think the
suggested change improves the code. drm_sched_pick_best() can return NULL.
drm_sched_entity_select_rq() can handle the NULL (partially).

drm_sched_job_arm() crashes on an entity that has rq set to NULL.

The handling of NULL values is half-baked.

In my opinion, you should define if drm_sched_pick_best() may put a NULL into
rq. If your answer is yes, it might put a NULL there; then, there should be a
BUG_ON(!entity->rq) after the invocation of drm_sched_entity_select_rq().
If your answer is no, the BUG_ON() should be in drm_sched_pick_best().

That helps guys with zero domain knowledge, like me, to figure out how
this is all
supposed to work.

best regards,
 Philipp
