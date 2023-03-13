Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334046B8CD5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 09:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D4A10E71F;
	Tue, 14 Mar 2023 08:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE4B10E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 19:41:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so11680672wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 12:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678736470;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kDHoNTYRuPYjRiZwfgC2w8CcgH54J2Q5EIBdARM+oCs=;
 b=WG5pBvPYaNCjjDwtZhJYZGmaoF5Ny5BQy6Q0w2tuyxdosHjqXxzz9N2KtYfxkEKHda
 bm6vOO2777IPYEQXY6u/tySVgYXKB5XWGqyGrEfaaNwj6VdrEYBmxZn/pwgiraxmm0Cr
 SBmkBACdsWLyQynkKWUszIZ7ltl0Npmd/o/tqhH+c6I9LdmPHm2c2PHNWm8PD1wioYNP
 5d87KJwG9qTMslXHhmeNSxuvx1DJUKZRG1zYBASthmByI5J70Mvx/ra1G8y/7Vo/R4pe
 kCu0gYG5YCqtdimuPkVxcwR3pXYtIE0+D+UBiu+ZjsYoTDkgB1gwi6fF+enZ5gvLZXXW
 ZmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678736470;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kDHoNTYRuPYjRiZwfgC2w8CcgH54J2Q5EIBdARM+oCs=;
 b=wD09TsfbWB8uAmH3Nj+bGoZQXRC1M82rPE51bwL+3rFA9Zp5iMFDBSS4gQ7WL74PdX
 aT1+Uihl52XQXwDGBQPbGGkWU6TLb+nyPPNifOXmYJ9WJOP+mRLhLoY9RB2BrSqRYeot
 /4MG3rYqWM+w3+uZf/XkRv4n1wX1qQco45nOWrH+Ldb1CqEymfTfiDaoKduKoQeh7X3O
 Z11aX63Vm2o4C6iL1612FVuzLp4t0UxkjaLnGbh4TRZeBSxkDXpggI369t8e3YP9ZC2Q
 E4tMQxs44JJn+BJuuXMhcot/DUlnUDIVGQqzXf/43UTJDAIDIAY+JV4IR98NSxmTmAdL
 N/fQ==
X-Gm-Message-State: AO0yUKWynMFxL4kcdUTIVJeCUypQJXS+wAK+DQdNQ49T0U+VGhoGuHAy
 0MkkExnrGbD1MvVhdG0npvY=
X-Google-Smtp-Source: AK7set/Cb4iH1IKwtyGpCNnEPAGk9kmpHLpbX4q9NnLiWUOQVqEje7GnNxwgOvhHQra3m/ty24H0zw==
X-Received: by 2002:a05:600c:4e8e:b0:3e0:1a9:b1d7 with SMTP id
 f14-20020a05600c4e8e00b003e001a9b1d7mr12100047wmq.19.1678736470047; 
 Mon, 13 Mar 2023 12:41:10 -0700 (PDT)
Received: from localhost (host86-146-209-214.range86-146.btcentralplus.com.
 [86.146.209.214]) by smtp.gmail.com with ESMTPSA id
 a16-20020a056000101000b002c54e26bca5sm275557wrx.49.2023.03.13.12.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 12:41:09 -0700 (PDT)
Date: Mon, 13 Mar 2023 19:38:58 +0000
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/3] drm/ttm: Remove comment referencing now-removed
 vmf_insert_mixed_prot()
Message-ID: <f7c5bd29-18e5-4eed-8a13-c84d4b9c4874@lucifer.local>
References: <cover.1678661628.git.lstoakes@gmail.com>
 <db403b3622b94a87bd93528cc1d6b44ae88adcdd.1678661628.git.lstoakes@gmail.com>
 <58224a49-654f-0026-4286-c6103d2057dc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58224a49-654f-0026-4286-c6103d2057dc@amd.com>
X-Mailman-Approved-At: Tue, 14 Mar 2023 08:16:08 +0000
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 08:47:21AM +0100, Christian König wrote:
> Am 13.03.23 um 00:40 schrieb Lorenzo Stoakes:
> > This function no longer exists, however the prot != vma->vm_page_prot case
> > discussion has been retained and moved to vmf_insert_pfn_prot() so refer to
> > this instead.
> >
> > Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Feel free to add my acked-by to the other two patches in the series and
> upstream through any branch you like.
>
> Alternatively ping me when you get rbs for the first two patches from the MM
> people and I can push this upstream through drm-misc.
>
> Thanks,
> Christian.

Thanks, much appreciated! I'd rather go through mm if possible as Andrew has
already taken for mm-unstable pending further review + that's easiest for
dealing with any mm feedback.

P.S. apologies for dropping the umlaut on your name in initial patch, I really
need to sort out my terminal which got horribly confused by non-ANSI characters :)

>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > index ca7744b852f5..5df3edadb808 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -254,7 +254,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> >   		 * encryption bits. This is because the exact location of the
> >   		 * data may not be known at mmap() time and may also change
> >   		 * at arbitrary times while the data is mmap'ed.
> > -		 * See vmf_insert_mixed_prot() for a discussion.
> > +		 * See vmf_insert_pfn_prot() for a discussion.
> >   		 */
> >   		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>
