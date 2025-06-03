Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D728DACC5B3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 13:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121A110E5F4;
	Tue,  3 Jun 2025 11:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="MB0cOGBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364C310E5A2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 11:45:58 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-adb47e0644dso557936166b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 04:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748951157; x=1749555957; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IfazfPYNHju0jH7hIPSEI9ULtmklFpa91hwq4k84SSc=;
 b=MB0cOGBefPx254YKxZn0jsthIklFwLM/dt+vzK2N80iz+GOunSVNbzDAMOWtYo+Zi+
 fHz1g4EWKrYK0g25TFZKBwaV6A58lLATuY5+qpwHHZqeeLngwJuuYKoOdj59/VQjoo15
 IrEXWJJDZ9A0LFACFDPcBxGPq5j7ENJqRDHoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748951157; x=1749555957;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IfazfPYNHju0jH7hIPSEI9ULtmklFpa91hwq4k84SSc=;
 b=oaL7+mg338knu3yhdM/2hwgNxzsjekKMENMNExpnDWga0IxoZDZ+WaZaK3xALD5rgi
 sWEA9bxIE4RSrW+o+YhvsauEdsycQyX4yqWNnYLZTzdEvd1L3MM2XqHAM2wCfL8Y7Xw9
 qWthjYfp6F8KuevXaSULCWXmW6sLj7Z661linOrMDWYVFGwnA/XMue6w2sKSR7FB5qCM
 1Nv7jYNcF7FGbeyG0Vn1QPnp70/soMk6ZaGw5UPjyRrW8hS3diOODsPFCCnNPUGY9nvi
 PKTgQPKGfrOTNfBRMpDaJ3HvDfh5+Eo2/G/v4Kzedo/CIL85TCDyKIVes65FTIxe8qTQ
 pETw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGlL0hEzLgPgMF4c1tbTikEIQal6kpEIdsmNhtFDZJNHzX1j6cqmoY8SKWxcuTH2CfrDRTlrXAKyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCqshgW6tumNBB10kXWhn7GRng7DCYBwNH3+gwF2F1qojSjUgz
 Mm/aiz9iiXNkA92SJOqBJ7DS5IzOjBiBXAmDLMQopppAdG7OEsaRoPrh2XfcO9MESxc=
X-Gm-Gg: ASbGncuLIbb05RvY40klpz0yLtwNQOminqhqvAV6lWREhdZR997xp597bDgMJjLCtq/
 rdECfIGdyZv/9AqqAYNZ1DiaeYyvqcw5hXAXFNFYWL96cdw5UaARbVtbBfxCRvNFYa00Vl+0zue
 JE08r7bYC4a/KoMmdu/0VDmv/ajqEMPrwM+Drdnf+3mXLypwzNPhNVs11udy+RUylU3Q40E59up
 Gg37EMlx8vfJn9nLcaikC/ebgXFpr8NObCHaj3CvEP18AdgUlUYgHbceEi/P9SScwCUrQG73I6c
 TB9e0QsdQrNRjZgTMH2tMGeRwuvOoviU610Y0GYB5IKhe0+U0ZYYKF3tRAqq5NU=
X-Google-Smtp-Source: AGHT+IG/yc1I09xXOpkrWC6fXgtwTaHTRCmhg1Bxq/oy8J2wc7t8jcYMlZLv+2Y63auTPM2uqnqVUQ==
X-Received: by 2002:a17:907:2d0e:b0:adb:4085:fb88 with SMTP id
 a640c23a62f3a-adde5e98e24mr233475866b.1.1748951156582; 
 Tue, 03 Jun 2025 04:45:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad3a6ccsm934847366b.156.2025.06.03.04.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 04:45:56 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:45:54 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH 1/8] drm/gem: Fix race in drm_gem_handle_create_tail()
Message-ID: <aD7gcvEaZzoDRRc1@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-2-simona.vetter@ffwll.ch>
 <2e60074d-8efd-4880-8620-9d9572583c88@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e60074d-8efd-4880-8620-9d9572583c88@suse.de>
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

