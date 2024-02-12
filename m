Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E937C8517C6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 16:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBDF10E8ED;
	Mon, 12 Feb 2024 15:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fOmsiwVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0807B10E809
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707751060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0adANtr6IwbtjNWnYkh0vuaJaZzmH8KV1/mm2CL+0c=;
 b=fOmsiwVxwRODZoYdOBwIP9JDSTtpw1VNuSAfiEkG3NHcRkAjA81T1p7VqfADDBOymRSanf
 z4KcHXwAvOuv8KQW/B3zIIfRUPIYooL5DOKMmJurB9xShFDMqytilSuTRygy3Y+RPTuth8
 XHKcwGe7iUUHqPKpimxibox6iM7cG3w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-1625O2ZnMFGEcKYE_eYJQA-1; Mon, 12 Feb 2024 10:17:36 -0500
X-MC-Unique: 1625O2ZnMFGEcKYE_eYJQA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a3c177d4fe7so106060666b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 07:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707751055; x=1708355855;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0adANtr6IwbtjNWnYkh0vuaJaZzmH8KV1/mm2CL+0c=;
 b=RNzPnUOtfg/p8K6Warw+YtG1zg6eVPiVHP5CU0eb00TSciH7Duij84O/MGxW3e+hB7
 4FDIkLShJOjrOh9WthcC0vywpCziSlJdUFw/qAYJRxemeNEKOFoSAqTC8lXzqZGIBvWr
 P9QtrQMBZrTBnePWlPtBFhcPBA6xU2S6MlkmYawWWkrrV7rCzegpNatN8b2z1lKkLi/d
 qBwz/ItmQ/23+tP0jHXqufev1KultNBMSW5uYs8XRN7rtm5rIAQP0cfNVHkRtfCqq0aa
 zkMcHUu+Kc5q8tjr5vds+h57Shfh3btWIThnNpoPWNRcnaearBu2kN+wE6CSvExTKbBq
 oThQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCSZZ5+1kIjuVOw1OM5+YQ+cSdSKQaeEWBDvB/583pkpQdUi1SAry0vEpI/AbGDXnCwjr71rTmJkwCkdXJkf5Wtgi7Tyej4blg+ZBx8Ec8
X-Gm-Message-State: AOJu0YzWc0ozC0WG3fpamxh4THT10Yyx22QRT3mI2Lx4drXNm6OVqz2G
 HHrArF/KHRaM8NbD72esJ13LaZAzHJrBeR1+xglL7EWW4WUmPNJH9KYR4//TEM3cijSrHqzs+/I
 Y8xfDCYvJqAWfJWzXuDpSl6qVXtxDYUCivAqeO1kUT3deZeeONf9vevtEW4djOxuzjQ==
X-Received: by 2002:a17:906:80d8:b0:a3c:d965:8c4c with SMTP id
 a24-20020a17090680d800b00a3cd9658c4cmr880613ejx.72.1707751055038; 
 Mon, 12 Feb 2024 07:17:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEP4kdKVvKtJmqRPWfvNqX7XdE6EB/6EBMSBRnR2ga+amR0tCNAgo0M/n/Zj3VSm25/5huN+w==
X-Received: by 2002:a17:906:80d8:b0:a3c:d965:8c4c with SMTP id
 a24-20020a17090680d800b00a3cd9658c4cmr880595ejx.72.1707751054739; 
 Mon, 12 Feb 2024 07:17:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXENn7BUszgo98/LNDqPnwT881+rZTZ+ocxY2+ycJA9F2vtoTJWBqeZFiWh1lMSR6qUxUXf9Bqgxdd5YUKJ/Nnd9KVoYoBojQs3VeibaMCE1vkyFhwEdWP+69ii7hbqTpkoa/VV9dHxRGsjJV/mOzPGJjpMntd/UoFEjiQw85kdWawlAPKEfH3bu/SHX3XQvqrLQAOBR/FYCIy094dzYoVtvEQyJqA26SpnOtYA7s8/hOGj6+htlBLymi7Nu3lrWacX6HHF9nqQgGLP4I/TsJ/+q6NfTqsj9M5EUQ/zgmI7psVHzq82P8RvwTdrmrdiF1PCYBE8JXzaZfdfbqz98vichWL049v2VNWDitsPmzyOUZT+/nP7m9Ki/ZE6m3lstjP10CRm7/VNKtnZc3aSbWE=
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 f27-20020a170906139b00b00a3cabea1b51sm300289ejc.42.2024.02.12.07.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 07:17:34 -0800 (PST)
Message-ID: <bddbec20-356b-468d-9c34-98a50c4f78a0@redhat.com>
Date: Mon, 12 Feb 2024 16:17:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/svm: fix kvcalloc() argument order
To: Arnd Bergmann <arnd@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240212112230.1117284-1-arnd@kernel.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240212112230.1117284-1-arnd@kernel.org>
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

On 2/12/24 12:22, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The conversion to kvcalloc() mixed up the object size and count
> arguments, causing a warning:
> 
> drivers/gpu/drm/nouveau/nouveau_svm.c: In function 'nouveau_svm_fault_buffer_ctor':
> drivers/gpu/drm/nouveau/nouveau_svm.c:1010:40: error: 'kvcalloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
>   1010 |         buffer->fault = kvcalloc(sizeof(*buffer->fault), buffer->entries, GFP_KERNEL);
>        |                                        ^
> drivers/gpu/drm/nouveau/nouveau_svm.c:1010:40: note: earlier argument should specify number of elements, later size of each element
> 
> The behavior is still correct aside from the warning, but fixing it avoids
> the warnings and can help the compiler track the individual objects better.
> 
> Fixes: 71e4bbca070e ("nouveau/svm: Use kvcalloc() instead of kvzalloc()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to drm-misc-fixes, thanks!

> ---
>   drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 4d1008915499..b4da82ddbb6b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -1007,7 +1007,7 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
>   	if (ret)
>   		return ret;
>   
> -	buffer->fault = kvcalloc(sizeof(*buffer->fault), buffer->entries, GFP_KERNEL);
> +	buffer->fault = kvcalloc(buffer->entries, sizeof(*buffer->fault), GFP_KERNEL);
>   	if (!buffer->fault)
>   		return -ENOMEM;
>   

