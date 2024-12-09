Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E879E9A92
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 16:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B15410E24D;
	Mon,  9 Dec 2024 15:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="a0kMMcMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F98A10E24D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 15:31:18 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38634c35129so1661346f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 07:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1733758276; x=1734363076; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rRrwKagbDkhwxnLFjd7MS7qeMP3V5ZX0pRGxISFGQGY=;
 b=a0kMMcMkffPHTdwcEfGf2PD+tX9Azky051XxGl36q+4er98frBDiSLzDqBvsrw4w8E
 e539Fq5VLPT+mKSyRaOdTarPMKu0xnZENcl8E5lYbeDaYyIz9VSxsTZBir/G77mhWQbi
 15CxcQ+R/+Q6g9wGILOiz64aBbbZzIwW2ZliY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733758276; x=1734363076;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rRrwKagbDkhwxnLFjd7MS7qeMP3V5ZX0pRGxISFGQGY=;
 b=tAgnNES3jLmuKfukPPkWmLjnddlyb0c3+oKuuqpCccfdUnw11Jj1r5Y6S0ElMN/DcE
 jf4172sIZSZ50WgGBlPcK/EJBhXcnlg+BzKXnSgKJp2mS02fF8CSDYf/+nPcBji8B3IN
 c7+hbQxgBM+cQ6LtVru6xdYP7T7jEkr3J2fV9MIaf+LnUqfbrAvsOU3zvoCucTWdqzFD
 1BI0VGysM9dMiNp0QXuuVUqq+K597qeoWPCOTCu+aXRDXyGMVT0eZzwRWuR/7oJiyhyN
 vlBb/hyUTH7E6F7OODhwz4n/IksiLhSvkVLXqegANFhb3hPPKRfQ8zEVkbEtSiuH9ih5
 6lGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSAfCLV3P5tApkQ8qk0vcmSKwzfQ4izk2onOo6RS2jScwviOvLMx2V4KYQ+Dw0cQZbBEI3NHtYerE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvryCC5Kv+8jQIQ23F4rqa8Ba+SV1uoiPVJn0poEEj+TFKFLSi
 2ckmtU63LOMAzr7e8C5TJctNnOtUBUS7kr1xIkjD1ifgdcEK1z/ODqfnId4UiWc=
X-Gm-Gg: ASbGnct1Hcb/Hc6/LyXoIqbThOFKoPzPOTSIuICzmm7fdLfQj2fh4mYiS4CzelJkQ8I
 KjuarYnXIgv4xQ71s/mpu5m0j6ZcE7oY9oeGnmVRN9cJQ7cTyAYxsy4oc2tUkRLgG1FqFFAPRmZ
 IjYk/5Ly6dUxlOlwdLFxEwdf++P0OYEQLYHDN2Q8I5A1g+5t0BBao5UZGRVLjb/wbWP8Hs/Gy6p
 beVrHjuWhseu75EuvcuBJkxYjlUfhrypuwg687grHOLB6wURoYhcsAW5erjSQ==
X-Google-Smtp-Source: AGHT+IEa2hI71BSfv72l6DzkdT7Sj5cETKMQ7Bq7s1zyr891Bbd+K0P9g6YcWBCA6YUOOgULQ7HHrw==
X-Received: by 2002:a5d:5f45:0:b0:385:f2a5:ef6a with SMTP id
 ffacd0b85a97d-386453d6876mr751537f8f.15.1733758276345; 
 Mon, 09 Dec 2024 07:31:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38637a0c6dfsm6814580f8f.93.2024.12.09.07.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 07:31:15 -0800 (PST)
Date: Mon, 9 Dec 2024 16:31:13 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
Message-ID: <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
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

