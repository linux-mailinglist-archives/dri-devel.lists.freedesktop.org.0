Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FE86285AF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 17:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD65410E24B;
	Mon, 14 Nov 2022 16:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4F410E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668444070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZ1hrVX7kXFY0qnXApuXHacxT8A1bIDmlqR7XFCqRdI=;
 b=BsJCibRMRPlRf176ZcyQ5OnOcEwRlV+jUHBRF3RvYjmuYi2mans8p2NZ6fnKqQPumaxqXg
 Sofc6VEeWET/LYrm11tVV3bJ+Sa8fPg+QoTEbWgVlUl5dYhtZNTJUNDP7TB7JevbvnUlax
 d+HcZrlsR1+//PVlas7mIYN5X0MW9iA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-jORyavd-NUikunP_nq-H-Q-1; Mon, 14 Nov 2022 11:41:06 -0500
X-MC-Unique: jORyavd-NUikunP_nq-H-Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso6992223wms.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jZ1hrVX7kXFY0qnXApuXHacxT8A1bIDmlqR7XFCqRdI=;
 b=Y5+E1D6tPX90ZP/QX5XaWQzXlYXmrtrrkO9I0X2czoiJ8whJx6c0iB1vmhAmAHgwE0
 pGfoEbYvq1DQqdS+asSAKY8sduC0EfLSaRmH8p9sIDk41pENbU1mdvIQKTBki32Ap3xj
 9BjcDC3tmHxadZ3PK3im81AwYODoiq+foD0J1lcb8adtBxCO4s663C/RfvO7PwM3h6kl
 uAUJp8aqO/7Eq7Q8LuNBUa4ryhm2Nr17RH1qvi6HAq/UPw7omdu5zRSx2TYp2THLKCl2
 lCMXtwwyLHIDk6J0uSQAVkFjwaWLKlhVID0My+Mv/RJm47yruXozi72CNU3rkNR6zP85
 FDHw==
X-Gm-Message-State: ANoB5pk+FtM2lAPcN/JuRbUiXYe21qIfgEU1zwsTm2lrr5yv7cgTXc0n
 v0jsmViFYYYkwvLSiHcclTuoxof5EB/V3sDoo0yYl1d2LgasMO/nUhK1SS785VYG8QDW/D4bhXN
 6VbU1vBEGW9H1R4ZcB+UuBd2DQmPn
X-Received: by 2002:adf:ce01:0:b0:22e:31a4:2323 with SMTP id
 p1-20020adfce01000000b0022e31a42323mr8207890wrn.691.1668444065075; 
 Mon, 14 Nov 2022 08:41:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6HOm5uZoYYfwRZ6fSo7NFXg+Fb6KpdFP3sohZDKA9PBTJcMcvvSRIYmlAZ4q5NmmrOzg19aQ==
X-Received: by 2002:adf:ce01:0:b0:22e:31a4:2323 with SMTP id
 p1-20020adfce01000000b0022e31a42323mr8207874wrn.691.1668444064801; 
 Mon, 14 Nov 2022 08:41:04 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:d300:d881:1fd5:bc95:5e2d?
 (p200300cbc703d300d8811fd5bc955e2d.dip0.t-ipconnect.de.
 [2003:cb:c703:d300:d881:1fd5:bc95:5e2d])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a056000110f00b0022a3a887ceasm10012300wrw.49.2022.11.14.08.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 08:41:04 -0800 (PST)
Message-ID: <f9826c72-7265-7c6f-371b-7ebab4aa27e0@redhat.com>
Date: Mon, 14 Nov 2022 17:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] mm/memory: Return vm_fault_t result from migrate_to_ram()
 callback
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20221114115537.727371-1-apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221114115537.727371-1-apopple@nvidia.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14.11.22 12:55, Alistair Popple wrote:
> The migrate_to_ram() callback should always succeed, but in rare cases
> can fail usually returning VM_FAULT_SIGBUS. Commit 16ce101db85d
> ("mm/memory.c: fix race when faulting a device private page")
> incorrectly stopped passing the return code up the stack. Fix this by
> setting the ret variable, restoring the previous behaviour on
> migrate_to_ram() failure.
> 
> Fixes: 16ce101db85d ("mm/memory.c: fix race when faulting a device private page")
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Alex Sierra <alex.sierra@amd.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> 
> ---
> 
> Hi Andrew, I noticed my series needs another small fix which I'm
> hoping you can apply for v6.1-rcX. Thanks (and sorry for not catching
> this sooner).
> ---
>   mm/memory.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index f88c351aecd4..8a6d5c823f91 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3763,7 +3763,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>   			 */
>   			get_page(vmf->page);
>   			pte_unmap_unlock(vmf->pte, vmf->ptl);
> -			vmf->page->pgmap->ops->migrate_to_ram(vmf);
> +			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
>   			put_page(vmf->page);
>   		} else if (is_hwpoison_entry(entry)) {
>   			ret = VM_FAULT_HWPOISON;


Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

