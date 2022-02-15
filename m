Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25FF4B6BD2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 13:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FB189CA2;
	Tue, 15 Feb 2022 12:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250F089CA2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 12:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644927342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=li59JkksonHEim8N19eLLyTcVUoQZhmnR79T7jisS84=;
 b=VzmYcxfB7+4gKXnH4m7ZuMtf78Wddqp48GIGOTv3EkS1MehitFAvU5Xlj2gJAPaFnm7+0r
 GUHmSWn4oINWhCkgv6AB4uVnm+emClkffN47vkNxO8p1QRO2meMmNk0YYEq//FCOReqDj+
 f4xgKiP5C6bcKEP01aV4c1iPjb9ggqw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-02t7TcyhOjSDQt8Uvd3rVQ-1; Tue, 15 Feb 2022 07:15:40 -0500
X-MC-Unique: 02t7TcyhOjSDQt8Uvd3rVQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so8308204wrd.22
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 04:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=li59JkksonHEim8N19eLLyTcVUoQZhmnR79T7jisS84=;
 b=J4qvtiNqS1UCGCmr2ebusWJ0GGzNZumh1mdQeZdUs/ecJGQ4Gzf74NeTc0VXrwgUPl
 R5BzfFnc6UqqeHVrf3eT/mwnUFl8qxKN0pKcGWkRLTK7xKUhd+72LozSPlQMmFa5XQ7X
 7DrCOAHGBTk7hxHEE1/mRR9NQwRswAliZK6AN1NoSxrfGKHHPR0B3iTuWUSQGbxn6c+i
 M87QlGSKIJeO72sD0+o5GcwROWp5LwPj2f18GCXAqeWV8MiTyeNCd91WOA/NN8DKA/uX
 a5f35DH5/ihDUdz2HlWxix6Ti8lxObBe17MdcngGdzha/vr+s6uw4k6qZUzdwwyaRTxr
 Scqw==
X-Gm-Message-State: AOAM530o0wEMIq7q7UcADm/T+6ifzgAHo6T6kJh1sTiGB3vuwL07uoEP
 vC6MsMmtq+1eLYnxY+8RwyDGPD9ERwAMdJ5veLlncbNl5MW4UntFeBOQGG9uKnaKQBmRCoL1y7n
 3PfBLHJQEeXDd/Zh3Jzzm54UbjgyG
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr3048018wry.639.1644927339743; 
 Tue, 15 Feb 2022 04:15:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkXiKIPDmUKc3peLAnxWMPOpVfO+YZVnwiubxG8ybWR9d1yWHVTQW3fpFRYPoIV1z4/FG1xQ==
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr3047997wry.639.1644927339488; 
 Tue, 15 Feb 2022 04:15:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:3700:9260:2fb2:742d:da3e?
 (p200300cbc70e370092602fb2742dda3e.dip0.t-ipconnect.de.
 [2003:cb:c70e:3700:9260:2fb2:742d:da3e])
 by smtp.gmail.com with ESMTPSA id u3sm18392835wmm.0.2022.02.15.04.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 04:15:39 -0800 (PST)
Message-ID: <7b830dc4-37bc-fb7b-c094-16595bd2a128@redhat.com>
Date: Tue, 15 Feb 2022 13:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <20220211164537.GO4160@nvidia.com>
 <6a8df47e-96d0-ffaf-247a-acc504e2532b@redhat.com>
 <20220211165624.GP4160@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
In-Reply-To: <20220211165624.GP4160@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix.Kuehling@amd.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.02.22 17:56, Jason Gunthorpe wrote:
> On Fri, Feb 11, 2022 at 05:49:08PM +0100, David Hildenbrand wrote:
>> On 11.02.22 17:45, Jason Gunthorpe wrote:
>>> On Fri, Feb 11, 2022 at 05:15:25PM +0100, David Hildenbrand wrote:
>>>
>>>> ... I'm pretty sure we cannot FOLL_PIN DEVICE_PRIVATE pages
>>>
>>> Currently the only way to get a DEVICE_PRIVATE page out of the page
>>> tables is via hmm_range_fault() and that doesn't manipulate any ref
>>> counts.
>>
>> Thanks for clarifying Jason! ... and AFAIU, device exclusive entries are
>> essentially just pointers at ordinary PageAnon() pages. So with DEVICE
>> COHERENT we'll have the first PageAnon() ZONE_DEVICE pages mapped as
>> present in the page tables where GUP could FOLL_PIN them.
> 
> This is my understanding
> 
> Though you probably understand what PageAnon means alot better than I
> do.. I wonder if it really makes sense to talk about that together
> with ZONE_DEVICE which has alot in common with filesystem originated
> pages too.

For me, PageAnon() means that modifications are visible only to the
modifying process. On actual CoW, the underlying page will get replaced
-- in the world of DEVICE_COHERENT that would mean that once you write
to a DEVICE_COHERENT you could suddenly have a !DEVICE_COHERENT page.

PageAnon() pages don't have a mapping, thus they can only be found in
MAP_ANON VMAs or in MAP_SHARED VMAs with MAP_PRIVATE. They can only be
found via a page table, and not looked up via the page cache (excluding
the swap cache).

So if we have PageAnon() pages on ZONE_DEVICE, they generally have the
exact same semantics as !ZONE_DEVICE pages, but the way they "appear" in
the page tables the allocation/freeing path differs -- I guess :)

... and as we want pinning semantics to be different we have to touch GUP.

> 
> I'm not sure what AMDs plan is here, is there an expecation that a GPU
> driver will somehow stuff these pages into an existing anonymous
> memory VMA or do they always come from a driver originated VMA?

My understanding is that a driver can just decide to replace "ordinary"
PageAnon() pages e.g., in a MAP_ANON VMA by these pages. Hopefully AMD
can clarify.


-- 
Thanks,

David / dhildenb

