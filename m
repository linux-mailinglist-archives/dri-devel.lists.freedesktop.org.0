Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7339B6E757C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 10:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE0310E8D8;
	Wed, 19 Apr 2023 08:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115BA10E8D3;
 Wed, 19 Apr 2023 08:40:15 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id dm2so79718280ejc.8;
 Wed, 19 Apr 2023 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893614; x=1684485614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=11sl8AqwZce1ertKq6Ztt8iuR+fB42Oex6pJ+U7xw2I=;
 b=DxJtLunx5h16pRRZ84LYqFPi6EJHNEhDJ/4M06dgxM2ur0kqsRc/6YtsMxfHQkzoDi
 ylakpROJRFG1jWkLkiLWH6m6zs8oZIVmbqf6QE9Rh/UhnpnDwyUZLPXmRvssJpYoZDq4
 dA3oUTNV0tBOII15372NBzNp9bOvYkzlTfEGJZxIKEZikoq9gVKGcJkNHYO6vsl30gna
 Gw8nQ26WHKu+rcmyKVnUkkkfKQfl1+bOO1WVUamcinpol0p8Vo9pbY75wEeWdU0DqoDB
 dgYTurZ1swwpQk3ZMlRno2Rs8y2I93xbBQuelN2GGxgHUd1i/SzDDEWa3kQT/R19xDwt
 vpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893614; x=1684485614;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=11sl8AqwZce1ertKq6Ztt8iuR+fB42Oex6pJ+U7xw2I=;
 b=N9c98o6d0M7oHluSBScEO9SduYVysJCmuzjJFf+dbij9RTsO73smQGx6WQTnaI6USl
 ItXeEBUMxQ8+AXkRQ1g4inz/VHyW5fCCEM48WJEd1dKwj2dHMojAwc1Ggw7Bfb+thXpD
 bORB71SvbGcuwY9Nu7fa9EBhXU05r0OYhm/0gO8wLx7FKsAmgzrEafQ7HfXQbjgzcmOz
 4QzedrOjeokXY8PV/XlpDWmYNn4Yxr+FnrNWXDJGhmROlvY4U1qX3E6n+VF+f1dLZK3D
 Hd5lHlGejq/WQjwn1CflBdGThZVH8grOUKMXbYpUlArDMRppYKK+gML65rjbwixVysc0
 M7aw==
X-Gm-Message-State: AAQBX9eRzhIh4kW3SCxsvPEJ7GPQfTMUXOrkJaj/HNocbHgd6EKotEsF
 oILEVnHo+TeZiIMcqGyXJoc=
X-Google-Smtp-Source: AKy350aFo85fWHrw1usKNUqmGwHdN9xEddgt1lB/ijvfifKCIrYYuxvdWJI7HS4UtLXKs9qddbPlAw==
X-Received: by 2002:a17:906:9153:b0:94e:6504:d134 with SMTP id
 y19-20020a170906915300b0094e6504d134mr13768717ejw.42.1681893613729; 
 Wed, 19 Apr 2023 01:40:13 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:6273:6c76:9697:9b4c?
 ([2a02:908:1256:79a0:6273:6c76:9697:9b4c])
 by smtp.gmail.com with ESMTPSA id
 qm5-20020a170907674500b0094e3ddcf153sm8949825ejc.115.2023.04.19.01.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 01:40:13 -0700 (PDT)
Message-ID: <6703b9b2-539f-9a1b-82b8-244328472640@gmail.com>
Date: Wed, 19 Apr 2023 10:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] mm/gup: remove unused vmas parameter from
 get_user_pages()
Content-Language: en-US
To: Lorenzo Stoakes <lstoakes@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <cover.1681831798.git.lstoakes@gmail.com>
 <cd05b41d6d15ee9ff94273bc116ed3db3f5125bf.1681831798.git.lstoakes@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <cd05b41d6d15ee9ff94273bc116ed3db3f5125bf.1681831798.git.lstoakes@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Dimitri Sivanich <dimitri.sivanich@hpe.com>, x86@kernel.org,
 kvm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@redhat.com>, amd-gfx@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.04.23 um 17:49 schrieb Lorenzo Stoakes:
> No invocation of get_user_pages() uses the vmas parameter, so remove
> it.
>
> The GUP API is confusing and caveated. Recent changes have done much to
> improve that, however there is more we can do. Exporting vmas is a prime
> target as the caller has to be extremely careful to preclude their use
> after the mmap_lock has expired or otherwise be left with dangling
> pointers.
>
> Removing the vmas parameter focuses the GUP functions upon their primary
> purpose - pinning (and outputting) pages as well as performing the actions
> implied by the input flags.
>
> This is part of a patch series aiming to remove the vmas parameter
> altogether.

Astonishing that there are so few users of the original get_user_pages() 
API left.

>
> Suggested-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>

Acked-by: Christian König <christian.koenig@amd.com> for the radeon parts.

Regards,
Christian.

