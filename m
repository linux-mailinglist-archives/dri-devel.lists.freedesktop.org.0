Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6605429996D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 23:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AED46EA7F;
	Mon, 26 Oct 2020 22:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6966EA7E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 22:15:23 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k21so6657183wmi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 15:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wSFQl5tEZJlMW2FF6sx0fmEDfKkZOvTzLyUG7GjevAQ=;
 b=kkBWmOfRGiGfynKFUUsY6Bg1cuklrhT3VBOwm/J9YiPw9z4cVdpY9sATV1o7Idrq4y
 00hLvWtKsiLWja7bX9HLg4TGqnRGU4YCOAVHW3FIdKeAgKvYbKa00UPb9+F6C9BiFdwx
 tqpkyBwyQ5Oqzusk6GTT3vSRGHf/YxvJsuWk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wSFQl5tEZJlMW2FF6sx0fmEDfKkZOvTzLyUG7GjevAQ=;
 b=V2tH++7HG3dM1IiXf+TWWKgzUsvY/lxhmawo2kpOWgGBUrfI5jA1KrrtpdsxosocT9
 x5ZA2mVhOea/IEvlw42HaaN1UGlRmWCw92+EZVOXE8PCD1jEjEe+2Y06KwEsu38CJ1lm
 PE4eoswlmxgATSZhx6oNC8VPWgjf8jyaNboQNgFtrlozD4bzjIYQu3rh2iE7peOk/L2T
 RbXdzbDUtDRmzwa3/SVRcbLaA6MX7xWIOgxN/c5Goa3vVX6ROgOe+y6sYU57IllUTejl
 1Q94Bt1tPx6lRz3PLNn+57/7JNZN5H4eEUPb19JDC/pM6mYqT9yHYKoipbjb/wtN0pVE
 uPFg==
X-Gm-Message-State: AOAM530pxlZ+RtA+x+L7mmHDDygVqVyqhDY0v10QmuVAvFoXiLtZNLB3
 MoR/rXOZvEqrFQtipcU4Up/CBQ==
X-Google-Smtp-Source: ABdhPJyCNb7QwTcRnF+7btKQht31eA1jnpozPoni78IGAJc6AIIgtmLd2KT94mvBmswfJX1TK6OixA==
X-Received: by 2002:a1c:3243:: with SMTP id y64mr18039466wmy.175.1603750522164; 
 Mon, 26 Oct 2020 15:15:22 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com.
 [34.76.131.216])
 by smtp.gmail.com with ESMTPSA id f17sm23103391wme.22.2020.10.26.15.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 15:15:21 -0700 (PDT)
Date: Mon, 26 Oct 2020 22:15:20 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v4 05/15] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201026221520.GC2802004@chromium.org>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201026105818.2585306-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026105818.2585306-6-daniel.vetter@ffwll.ch>
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
Cc: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Mon, Oct 26, 2020 at 11:58:08AM +0100, Daniel Vetter wrote:
> This is used by media/videbuf2 for persistent dma mappings, not just
> for a single dma operation and then freed again, so needs
> FOLL_LONGTERM.
> =

> Unfortunately current pup_locked doesn't support FOLL_LONGTERM due to
> locking issues. Rework the code to pull the pup path out from the
> mmap_sem critical section as suggested by Jason.
> =

> By relying entirely on the vma checks in pin_user_pages and follow_pfn
> (for vm_flags and vma_is_fsdax) we can also streamline the code a lot.
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Pawel Osciak <pawel@osciak.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> --
> v2: Streamline the code and further simplify the loop checks (Jason)
> ---
>  mm/frame_vector.c | 50 ++++++++++++++---------------------------------
>  1 file changed, 15 insertions(+), 35 deletions(-)
> =


Thank you for the patch. Please see my comments inline.

> diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> index 10f82d5643b6..d44779e56313 100644
> --- a/mm/frame_vector.c
> +++ b/mm/frame_vector.c
> @@ -38,7 +38,6 @@ int get_vaddr_frames(unsigned long start, unsigned int =
nr_frames,
>  	struct vm_area_struct *vma;
>  	int ret =3D 0;
>  	int err;
> -	int locked;
>  =

>  	if (nr_frames =3D=3D 0)
>  		return 0;
> @@ -48,40 +47,25 @@ int get_vaddr_frames(unsigned long start, unsigned in=
t nr_frames,
>  =

>  	start =3D untagged_addr(start);
>  =

> -	mmap_read_lock(mm);
> -	locked =3D 1;
> -	vma =3D find_vma_intersection(mm, start, start + 1);
> -	if (!vma) {
> -		ret =3D -EFAULT;
> -		goto out;
> -	}
> -
> -	/*
> -	 * While get_vaddr_frames() could be used for transient (kernel
> -	 * controlled lifetime) pinning of memory pages all current
> -	 * users establish long term (userspace controlled lifetime)
> -	 * page pinning. Treat get_vaddr_frames() like
> -	 * get_user_pages_longterm() and disallow it for filesystem-dax
> -	 * mappings.
> -	 */
> -	if (vma_is_fsdax(vma)) {
> -		ret =3D -EOPNOTSUPP;
> -		goto out;
> -	}
> -
> -	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> +	ret =3D pin_user_pages_fast(start, nr_frames,
> +				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> +				  (struct page **)(vec->ptrs));
> +	if (ret > 0) {
>  		vec->got_ref =3D true;
>  		vec->is_pfns =3D false;
> -		ret =3D pin_user_pages_locked(start, nr_frames,
> -			gup_flags, (struct page **)(vec->ptrs), &locked);

Should we drop the gup_flags argument, since it's ignored now?

> -		goto out;
> +		goto out_unlocked;
>  	}
>  =


Should we initialize ret with 0 here, since pin_user_pages_fast() can
return a negative error code, but below we use it as a counter for the
looked up frames?

Best regards,
Tomasz

> +	mmap_read_lock(mm);
>  	vec->got_ref =3D false;
>  	vec->is_pfns =3D true;
>  	do {
>  		unsigned long *nums =3D frame_vector_pfns(vec);
>  =

> +		vma =3D find_vma_intersection(mm, start, start + 1);
> +		if (!vma)
> +			break;
> +
>  		while (ret < nr_frames && start + PAGE_SIZE <=3D vma->vm_end) {
>  			err =3D follow_pfn(vma, start, &nums[ret]);
>  			if (err) {
> @@ -92,17 +76,13 @@ int get_vaddr_frames(unsigned long start, unsigned in=
t nr_frames,
>  			start +=3D PAGE_SIZE;
>  			ret++;
>  		}
> -		/*
> -		 * We stop if we have enough pages or if VMA doesn't completely
> -		 * cover the tail page.
> -		 */
> -		if (ret >=3D nr_frames || start < vma->vm_end)
> +		/* Bail out if VMA doesn't completely cover the tail page. */
> +		if (start < vma->vm_end)
>  			break;
> -		vma =3D find_vma_intersection(mm, start, start + 1);
> -	} while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
> +	} while (ret < nr_frames);
>  out:
> -	if (locked)
> -		mmap_read_unlock(mm);
> +	mmap_read_unlock(mm);
> +out_unlocked:
>  	if (!ret)
>  		ret =3D -EFAULT;
>  	if (ret > 0)
> -- =

> 2.28.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
