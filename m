Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9A734577
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 10:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3373710E0ED;
	Sun, 18 Jun 2023 08:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F0E10E00D;
 Sat, 17 Jun 2023 18:26:19 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b2b7ca1c5eso1692685a34.0; 
 Sat, 17 Jun 2023 11:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687026378; x=1689618378;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iAOhlvHTcWXeb9PboEkspmfVbcV594RGj9F/z1tmu4Y=;
 b=DWYFOewOzfcxwUvqtdocgz991WeelZUqOziEmq3Yr1OOBIRlZZZ0Nnzb7tGqJ+WhvZ
 UKCDxM4SD0iyTQC2LQPSnoYvHqvPTSbhi2EpJHXBZuN+zWmtNPGy3z37fgO+DDMDjTO6
 SsSJ0BxgCV29PYyve4O/PEa5snOgcrgclkBGg4yovHC0pfal5ILNoTh3nawLfqGzUdQl
 mBbAvMYXthloGbzpjwO/+YL0LBMR4Gvzvi+hCsHsuXi6jbWx8BJ/9wTWqC+LfhNfmIEM
 4GI/jnS+Wu8R0TofM1bt19kKhf31PegFr7HOoF+OZLjfbem0CtAKF4ZffGd+zIqmErHc
 2GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687026378; x=1689618378;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iAOhlvHTcWXeb9PboEkspmfVbcV594RGj9F/z1tmu4Y=;
 b=dfZF1MXkoK/17QwZ5ABdYjcLkXioMK+Fwi/XBpvGkQDmAKKfQAabYYQfZWxPjhWQkx
 3PWXHhOeNNYBz9dFrGFC/nrL51pEKTjcA5rtaMR1kSCzIpH/DGKXzbbo3loAazgbJ5S8
 y8sPunYiBz2IntTacrb+UZ91VRveI9OqnGT0zbOCxZIajfyXpMb67FyjwMQGLRdXyxXk
 WvcL/3hNIOnF6m561naMl827jDbEJmvErRaoh0XYj2VdzuFV+mU4t/aocaV8JoKhzc1V
 7C53vTFtwjxRLRl3eYlgpnGNOxjO+E9wGG1rtAKZ5ZYC13CpQ6IlHNqconbd5P36WdU7
 3FPw==
X-Gm-Message-State: AC+VfDxq8MTBw10/MJiCXZXRmThyKs1W63WOih04OPKaHBkxRMsGXnQV
 TjSRlJK/qZba/eXy8SenBoI=
X-Google-Smtp-Source: ACHHUZ56YUUTSc04n4jtBmXQunTwc6aTvQHQknF6ljrYQVzDoYqxNZifQoRcL1NlfF1RF9LJPzbkNw==
X-Received: by 2002:a05:6359:c1e:b0:12b:dd43:b0a5 with SMTP id
 gn30-20020a0563590c1e00b0012bdd43b0a5mr2815690rwb.24.1687026378312; 
 Sat, 17 Jun 2023 11:26:18 -0700 (PDT)
Received: from sumitra.com ([117.199.158.52]) by smtp.gmail.com with ESMTPSA id
 ik26-20020a170902ab1a00b001b20dc1b3c9sm1646501plb.200.2023.06.17.11.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jun 2023 11:26:17 -0700 (PDT)
Date: Sat, 17 Jun 2023 11:26:09 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Call page_address() on page
 acquired with GFP_KERNEL flag
Message-ID: <20230617182609.GA410998@sumitra.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69d7af2f-f4c2-5a7d-ce69-c38be5660c74@shipmail.org>
X-Mailman-Approved-At: Sun, 18 Jun 2023 08:21:45 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sumitra Sharma <sumitraartsy@gmail.com>, Ira Weiny <ira.weiny@intel.com>,
 Deepak R Varma <drv@mailo.com>, Fabio <fmdefrancesco@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Hellstrom <thomas.hellstrom@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, Jun 14, 2023 at 05:30:25PM +0200, Thomas Hellström (Intel) wrote:
> 
> On 6/14/23 15:22, Tvrtko Ursulin wrote:
> > 
> > On 14/06/2023 13:35, Sumitra Sharma wrote:
> > > Pages allocated with GFP_KERNEL cannot come from Highmem.
> > > That is why there is no need to call kmap() on them.
> > 
> > Are you sure it is GFP_KERNEL backed and not tmpfs? I am not sure myself
> > so let me copy Matt and Thomas if they happen to know off hand.
>

Hello,

Yes it is true that the pages have not been acquired using the GFP_KERNEL.

I confused the allocation of the struct 'i915_vma_resource' tracking the 
pages with the allocation of the pages themselves.

This was noted by my mentor Ira Weiny <ira.weiny@intel.com>.

> It looks to me these are shmem pages or TTM pages. Both could be highmem. So
> I think kmap is the correct choice here.
> 

However, the kmap() will not be the correct choice here and kmap_local_page()
must be used instead. I have created a v2 patch for the same
https://lore.kernel.org/lkml/20230617180420.GA410966@sumitra.com/

Thank you for helping me.

Regards
Sumitra

> /Thomas
>
> 
> 
> 
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > > Therefore, don't call kmap() on the page coming from
> > > vma_res->bi.pages using for_each_sgt_page() in
> > > i915_vma_coredump_create().
> > > 
> > > Use a plain page_address() to get the kernel address instead.
> > > 
> > > Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> > > ---
> > >   drivers/gpu/drm/i915/i915_gpu_error.c | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c
> > > b/drivers/gpu/drm/i915/i915_gpu_error.c
> > > index f020c0086fbc..6f51cb4fc55c 100644
> > > --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> > > +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> > > @@ -1164,9 +1164,8 @@ i915_vma_coredump_create(const struct intel_gt
> > > *gt,
> > >                 drm_clflush_pages(&page, 1);
> > >   -            s = kmap(page);
> > > +            s = page_address(page);
> > >               ret = compress_page(compress, s, dst, false);
> > > -            kunmap(page);
> > >                 drm_clflush_pages(&page, 1);
