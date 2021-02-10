Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D708B316D67
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 18:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5452F6E06E;
	Wed, 10 Feb 2021 17:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955316E2D7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 17:56:29 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id o21so2175647qtr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 09:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RUQ3IiEy3EeRQSWZTl5rkIVfBMl0Yr+7rUwczbTqPUI=;
 b=a+PshXZQLSQ7/K/9jegFaNYC0vZtmSYFRP1bDA8dbf8/musoPpHsw5fl3p1ROGJKfd
 BIwN8dEMPEjoYVb1yDkSYhphTXpCL9gSnrGEzHWvQCXWv29Ejjq92mz5G3Dg0KmE0XCX
 FeeRFLPtrUqSk8F0amJkbyHTGLQm8PvYyk+6v0OxaHba2MdI5fI0N/d0XsEh6GVU5emG
 /0vg6Fo5+WSy7jh21z0QKnlqdDB/yryAPmpCWW8UUSaCKsVbVpQw7LWKFor1C0y7OngB
 hQc5Rc67W3FeJVpxVwzluKmOqtnpGTOUR0RUS2WW2uLURW1Ug+7jhSO51GMEDjEjkQEH
 Fj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RUQ3IiEy3EeRQSWZTl5rkIVfBMl0Yr+7rUwczbTqPUI=;
 b=Fqk6G3G4/LCK6vcIQTujnahjxjC8eqvrkPVy8bIgIpMWnk0jT/49GOV4zqllnnk6qQ
 0M8YIRpFPe4kBB4J0IMa00W5AFL91CFWROWjA+bvI2EUn/Vb7mZDk/zDqmlXBpfMKnI3
 onP1z7O3VCn6RvZC5Rzcesq5tTBpgtC+iZ/llSp+bqypJvNMmu7LHRUd1CJBVpw9YzVv
 PEj7C3YT2bM+bGcjpJrJnGhfl24H7v+AQcerrmYb6LKsrVYsAN8ZemHVvlU690LvPqgo
 64yWm+8SnsL4uAJ2Ns5ntjCd7sb4YGy1vh3WnWwTEG+5wb4/yOuNUTGubKEJkNKXXj3A
 Af6w==
X-Gm-Message-State: AOAM532MiuODa8ZEkNfDcGIN/buuL+fcplHIi33hRWdrDcwO1+pVAXnS
 HAQOd5s8T9mpMMvfcS3Q7mM5kw==
X-Google-Smtp-Source: ABdhPJwWEC9HwbcTz58sdbmUTleaPOjsDExx3u3MJe7UYTKAqinGSmHRrRGSIqyVmc4V1t6YgU/4OQ==
X-Received: by 2002:ac8:d03:: with SMTP id q3mr3814296qti.19.1612979788592;
 Wed, 10 Feb 2021 09:56:28 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id a25sm1697115qtw.87.2021.02.10.09.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 09:56:27 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l9tj0-00686U-SC; Wed, 10 Feb 2021 13:56:26 -0400
Date: Wed, 10 Feb 2021 13:56:26 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH 0/9] Add support for SVM atomics in Nouveau
Message-ID: <20210210175626.GN4718@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian> <20210209133520.GB4718@ziepe.ca>
 <20210209211738.GA834106@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209211738.GA834106@redhat.com>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Ben Skeggs <bskeggs@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 04:17:38PM -0500, Jerome Glisse wrote:

> > > Yes, I would like to avoid the long term pin constraints as well if possible I
> > > just haven't found a solution yet. Are you suggesting it might be possible to 
> > > add a callback in the page migration logic to specially deal with moving these 
> > > pages?
> > 
> > How would migration even find the page?
> 
> Migration can scan memory from physical address (isolate_migratepages_range())
> So the CPU mapping is not the only path to get to a page.

I mean find out that the page is now owned by the GPU driver to tell
it that it needs to migrate that reference. Normally that would go
through the VMA to the mmu notifier, but with the page removed from
the normal VMA it can't get to a mmu notifier or the GPU driver.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
