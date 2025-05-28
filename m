Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AB3AC694E
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 14:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFC910E603;
	Wed, 28 May 2025 12:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="eGxLW3r+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B888310E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 12:30:14 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3a375888297so556737f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748435412; x=1749040212; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LO5QPkQmxFsJzRiflztN9ZszXrtSheo7IjN1O6/YEeo=;
 b=eGxLW3r+BpaJSWbugOL17Q9nCN5UefE4IchHMfnz21wToxWadGW5RuKNWUz8hpIfTu
 tfixBw/8UjJmrVX+wpu/PDDVhiVVDEFl1/8Vt3O4OAe8B6iQZ1bboUxoOZNCZpM4VfgP
 qw4Nz89WvwbsNrtUnffAueZy4GTmiFuwQXKAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748435412; x=1749040212;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LO5QPkQmxFsJzRiflztN9ZszXrtSheo7IjN1O6/YEeo=;
 b=BfyCHsH5nhhiEhYY0cpnqZcOQsCfAuxrgR9ffdALhb0taIdKcLBSMRiUjHqJkXekZZ
 1FtQDa2+OkTECtBBZ/oB/Xh4ebv1ufJIjGjxO2qwerndX440nUUyt3YbqmMuA1TdprJ/
 smWKueTAb8VPPIlmjE0gm8KOTqacooaTWvhUgVlL0y5xipCrj2opR4DfLFxeLFB/D6GP
 ifNe0Wgw0cuXnT/Hm2YaBJbwBgn2C9jIET0viIi95eGYl9OlEAzMCmCNaSc559SlO/ju
 l1+UwIDKNqQy2qF+OffpYAGQjZ3CzyzdCxp+U9sISzRqvkBpiLHhnkaMy7fmA9Sf/JWP
 htKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPmqkQHNQ4agrgy0s2aJWoPvJojn1khQQAq9CvCzWMuEEEY3SCZno567zD79xYfnBib3d31rl09PU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVtAIuaD/9frJyYCuMTK9FThjuX5C8JAzX8f8LSpUE5RDnHTk2
 1On9WMJR5E1Mj6TXrHed49QiLKpH5iCC6KUcXqNo3eAHQiYOSDyYrSzqthM8bqr56t0=
X-Gm-Gg: ASbGncuD2pFz+3n6yDLnKbYVoH2eeSPms6i57BP6JzlkhBP0z+Rdrf8re0owS0WWcAa
 /8DNUWg8T8vXScVgX/0om9rC2PXM0DtYIvJ3WhUTz974SZo6Uf/1O6TuKyWHwfxSg/AliM56qJf
 LHfF0NGavQ0PuwdxYSS+pUfZl/2kHb0N36uxvBqRWUl6Snz8UbGaMwACfyaTO2QQZ+umqRY0WM8
 TD0ePoOsv590BUDyeuXolYVthUtCGqBoyrNG7SD9Vmel8TmDHRGWq+RHRNiQv0nkCYcogXtEMEA
 C+XpK0EjyXg/V6ETTbl7rRGSc4pKhFLASCdyTSImdEj9NiDnELepH9KD4HTfIPs=
X-Google-Smtp-Source: AGHT+IGCEGa4HFoW82MLiMfWrD3ZVlK3iLJn3N9oPQfimCcAn7wKldob0OS1QP44dsnfkoK9P1GoeA==
X-Received: by 2002:a05:6000:bc7:b0:3a4:e63d:2f2d with SMTP id
 ffacd0b85a97d-3a4e63d2fc1mr2965757f8f.6.1748435411861; 
 Wed, 28 May 2025 05:30:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4eac89daesm1326718f8f.44.2025.05.28.05.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 05:30:11 -0700 (PDT)
Date: Wed, 28 May 2025 14:30:08 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: phasta@kernel.org
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, tursulin@ursulin.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
Message-ID: <aDcB0AbQiHOVUyAU@phenom.ffwll.local>
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae> <aDCDJ-sK9rRI6wse@cassiopeiae>
 <cd64af4d-f5b3-4f18-9be6-636624833075@amd.com>
 <08bb986281fefb5cbdb35c63a56e1bbd923d9297.camel@mailbox.org>
 <74c4b9d8-5e25-438e-97c5-5aa2035fb9bd@amd.com>
 <cbd3eaa4c228c0d0688745e8a539103eb2278a0b.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbd3eaa4c228c0d0688745e8a539103eb2278a0b.camel@mailbox.org>
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

