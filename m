Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF09392105
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 21:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33026E9E1;
	Wed, 26 May 2021 19:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD2C6E840
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622058071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IK6Th4ZCx+0amLJEZjMrTW9bDpGzITHnRAL9h8VgscA=;
 b=ZV5MmiOxp6cFaupevgIBPi+3x03Bkd24qjoGhlH389dIjzps2WGegOLjnYuWXyi1xsCDlz
 3WfY7/xAIPZl7HBh5BkmYxdBeK+j+FtTRtwm6y5sJjSNvnaFfuOEpKWm44oaoTfgGlKQaX
 Of/yYe8irIJfXooknise8QwntP3z1aE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-0dsoTR2bPhqm04gaHhV_aA-1; Wed, 26 May 2021 15:41:09 -0400
X-MC-Unique: 0dsoTR2bPhqm04gaHhV_aA-1
Received: by mail-qk1-f198.google.com with SMTP id
 b3-20020a05620a0cc3b02902e9d5ca06f2so1633210qkj.19
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 12:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IK6Th4ZCx+0amLJEZjMrTW9bDpGzITHnRAL9h8VgscA=;
 b=VqT/ZMxCzr1BNdvMnwSP9tLPxdohqkU4e1LGao/ZbfiBxoxpuwO2jDgZJdCurteqrD
 cdbMmHNl51Q8VZi7IBWkmMHQ4MfnlUEsbyIeLpLAR8zFPxebsXUnZqAZXH2XxBVG6e6E
 rVWA77edJWtdvtPIH9uVNPVqOiWj/wnzjEaAWfh9QslMc+WrK42iksriMMj1Ck0M1Hn6
 Ek8D2mjH5lo/4UKhbuo7Ni2yriUiWGpq05A+MEfU/8axT36m/rY8sAotMYJ++EfXtZXY
 m8ygjFi+f5IUUlIdnhu+jpeIsQyOeP0dzRZhWLYMmrJpGqkEr0oqvN50ax4oNL7GT8hg
 zQCA==
X-Gm-Message-State: AOAM533HJ7+t6SyG87VK3kmJWmLQvRGoeY8KRR7LJmVdSQIfyM8VAORV
 emfRRbYX5nFCmoJfTO56SmzWvU0YaP6wnTpeivUWFfchUJVieh/brH1UODrSSPKd64OwyZOa8Ls
 vZ27DYn2QcZtRcsmob37KPxhCjiZs
X-Received: by 2002:ac8:5bc2:: with SMTP id b2mr38732467qtb.220.1622058069381; 
 Wed, 26 May 2021 12:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJnPqtQWXkJ/e/uDJethFbtPOcM3K9BKum6Ztqo6rrKUmjkHKDiiSLmcCX23fB6dWiie8WzA==
X-Received: by 2002:ac8:5bc2:: with SMTP id b2mr38732446qtb.220.1622058069146; 
 Wed, 26 May 2021 12:41:09 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id j1sm2056219qtn.83.2021.05.26.12.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 12:41:08 -0700 (PDT)
Date: Wed, 26 May 2021 15:41:07 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v9 05/10] mm: Rename migrate_pgmap_owner
Message-ID: <YK6kU25FDhuZC3AV@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-6-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210524132725.12697-6-apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 11:27:20PM +1000, Alistair Popple wrote:
> @@ -521,14 +521,14 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
>  	range->flags = flags;
>  }
>  
> -static inline void mmu_notifier_range_init_migrate(
> -			struct mmu_notifier_range *range, unsigned int flags,
> +static inline void mmu_notifier_range_init_owner(
> +			struct mmu_notifier_range *range,
> +			enum mmu_notifier_event event, unsigned int flags,
>  			struct vm_area_struct *vma, struct mm_struct *mm,
> -			unsigned long start, unsigned long end, void *pgmap)
> +			unsigned long start, unsigned long end, void *owner)
>  {
> -	mmu_notifier_range_init(range, MMU_NOTIFY_MIGRATE, flags, vma, mm,
> -				start, end);
> -	range->migrate_pgmap_owner = pgmap;
> +	mmu_notifier_range_init(range, event, flags, vma, mm, start, end);
> +	range->owner = owner;
>  }

mmu_notifier_range_init_migrate() can even be kept to just call the new helper,
then existing callers are unaffected.  Not a big deal, though:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu

