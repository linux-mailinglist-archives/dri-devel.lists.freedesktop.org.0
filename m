Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FBA39848B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 10:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99826E3C6;
	Wed,  2 Jun 2021 08:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249446E3C6;
 Wed,  2 Jun 2021 08:50:42 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id k5so1295012pjj.1;
 Wed, 02 Jun 2021 01:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o9lxecdQ+sUFtyWEQYnGHVSA9kUb7tM0XtaGYDbglIU=;
 b=EHucTEQtsxnfYE2QIpFkB+b80UKPVtGTuj44cfEGTctDfweDXFNWILx2kT/juLet+7
 oBhCr11wzlo8i3a1kMBkNGW2KgkQ3mL4ZdNrvSnEz/Q7rkxkl386Ip3wJ5rYkzSFOCqo
 1zamko+VpG6K/7JTBgdROITcvin5vhpWh6Ts6QOaJTg1HC88CFOon2Ut2v59IkScKCTj
 SexhOHCDaGtsqxI5BtUNlmmeY0E5hYObhyd8wqYN2Jzv0Jpbfh5n7Edss6F6dEFLlD4f
 32xH8cG/3ZD0vLVicGYr+P+g7E5syLUrogiZ/hqtvZHLW6GDp5MH71RbPal+/6f5MOCS
 hb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o9lxecdQ+sUFtyWEQYnGHVSA9kUb7tM0XtaGYDbglIU=;
 b=tmisFiptQSM3mA6yJpgtv9HSj+US/KJfxOsGdiChzl9LTnQMG8hTx0pJA9ITfTPjNq
 fLEU7N9aAv2MhsGy4EMhLKlay0uTHteM+OBK7emuoeJOGtxwGkUX7Ip9wJ14b+ZDeTKN
 4C+6C3qHUzxGNoZ3n6VPHaGoUWCiMVn566nGYBK3vv7HbdDJV8hLdoShN3pzHFrvpp/C
 7M/EPAEqa+87IdW73jLPkn2MMgxwuSG93lGpkC6Ln/nbtqJPq7ok8qcpab73p+icbisU
 GVzYRlONoATaMHNrwl95G19ghs1WYvekonVuZVIx7sFBuYR1rP1tN0R2aVViybVcTwER
 Hz7Q==
X-Gm-Message-State: AOAM531RSruvKXgJevT8ArIMdHpVWKFln9Y7proW3X1k6nBQ+9xTp/zS
 vweYBYuW7Y7ju3CzCwawnuQ=
X-Google-Smtp-Source: ABdhPJyaugF6+CYwrJI3pVkj2b4jzGpeXPEYzpUFLG3awQAK21ZuritpgNYaqMGnLzReJocPn1YhKg==
X-Received: by 2002:a17:90a:6e07:: with SMTP id b7mr4431857pjk.7.1622623841640; 
 Wed, 02 Jun 2021 01:50:41 -0700 (PDT)
Received: from localhost (60-242-95-222.static.tpgi.com.au. [60.242.95.222])
 by smtp.gmail.com with ESMTPSA id nn6sm5443508pjb.57.2021.06.02.01.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 01:50:40 -0700 (PDT)
Date: Wed, 2 Jun 2021 18:50:37 +1000
From: Balbir Singh <bsingharora@gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Message-ID: <YLdGXSw0zdiovn4i@balbir-desktop>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-8-apopple@nvidia.com>
 <20210524151157.2dc5d2bb510ff86dc449bf0c@linux-foundation.org>
 <YKzk0ILRsyazMs2W@balbir-desktop>
 <8844f8c1-d78c-e0f9-c046-592bd75d4c07@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8844f8c1-d78c-e0f9-c046-592bd75d4c07@nvidia.com>
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
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, peterx@redhat.com, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 12:17:18AM -0700, John Hubbard wrote:
> On 5/25/21 4:51 AM, Balbir Singh wrote:
> ...
> > > How beneficial is this code to nouveau users?  I see that it permits a
> > > part of OpenCL to be implemented, but how useful/important is this in
> > > the real world?
> > 
> > That is a very good question! I've not reviewed the code, but a sample
> > program with the described use case would make things easy to parse.
> > I suspect that is not easy to build at the moment?
> > 
> 
> The cover letter says this:
> 
> This has been tested with upstream Mesa 21.1.0 and a simple OpenCL program
> which checks that GPU atomic accesses to system memory are atomic. Without
> this series the test fails as there is no way of write-protecting the page
> mapping which results in the device clobbering CPU writes. For reference
> the test is available at https://ozlabs.org/~apopple/opencl_svm_atomics/
> 
> Further testing has been performed by adding support for testing exclusive
> access to the hmm-tests kselftests.
> 
> ...so that seems to cover the "sample program" request, at least.

Thanks, I'll take a look

> 
> > I wonder how we co-ordinate all the work the mm is doing, page migration,
> > reclaim with device exclusive access? Do we have any numbers for the worst
> > case page fault latency when something is marked away for exclusive access?
> 
> CPU page fault latency is approximately "terrible", if a page is resident on
> the GPU. We have to spin up a DMA engine on the GPU and have it copy the page
> over the PCIe bus, after all.
> 
> > I presume for now this is anonymous memory only? SWP_DEVICE_EXCLUSIVE would
> 
> Yes, for now.
> 
> > only impact the address space of programs using the GPU. Should the exclusively
> > marked range live in the unreclaimable list and recycled back to active/in-active
> > to account for the fact that
> > 
> > 1. It is not reclaimable and reclaim will only hurt via page faults?
> > 2. It ages the page correctly or at-least allows for that possibility when the
> >     page is used by the GPU.
> 
> I'm not sure that that is *necessarily* something we can conclude. It depends upon
> access patterns of each program. For example, a "reduction" parallel program sends
> over lots of data to the GPU, and only a tiny bit of (reduced!) data comes back
> to the CPU. In that case, freeing the physical page on the CPU is actually the
> best decision for the OS to make (if the OS is sufficiently prescient).
>

With a shared device or a device exclusive range, it would be good to get the device
usage pattern and update the mm with that knowledge, so that the LRU can be better
maintained. With your comment you seem to suggest that a page used by the GPU might
be a good candidate for reclaim based on the CPU's understanding of the age of
the page should not account for use by the device
(are GPU workloads - access once and discard?) 

Balbir Singh.

