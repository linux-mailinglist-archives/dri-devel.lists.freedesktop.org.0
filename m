Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A7A89992F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 11:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F1A10EA13;
	Fri,  5 Apr 2024 09:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GdAORM3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AFC10EA11
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712308505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UkJ21UDriSdB6gArKOJeT8psAEbfoK/LWacdcKmVSAE=;
 b=GdAORM3Y4akFscgJWWwxQaesrHqDXZyl0Qwyd19PPuLSCxp44vQ6MXg1/GCMv4d9B9abqf
 MgoR5HjqNQHAf6LJ94l6Bl5rPM6vOcIuoLEeAseKbCK1hV8Z6d8ZVM3tloJihT4D3UWpVi
 XHtyvOEMrIThgPeeDh6+aeBGERCS8FE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-zFI3b63WOB6fKARuKGIAwQ-1; Fri, 05 Apr 2024 05:15:03 -0400
X-MC-Unique: zFI3b63WOB6fKARuKGIAwQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-41552c04845so9424745e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 02:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712308503; x=1712913303;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UkJ21UDriSdB6gArKOJeT8psAEbfoK/LWacdcKmVSAE=;
 b=tVzKLLHSJPVBM+vyCQQdZkNow9ktfVGjyEd+745s+RKAB7h/urCHfAgdD3BuyVuwLc
 TxObRT0Zd4jmNXJrnqhQvP58m7Q59nmYrxZBlGkBx+Cg1ZRzk6M+hYUPxDpIJtb8BocD
 doKhfV6PU3ULUDvzBE2s2R3xwxcd+rcHwSTX+Ql+eCQLfafLyBU+LRe/GTWt9DwqkoOm
 0cv5OLzByV4IqF0oIgFJ2Nrc/heI9lUrkWKAbhE36/RM8b8DRQ3M8MDyy5+5JW/u8LRw
 7bAMOLyd90rqgoGB94r8z+KHXvFuMQ9QSlsOZYn6gQuCeJKGbb0jaUpiMMmmWcSL2zZZ
 /guA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/VnlNrhMd4kLm4Xgx/7U64t4YakfJWUBy0h11OCAGzBB8W+li//60W/sMVK8SWfFJwD3gZc36PDLc2sQovNcYdkLLu6jW9Cc1Xndq3njK
X-Gm-Message-State: AOJu0YxAdZekINEzEG5v/tbBpaEjT62EeYdVaONU82iIWyN8fLJdd293
 rXCQW4Hr/zcKsPV8YzsorMX1OeEoDhvBI+ahULXzAoZfxpWSbf4CIuG2ML9J5NPZ5eq7XFLuJVR
 Inelz0j24Va8oUxLHZ1pibdSZpWZXXD2S+B8VVYgv7q/x0w1pw4AxbljHClCG2iqrpA==
X-Received: by 2002:a05:600c:1395:b0:414:71b2:c915 with SMTP id
 u21-20020a05600c139500b0041471b2c915mr652798wmf.34.1712308502829; 
 Fri, 05 Apr 2024 02:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK8iYw5gNsHqd33kUGW5zS/Q/OT++PTQexCmlbKk0IjARRuAEJQnU2Z/jAZYgDVpch62m1Jw==
X-Received: by 2002:a05:600c:1395:b0:414:71b2:c915 with SMTP id
 u21-20020a05600c139500b0041471b2c915mr652777wmf.34.1712308502426; 
 Fri, 05 Apr 2024 02:15:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74b:5500:e1f8:a310:8fa3:4ec1?
 (p200300cbc74b5500e1f8a3108fa34ec1.dip0.t-ipconnect.de.
 [2003:cb:c74b:5500:e1f8:a310:8fa3:4ec1])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a5d5502000000b0033e786abf84sm1536706wrv.54.2024.04.05.02.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 02:15:01 -0700 (PDT)
Message-ID: <a85b5fa1-d155-4be7-a4de-ae466357aef1@redhat.com>
Date: Fri, 5 Apr 2024 11:15:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/8] mm/gup: Introduce unpin_folio/unpin_folios helpers
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Peter Xu <peterx@redhat.com>
References: <20240404073053.3073706-1-vivek.kasireddy@intel.com>
 <20240404073053.3073706-2-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240404073053.3073706-2-vivek.kasireddy@intel.com>
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
> These helpers are the folio versions of unpin_user_page/unpin_user_pages.
> They are currently only useful for unpinning folios pinned by
> memfd_pin_folios() or other associated routines. However, they could
> find new uses in the future, when more and more folio-only helpers
> are added to GUP.
> 
> We should probably sanity check the folio as part of unpin similar
> to how it is done in unpin_user_page/unpin_user_pages but we cannot
> cleanly do that at the moment without also checking the subpage.
> Therefore, sanity checking needs to be added to these routines once
> we have a way to determine if any given folio is anon-exclusive (via
> a per folio AnonExclusive flag).
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