> ---
>   arch/x86/kernel/cpu/sgx/ioctl.c     | 2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
>   drivers/misc/sgi-gru/grufault.c     | 2 +-
>   include/linux/mm.h                  | 3 +--
>   mm/gup.c                            | 9 +++------
>   mm/gup_test.c                       | 5 ++---
>   virt/kvm/kvm_main.c                 | 2 +-
>   7 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/sgx/ioctl.c b/arch/x86/kernel/cpu/sgx/ioctl.c
> index 21ca0a831b70..5d390df21440 100644
> --- a/arch/x86/kernel/cpu/sgx/ioctl.c
> +++ b/arch/x86/kernel/cpu/sgx/ioctl.c
> @@ -214,7 +214,7 @@ static int __sgx_encl_add_page(struct sgx_encl *encl,
>   	if (!(vma->vm_flags & VM_MAYEXEC))
>   		return -EACCES;
>   
> -	ret = get_user_pages(src, 1, 0, &src_page, NULL);
> +	ret = get_user_pages(src, 1, 0, &src_page);
>   	if (ret < 1)
>   		return -EFAULT;
>   
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 1e8e287e113c..0597540f0dde 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -362,7 +362,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm_tt *ttm
>   		struct page **pages = ttm->pages + pinned;
>   
>   		r = get_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
> -				   pages, NULL);
> +				   pages);
>   		if (r < 0)
>   			goto release_pages;
>   
> diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufault.c
> index b836936e9747..378cf02a2aa1 100644
> --- a/drivers/misc/sgi-gru/grufault.c
> +++ b/drivers/misc/sgi-gru/grufault.c
> @@ -185,7 +185,7 @@ static int non_atomic_pte_lookup(struct vm_area_struct *vma,
>   #else
>   	*pageshift = PAGE_SHIFT;
>   #endif
> -	if (get_user_pages(vaddr, 1, write ? FOLL_WRITE : 0, &page, NULL) <= 0)
> +	if (get_user_pages(vaddr, 1, write ? FOLL_WRITE : 0, &page) <= 0)
>   		return -EFAULT;
>   	*paddr = page_to_phys(page);
>   	put_page(page);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 37554b08bb28..b14cc4972d0b 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2380,8 +2380,7 @@ long pin_user_pages_remote(struct mm_struct *mm,
>   			   unsigned int gup_flags, struct page **pages,
>   			   struct vm_area_struct **vmas, int *locked);
>   long get_user_pages(unsigned long start, unsigned long nr_pages,
> -			    unsigned int gup_flags, struct page **pages,
> -			    struct vm_area_struct **vmas);
> +		    unsigned int gup_flags, struct page **pages);
>   long pin_user_pages(unsigned long start, unsigned long nr_pages,
>   		    unsigned int gup_flags, struct page **pages,
>   		    struct vm_area_struct **vmas);
> diff --git a/mm/gup.c b/mm/gup.c
> index 1f72a717232b..7e454d6b157e 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2251,8 +2251,6 @@ long get_user_pages_remote(struct mm_struct *mm,
>    * @pages:      array that receives pointers to the pages pinned.
>    *              Should be at least nr_pages long. Or NULL, if caller
>    *              only intends to ensure the pages are faulted in.
> - * @vmas:       array of pointers to vmas corresponding to each page.
> - *              Or NULL if the caller does not require them.
>    *
>    * This is the same as get_user_pages_remote(), just with a less-flexible
>    * calling convention where we assume that the mm being operated on belongs to
> @@ -2260,16 +2258,15 @@ long get_user_pages_remote(struct mm_struct *mm,
>    * obviously don't pass FOLL_REMOTE in here.
>    */
>   long get_user_pages(unsigned long start, unsigned long nr_pages,
> -		unsigned int gup_flags, struct page **pages,
> -		struct vm_area_struct **vmas)
> +		    unsigned int gup_flags, struct page **pages)
>   {
>   	int locked = 1;
>   
> -	if (!is_valid_gup_args(pages, vmas, NULL, &gup_flags, FOLL_TOUCH))
> +	if (!is_valid_gup_args(pages, NULL, NULL, &gup_flags, FOLL_TOUCH))
>   		return -EINVAL;
>   
>   	return __get_user_pages_locked(current->mm, start, nr_pages, pages,
> -				       vmas, &locked, gup_flags);
> +				       NULL, &locked, gup_flags);
>   }
>   EXPORT_SYMBOL(get_user_pages);
>   
> diff --git a/mm/gup_test.c b/mm/gup_test.c
> index 8ae7307a1bb6..9ba8ea23f84e 100644
> --- a/mm/gup_test.c
> +++ b/mm/gup_test.c
> @@ -139,8 +139,7 @@ static int __gup_test_ioctl(unsigned int cmd,
>   						 pages + i);
>   			break;
>   		case GUP_BASIC_TEST:
> -			nr = get_user_pages(addr, nr, gup->gup_flags, pages + i,
> -					    NULL);
> +			nr = get_user_pages(addr, nr, gup->gup_flags, pages + i);
>   			break;
>   		case PIN_FAST_BENCHMARK:
>   			nr = pin_user_pages_fast(addr, nr, gup->gup_flags,
> @@ -161,7 +160,7 @@ static int __gup_test_ioctl(unsigned int cmd,
>   						    pages + i, NULL);
>   			else
>   				nr = get_user_pages(addr, nr, gup->gup_flags,
> -						    pages + i, NULL);
> +						    pages + i);
>   			break;
>   		default:
>   			ret = -EINVAL;
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index d255964ec331..7f31e0a4adb5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2474,7 +2474,7 @@ static inline int check_user_page_hwpoison(unsigned long addr)
>   {
>   	int rc, flags = FOLL_HWPOISON | FOLL_WRITE;
>   
> -	rc = get_user_pages(addr, 1, flags, NULL, NULL);
> +	rc = get_user_pages(addr, 1, flags, NULL);
>   	return rc == -EHWPOISON;
>   }
>   

