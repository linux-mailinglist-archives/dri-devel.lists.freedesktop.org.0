Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF0627716
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4EB10E272;
	Mon, 14 Nov 2022 08:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96C510E272
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668413262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sc3OD/33LVOTPB4+NFeZBiaw904aPGsKctdDvYBcdUs=;
 b=SeAv1Ms+c08rDc/o0xlYib1ri6FsJPXDtS/28wBusHLgXOTso7dso1fKsVTDJ5CHvHpKx0
 dPfEmadO9EhEyL9S+8eoXJhVdMACF6U0usS4a1bm+Gj0cRIwnA4Mya3srjR6qOAdgk4Ow7
 cL0auSI083h+/d/P5WCXUD4HMNsl16A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-RRnzpCjCMZa3J3vAWhZb2w-1; Mon, 14 Nov 2022 03:07:38 -0500
X-MC-Unique: RRnzpCjCMZa3J3vAWhZb2w-1
Received: by mail-wm1-f71.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so2657647wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 00:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sc3OD/33LVOTPB4+NFeZBiaw904aPGsKctdDvYBcdUs=;
 b=ICGG0A3Q1/850SVwrRaZeZDMqSXCKGWPg2jhBmZk+ov6JVvZQuK/37GlGx4j+ZnOZf
 aX2QJstlTFUawht9ySyDkkaemoMBRNsSoi/JwIlgoOT03w7pqJUvXUNzsv2isAVPyg9j
 6L/wL4Sivf3b53lKre/NgkP1CBmdiRZp0pwgupRy0Vuou2bDdOSCIM0sWcNDZaPLsZeX
 XbnZ7Mg9N8KlYXcUXN+xDH+h+jLdMTsy/WV2V4uAzaVYkYx/OX0mHjX5L4x9tuXwglLU
 ILh0QF1Vufr6SpmalKdJRDkF8r6tXMoUI1+LDaA37BY/Tfp2xsXAyGnb2kWwpdVvsMDM
 1DSQ==
X-Gm-Message-State: ANoB5pnqFOZ9gi4cR+9czAWAVdIqrHvrk8jih+Pd8ARMEkNrBdnNaafi
 bshvBpKlz2ukB3HIjRGFVMo+mi5qacJoK5Wvk/bLLP4wcl5OA5vQOm+MdnVnUWLYTAYRocDU4zp
 EOsf3UOznYoq2oUo5LBeG2OPG8j/V
X-Received: by 2002:a5d:4575:0:b0:236:6e4b:8c2 with SMTP id
 a21-20020a5d4575000000b002366e4b08c2mr6336366wrc.545.1668413257330; 
 Mon, 14 Nov 2022 00:07:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7nVXgU/8Jv+xzckTpvD06sshk0g6lWh6ohMy1bXzH3vi7keYGWVfIARGixyNY+Rc8WvFWGhQ==
X-Received: by 2002:a5d:4575:0:b0:236:6e4b:8c2 with SMTP id
 a21-20020a5d4575000000b002366e4b08c2mr6336334wrc.545.1668413256954; 
 Mon, 14 Nov 2022 00:07:36 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:d300:8765:6ef2:3111:de53?
 (p200300cbc703d30087656ef23111de53.dip0.t-ipconnect.de.
 [2003:cb:c703:d300:8765:6ef2:3111:de53])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a5d540b000000b0022cdeba3f83sm8798705wrv.84.2022.11.14.00.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 00:07:36 -0800 (PST)
Message-ID: <f233f77b-a065-37aa-e2fb-5b92899dd13b@redhat.com>
Date: Mon, 14 Nov 2022 09:07:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC 00/19] mm/gup: remove FOLL_FORCE usage from drivers
 (reliable R/O long-term pinning)
To: Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20221107161740.144456-1-david@redhat.com>
 <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
 <Y3HaGbPcGfTxlLPZ@infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y3HaGbPcGfTxlLPZ@infradead.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 linux-rdma@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 etnaviv@lists.freedesktop.org, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>, Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.11.22 07:03, Christoph Hellwig wrote:
> On Mon, Nov 07, 2022 at 09:27:23AM -0800, Linus Torvalds wrote:
>> And I'd really love to just have this long saga ended, and FOLL_FORCE
>> finally relegated to purely ptrace accesses.
> 
> At that point we should also rename it to FOLL_PTRACE to make that
> very clear, and also break anything in-flight accidentally readding it,
> which I'd otherwise expect to happen.

Good idea; I'll include a patch in v1.

-- 
Thanks,

David / dhildenb