On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian König wrote:
> Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
> > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > 
> > Debugger needs to read/write program's vmas including userptr_vma.
> > Since hmm_range_fault is used to pin userptr vmas, it is possible
> > to map those vmas from debugger context.
> 
> Oh, this implementation is extremely questionable as well. Adding the LKML
> and the MM list as well.
> 
> First of all hmm_range_fault() does *not* pin anything!
> 
> In other words you don't have a page reference when the function returns,
> but rather just a sequence number you can check for modifications.

I think it's all there, holds the invalidation lock during the critical
access/section, drops it when reacquiring pages, retries until it works.

I think the issue is more that everyone hand-rolls userptr. Probably time
we standardize that and put it into gpuvm as an optional part, with
consistent locking, naming (like not calling it _pin_pages when it's
unpinnged userptr), kerneldoc and all the nice things so that we
stop consistently getting confused by other driver's userptr code.

I think that was on the plan originally as an eventual step, I guess time
to pump that up. Matt/Thomas, thoughts?
-Sima

> 
> > v2: pin pages vs notifier, move to vm.c (Matthew)
> > v3: - iterate over system pages instead of DMA, fixes iommu enabled
> >      - s/xe_uvma_access/xe_vm_uvma_access/ (Matt)
> > 
> > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
> > ---
> >   drivers/gpu/drm/xe/xe_eudebug.c |  3 ++-
> >   drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_vm.h      |  3 +++
> >   3 files changed, 52 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> > index 9d87df75348b..e5949e4dcad8 100644
> > --- a/drivers/gpu/drm/xe/xe_eudebug.c
> > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> > @@ -3076,7 +3076,8 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset_in_vma,
> >   		return ret;
> >   	}
> > -	return -EINVAL;
> > +	return xe_vm_userptr_access(to_userptr_vma(vma), offset_in_vma,
> > +				    buf, bytes, write);
> >   }
> >   static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 0f17bc8b627b..224ff9e16941 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3414,3 +3414,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
> >   	}
> >   	kvfree(snap);
> >   }
> > +
> > +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
> > +			 void *buf, u64 len, bool write)
> > +{
> > +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> > +	struct xe_userptr *up = &uvma->userptr;
> > +	struct xe_res_cursor cur = {};
> > +	int cur_len, ret = 0;
> > +
> > +	while (true) {
> > +		down_read(&vm->userptr.notifier_lock);
> > +		if (!xe_vma_userptr_check_repin(uvma))
> > +			break;
> > +
> > +		spin_lock(&vm->userptr.invalidated_lock);
> > +		list_del_init(&uvma->userptr.invalidate_link);
> > +		spin_unlock(&vm->userptr.invalidated_lock);
> > +
> > +		up_read(&vm->userptr.notifier_lock);
> > +		ret = xe_vma_userptr_pin_pages(uvma);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (!up->sg) {
> > +		ret = -EINVAL;
> > +		goto out_unlock_notifier;
> > +	}
> > +
> > +	for (xe_res_first_sg_system(up->sg, offset, len, &cur); cur.remaining;
> > +	     xe_res_next(&cur, cur_len)) {
> > +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
> 
> The interface basically creates a side channel to access userptrs in the way
> an userspace application would do without actually going through userspace.
> 
> That is generally not something a device driver should ever do as far as I
> can see.
> 
> > +
> > +		cur_len = min(cur.size, cur.remaining);
> > +		if (write)
> > +			memcpy(ptr, buf, cur_len);
> > +		else
> > +			memcpy(buf, ptr, cur_len);
> > +		kunmap_local(ptr);
> > +		buf += cur_len;
> > +	}
> > +	ret = len;
> > +
> > +out_unlock_notifier:
> > +	up_read(&vm->userptr.notifier_lock);
> 
> I just strongly hope that this will prevent the mapping from changing.
> 
> Regards,
> Christian.
> 
> > +	return ret;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 23adb7442881..372ad40ad67f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -280,3 +280,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
> >   void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
> >   void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
> >   void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > +
> > +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64 offset,
> > +			 void *buf, u64 len, bool write);
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
