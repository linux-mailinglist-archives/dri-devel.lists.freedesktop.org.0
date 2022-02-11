Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2014B2A8E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 17:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0863B10E219;
	Fri, 11 Feb 2022 16:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F00910E220
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 16:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644597583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52cEaDM7AWwIPaCJI/Mv+zVmcSm8DpO7Z0SPMFeXq1c=;
 b=bJLO6AY3o67F1huAqMfx4YN1y0Y5CKMTW+rD9APQ/veSsJQi6T7IGi6TwlgoQZ7ewhYpKG
 VMW/ZQ/l/j2DBGTW2BZlvu+avhijFWWMaYDriKi2jw+85UBZwgV14hOi0VgUTdT8l9ymsK
 8qpCXyTRu6lHB5Zce8LEiZ+ywT89vfw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-3dO8hdcxP9asyvn24fyJFw-1; Fri, 11 Feb 2022 11:39:42 -0500
X-MC-Unique: 3dO8hdcxP9asyvn24fyJFw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f26-20020a7bc8da000000b0037bd7f39dbbso981338wml.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 08:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=52cEaDM7AWwIPaCJI/Mv+zVmcSm8DpO7Z0SPMFeXq1c=;
 b=rXCEiLm8xx3eYHyGWh29SifctPjHUl4DKBeR03mb8pQe+1qjTNHi0QigtGATymF8S3
 XBforvjj8vU1upazGaxeb3pcA97oEXouyLexgx5IpwHUoCcnhiSE3W6Qu7fuySGr/l2D
 s2XaBOgWklFgYSMIimCR/JSiPobuEuOHOni5sa9VY/JqJ7eesH3+vb1m/zrEfjMReU9I
 XzeKEFkoaF6nFYmVZ6SeQbuZUORUroVwKuThwHH6ytyiQCW6I5vsHNT9wSIx2h812GJI
 Fkr6N4pxm1TuPnkgKceIGLAbMthd08Jv1Eltz8DBTqxEUhjzoNZKV82G7Db6yiiFE2jF
 T7+Q==
X-Gm-Message-State: AOAM533/K8W+FcSvJXef5HhAbjLtdyVqguETxoiHIsBnwP14uqycUoCE
 gs6mhuVZUIcjUC3xyuNU8v+CgXaJ47npuH0svf2PnGRKDx0HjNZRnhSCWIFf0MDmAtS+3nUpwNm
 cl1MTGeI7Ou+j6Laz5BEHHwWhEgxJ
X-Received: by 2002:adf:fd8b:: with SMTP id d11mr1992009wrr.324.1644597581337; 
 Fri, 11 Feb 2022 08:39:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxG2+Cbb0dTVk2FSPauT9Ob17meX25qZzZA8tNbFh+KAUELa84lwydmL31J4KRtYZ2wF45ROQ==
X-Received: by 2002:adf:fd8b:: with SMTP id d11mr1991978wrr.324.1644597581081; 
 Fri, 11 Feb 2022 08:39:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c70c:aa00:4cc6:d24a:90ae:8c1f?
 (p200300cbc70caa004cc6d24a90ae8c1f.dip0.t-ipconnect.de.
 [2003:cb:c70c:aa00:4cc6:d24a:90ae:8c1f])
 by smtp.gmail.com with ESMTPSA id d18sm1232773wmq.18.2022.02.11.08.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 08:39:40 -0800 (PST)
Message-ID: <f2af73c1-396b-168f-7f86-eb10b3b68a26@redhat.com>
Date: Fri, 11 Feb 2022 17:39:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
From: David Hildenbrand <david@redhat.com>
To: Alex Sierra <alex.sierra@amd.com>, akpm@linux-foundation.org,
 Felix.Kuehling@amd.com, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
Organization: Red Hat
In-Reply-To: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.02.22 17:15, David Hildenbrand wrote:
> On 01.02.22 16:48, Alex Sierra wrote:
>> Device memory that is cache coherent from device and CPU point of view.
>> This is used on platforms that have an advanced system bus (like CAPI
>> or CXL). Any page of a process can be migrated to such memory. However,
>> no one should be allowed to pin such memory so that it can always be
>> evicted.
>>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> 
> So, I'm currently messing with PageAnon() pages and CoW semantics ...
> all these PageAnon() ZONE_DEVICE variants don't necessarily make my life
> easier but I'm not sure yet if they make my life harder. I hope you can
> help me understand some of that stuff.
> 
> 1) What are expected CoW semantics for DEVICE_COHERENT?
> 
> I assume we'll share them just like other PageAnon() pages during fork()
> readable, and the first sharer writing to them receives an "ordinary"
> !ZONE_DEVICE copy.
> 
> So this would be just like DEVICE_EXCLUSIVE CoW handling I assume, just
> that we don't have to go through the loop of restoring a device
> exclusive entry?
> 
> 2) How are these pages freed to clear/invalidate PageAnon() ?
> 
> I assume for PageAnon() ZONE_DEVICE pages we'll always for via
> free_devmap_managed_page(), correct?
> 
> 
> 3) FOLL_PIN
> 
> While you write "no one should be allowed to pin such memory", patch #2
> only blocks FOLL_LONGTERM. So I assume we allow ordinary FOLL_PIN and
> you might want to be a bit more precise?
> 
> 
> ... I'm pretty sure we cannot FOLL_PIN DEVICE_PRIVATE pages, but can we
> FILL_PIN DEVICE_EXCLUSIVE pages? I strongly assume so?
> 
> 
> Thanks for any information.
> 

(digging a bit more, I realized that device exclusive pages are not
actually/necessarily ZONE_DEVICE pages -- so I assume DEVICE_COHERENT
will be the actual first PageAnon() ZONE_DEVICE pages that can be
present in a page table.)

-- 
Thanks,

David / dhildenb

