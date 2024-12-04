Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EF29E3EE2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 16:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C058910E4E2;
	Wed,  4 Dec 2024 15:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="L9iuDnc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A168210E4E2
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733327938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PKbyfYlEzsBujPEJXUvTgJm5gyk4gXBwn1S2KY6PxE0=;
 b=L9iuDnc8SdhvbPBYy/7F5qniOwSf7SbrFE0ZBFzdXaDToPjcmlOHVFme+asyEKjWziI05T
 T97sEsfQqNqqLcIN6wuL4Tkge7MHFIeuMMdaPsLMamlE0vCnZQPxi8YQnrNGOlTtI3RBfL
 NHE6DcGPMHyPCy8C/9xGO6U1BDXczZY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-nrJ9Xif_NMSPNjpQ_h5W7g-1; Wed, 04 Dec 2024 10:58:57 -0500
X-MC-Unique: nrJ9Xif_NMSPNjpQ_h5W7g-1
X-Mimecast-MFC-AGG-ID: nrJ9Xif_NMSPNjpQ_h5W7g
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385e5e3bf60so2992974f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 07:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733327936; x=1733932736;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PKbyfYlEzsBujPEJXUvTgJm5gyk4gXBwn1S2KY6PxE0=;
 b=wq94X9jcOIpiIhV+6RJJWBCYCZiW8L3INKwaosjJ0tmujcuaTYKuybJfTmsuctiv2b
 5I8/aO3cEzEAj/1QyD3TzMVdOMX/FganrxMwNeD4q7WY9M5PoMUQ4/8jrTaFNWC9hL/z
 O7egm3qX3osgTLANxhflHQdLLMcXxHkVlWbDlx3lBGNtp+NVub9zdrj+0+OmKMDo4Mhw
 nh8VKa/7heRXYnCX8erkvpCpJs43I3qad4RUyHSBqcexBjfCVSKe9b6tl54ptFhoAbtq
 pw0Yf4AImRtL/DuO3HCH5NjyDLi4YRdK2iwHLGt8X+TWVEjzepluGLM5PDD3CmEc8MTf
 GN7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBcUxsPtGyZ2usOAgmIQIeX7WcWlh9A8zkqHDuuAdra0rJs3+Z0lix3egpKnL3CV4K4OE3Pmjy8lw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyyn2DrHtyL1yx4Z2J6IUcYOP/+UJ6zt/35dbVtDxKtMku8rql4
 nrgmDc4P3/941008LQ0zhZPdr3kAr9GSkyp9t7h2LA3tbjYxDtiO4ctiC/PGGcCRUmzFoj4Wjo6
 rxJ3z4yjUeXRruPS8hH/P48neHD/94zuF5R304KxaIgPRmh/5JQtMkI5jU021+fQxJA==
X-Gm-Gg: ASbGncsGFzTHDVehJcldfIRqejtrSkwXyAOuIPYbhyBY3kNuKa0vL2IyOq2kYksAoqU
 JQT4ryYLvF8Apvbs10jIae1tE7HMyRh9TG9onXDnURSmrsB+cCFZtWaImflt6KPxwJLqJDCgoJ3
 cn2zRNpXZjb/HfJwhHie26AuVTUZqPWacMilqeHLSetP47eux5uSlNjeju0bQ5lg0X224LFuB3X
 jvTfjH2Iz2cdZjDLvumeDaHs9r94w4JV853LC+eLrXODqknJILeiWMT7Or50AqoQOeIpDbVrkXu
 rZVkmppJmZJMqN/v/6gwz+nF8mwKxK18bkEcrbDr9z7y4f4I1fn0qnp9QDJ4k0IlurcLT3ASrDC
 KEg==
X-Received: by 2002:a5d:6d0a:0:b0:385:df87:28de with SMTP id
 ffacd0b85a97d-385fd433607mr5947958f8f.56.1733327936073; 
 Wed, 04 Dec 2024 07:58:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdOQUBULKzvFzkHWqPRGxc1LuUQ7T34ds9Ipq4JMMTeGrEwEobbTL5YAOMuZklHAw/mSdAhw==
X-Received: by 2002:a5d:6d0a:0:b0:385:df87:28de with SMTP id
 ffacd0b85a97d-385fd433607mr5947932f8f.56.1733327935659; 
 Wed, 04 Dec 2024 07:58:55 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:e100:38d6:8aa1:11b0:a20a?
 (p200300cbc70be10038d68aa111b0a20a.dip0.t-ipconnect.de.
 [2003:cb:c70b:e100:38d6:8aa1:11b0:a20a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385faec0c9dsm6142889f8f.20.2024.12.04.07.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 07:58:54 -0800 (PST)
Message-ID: <cebb44b2-e258-43ff-80a5-6bd19c8edab8@redhat.com>
Date: Wed, 4 Dec 2024 16:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Removing page->index
To: Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-s390@vger.kernel.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <Z09hOy-UY9KC8WMb@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z09hOy-UY9KC8WMb@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 42vVMBPQQDsaey0fHzABZr5_4V1s1f3xQF9MhKNLH8A_1733327936
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

On 03.12.24 20:51, Matthew Wilcox wrote:
> I've pushed out a new tree to
> git://git.infradead.org/users/willy/pagecache.git shrunk-page
> aka
> http://git.infradead.org/?p=users/willy/pagecache.git;a=shortlog;h=refs/heads/shrunk-page
> 
> The observant will notice that it doesn't actually shrink struct page
> yet.  However, we're getting close.  What it does do is rename
> page->index to page->__folio_index to prevent new users of page->index
> from showing up.

BTW, I was wondering how often we convert a page to a folio to then 
access folio->index / folio->mapping and not actually having a folio (in 
the future).

I suspect this will need quite some changes to get it right, and I would 
count that as "less obvious".

Calling PageAnon() on anything mapped into user space page tables might 
be one such case, for example.

> 
> There are (I believe) three build failures in that tree:
> 
>   - fb_defio
>   - fbtft
>   - s390's gmap (and vsie?  is that the same thing?)

Not completely (vsie (nested VMs) uses shadow gmap, ordinary VMs use 
ordinary gmap) , but they are very related (-> KVM implementation on s390x).

I know that Claudio is working on some changes, but not sure how that 
would affect gmap's usage of page->index.

s390x gmap is 64bit only, so we have to store stuff in 8byte. gmap page 
tables are

Maybew e could simply switch from page->index to page->private? But I 
lost track if that will also be gone in the near future :)

> 
> Other than that, allmodconfig builds on x86 and I'm convinced the build
> bots will tell me about anything else I missed.
> 
> Lorenzo is working on fb_defio and fbtft will come along for the ride
> (it's a debug printk, so could just be deleted).
> 
> s390 is complicated.  I'd really appreciate some help.
> 
> The next step is to feed most of the patches through the appropriate
> subsystems.  Some have already gone into various maintainer trees
> (thanks!)
> 
> 
> There are still many more steps to go after this; eliminating memcg_data
> is closest to complete, and after that will come (in some order)
> eliminating ->lru, ->mapping, ->refcount and ->mapcount. 

Will continue working on the latter ;)

-- 
Cheers,

David / dhildenb

