Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA268AC6A6D
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A19A10E5F4;
	Wed, 28 May 2025 13:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PwW8Mmxb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320E210E5E1;
 Wed, 28 May 2025 13:29:42 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-31141a8e6c9so601636a91.3; 
 Wed, 28 May 2025 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748438982; x=1749043782; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XNEGmM0JlP9wq6opyDQ0PfkvRzw7tQOL49la3yXZ13c=;
 b=PwW8MmxbIkMwOrrNZI2B6BTprWmfC9yTE9olQ2vYAZ7+7wYbhfyPVKn7G6XkpBWY7z
 s1xIGZql6GmAJ8COWnNaoT0UgiMl+pu1fjjU7zPvLRWvf42mNaPos8H9RUcFfij9uOWl
 djBO5OQTOsv+Y/QYPDIRoZrF4uNa9Hv2vaTDb9reH3f5OvRulnJccjGlccyJoh9XA4ls
 MaU3aEQQpl+bjMdr1oQCGsswR9crckquB/gxMLNBX7CUkAdHiZ4JSKpptjQQh1F3Vao6
 5jFzujRXw/1MfUwJeCU4bKho2ZiDVJ21Ij1GJNw0XR9TCTxawnpVfXuOT7HhpIVGvlh/
 rcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748438982; x=1749043782;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XNEGmM0JlP9wq6opyDQ0PfkvRzw7tQOL49la3yXZ13c=;
 b=vYYZDHGUToIZA1PLLTwWmkwp/r5xVTzRx67pyfGsin5b3OjXT+szgrmnwygm1xxg3L
 Nr0r8vzGMLRj3li9N+lA1G+Lcg2wGCptsjKLTK+E4MJ9UrbCXV9QmpWFq4McUrXnHKOF
 LGw1li2Qab2V2vhPCjyI+PKSvdAQFDE2mSeL5Z8bBZ0CCiQ1DxwEI6GaUrT6MqP3022U
 jjHAEKAKp2G+2vHj2KDgHPC2IuqWGKl/MpzDDdDHBIhQKIVRygHaRib6jTSeEEJz9ISs
 fjKal0kBUJhREEI6AYIh/JD1LjoCrcKB4KXU4xTW4lBP/yj+6WusoxA4KE2c99we6pIS
 /hCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF62x4KjxDq++8AN7bTlx+XUUPBh6LRJl/kSszjzALAFmh8DLpalG4jaAxtR/8n+sE9B5aMSzb@lists.freedesktop.org,
 AJvYcCWtT7kEQEh9cRr4hW/uIHq99k/54VWg+IItcsjneDQRK9WdaUQLcSLAJXFbF014tXeER1kMCS+hdl+W@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd3q5sC9/63YJC+huyy2OMoQq/hFCuED7/ap+kcmn8vFbYOhvd
 mcMNew3hkO1HFae3yFJjZT3Ri6j/p5YUtbMtUQQ2ul9tEm/QeLk0NytcNggBSlRoLncXlzuvmJe
 th19ZGvozXPk4EYxrcG12ijuEBy/bHJI=
X-Gm-Gg: ASbGncstMglk3f+pXpbB9BMUvyuDNby9afCY4cpjqDUwL1vIWOM9LZrIZ07S3IgXhgH
 Q8EAsXftnWcZHHoKf2uysTgYv57uN++BWOzUu1T0R77ZsKgReNggmHo/OpFXFRzGx2q3ONFUPeY
 PNbntytvltbH1iWXIye2GRS8WtOxDwaTiUNOTc/Rs/k/bx
X-Google-Smtp-Source: AGHT+IFp9dYm27ljQ+pduZf1WWWHosCrH20sLdVDsx/JXSdhEjmFWQf5BV8+Te7KPlE4W/cEqV/LeKq9OPOR02v04og=
X-Received: by 2002:a17:90b:388a:b0:312:639:a06d with SMTP id
 98e67ed59e1d1-3120639af74mr319796a91.5.1748438981470; Wed, 28 May 2025
 06:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae>
 <aDCDJ-sK9rRI6wse@cassiopeiae> <cd64af4d-f5b3-4f18-9be6-636624833075@amd.com>
 <08bb986281fefb5cbdb35c63a56e1bbd923d9297.camel@mailbox.org>
 <74c4b9d8-5e25-438e-97c5-5aa2035fb9bd@amd.com>
 <cbd3eaa4c228c0d0688745e8a539103eb2278a0b.camel@mailbox.org>
 <aDcB0AbQiHOVUyAU@phenom.ffwll.local>
