Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 122499EE3D4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C288610ED37;
	Thu, 12 Dec 2024 10:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="O/rECvI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C9B10ED37
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 10:12:43 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so3815775e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1733998362; x=1734603162; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/6L/m3gKnrPsaMxDrU89bXCWhOH8qgzGCoqHbE1Yj18=;
 b=O/rECvI6M3daxfQayW7E0VKuXIdkNQPSsmVikqc6a/A755YNocI0rSug/0Fm1pp4us
 KTmzitevdznceLDj9jiJ3lnpXe+WHcTvvA6dBGggvryJVfecYKt64hNqTW+Im3YmG5dO
 eZUuIgifyii6dNpzHYsKiXaV6Lifjr8NR379U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733998362; x=1734603162;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6L/m3gKnrPsaMxDrU89bXCWhOH8qgzGCoqHbE1Yj18=;
 b=UIcCm1vzXYpw6iTP9fO88/yHSO4G4k+Oyy8XfNTFo3bMuwVzxiBqJJEY7HDcJXWzMC
 GVJ7ZfkFQOY56lyyH/AjFYWFv94YwmdZcE7wOrM26cjDynLrosoTkyrg+MmiOCGWzpBa
 dIJefod78+W5WBybWLfg4CKKAooSRbZhP0Ww7gK5zOlYRu3CwSAlS5w9Xjzo0SOg4IIf
 9uLsBWkGUuXMZomNhmfyn/AF8NUt2Kf5MWOO/i3VbjiUKXFzQOYA7BaBJdE62gj2FN4q
 kAzh3s4aqoF/+YDmmVPCTcb/Je2t+qEXnMOCqOZv0q4vulMqbVscSMft0s/i2/+LkzSC
 EL8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkaPqEqnSBcsjY+PbOT6U575KIGH9KgNJspCjTdGfJGves6c7LrbJGzzUhOCTGAyArt4ReoBOzcCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOMdcAIvaP0pPyDBSkJP2793vKOpLhngVZcc3KOTUBH80jhDMk
 EjeETNZX5O+/2xFQ+A9fjyXtQX0Ab9tH7ciF7KZdg/se+O2XMDwpb2diLQMzx83rgXSCvWsSsvu
 SQsQ=
X-Gm-Gg: ASbGncvEH+B4+ciIpFouol7quiBIJiZCMNHSpFCYTcZZ3o4p3ME1nGrOjo8Pfu5b87V
 usUnzUBfOrsSDktXxea/kidpldWL1CCUSmrR+lWSjuW9q/1hMnfHtZkZSIn5xLiIEeGQIMyPKYz
 HJe3kJSkgAd4GbEkt7HnuSRb3TEU09cYOGgsPqlukwZ1wMjVabDt88gjR9ZzwHNJJ4j6QlSploa
 Fqs/b1rUgnOY0MDbRGgKiW2BQ3AQ7tXqF8gX3WTp560G2FOnovfs9fVj6hHeFM64QvP
X-Google-Smtp-Source: AGHT+IEvyP9FitM66cSZMMwydxM3tJNlBph+iYVkomM+fbp/4XM+0mwafLdeLXGjgJiZl+wAHekCvA==
X-Received: by 2002:a05:600c:3b0e:b0:435:32e:8270 with SMTP id
 5b1f17b1804b1-4362282e38dmr25784385e9.14.1733998362260; 
 Thu, 12 Dec 2024 02:12:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559f9b5sm12200215e9.26.2024.12.12.02.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 02:12:41 -0800 (PST)
Date: Thu, 12 Dec 2024 11:12:39 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
Message-ID: <Z1q3F81k2TkUzKW7@phenom.ffwll.local>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, 
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
 <3c1cc9403eb50bc8c532d180f766eb7a429e8913.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c1cc9403eb50bc8c532d180f766eb7a429e8913.camel@linux.intel.com>
X-Operating-System: Linux phenom 6.11.6-amd64 
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

On Thu, Dec 12, 2024 at 09:49:24AM +0100, Thomas Hellström wrote:
> On Mon, 2024-12-09 at 16:31 +0100, Simona Vetter wrote:
> > On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian König wrote:
> > > Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
> > > > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > 
> > > > Debugger needs to read/write program's vmas including
> > > > userptr_vma.
> > > > Since hmm_range_fault is used to pin userptr vmas, it is possible
> > > > to map those vmas from debugger context.
> > > 
> > > Oh, this implementation is extremely questionable as well. Adding
> > > the LKML
> > > and the MM list as well.
> > > 
> > > First of all hmm_range_fault() does *not* pin anything!
> > > 
> > > In other words you don't have a page reference when the function
> > > returns,
> > > but rather just a sequence number you can check for modifications.
> > 
> > I think it's all there, holds the invalidation lock during the
> > critical
> > access/section, drops it when reacquiring pages, retries until it
> > works.
> > 
> > I think the issue is more that everyone hand-rolls userptr. Probably
> > time
> > we standardize that and put it into gpuvm as an optional part, with
> > consistent locking, naming (like not calling it _pin_pages when it's
> > unpinnged userptr), kerneldoc and all the nice things so that we
> > stop consistently getting confused by other driver's userptr code.
> > 
> > I think that was on the plan originally as an eventual step, I guess
> > time
> > to pump that up. Matt/Thomas, thoughts?
> 
> It looks like we have this planned and ongoing but there are some
> complications and thoughts.
> 
> 1) A drm_gpuvm implementation would be based on vma userptrs, and would
> be pretty straightforward based on xe's current implementation and, as
> you say, renaming.
> 
> 2) Current Intel work to land this on the drm level is based on
> drm_gpusvm (minus migration to VRAM). I'm not fully sure yet how this
> will integrate with drm_gpuvm.
> 
> 3) Christian mentioned a plan to have a common userptr implementation
> based off drm_exec. I figure that would be bo-based like the amdgpu
> implemeentation still is. Possibly i915 would be interested in this but
> I think any VM_BIND based driver would want to use drm_gpuvm /
> drm_gpusvm implementation, which is also typically O(1), since userptrs
> are considered vm-local.
> 
> Ideas / suggestions welcome

