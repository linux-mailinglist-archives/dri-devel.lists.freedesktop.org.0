Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5201289994D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 11:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8392E10E9C7;
	Fri,  5 Apr 2024 09:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q/86jhJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2978610E9C7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712308779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8IF4/jxhc/3/WzvhvhnPveK8cQIaCBIwC34EM7caYDI=;
 b=Q/86jhJtY4V0PPtwFZoUlpc9g0a4ixfu7LGnwB4By2To/6NVaF8o9Udz6gvM0Xp4X9AP6e
 NBKAiXDFcN06CA6+j9gpjmjf3pOHtuVmT8dBmEYcDTe2flxvIETi8a+0baBmqTIwoAfI0m
 D2dPASb9HZ16kBpqb5SiaWzIm10vQZA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-3C8B5mdsNzWGVqHtYyKxVg-1; Fri, 05 Apr 2024 05:19:35 -0400
X-MC-Unique: 3C8B5mdsNzWGVqHtYyKxVg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-414042da713so15461775e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 02:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712308774; x=1712913574;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8IF4/jxhc/3/WzvhvhnPveK8cQIaCBIwC34EM7caYDI=;
 b=ZAz+9ZE7GFwXaz4oP0y72bk5m8DIrVU0b53WeJ7UKKAQ8Fb7SUdHO4AWlNYZFrbqoS
 xN/9zTy38mX2qi6W4a89Qg6YJ9dR8GYQLBzXJZ+LQ4r0jJphEujT1xVoJ6BXU0zcMxPb
 nvaneuU12WQvA6Rsx6+0SeF1Q2CqmwMZrV5PtEzqlActS5rYMNxJ8SRxZM+xLQRBua88
 /nCisH4hyV664pZkbEVcbuPbxFuxNSgpfsGv/SCMCW0X5S9Kzrhp7blEfhyZuLji5Add
 59rkjWJ+i56/DH5/gq+TDBDV8NwEyFIv4+wBcVBdHCUREISGoSHUZKq/s9fO7aAPtOJa
 Jd/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvC5gQfoZOXvp+zbIfzkGiLoPSO9tfw1G3gn8O11ipSJPmwOS6cfGJgVPznZh/l+KdmTb5hzmI+ZTrLt8lNBzIfZUjd1GIJXwveocramS2
X-Gm-Message-State: AOJu0YyxJNdAC5YBajohAbWYWm+pr2DZjEFMa8fuyZu2S3WCfsXu4ki2
 JPrg8i+vZkpUOhiGa1K8G4TMwzU1Uon4tCCC35E2lc6o9uxMezXzecDgVp+P+ZnHyEYLpImZ0De
 zyyYEm7+0loAQC3pEDZwztim609q5g4gVfyM+/z4O9xRye06QRXwzDkjGWruMqTZhUg==
X-Received: by 2002:a5d:4705:0:b0:343:7f4b:6da5 with SMTP id
 y5-20020a5d4705000000b003437f4b6da5mr1728417wrq.17.1712308774398; 
 Fri, 05 Apr 2024 02:19:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC9UN9KmrIImOTgNNyitLuITiDXGJ7+WLds70o9ANjlY/L1WXuVcOb379zcScHSd/zjMe+zQ==
X-Received: by 2002:a5d:4705:0:b0:343:7f4b:6da5 with SMTP id
 y5-20020a5d4705000000b003437f4b6da5mr1728395wrq.17.1712308774027; 
 Fri, 05 Apr 2024 02:19:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74b:5500:e1f8:a310:8fa3:4ec1?
 (p200300cbc74b5500e1f8a3108fa34ec1.dip0.t-ipconnect.de.
 [2003:cb:c74b:5500:e1f8:a310:8fa3:4ec1])
 by smtp.gmail.com with ESMTPSA id
 r24-20020adfb1d8000000b00341b451a31asm1565967wra.36.2024.04.05.02.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 02:19:33 -0700 (PDT)
Message-ID: <a8b536ca-0882-4e13-9681-4ff2f1d2a7d9@redhat.com>
Date: Fri, 5 Apr 2024 11:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/8] mm/gup: Introduce
 check_and_migrate_movable_folios()
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Peter Xu <peterx@redhat.com>
References: <20240404073053.3073706-1-vivek.kasireddy@intel.com>
 <20240404073053.3073706-3-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240404073053.3073706-3-vivek.kasireddy@intel.com>
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

On 04.04.24 09:26, Vivek Kasireddy wrote:
> This helper is the folio equivalent of check_and_migrate_movable_pages().
> Therefore, all the rules that apply to check_and_migrate_movable_pages()
> also apply to this one as well. Currently, this helper is only used by
> memfd_pin_folios().
> 
> This patch also includes changes to rename and convert the internal
> functions collect_longterm_unpinnable_pages() and
> migrate_longterm_unpinnable_pages() to work on folios. As a result,
> check_and_migrate_movable_pages() is now a wrapper around
> check_and_migrate_movable_folios().
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---

[...]

> +/*
> + * Check whether all folios are *allowed* to be pinned indefinitely (longterm).
> + * Rather confusingly, all folios in the range are required to be pinned via
> + * FOLL_PIN, before calling this routine.
> + *
> + * If any folios in the range are not allowed to be pinned, then this routine
> + * will migrate those folios away, unpin all the folios in the range and return
> + * -EAGAIN. The caller should re-pin the entire range with FOLL_PIN and then
> + * call this routine again.
> + *
> + * If an error other than -EAGAIN occurs, this indicates a migration failure.
> + * The caller should give up, and propagate the error back up the call stack.
> + *
> + * If everything is OK and all folios in the range are allowed to be pinned,
> + * then this routine leaves all folios pinned and returns zero for success.
> + */
> +static long check_and_migrate_movable_folios(unsigned long nr_folios,
> +					     struct folio **folios)
> +{
> +	unsigned long collected;
> +	LIST_HEAD(movable_folio_list);
> +
> +	collected = collect_longterm_unpinnable_folios(&movable_folio_list,
> +						       nr_folios, folios);
> +	if (!collected)
> +		return 0;
> +
> +	return migrate_longterm_unpinnable_folios(&movable_folio_list,
> +						  nr_folios, folios);
> +}
> +
>   /*
>    * Check whether all pages are *allowed* to be pinned. Rather confusingly, all
>    * pages in the range are required to be pinned via FOLL_PIN, before calling

Likely we should just drop that comment and refer to 
check_and_migrate_movable_folios() instead. No need to duplicate all that.

> @@ -2555,16 +2585,20 @@ static int migrate_longterm_unpinnable_pages(
>   static long check_and_migrate_movable_pages(unsigned long nr_pages,
>   					    struct page **pages)
>   {
> -	unsigned long collected;
> -	LIST_HEAD(movable_page_list);
> +	struct folio **folios;
> +	long i, ret;
>   
> -	collected = collect_longterm_unpinnable_pages(&movable_page_list,
> -						nr_pages, pages);
> -	if (!collected)
> -		return 0;
> +	folios = kmalloc_array(nr_pages, sizeof(*folios), GFP_KERNEL);
> +	if (!folios)
> +		return -ENOMEM;
>   
> -	return migrate_longterm_unpinnable_pages(&movable_page_list, nr_pages,
> -						pages);
> +	for (i = 0; i < nr_pages; i++)
> +		folios[i] = page_folio(pages[i]);


I wonder if we have to handle pages[i] being NULL. Hopefully not :)

Looks straight forward now:

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