On Mon, May 26, 2025 at 01:27:28PM +0200, Philipp Stanner wrote:
> On Mon, 2025-05-26 at 13:16 +0200, Christian König wrote:
> > On 5/26/25 11:34, Philipp Stanner wrote:
> > > On Mon, 2025-05-26 at 11:25 +0200, Christian König wrote:
> > > > On 5/23/25 16:16, Danilo Krummrich wrote:
> > > > > On Fri, May 23, 2025 at 04:11:39PM +0200, Danilo Krummrich
> > > > > wrote:
> > > > > > On Fri, May 23, 2025 at 02:56:40PM +0200, Christian König
> > > > > > wrote:
> > > > > > > It turned out that we can actually massively optimize here.
> > > > > > > 
> > > > > > > The previous code was horrible inefficient since it
> > > > > > > constantly
> > > > > > > released
> > > > > > > and re-acquired the lock of the xarray and started each
> > > > > > > iteration from the
> > > > > > > base of the array to avoid concurrent modification which in
> > > > > > > our
> > > > > > > case
> > > > > > > doesn't exist.
> > > > > > > 
> > > > > > > Additional to that the xas_find() and xas_store() functions
> > > > > > > are
> > > > > > > explicitly
> > > > > > > made in a way so that you can efficiently check entries and
> > > > > > > if
> > > > > > > you don't
> > > > > > > find a match store a new one at the end or replace existing
> > > > > > > ones.
> > > > > > > 
> > > > > > > So use xas_for_each()/xa_store() instead of
> > > > > > > xa_for_each()/xa_alloc().
> > > > > > > It's a bit more code, but should be much faster in the end.
> > > > > > 
> > > > > > This commit message does neither explain the motivation of
> > > > > > the
> > > > > > commit nor what it
> > > > > > does. It describes what instead belongs into the changelog
> > > > > > between versions.
> > > > > 
> > > > > Sorry, this is wrong. I got confused, the commit message is
> > > > > perfectly fine. :)
> > > > > 
> > > > > The rest still applies though.
> > > > > 
> > > > > > Speaking of versioning of the patch series, AFAIK there were
> > > > > > previous versions,
> > > > > > but this series was sent as a whole new series -- why?
> > > > > > 
> > > > > > Please resend with a proper commit message, version and
> > > > > > changelog. Thanks!
> > > > 
> > > > 
> > > > Well Philip asked to remove the changelog. I'm happy to bring it
> > > > back, but yeah...
> > > 
> > > No no no no :D
> > > 
> > > Philipp asked for the changelog to be removed *from the git commit
> > > message*; because it doesn't belong / isn't useful there.
> > > 
> > > If there's a cover letter, the changelog should be in the cover
> > > letter.
> > > If there's no cover letter, it should be between the ---
> > > separators:
> > 
> > I can live with that, just clearly state what you want.
> 
> Sure thing:
> 
>  * Patches and patch series's should contain their version identifier
>    within the square brackets [PATCH v3]. git format-patch -v3 does
>    that automatically.
>  * Changelog should be as described above
>  * Ideally, cover letters always contain the full changelog, v2, v3 and
>    so on, so that new readers get a sense of the evolution of the
>    series.
> 
> > 
> > For DRM the ask is often to keep the changelog in the commit message
> > or remove it entirely.
> 
> Yup, I've seen that a few times. I think we, the DRM community, should
> stop that. It's just not useful and makes the commit messages larger,
> both for the human reader while scrolling, as for the hard drive
> regarding storage size

I do occasionally find it useful as a record of different approaches
considered, which sometimes people fail to adequately cover in their
commit messages. Also useful indicator of how cursed a patch is :-)

But as long as anything relevant does end up in the commit message and
people don't just delete stuff I don't care how it's done at all. It's
just that the cost of deleting something that should have been there can
be really nasty sometimes, and storage is cheap.
-Sima

