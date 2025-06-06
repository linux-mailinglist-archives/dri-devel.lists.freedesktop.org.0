Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC4AD03C0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 16:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9367510EAC0;
	Fri,  6 Jun 2025 14:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="C8WqEb86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8F110EAC0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 14:08:41 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-adb2bd27c7bso343877366b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749218920; x=1749823720; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q+SrCl/f51Q6wsvIr87A5oDPDHuMVXDJpgKBq/CGFc8=;
 b=C8WqEb86j/18liL9gEaAnh0l8LV/sPPyq0F6Xk+PnoIG5KO65r/LA8TaBzZttLj/IS
 CX7Ju6gKWeok8DtgTlEkUTWyQRByVNF0CAkepPYoUoGrlXmUgSGzqB2lYlo2bbrmZYKJ
 tSaMF+0qCptDl2O9vFu/8ybQvhLzpvZr4+T+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749218920; x=1749823720;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q+SrCl/f51Q6wsvIr87A5oDPDHuMVXDJpgKBq/CGFc8=;
 b=ZDaoVMGbA7BwjTRZc+Jq7YyX/3EOiMwqXUkAfdK5HqNN0jBySMLrttR2cCUVURbl1j
 kF3JMj3Ezm2VVxVPUwcG95+O9cp/JBnS6bgutcP0sSVKZveVQiQ0adCKNmzjjsUiRKrH
 rPgPNdnfwddrnC13tQeY4ZuC+WZK0r0XkxzR3QvpUvw5BdH/FvxLoUJP2wOVerKCbnoz
 9wbhyyoe/9o0mgp9UsetNrUhtGzRLXGoSi4pIgl/7e8fkO8BqOmvOXR1Qh6t3J1eytOg
 8BlPW4FMty7QOANd87Y38/Uf7pr9g652/3TaRdpeN/9Ip72n71z9yS9NiDwnPAM7ymNK
 VJew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUalqwS/ByoMVb5AprGKvp7ufE/isSkAHLcjIJq1t1j7SU6lGSuzRvvQrS/NEOd1dUqu/hImkRjcnA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycH1Wq+icuqt9gRVb8xmYDh5kKdirqqTrdCplU5GG7XM4SI0vQ
 4AowFWxsNWIgr5Xw4hc1ejzCYjt/8iV5FZudDAh6xdCpJBzWsQY3PTAIosWU7BGAO1s=
X-Gm-Gg: ASbGncupnijLiKJAqxv3LQtPTb0oFS6RFySAy83JMm90sT77q1t196C4nXY3tmCWQVM
 asdRyUmau99MlLfkFMwYSUFhXkDgNe+Vtk3OYjxTy8TFSLp63bLI75UbBNvWwGNXbsR3dJQlcl+
 ITyRsl/1EFhGy7UsZjiSrjApr8U8ZzLSu17tsjx6GxrD7eyto6qo79Cps28hDYd4lD618y7pQOi
 w2Wf+rG9AQ/3UyD462S+xAyQj7EwHMvsdPDHbCPiFx3qQW6tle9MfijAjhEdB3NRc4YWrq3JBnn
 7RHDRmGVG4mH+fyt3mchnDrdHSjc8s8N+3k0pXQfKK41ZclEn08gZ7PD1sQas2EHUyEiwgGeJg=
 =
X-Google-Smtp-Source: AGHT+IHFX0HnsPyTOdDAeUlo2hrNHElBrbc+CU9RgfvFeOrbV0ZvwQiJngadUTVgNhOy+/CArmmCcg==
X-Received: by 2002:a17:907:3da3:b0:ad8:a512:a9fc with SMTP id
 a640c23a62f3a-ade1a9fd897mr290273966b.42.1749218919860; 
 Fri, 06 Jun 2025 07:08:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc3abe0sm122443766b.146.2025.06.06.07.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 07:08:39 -0700 (PDT)
Date: Fri, 6 Jun 2025 16:08:37 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched: Discourage usage of separate workqueues
Message-ID: <aEL2Za28DVgbfiny@phenom.ffwll.local>
Mail-Followup-To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250604081657.124453-2-phasta@kernel.org>
 <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
 <aEBhIzccXBPyt_58@phenom.ffwll.local>
 <aEB4DFFE2C7gElRL@lstrano-desk.jf.intel.com>
 <aEB6GOTlC_Z_Rq8b@cassiopeiae>
 <aEB9/VGHJGnY4+fP@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEB9/VGHJGnY4+fP@lstrano-desk.jf.intel.com>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, Jun 04, 2025 at 10:10:21AM -0700, Matthew Brost wrote:
> On Wed, Jun 04, 2025 at 06:53:44PM +0200, Danilo Krummrich wrote:
> > On Wed, Jun 04, 2025 at 09:45:00AM -0700, Matthew Brost wrote:
> > > On Wed, Jun 04, 2025 at 05:07:15PM +0200, Simona Vetter wrote:
> > > > We should definitely document this trick better though, I didn't find any
> > > > place where that was documented.
> > > 
> > > This is a good idea.
> > 
> > I think - and I also mentioned this a few times in the patch series that added
> > the workqueue support - we should also really document the pitfalls of this.
> > 
> > If the scheduler shares a workqueue with the driver, the driver needs to take
> > special care when submitting work that it's not possible to prevent run_job and
> > free_job work from running by doing this.
> > 
> > For instance, if it's a single threaded workqueue and the driver submits work
> > that allocates with GFP_KERNEL, this is a deadlock condition.
> > 
> > More generally, if the driver submits N work that, for instance allocates with
> > GFP_KERNEL, it's also a deadlock condition if N == max_active.
> 
> Can we prime lockdep on scheduler init? e.g.
> 
> fs_reclaim_acquire(GFP_KERNEL);
> workqueue_lockdep_acquire();
> workqueue_lockdep_release();
> fs_reclaim_release(GFP_KERNEL);

+1, this should do the trick. Well strictly need GFP_NORECLAIM, so ideally
the one below for dma_fence.

> In addition to documentation, this would prevent workqueues from being
> used that allocate with GFP_KERNEL.
> 
> Maybe we could use dma_fence_sigaling annotations instead of
> fs_reclaim_acquire, but at one point those gave Xe false lockdep
> positives so use fs_reclaim_acquire in similar cases. Maybe that has
> been fixed though.

Yeah the annotation is busted because it doesn't use the right recursive
version. I thought Thomas Hellstrom had a patch once, but it didn't land
yet.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
