Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654DDACDA77
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 11:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE79710E229;
	Wed,  4 Jun 2025 09:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="b/dfmeMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A4310E236
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 09:03:00 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-adb47e0644dso153680266b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749027779; x=1749632579; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OWXCxfPn5mxMyAc/RvJYvkJY+WkXczRM7a4xRFzAqfc=;
 b=b/dfmeMmmfF/v81arKAhS2N8tiwX67z6fU9wgBaHXU0lzjBPbYW7iSdGTFtumFflD+
 Vu1IOwVzh1FIGr+mZZe8iHu4Pp2FswXehVaQt//ptgmypXb9vw/OKG5hOoLRA39u5PDJ
 Ra8pBdlbdZDJXGbcFEFpB/ZLmcV5xC69TcBuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749027779; x=1749632579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWXCxfPn5mxMyAc/RvJYvkJY+WkXczRM7a4xRFzAqfc=;
 b=iydB3zGDefZz+rVL0BL8EHSiKst7jMU+aUfD4UXOmmUpnMLIOoJuSaVQ2KcK9iUJD9
 lbHV5IjbfIm3qzuCXBkmXMdj2QjIitSFQ3vwMj08DpVD0tqDky5PTo69hfkJSONbDCOO
 Q7wRgg7zubfAODSIoyN+d71tMcHtcwUTAMJi8ooMJ1LE4q3gn6VxkizV2o3Kql4pb6Qv
 qrJ8V7jwQOCkHdE8OFwViRz3mi8brmk3CErANh6DLm2cq0iOyK/MCjoAAIcOGMSMnzII
 U3WrjUDwftHnczzMVJnMPqwfsmJ+/eIj8DJG2XmOkw1vKd1Sgojwwc2UANlfufYc8qfC
 v7bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVpZykiP7/9jQCi3Xsskaj/UadA5soLn8Bw7BifLzMqpHNNPHbvzpslk59THtDL7DXDTMB4f10M2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2rg7IMkBnMykLSJO1d8RhWAWubpC4mPniAJz/T37tVVABGw9X
 RG/gXxGbC1mEvS/h4wlrFVV3ozd2CrNWRB9uvlLjOuTtnVNUrIOYfHLBZcXX5LXHpl4=
X-Gm-Gg: ASbGnctejOWrhSeNo1Zvd+TW3ueG9AAvuDx1Y/2fDdWfXKQkdV+wp5MGeHt0ccD1Esy
 Hhsz5byDm38jwSgPoYtuZnoaA1pr2qS4IkYBiw/k1be28RgJXN4AqBU1qOWmEUlmR7YvpaDDbRW
 yM2fxJ0IC019kOlx6knVPuIlyAmV2lPGmTDGFIZwaEIuDhf5Ck6XCW/gPcD99BwmINvL3jwNNcm
 40xbmTo9NqSpJf6KRQrztuPXk3dgYlzukgSjsVyukcPqqC+uEEMtjD+Ez+bctorKcuKee1AZgz+
 ap00rpSVX8ECGey7gcq3DHN9iPjDr9uqi5+4qkzT+VuGM7sSsxwPw1boxSI+VLw=
X-Google-Smtp-Source: AGHT+IEsJ97eDX1ULIm8eXkHndMHDh6m9SOTcFVQvV2ShGufPJtYbcCaZ0sz612r1GZStWeNAsIcRg==
X-Received: by 2002:a17:907:7284:b0:ad5:7048:5177 with SMTP id
 a640c23a62f3a-adde5fe14camr526806866b.23.1749027777891; 
 Wed, 04 Jun 2025 02:02:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5dd045c8sm1074517766b.103.2025.06.04.02.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 02:02:57 -0700 (PDT)
Date: Wed, 4 Jun 2025 11:02:55 +0200
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
Message-ID: <aEALvw-H8OmCnNWD@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-2-simona.vetter@ffwll.ch>
 <2e60074d-8efd-4880-8620-9d9572583c88@suse.de>
 <aD7gcvEaZzoDRRc1@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD7gcvEaZzoDRRc1@phenom.ffwll.local>
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