> 
> 
> Thx
> P.
> 
> 
> > 
> > Regards,
> > Christian.
> > 
> > > 
> > > 
> > > Signed-off-by: Gordon Freeman <freeman@blackmesa.org>
> > > Reviewed-by: Alyx Vance <alyx@vance.edu>
> > > ---
> > > Changes in v2:
> > >   - Provide more docu for crowbar-alloc-function.
> > >   - Use NULL pointers for reserved xarray entries
> > > ---
> > > <DIFF>
> > > 
> > > 
> > > P.
> > > 
> > > 
> > > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > > > 
> > > > > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/scheduler/sched_main.c | 29
> > > > > > > ++++++++++++++++++--------
> > > > > > >  1 file changed, 20 insertions(+), 9 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > index f7118497e47a..cf200b1b643e 100644
> > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
> > > > > > >  int drm_sched_job_add_dependency(struct drm_sched_job
> > > > > > > *job,
> > > > > > >   struct dma_fence *fence)
> > > > > > >  {
> > > > > > > + XA_STATE(xas, &job->dependencies, 0);
> > > > > > >   struct dma_fence *entry;
> > > > > > > - unsigned long index;
> > > > > > > - u32 id = 0;
> > > > > > > - int ret;
> > > > > > >  
> > > > > > >   if (!fence)
> > > > > > >   return 0;
> > > > > > > @@ -883,24 +881,37 @@ int
> > > > > > > drm_sched_job_add_dependency(struct
> > > > > > > drm_sched_job *job,
> > > > > > >   * This lets the size of the array of deps scale with
> > > > > > > the number of
> > > > > > >   * engines involved, rather than the number of BOs.
> > > > > > >   */
> > > > > > > - xa_for_each(&job->dependencies, index, entry) {
> > > > > > > + xa_lock(&job->dependencies);
> > > > > > > + xas_for_each(&xas, entry, ULONG_MAX) {
> > > > > > >   if (entry->context != fence->context)
> > > > > > >   continue;
> > > > > > >  
> > > > > > >   if (dma_fence_is_later(fence, entry)) {
> > > > > > >   dma_fence_put(entry);
> > > > > > > - xa_store(&job->dependencies, index,
> > > > > > > fence, GFP_KERNEL);
> > > > > > > + xas_store(&xas, fence);
> > > > > > >   } else {
> > > > > > >   dma_fence_put(fence);
> > > > > > >   }
> > > > > > > - return 0;
> > > > > > > + xa_unlock(&job->dependencies);
> > > > > > > + return xas_error(&xas);
> > > > > > >   }
> > > > > > >  
> > > > > > > - ret = xa_alloc(&job->dependencies, &id, fence,
> > > > > > > xa_limit_32b, GFP_KERNEL);
> > > > > > > - if (ret != 0)
> > > > > > > +retry:
> > > > > > > + entry = xas_store(&xas, fence);
> > > > > > > + xa_unlock(&job->dependencies);
> > > > > > > +
> > > > > > > + /* There shouldn't be any concurrent add, so no need
> > > > > > > to loop again */
> > > > > > 
> > > > > > Concurrency shouldn't matter, xas_nomem() stores the pre-
> > > > > > allocated memory in the
> > > > > > XA_STATE not the xarray. Hence, I think we should remove the
> > > > > > comment.
> > > > > > 
> > > > > > > + if (xas_nomem(&xas, GFP_KERNEL)) {
> > > > > > > + xa_lock(&job->dependencies);
> > > > > > > + goto retry;
> > > > > > 
> > > > > > Please don't use a goto here, if we would have failed to
> > > > > > allocate
> > > > > > memory here,
> > > > > > this would be an endless loop until we succeed eventually. It
> > > > > > would be equal to:
> > > > > > 
> > > > > > while (!ptr) {
> > > > > > ptr = kmalloc();
> > > > > > }
> > > > > > 
> > > > > > Instead just take the lock and call xas_store() again.
> > > > > > 
> > > > > > > + }
> > > > > > > +
> > > > > > > + if (xas_error(&xas))
> > > > > > >   dma_fence_put(fence);
> > > > > > > + else
> > > > > > > + WARN_ON(entry);
> > > > > > 
> > > > > > Please don't call WARN_ON() here, this isn't fatal, we only
> > > > > > need
> > > > > > to return the
> > > > > > error code.
> > > > 
> > > 
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