On Mon, Jun 02, 2025 at 05:15:58PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 28.05.25 um 11:12 schrieb Simona Vetter:
> > Object creation is a careful dance where we must guarantee that the
> > object is fully constructed before it is visible to other threads, and
> > GEM buffer objects are no difference.
> > 
> > Final publishing happens by calling drm_gem_handle_create(). After
> > that the only allowed thing to do is call drm_gem_object_put() because
> > a concurrent call to the GEM_CLOSE ioctl with a correctly guessed id
> > (which is trivial since we have a linear allocator) can already tear
> > down the object again.
> > 
> > Luckily most drivers get this right, the very few exceptions I've
> > pinged the relevant maintainers for. Unfortunately we also need
> > drm_gem_handle_create() when creating additional handles for an
> > already existing object (e.g. GETFB ioctl or the various bo import
> > ioctl), and hence we cannot have a drm_gem_handle_create_and_put() as
> > the only exported function to stop these issues from happening.
> > 
> > Now unfortunately the implementation of drm_gem_handle_create() isn't
> > living up to standards: It does correctly finishe object
> > initialization at the global level, and hence is safe against a
> > concurrent tear down. But it also sets up the file-private aspects of
> > the handle, and that part goes wrong: We fully register the object in
> > the drm_file.object_idr before calling drm_vma_node_allow() or
> > obj->funcs->open, which opens up races against concurrent removal of
> > that handle in drm_gem_handle_delete().
> > 
> > Fix this with the usual two-stage approach of first reserving the
> > handle id, and then only registering the object after we've completed
> > the file-private setup.
> > 
> > Jacek reported this with a testcase of concurrently calling GEM_CLOSE
> > on a freshly-created object (which also destroys the object), but it
> > should be possible to hit this with just additional handles created
> > through import or GETFB without completed destroying the underlying
> > object with the concurrent GEM_CLOSE ioctl calls.
> > 
> > Note that the close-side of this race was fixed in f6cd7daecff5 ("drm:
> > Release driver references to handle before making it available
> > again"), which means a cool 9 years have passed until someone noticed
> > that we need to make this symmetry or there's still gaps left :-/
> > Without the 2-stage close approach we'd still have a race, therefore
> > that's an integral part of this bugfix.
> > 
> > More importantly, this means we can have NULL pointers behind
> > allocated id in our drm_file.object_idr. We need to check for that
> > now:
> > 
> > - drm_gem_handle_delete() checks for ERR_OR_NULL already
> > 
> > - drm_gem.c:object_lookup() also chekcs for NULL
> > 
> > - drm_gem_release() should never be called if there's another thread
> >    still existing that could call into an IOCTL that creates a new
> >    handle, so cannot race. For paranoia I added a NULL check to
> >    drm_gem_object_release_handle() though.
> > 
> > - most drivers (etnaviv, i915, msm) are find because they use
> >    idr_find, which maps both ENOENT and NULL to NULL.
> > 
> > - vmgfx is already broken vmw_debugfs_gem_info_show() because NULL
> >    pointers might exist due to drm_gem_handle_delete(). This needs a
> >    separate patch. This is because idr_for_each_entry terminates on the
> >    first NULL entry and so might not iterate over everything.
> > 
> > - similar for amd in amdgpu_debugfs_gem_info_show() and
> >    amdgpu_gem_force_release(). The latter is really questionable though
> >    since it's a best effort hack and there's no way to close all the
> >    races. Needs separate patches.
> > 
> > - xe is really broken because it not uses idr_for_each_entry() but
> >    also drops the drm_file.table_lock, which can wreak the idr iterator
> >    state if you're unlucky enough. Maybe another reason to look into
> >    the drm fdinfo memory stats instead of hand-rolling too much.
> > 
> > - drm_show_memory_stats() is also broken since it uses
> >    idr_for_each_entry. But since that's a preexisting bug I'll follow
> >    up with a separate patch.
> > 
> > Reported-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > Cc: stable@vger.kernel.org
> > Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> > Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> > ---
> >   drivers/gpu/drm/drm_gem.c | 10 +++++++++-
> >   include/drm/drm_file.h    |  3 +++
> >   2 files changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 1e659d2660f7..e4e20dda47b1 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -279,6 +279,9 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
> >   	struct drm_file *file_priv = data;
> >   	struct drm_gem_object *obj = ptr;
> > +	if (WARN_ON(!data))
> > +		return 0;
> > +
> >   	if (obj->funcs->close)
> >   		obj->funcs->close(obj, file_priv);
> > @@ -399,7 +402,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
> >   	idr_preload(GFP_KERNEL);
> >   	spin_lock(&file_priv->table_lock);
> > -	ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
> > +	ret = idr_alloc(&file_priv->object_idr, NULL, 1, 0, GFP_NOWAIT);
> >   	spin_unlock(&file_priv->table_lock);
> >   	idr_preload_end();
> > @@ -420,6 +423,11 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
> >   			goto err_revoke;
> >   	}
> > +	/* mirrors drm_gem_handle_delete to avoid races */
> > +	spin_lock(&file_priv->table_lock);
> > +	obj = idr_replace(&file_priv->object_idr, obj, handle);
> > +	WARN_ON(obj != NULL);
> 
> A DRM print function would be preferable. The obj here is an errno pointer.
> Should the errno code be part of the error message?
> 
> If it fails, why does the function still succeed?

This is an internal error that should never happen, at that point just
bailing out is the way to go.

Also note that the error code here is just to satisfy the function
signature that id_for_each expects, we don't look at it ever (since if
there's no bugs, it should never fail). I learned this because I actually
removed the int return value and stuff didn't compile :-)

I can use drm_WARN_ON if you want me to though?

I'll also explain this in the commit message for the next round.
-Sima

> 
> Best regards
> Thomas
> 
> > +	spin_unlock(&file_priv->table_lock);
> >   	*handlep = handle;
> >   	return 0;
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > index 5c3b2aa3e69d..d344d41e6cfe 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -300,6 +300,9 @@ struct drm_file {
> >   	 *
> >   	 * Mapping of mm object handles to object pointers. Used by the GEM
> >   	 * subsystem. Protected by @table_lock.
> > +	 *
> > +	 * Note that allocated entries might be NULL as a transient state when
> > +	 * creating or deleting a handle.
> >   	 */
> >   	struct idr object_idr;
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