In-Reply-To: <aDcB0AbQiHOVUyAU@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 May 2025 09:29:30 -0400
X-Gm-Features: AX0GCFs3uo46gdIA9y3Bj2M5cVK7AM1LzBwrkJUupArrvkW3paxur3TGipTcZ-8
Message-ID: <CADnq5_NiMOhc95h-GLRjAD7LXyQ=9nb=Uvim1rwX4n9tekLkyA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: phasta@kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Danilo Krummrich <dakr@kernel.org>, tursulin@ursulin.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Wed, May 28, 2025 at 8:45=E2=80=AFAM Simona Vetter <simona.vetter@ffwll.=
ch> wrote:
>
> On Mon, May 26, 2025 at 01:27:28PM +0200, Philipp Stanner wrote:
> > On Mon, 2025-05-26 at 13:16 +0200, Christian K=C3=B6nig wrote:
> > > On 5/26/25 11:34, Philipp Stanner wrote:
> > > > On Mon, 2025-05-26 at 11:25 +0200, Christian K=C3=B6nig wrote:
> > > > > On 5/23/25 16:16, Danilo Krummrich wrote:
> > > > > > On Fri, May 23, 2025 at 04:11:39PM +0200, Danilo Krummrich
> > > > > > wrote:
> > > > > > > On Fri, May 23, 2025 at 02:56:40PM +0200, Christian K=C3=B6ni=
g
> > > > > > > wrote:
> > > > > > > > It turned out that we can actually massively optimize here.
> > > > > > > >
> > > > > > > > The previous code was horrible inefficient since it
> > > > > > > > constantly
> > > > > > > > released
> > > > > > > > and re-acquired the lock of the xarray and started each
> > > > > > > > iteration from the
> > > > > > > > base of the array to avoid concurrent modification which in
> > > > > > > > our
> > > > > > > > case
> > > > > > > > doesn't exist.
> > > > > > > >
> > > > > > > > Additional to that the xas_find() and xas_store() functions
> > > > > > > > are
> > > > > > > > explicitly
> > > > > > > > made in a way so that you can efficiently check entries and
> > > > > > > > if
> > > > > > > > you don't
> > > > > > > > find a match store a new one at the end or replace existing
> > > > > > > > ones.
> > > > > > > >
> > > > > > > > So use xas_for_each()/xa_store() instead of
> > > > > > > > xa_for_each()/xa_alloc().
> > > > > > > > It's a bit more code, but should be much faster in the end.
> > > > > > >
> > > > > > > This commit message does neither explain the motivation of
> > > > > > > the
> > > > > > > commit nor what it
> > > > > > > does. It describes what instead belongs into the changelog
> > > > > > > between versions.
> > > > > >
> > > > > > Sorry, this is wrong. I got confused, the commit message is
> > > > > > perfectly fine. :)
> > > > > >
> > > > > > The rest still applies though.
> > > > > >
> > > > > > > Speaking of versioning of the patch series, AFAIK there were
> > > > > > > previous versions,
> > > > > > > but this series was sent as a whole new series -- why?
> > > > > > >
> > > > > > > Please resend with a proper commit message, version and
> > > > > > > changelog. Thanks!
> > > > >
> > > > >
> > > > > Well Philip asked to remove the changelog. I'm happy to bring it
> > > > > back, but yeah...
> > > >
> > > > No no no no :D
> > > >
> > > > Philipp asked for the changelog to be removed *from the git commit
> > > > message*; because it doesn't belong / isn't useful there.
> > > >
> > > > If there's a cover letter, the changelog should be in the cover
> > > > letter.
> > > > If there's no cover letter, it should be between the ---
> > > > separators:
> > >
> > > I can live with that, just clearly state what you want.
> >
> > Sure thing:
> >
> >  * Patches and patch series's should contain their version identifier
> >    within the square brackets [PATCH v3]. git format-patch -v3 does
> >    that automatically.
> >  * Changelog should be as described above
> >  * Ideally, cover letters always contain the full changelog, v2, v3 and
> >    so on, so that new readers get a sense of the evolution of the
> >    series.
> >
> > >
> > > For DRM the ask is often to keep the changelog in the commit message
> > > or remove it entirely.
> >
> > Yup, I've seen that a few times. I think we, the DRM community, should
> > stop that. It's just not useful and makes the commit messages larger,
> > both for the human reader while scrolling, as for the hard drive
> > regarding storage size
>
> I do occasionally find it useful as a record of different approaches
> considered, which sometimes people fail to adequately cover in their
> commit messages. Also useful indicator of how cursed a patch is :-)
>
> But as long as anything relevant does end up in the commit message and
> people don't just delete stuff I don't care how it's done at all. It's
> just that the cost of deleting something that should have been there can
> be really nasty sometimes, and storage is cheap.

I like them for the same reasons.  Also, even with links, sometimes
there are forks of the conversation that get missed that a changelog
provides some insight into.  I find it useful in my own development as
I can note what I've changed in a patch and can retain that in the
commit rather than as something I need to track separately and then
add to the patches when I send them out.

