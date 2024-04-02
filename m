Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8E4895668
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 16:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B34810FD5E;
	Tue,  2 Apr 2024 14:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GRxw5P5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DA210F698
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712067254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2JLn1owCc/szPDktX3u/BgafQ42qH7URBw20CKsDE2k=;
 b=GRxw5P5+setOtyDpB0G42+YI6BS3gXKFBlRh5hHMkTDIboN2/7W3DML2mKU3Fyjd/qAf9n
 p4zNWGsV1KWgSNCq7zfeT2mfD2bCzlKWtyRo0tRBTA0knMSvDusYSRhkPD9nENO6WnbBFs
 VP0VXM6UCcAs6nueiS/9E+IAzfUw5lE=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-89AC3KpYOp-auNMdFdaKQA-1; Tue, 02 Apr 2024 10:14:12 -0400
X-MC-Unique: 89AC3KpYOp-auNMdFdaKQA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2d48af389acso37251141fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 07:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712067251; x=1712672051;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2JLn1owCc/szPDktX3u/BgafQ42qH7URBw20CKsDE2k=;
 b=Q/0qtsuTxzD1G0M8GCwZcu2ZLwr1zXkhwbj4U9O/tbKxQtOTCwiefKifTxmHaxBNWR
 WS0qrSowkoHpUdzr8vKS041sTzYvWDS4T4Sej2aPQw+d4IWPSp/qZl/5mBywlvG8ep7G
 zMXlG+Ua8zsUGzEnvqWK9Zuzc32LdjqhSUk31tvkL6voruBlUCM5ocmGJmDd0PGzaG0w
 kvLpVOlTrmuTU9RBJJscja200NsmslXbEbZAZFTPOQAVJZwSe9nrBjLSm34dPJqVLh3o
 hTsQ/zKLgNatguqpkkhJrz4L/H6RhP1+4HPOboGjOwTITdr9txc41aJtxaUlUR1HPCNJ
 OskQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/1DGexnhOgVGr+Opuycn9uU3j+rVHrYCNxAMQBi5uehSkYrqKpRsDgGbyXMvTwarGGt3uyor8TqHzJpz+lmzqMxjbL8GeBDNnmkjKseMV
X-Gm-Message-State: AOJu0YwCjyVhcKNZhurUA6epzm+8Unpwp1shxFld2ETXH/pK6AqCFuSu
 h5gFCPWJ9oImqqzGJG3Y1sotjf+jZUcv4FlmFadwLsar4Ps0U2USbUO9OgP+LsHkgRRsW006vIL
 jP38o/bvNbi+2ncNxeURirqZO5qCRIKZyyT1i753QyFsMu2DqJNkecqVMWpNWQ+XmYw==
X-Received: by 2002:a2e:b0ed:0:b0:2d8:1249:a047 with SMTP id
 h13-20020a2eb0ed000000b002d81249a047mr5766856ljl.41.1712067251186; 
 Tue, 02 Apr 2024 07:14:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1pJhE8Jw0opzwPiJYg69uUNKw/UmEEjarbvxgKL/u2GymOP8Qih825dO/Gh9D/1YPFeggQg==
X-Received: by 2002:a2e:b0ed:0:b0:2d8:1249:a047 with SMTP id
 h13-20020a2eb0ed000000b002d81249a047mr5766831ljl.41.1712067250737; 
 Tue, 02 Apr 2024 07:14:10 -0700 (PDT)
Received: from ?IPV6:2003:cb:c732:e600:4982:2903:710f:f20a?
 (p200300cbc732e60049822903710ff20a.dip0.t-ipconnect.de.
 [2003:cb:c732:e600:4982:2903:710f:f20a])
 by smtp.gmail.com with ESMTPSA id
 k35-20020a05600c1ca300b004156afd6843sm4887490wms.18.2024.04.02.07.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 07:14:10 -0700 (PDT)
Message-ID: <17756b00-b051-40de-afa2-c3df97de755f@redhat.com>
Date: Tue, 2 Apr 2024 16:14:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/8] mm/gup: Introduce unpin_folio/unpin_folios helpers
From: David Hildenbrand <david@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Peter Xu <peterx@redhat.com>
References: <20240225080008.1019653-1-vivek.kasireddy@intel.com>
 <20240225080008.1019653-2-vivek.kasireddy@intel.com>
 <54381897-35bc-442d-951d-b9a89f16b1a5@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <54381897-35bc-442d-951d-b9a89f16b1a5@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 02.04.24 15:52, David Hildenbrand wrote:
> On 25.02.24 08:56, Vivek Kasireddy wrote:
>> These helpers are the folio versions of unpin_user_page/unpin_user_pages.
>> They are currently only useful for unpinning folios pinned by
>> memfd_pin_folios() or other associated routines. However, they could
>> find new uses in the future, when more and more folio-only helpers
>> are added to GUP.
>>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Matthew Wilcox <willy@infradead.org>
>> Cc: Christoph Hellwig <hch@infradead.org>
>> Cc: Jason Gunthorpe <jgg@nvidia.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> ---
>>    include/linux/mm.h |  2 ++
>>    mm/gup.c           | 81 ++++++++++++++++++++++++++++++++++++++++------
>>    2 files changed, 74 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 6f4825d82965..36e4c2b22600 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1601,11 +1601,13 @@ static inline void put_page(struct page *page)
>>    #define GUP_PIN_COUNTING_BIAS (1U << 10)
>>    
>>    void unpin_user_page(struct page *page);
>> +void unpin_folio(struct folio *folio);
>>    void unpin_user_pages_dirty_lock(struct page **pages, unsigned long npages,
>>    				 bool make_dirty);
>>    void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
>>    				      bool make_dirty);
>>    void unpin_user_pages(struct page **pages, unsigned long npages);
>> +void unpin_folios(struct folio **folios, unsigned long nfolios);
>>    
>>    static inline bool is_cow_mapping(vm_flags_t flags)
>>    {
>> diff --git a/mm/gup.c b/mm/gup.c
>> index df83182ec72d..0a45eda6aaeb 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -30,6 +30,23 @@ struct follow_page_context {
>>    	unsigned int page_mask;
>>    };
>>    
>> +static inline void sanity_check_pinned_folios(struct folio **folios,
>> +					      unsigned long nfolios)
>> +{
>> +	if (!IS_ENABLED(CONFIG_DEBUG_VM))
>> +		return;
>> +
>> +	for (; nfolios; nfolios--, folios++) {
>> +		struct folio *folio = *folios;
>> +
>> +		if (is_zero_folio(folio) ||
>> +		    !folio_test_anon(folio))
>> +			continue;
>> +
>> +		VM_BUG_ON_FOLIO(!PageAnonExclusive(&folio->page), folio);
> 
> That change is wrong (and the split makes the check confusing).
> 
> It could be that the first subpage is no longer exclusive, but the given
> (sanity_check_pinned_pages() ) subpage is exclusive for large folios.
> 
> I suggest dropping that change, and instead, in
> unpin_folio()/unpin_folios(), reject any anon folios for now.
> 
> So, replace the sanity_check_pinned_folios() in unpin_folio() /
> unpin_folios() by a VM_WARN_ON(folio_test_anon(folio));

After reading patch #2: drop both the sanity check and VM_WARN_ON() from 
unpin_folio()/unpin_folios(), and add a comment to the patch description 
that we cannot do the sanity checking without the subpage, and that we 
can reintroduce it once we have a single per-folio AnonExclusive bit.

-- 
Cheers,

David / dhildenb