So just discussed this a bit with Joonas, and if we use access_remote_vm
for the userptr access instead of hand-rolling then we really only need
bare-bones data structure changes in gpuvm, and nothing more. So

- add the mm pointer to struct drm_gpuvm
- add a flag indicating that it's a userptr + userspace address to struct
  drm_gpuva
- since we already have userptr in drivers I guess there should be any
  need to adjust the actual drm_gpuvm code to cope with these

Then with this you can write the access helper using access_remote_vm
since that does the entire remote mm walking internally, and so there's
no need to also have all the mmu notifier and locking lifted to gpuvm. But
it does already give us some great places to put relevant kerneldocs (not
just for debugging architecture, but userptr stuff in general), which is
already a solid step forward.

Plus I think it'd would also be a solid first step that we need no matter
what for figuring out the questions/options you have above.

Thoughts?
-Sima

> 
> > -Sima
> > 
> > > 
> > > > v2: pin pages vs notifier, move to vm.c (Matthew)
> > > > v3: - iterate over system pages instead of DMA, fixes iommu
> > > > enabled
> > > >      - s/xe_uvma_access/xe_vm_uvma_access/ (Matt)
> > > > 
> > > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > > > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_eudebug.c |  3 ++-
> > > >   drivers/gpu/drm/xe/xe_vm.c      | 47
> > > > +++++++++++++++++++++++++++++++++
> > > >   drivers/gpu/drm/xe/xe_vm.h      |  3 +++
> > > >   3 files changed, 52 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c
> > > > b/drivers/gpu/drm/xe/xe_eudebug.c
> > > > index 9d87df75348b..e5949e4dcad8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_eudebug.c
> > > > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> > > > @@ -3076,7 +3076,8 @@ static int xe_eudebug_vma_access(struct
> > > > xe_vma *vma, u64 offset_in_vma,
> > > >   		return ret;
> > > >   	}
> > > > -	return -EINVAL;
> > > > +	return xe_vm_userptr_access(to_userptr_vma(vma),
> > > > offset_in_vma,
> > > > +				    buf, bytes, write);
> > > >   }
> > > >   static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 0f17bc8b627b..224ff9e16941 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -3414,3 +3414,50 @@ void xe_vm_snapshot_free(struct
> > > > xe_vm_snapshot *snap)
> > > >   	}
> > > >   	kvfree(snap);
> > > >   }
> > > > +
> > > > +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64
> > > > offset,
> > > > +			 void *buf, u64 len, bool write)
> > > > +{
> > > > +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> > > > +	struct xe_userptr *up = &uvma->userptr;
> > > > +	struct xe_res_cursor cur = {};
> > > > +	int cur_len, ret = 0;
> > > > +
> > > > +	while (true) {
> > > > +		down_read(&vm->userptr.notifier_lock);
> > > > +		if (!xe_vma_userptr_check_repin(uvma))
> > > > +			break;
> > > > +
> > > > +		spin_lock(&vm->userptr.invalidated_lock);
> > > > +		list_del_init(&uvma->userptr.invalidate_link);
> > > > +		spin_unlock(&vm->userptr.invalidated_lock);
> > > > +
> > > > +		up_read(&vm->userptr.notifier_lock);
> > > > +		ret = xe_vma_userptr_pin_pages(uvma);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > > +	if (!up->sg) {
> > > > +		ret = -EINVAL;
> > > > +		goto out_unlock_notifier;
> > > > +	}
> > > > +
> > > > +	for (xe_res_first_sg_system(up->sg, offset, len, &cur);
> > > > cur.remaining;
> > > > +	     xe_res_next(&cur, cur_len)) {
> > > > +		void *ptr = kmap_local_page(sg_page(cur.sgl)) +
> > > > cur.start;
> > > 
> > > The interface basically creates a side channel to access userptrs
> > > in the way
> > > an userspace application would do without actually going through
> > > userspace.
> > > 
> > > That is generally not something a device driver should ever do as
> > > far as I
> > > can see.
> > > 
> > > > +
> > > > +		cur_len = min(cur.size, cur.remaining);
> > > > +		if (write)
> > > > +			memcpy(ptr, buf, cur_len);
> > > > +		else
> > > > +			memcpy(buf, ptr, cur_len);
> > > > +		kunmap_local(ptr);
> > > > +		buf += cur_len;
> > > > +	}
> > > > +	ret = len;
> > > > +
> > > > +out_unlock_notifier:
> > > > +	up_read(&vm->userptr.notifier_lock);
> > > 
> > > I just strongly hope that this will prevent the mapping from
> > > changing.
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > +	return ret;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > > > b/drivers/gpu/drm/xe/xe_vm.h
> > > > index 23adb7442881..372ad40ad67f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > > @@ -280,3 +280,6 @@ struct xe_vm_snapshot
> > > > *xe_vm_snapshot_capture(struct xe_vm *vm);
> > > >   void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot
> > > > *snap);
> > > >   void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct
> > > > drm_printer *p);
> > > >   void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > > > +
> > > > +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64
> > > > offset,
> > > > +			 void *buf, u64 len, bool write);
> > > 
> > 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