Alex

> -Sima
>
> >
> >
> > Thx
> > P.
> >
> >
> > >
> > > Regards,
> > > Christian.
> > >
> > > >
> > > >
> > > > Signed-off-by: Gordon Freeman <freeman@blackmesa.org>
> > > > Reviewed-by: Alyx Vance <alyx@vance.edu>
> > > > ---
> > > > Changes in v2:
> > > >   - Provide more docu for crowbar-alloc-function.
> > > >   - Use NULL pointers for reserved xarray entries
> > > > ---
> > > > <DIFF>
> > > >
> > > >
> > > > P.
> > > >
> > > >
> > > > >
> > > > > Regards,
> > > > > Christian.
> > > > >
> > > > > > >
> > > > > > > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.c=
om>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/scheduler/sched_main.c | 29
> > > > > > > > ++++++++++++++++++--------
> > > > > > > >  1 file changed, 20 insertions(+), 9 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > index f7118497e47a..cf200b1b643e 100644
> > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
> > > > > > > >  int drm_sched_job_add_dependency(struct drm_sched_job
> > > > > > > > *job,
> > > > > > > >   struct dma_fence *fence)
> > > > > > > >  {
> > > > > > > > + XA_STATE(xas, &job->dependencies, 0);
> > > > > > > >   struct dma_fence *entry;
> > > > > > > > - unsigned long index;
> > > > > > > > - u32 id =3D 0;
> > > > > > > > - int ret;
> > > > > > > >
> > > > > > > >   if (!fence)
> > > > > > > >   return 0;
> > > > > > > > @@ -883,24 +881,37 @@ int
> > > > > > > > drm_sched_job_add_dependency(struct
> > > > > > > > drm_sched_job *job,
> > > > > > > >   * This lets the size of the array of deps scale with
> > > > > > > > the number of
> > > > > > > >   * engines involved, rather than the number of BOs.
> > > > > > > >   */
> > > > > > > > - xa_for_each(&job->dependencies, index, entry) {
> > > > > > > > + xa_lock(&job->dependencies);
> > > > > > > > + xas_for_each(&xas, entry, ULONG_MAX) {
> > > > > > > >   if (entry->context !=3D fence->context)
> > > > > > > >   continue;
> > > > > > > >
> > > > > > > >   if (dma_fence_is_later(fence, entry)) {
> > > > > > > >   dma_fence_put(entry);
> > > > > > > > - xa_store(&job->dependencies, index,
> > > > > > > > fence, GFP_KERNEL);
> > > > > > > > + xas_store(&xas, fence);
> > > > > > > >   } else {
> > > > > > > >   dma_fence_put(fence);
> > > > > > > >   }
> > > > > > > > - return 0;
> > > > > > > > + xa_unlock(&job->dependencies);
> > > > > > > > + return xas_error(&xas);
> > > > > > > >   }
> > > > > > > >
> > > > > > > > - ret =3D xa_alloc(&job->dependencies, &id, fence,
> > > > > > > > xa_limit_32b, GFP_KERNEL);
> > > > > > > > - if (ret !=3D 0)
> > > > > > > > +retry:
> > > > > > > > + entry =3D xas_store(&xas, fence);
> > > > > > > > + xa_unlock(&job->dependencies);
> > > > > > > > +
> > > > > > > > + /* There shouldn't be any concurrent add, so no need
> > > > > > > > to loop again */
> > > > > > >
> > > > > > > Concurrency shouldn't matter, xas_nomem() stores the pre-
> > > > > > > allocated memory in the
> > > > > > > XA_STATE not the xarray. Hence, I think we should remove the
> > > > > > > comment.
> > > > > > >
> > > > > > > > + if (xas_nomem(&xas, GFP_KERNEL)) {
> > > > > > > > + xa_lock(&job->dependencies);
> > > > > > > > + goto retry;
> > > > > > >
> > > > > > > Please don't use a goto here, if we would have failed to
> > > > > > > allocate
> > > > > > > memory here,
> > > > > > > this would be an endless loop until we succeed eventually. It
> > > > > > > would be equal to:
> > > > > > >
> > > > > > > while (!ptr) {
> > > > > > > ptr =3D kmalloc();
> > > > > > > }
> > > > > > >
> > > > > > > Instead just take the lock and call xas_store() again.
> > > > > > >
> > > > > > > > + }
> > > > > > > > +
> > > > > > > > + if (xas_error(&xas))
> > > > > > > >   dma_fence_put(fence);
> > > > > > > > + else
> > > > > > > > + WARN_ON(entry);
> > > > > > >
> > > > > > > Please don't call WARN_ON() here, this isn't fatal, we only
> > > > > > > need
> > > > > > > to return the
> > > > > > > error code.
> > > > >
> > > >
> > >
> >
>
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
