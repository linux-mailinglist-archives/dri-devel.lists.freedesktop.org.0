Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E6963BBFB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 09:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEBD10E255;
	Tue, 29 Nov 2022 08:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F6C10E255
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 08:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669711720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9/SG262uJs5aEn47977HgvoOkAGZaXesrmlGYL/QQU=;
 b=i6fffV4iyglSBfw+Eusn5TIdEBkpkBIPrcw5XLFT3D3fg173kzlVSvLg9wQY2xxixwNJde
 jjTdliXMPn2s2laFFb/pJLooMZz1T1E6dyGh4akDaWCSnbsA79OnBYoDMP58d1AWnAYWEC
 3wqawrhv1Mc2ax/79kumXfSwuchntPY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-97-2mDr7cnKPBOy1guMrJ5kIQ-1; Tue, 29 Nov 2022 03:48:37 -0500
X-MC-Unique: 2mDr7cnKPBOy1guMrJ5kIQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so9859561wme.7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 00:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+9/SG262uJs5aEn47977HgvoOkAGZaXesrmlGYL/QQU=;
 b=BCFch1ibjAq+NRGBAxUQcXiZEY1VfHFNrQdikMAjRC25wptQFHdQlfcTWL3Yv1R9f1
 cOhhNvaOm5ma+Zkx2xQDnWvzjPhy5+d/FKpC62OOjrsgL5y2tmHp3cfekWN7xgiEvOvO
 A6Z/A24o7b/RXuRtqVdRSTQ3CX7ObPzesxyXLqyxfwo9l+KBWdUUQEQ88yBNbwCaeRzT
 IMAryUTYy3XN/vJ7Uk5L5ien21ub/FrSZJeXOR8NpB0Ny/c0gnYtEuabDDFa8h6IWM2T
 KxenCGFblrNbvcJ0E0rwFp+e4IM065Xm6LyPmrQ7LaarACbF4FAhCT2dPMRH233VEqpi
 +ggA==
X-Gm-Message-State: ANoB5pkijsfFHsOEHnSbOx9c1F6fb+Rgc+TFSoNxyqWxOEsk26lvbv2l
 jyeqnUZwms1LL3VvUhsZxFt6NxEbDNRh28iXRR+5JJcXw62kXsrMvd76yTIcfVRlrYKEHit86pZ
 qZY2nnn3UR4r9yJ0bKp2Mkafnh9S0
X-Received: by 2002:adf:ed86:0:b0:236:4930:2468 with SMTP id
 c6-20020adfed86000000b0023649302468mr27266643wro.221.1669711716556; 
 Tue, 29 Nov 2022 00:48:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5WObKFiHoIvjAvSDGoBWk7nZS9J8pydo8v+yQ7WbXm3jibFRxv0v14chgZsAxfMxQqYFXPxw==
X-Received: by 2002:adf:ed86:0:b0:236:4930:2468 with SMTP id
 c6-20020adfed86000000b0023649302468mr27266600wro.221.1669711716176; 
 Tue, 29 Nov 2022 00:48:36 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:ca00:3fb8:c253:3bf7:b60e?
 (p200300cbc705ca003fb8c2533bf7b60e.dip0.t-ipconnect.de.
 [2003:cb:c705:ca00:3fb8:c253:3bf7:b60e])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a5d5645000000b00225307f43fbsm13057331wrw.44.2022.11.29.00.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 00:48:35 -0800 (PST)
Message-ID: <22b1107b-0acc-5772-a883-8f3c4682eb1b@redhat.com>
Date: Tue, 29 Nov 2022 09:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH mm-unstable v1 16/20] mm/frame-vector: remove FOLL_FORCE
 usage
To: Andrew Morton <akpm@linux-foundation.org>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-17-david@redhat.com>
 <81fb0fa3-2e06-b765-56ac-a7d981194e59@redhat.com>
 <08b65ac6-6786-1080-18f8-d2be109c85fc@xs4all.nl>
 <9d0bf98a-3d6a-1082-e992-1338e1525935@redhat.com>
 <20221128145927.df895bf1966cfa125cae9668@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221128145927.df895bf1966cfa125cae9668@linux-foundation.org>
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
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 linux-rdma@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
 etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.11.22 23:59, Andrew Morton wrote:
> On Mon, 28 Nov 2022 09:18:47 +0100 David Hildenbrand <david@redhat.com> wrote:
> 
>>> Less chances of things going wrong that way.
>>>
>>> Just mention in the v2 cover letter that the first patch was added to
>>> make it easy to backport that fix without being hampered by merge
>>> conflicts if it was added after your frame_vector.c patch.
>>
>> Yes, that's the way I would naturally do, it, however, Andrew prefers
>> delta updates for minor changes.
>>
>> @Andrew, whatever you prefer!
> 
> I'm inclined to let things sit as they are.  Cross-tree conflicts
> happen, and Linus handles them.  I'll flag this (very simple) conflict
> in the pull request, if MM merges second.  If v4l merges second then
> hopefully they will do the same.  But this one is so simple that Linus
> hardly needs our help.
> 
> But Linus won't be editing changelogs so that the changelog makes more
> sense after both trees are joined.  I'm inclined to let the changelog
> sit as it is as well.

Works for me. Thanks Andrew!

-- 
Thanks,

David / dhildenb

