Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2D6CEC68
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A0F10EB1A;
	Wed, 29 Mar 2023 15:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3550C10EB09
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680102530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kvQ8jjYfdj9oMdnFVWPKnOEmPoynqQH9YoZbyobAcE=;
 b=c9MhBmS0IhbW3XcYMFSEgDkikZuNSxQPIZ+/+VTS6v2b2kdkvOMkigVHMH0CBz3qhgu5gC
 hmIU//MHwmFOYgXBL3aftyPbj2O/e+Ir7xWDThypoasRXDsmlHtWzHu+R5WFf4mJTDVBuC
 Ww8M8NG7A3m0tIS9oilCtM7kQO/F/NQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-6Kh1B9fNPqGD5vWLEd68EA-1; Wed, 29 Mar 2023 11:08:48 -0400
X-MC-Unique: 6Kh1B9fNPqGD5vWLEd68EA-1
Received: by mail-ed1-f71.google.com with SMTP id
 t14-20020a056402240e00b004fb36e6d670so22689141eda.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 08:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680102527; x=1682694527;
 h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3kvQ8jjYfdj9oMdnFVWPKnOEmPoynqQH9YoZbyobAcE=;
 b=1jO+bmH2eY8IJJqSJXSdpC1Bi4sW9HeBiB3QHLqrTdcQkdtX1ZPLZBky3Urwr+S1Ri
 IQ/XCccXEWnQKCN9TvuRsFqkXR+52jj2rH4xZk5WAaFvWnFvNg63r50aYPkqWMK8Aljs
 01I7RlLG/KBkIOaPkoa9rtR1f7360kDZfzrm6dIsnwzrNpdiIkMUWKGjPzZr2uFsMkjG
 Bwu0bX8Prp5ACDe6PqWsIPaPluFhrMoDNpmKScDq/cu9KbreoqHaD4kJMj091Ho0jBt6
 PZFD54DelHf6rNoXeaDCwmbnnRu4m6m1ot1AZwqpU2wIGL+w4x6pOBjr8PdIZLlpyGjV
 M5cQ==
X-Gm-Message-State: AAQBX9cvqt3ZZ6J9g2pjAV4gZyWuCIo/UlYrJ6AHd2zILOduj2RjlREY
 03J3TI2SyQCapI4DSCduAkeTQpU9wBd3stKfQh+H9uk0Ofvai4TiGjQMOyck39WVWLwrIJl1si5
 iN94RnAc0lISxzRZ0YGOiFL6FBBk5
X-Received: by 2002:a17:906:7196:b0:92f:a00c:ee52 with SMTP id
 h22-20020a170906719600b0092fa00cee52mr19551428ejk.18.1680102527590; 
 Wed, 29 Mar 2023 08:08:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350bsnv3SSh/pgQ4cLmFoiLnDNl26tn6xLNrtlL+WVQcVo9YmVmNV9uI0M0a6CsLGf2jQzeG7XQ==
X-Received: by 2002:a17:906:7196:b0:92f:a00c:ee52 with SMTP id
 h22-20020a170906719600b0092fa00cee52mr19551399ejk.18.1680102527284; 
 Wed, 29 Mar 2023 08:08:47 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 xo20-20020a170907bb9400b0093f0fbebfc2sm6152468ejc.144.2023.03.29.08.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 08:08:46 -0700 (PDT)
Message-ID: <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
Date: Wed, 29 Mar 2023 17:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230329135401.105592-1-christian.koenig@amd.com>
 <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
In-Reply-To: <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Pierre-eric.Pelloux-prayer@amd.com, npiggin@gmail.com,
 Sean Christopherson <seanjc@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/29/23 16:28, Paolo Bonzini wrote:
> On 3/29/23 15:54, Christian König wrote:
>> KVM tries to grab references to pages in VMAs marked with VM_PFNMAP.
>> This is illegal and can cause data corruption with TTM pages because
>> only some of them are actually reference counted.

After some other offlist discussions, I also would like to understand 
what you mean by corruption.

First, is it a _host_ corruption or a guest corruption/crash?  A guest 
crash would be KVM doing exactly what it's meant to do: it detects the 
non-reserved, non-refcounted page and refuses to map it into the guest.

On the other hand, if it is a host crash, my understanding is that an 
order>0 allocation leaves the tail pages with a zero reference count 
(and without a compound_head if, as in this case, __GFP_COMP is unset). 
If that's correct, more analysis is needed to understand why 
get_page_unless_zero() isn't rejecting the tail pages.

Paolo


>> Mark all pages allocated by TTM as reserved, this way KVM handles the
>> PFNs like they would point to MMIO space.
>>
>> This still results in a warning, but at least no other problem.
> 
> What warning is it?
> 
> Paolo
> 
>> Signed-off-by: Christian König<christian.koenig@amd.com>
> 

