Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DC9183359
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 15:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D366EAB2;
	Thu, 12 Mar 2020 14:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCFBA6EAB2;
 Thu, 12 Mar 2020 14:40:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D1D130E;
 Thu, 12 Mar 2020 07:40:17 -0700 (PDT)
Received: from [10.57.15.252] (unknown [10.57.15.252])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92E703F534;
 Thu, 12 Mar 2020 07:40:13 -0700 (PDT)
Subject: Re: [PATCH] mm/hmm: Simplify hmm_vma_walk_pud slightly
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <5bd778fa-51e5-3e0c-d9bb-b38539b03c8d@arm.com>
 <20200312102813.56699-1-steven.price@arm.com>
 <20200312142749.GM31668@ziepe.ca>
From: Steven Price <steven.price@arm.com>
Message-ID: <58e296a6-d32b-bb37-28ce-ade0f784454d@arm.com>
Date: Thu, 12 Mar 2020 14:40:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312142749.GM31668@ziepe.ca>
Content-Language: en-GB
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/03/2020 14:27, Jason Gunthorpe wrote:
> On Thu, Mar 12, 2020 at 10:28:13AM +0000, Steven Price wrote:
>> By refactoring to deal with the !pud_huge(pud) || !pud_devmap(pud)
>> condition early it's possible to remove the 'ret' variable and remove a
>> level of indentation from half the function making the code easier to
>> read.
>>
>> No functional change.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Thanks to Jason's changes there were only two code paths left using
>> the out_unlock label so it seemed like a good opportunity to
>> refactor.
> 
> Yes, I made something very similar, what do you think of this:
> 
> https://github.com/jgunthorpe/linux/commit/93f0ed42ab3f9ceb27b58fb7c7c3ecaf60f16b36

Even better! Sorry I didn't realise you'd already done this. I just saw 
that the function was needlessly complicated after your fix, so I 
thought I'd do a drive-by cleanup since part of the mess was my fault! :)

Thanks,

Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