On Tue, Jun 03, 2025 at 01:45:54PM +0200, Simona Vetter wrote:
> On Mon, Jun 02, 2025 at 05:15:58PM +0200, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 28.05.25 um 11:12 schrieb Simona Vetter:
> > > Object creation is a careful dance where we must guarantee that the
> > > object is fully constructed before it is visible to other threads, and
> > > GEM buffer objects are no difference.
> > > 
> > > Final publishing happens by calling drm_gem_handle_create(). After
> > > that the only allowed thing to do is call drm_gem_object_put() because
> > > a concurrent call to the GEM_CLOSE ioctl with a correctly guessed id
> > > (which is trivial since we have a linear allocator) can already tear
> > > down the object again.
> > > 
> > > Luckily most drivers get this right, the very few exceptions I've
> > > pinged the relevant maintainers for. Unfortunately we also need
> > > drm_gem_handle_create() when creating additional handles for an
> > > already existing object (e.g. GETFB ioctl or the various bo import
> > > ioctl), and hence we cannot have a drm_gem_handle_create_and_put() as
> > > the only exported function to stop these issues from happening.
> > > 
> > > Now unfortunately the implementation of drm_gem_handle_create() isn't
> > > living up to standards: It does correctly finishe object
> > > initialization at the global level, and hence is safe against a
> > > concurrent tear down. But it also sets up the file-private aspects of
> > > the handle, and that part goes wrong: We fully register the object in
> > > the drm_file.object_idr before calling drm_vma_node_allow() or
> > > obj->funcs->open, which opens up races against concurrent removal of
> > > that handle in drm_gem_handle_delete().
> > > 
> > > Fix this with the usual two-stage approach of first reserving the
> > > handle id, and then only registering the object after we've completed
> > > the file-private setup.
> > > 
> > > Jacek reported this with a testcase of concurrently calling GEM_CLOSE
> > > on a freshly-created object (which also destroys the object), but it
> > > should be possible to hit this with just additional handles created
> > > through import or GETFB without completed destroying the underlying
> > > object with the concurrent GEM_CLOSE ioctl calls.
> > > 
> > > Note that the close-side of this race was fixed in f6cd7daecff5 ("drm:
> > > Release driver references to handle before making it available
> > > again"), which means a cool 9 years have passed until someone noticed
> > > that we need to make this symmetry or there's still gaps left :-/
> > > Without the 2-stage close approach we'd still have a race, therefore
> > > that's an integral part of this bugfix.
> > > 
> > > More importantly, this means we can have NULL pointers behind
> > > allocated id in our drm_file.object_idr. We need to check for that
> > > now:
> > > 
> > > - drm_gem_handle_delete() checks for ERR_OR_NULL already
> > > 
> > > - drm_gem.c:object_lookup() also chekcs for NULL
> > > 
> > > - drm_gem_release() should never be called if there's another thread
> > >    still existing that could call into an IOCTL that creates a new
> > >    handle, so cannot race. For paranoia I added a NULL check to
> > >    drm_gem_object_release_handle() though.
> > > 
> > > - most drivers (etnaviv, i915, msm) are find because they use
> > >    idr_find, which maps both ENOENT and NULL to NULL.
> > > 
> > > - vmgfx is already broken vmw_debugfs_gem_info_show() because NULL
> > >    pointers might exist due to drm_gem_handle_delete(). This needs a
> > >    separate patch. This is because idr_for_each_entry terminates on the
> > >    first NULL entry and so might not iterate over everything.
> > > 
> > > - similar for amd in amdgpu_debugfs_gem_info_show() and
> > >    amdgpu_gem_force_release(). The latter is really questionable though
> > >    since it's a best effort hack and there's no way to close all the
> > >    races. Needs separate patches.
> > > 
> > > - xe is really broken because it not uses idr_for_each_entry() but
> > >    also drops the drm_file.table_lock, which can wreak the idr iterator
> > >    state if you're unlucky enough. Maybe another reason to look into
> > >    the drm fdinfo memory stats instead of hand-rolling too much.
> > > 
> > > - drm_show_memory_stats() is also broken since it uses
> > >    idr_for_each_entry. But since that's a preexisting bug I'll follow
> > >    up with a separate patch.
> > > 
> > > Reported-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > > Cc: stable@vger.kernel.org
> > > Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> > > Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > ---
> > >   drivers/gpu/drm/drm_gem.c | 10 +++++++++-
> > >   include/drm/drm_file.h    |  3 +++
> > >   2 files changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > index 1e659d2660f7..e4e20dda47b1 100644
> > > --- a/drivers/gpu/drm/drm_gem.c
> > > +++ b/drivers/gpu/drm/drm_gem.c
> > > @@ -279,6 +279,9 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
> > >   	struct drm_file *file_priv = data;
> > >   	struct drm_gem_object *obj = ptr;
> > > +	if (WARN_ON(!data))
> > > +		return 0;
> > > +
> > >   	if (obj->funcs->close)
> > >   		obj->funcs->close(obj, file_priv);
> > > @@ -399,7 +402,7 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
> > >   	idr_preload(GFP_KERNEL);
> > >   	spin_lock(&file_priv->table_lock);
> > > -	ret = idr_alloc(&file_priv->object_idr, obj, 1, 0, GFP_NOWAIT);
> > > +	ret = idr_alloc(&file_priv->object_idr, NULL, 1, 0, GFP_NOWAIT);
> > >   	spin_unlock(&file_priv->table_lock);
> > >   	idr_preload_end();
> > > @@ -420,6 +423,11 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
> > >   			goto err_revoke;
> > >   	}
> > > +	/* mirrors drm_gem_handle_delete to avoid races */
> > > +	spin_lock(&file_priv->table_lock);
> > > +	obj = idr_replace(&file_priv->object_idr, obj, handle);
> > > +	WARN_ON(obj != NULL);
> > 
> > A DRM print function would be preferable. The obj here is an errno pointer.
> > Should the errno code be part of the error message?
> > 
> > If it fails, why does the function still succeed?
> 
> This is an internal error that should never happen, at that point just
> bailing out is the way to go.
> 
> Also note that the error code here is just to satisfy the function
> signature that id_for_each expects, we don't look at it ever (since if
> there's no bugs, it should never fail). I learned this because I actually
> removed the int return value and stuff didn't compile :-)

Ok this part was nonsense, I mixed it up with handle_delete(). I still
don't think we should return an error code here, because we've
successfully installed the handle. It's just that something happened with
the idr that should be impossible, so all bets are off.
-Sima

> I can use drm_WARN_ON if you want me to though?
> 
> I'll also explain this in the commit message for the next round.
> -Sima
> 
> > 
> > Best regards
> > Thomas
> > 
> > > +	spin_unlock(&file_priv->table_lock);
> > >   	*handlep = handle;
> > >   	return 0;
> > > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > > index 5c3b2aa3e69d..d344d41e6cfe 100644
> > > --- a/include/drm/drm_file.h
> > > +++ b/include/drm/drm_file.h
> > > @@ -300,6 +300,9 @@ struct drm_file {
> > >   	 *
> > >   	 * Mapping of mm object handles to object pointers. Used by the GEM
> > >   	 * subsystem. Protected by @table_lock.
> > > +	 *
> > > +	 * Note that allocated entries might be NULL as a transient state when
> > > +	 * creating or deleting a handle.
> > >   	 */
> > >   	struct idr object_idr;
> > 
> > -- 
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Frankenstrasse 146, 90461 Nuernberg, Germany
> > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > HRB 36809 (AG Nuernberg)
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
