Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1ADA2C1E1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 12:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A1B10EAE9;
	Fri,  7 Feb 2025 11:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vVtr0oXt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32C010EAE9
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 11:48:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so19594305e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 03:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738928928; x=1739533728; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dHNJ8Eew7Hg7Pyzt2+hfw+RIo9hE4aetoeK/N/PeZXw=;
 b=vVtr0oXtiaN93nkz5r6icQ8XmmcmZGjX5WLO0Qyuy8NMS5Ixb5hiDODrQA/GBfCBPm
 beQWBI5tuQVZV2316JAimX2Sq+azSvso4MNAvrCCUuOcn9DRjLbb3yZveG56ItRH7hZO
 JObbTEqATtwjvTMVdF30k+qLlOAB0Qm4t/Sk53XSQa6u3EBsUmJEi+BgeSDYStdetjIN
 22RLG59GM5TvmH02u4WhR9quWC9ztx98YGFscJcVn5Wa2aYQiiuBnlkDh7P3SC2kQv+C
 34RoAeOOE+XZQuw5zJkoYVYzXiWqB+aoJ51oDuH6VlRqOSnlZut93OB2e4VNWGuHX4fg
 Oczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738928928; x=1739533728;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dHNJ8Eew7Hg7Pyzt2+hfw+RIo9hE4aetoeK/N/PeZXw=;
 b=GvA/yWlajg9arLk1b+LSzKd1Q+CSCw5VL2iz3d6khzPaG0GqoE9HBeCYRJ1mh7B7R6
 WjDmwtICGgHAIQ7yFgFiWHH6QPCNXr+horYS33Xqe/bkhkrGsTzoSDL+/BoAtG41Jlgd
 NJK/W7JnnWfZ4Ttsf8PC/5QM/TlkShfpz/SpK1Yvr/5oUG8FRrN27yD0XHAmeWCU5qq4
 Jld2zIeAKIRdX8H4KfTm/MUZjlssK+fWUaVNtRhlww7aLb6fKabAtbIsHIW1kW7CU7k2
 WIHFPr59dfQoIgaSJIviNX2iLyghibbnIgzM+YimLw6UF/u8GFR9MgvD6fLQLhxyMaFV
 g3Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIKaQLkg2sC9EgC7mHjezy18NPGxOPhWJNQiGiFMa41Xu3IhL9u4UWke/PBMko7UUF/eQAP+2dZz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUcyYJIvJLYgAKI1Eg5UGaA/nNaWj8AHCX+Rr7dTGKLOHtqjL6
 uX82q0vdrzsL4NI0wYOjXrFNp3O0QPp0h82EhZPIdq2ivIRvHd0CmONMw6o9His=
X-Gm-Gg: ASbGncsuTjf36iz1OnZH371PeswYkQrRt0dGTfvx+qdYPg2x3NfWc4+HS/DodQBcySu
 LG4bFq8U+nnLvv+AtK9H7cxuf4QEl4MCZX7NKwBodkcsvympbeqEocoO1qvzWu62/I5erRK68b5
 NlG6SudljIlAH+ZXoud7iK2LDZIeJuuI2e24Gb9BN5SwEGYiaxK/MHoaj9aKknO4UjCxVSW6bVW
 /Er1EZOyA5kDsCGxUMk8ECalnPlFyEjYaBqR4QWR3wzv5IfbqGNuyep7onDtd8DULxGqoH0OAwk
 KU5GAmha5zkTn8btExkA
X-Google-Smtp-Source: AGHT+IEr0OWNf6abQpoX6y1vt4hzbn9/9cpFB6IqywNlb0ApAbUXKRVMlqvR2p9ieTmDj/CQ8gYdUQ==
X-Received: by 2002:a05:600c:1d0c:b0:434:ff30:a159 with SMTP id
 5b1f17b1804b1-439248d395cmr28322995e9.0.1738928928439; 
 Fri, 07 Feb 2025 03:48:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4390d94d753sm87464535e9.11.2025.02.07.03.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 03:48:48 -0800 (PST)
Date: Fri, 7 Feb 2025 14:48:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Josef Bacik <josef@toxicpanda.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Brian Geffon <bgeffon@google.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/i915: Fix NULL vs IS_ERR() check in
 __shmem_writeback()
Message-ID: <1d15e298-4e37-467d-9527-bfd6215cf276@stanley.mountain>
References: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>
 <Z6XoU6GopCT-CxNK@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6XoU6GopCT-CxNK@ashyti-mobl2.lan>
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

On Fri, Feb 07, 2025 at 12:02:43PM +0100, Andi Shyti wrote:
> Hi Dan,
> 
> On Thu, Feb 06, 2025 at 11:17:02AM +0300, Dan Carpenter wrote:
> > The filemap_lock_folio() function doesn't return NULL, it returns error
> > pointers.
> > 
> > Fixes: 25dd342f0cc8 ("drm/i915/gem: convert __shmem_writeback() to folios")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > index a784fb44e59c..fb263b421958 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > @@ -319,7 +319,7 @@ void __shmem_writeback(size_t size, struct address_space *mapping)
> >  		struct folio *folio;
> >  
> >  		folio = filemap_lock_folio(mapping, i);
> > -		if (!folio)
> > +		if (IS_ERR(folio))
> 
> I don't see this patch yet in -next yet (and of course not in
> drm-tip), which branch is it based on?
> 

This was in linux-next but it's not there now.  It came via -mm.  I
guess it's been dropped and Kirill will fix this in his devel branch
before resending.

regards,
dan carpenter

