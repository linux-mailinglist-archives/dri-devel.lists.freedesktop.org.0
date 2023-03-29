Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7526CEFF7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 18:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B0F10E046;
	Wed, 29 Mar 2023 16:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51FC10E046
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680108983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N4XU1V0SCdpmIReJZV1GmPtF9M3vAQX9td0oNF/TxOY=;
 b=d60jlvQHxKwQCBNgUxa7E/Z2421BsIXttk8DaSbMfHF0hSDpOE5td4gpIaqDkhvwrfDXzI
 Wctl+i8gBlspla66rj0JbVaJVU/FyZ46wLyBuodhkYvVvqHl0kz6eceyy0Blmwa4bUeFeO
 vdAjgWipbsq2yQAVRKta4axj0J47VxQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-FZlt3FHHN3mdCodmpfWRLw-1; Wed, 29 Mar 2023 12:56:22 -0400
X-MC-Unique: FZlt3FHHN3mdCodmpfWRLw-1
Received: by mail-ed1-f69.google.com with SMTP id
 q13-20020a5085cd000000b004af50de0bcfso23629017edh.15
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 09:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680108981; x=1682700981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N4XU1V0SCdpmIReJZV1GmPtF9M3vAQX9td0oNF/TxOY=;
 b=Ro6m1OrqjKkzA6Jky57J6Sua+Sey/l53yclWc7u0vUe31jp1OIyj/yJrf91VT0IZK5
 oHQpjxCqj4+CJi+wLjpWcOq3aG6lvLMGC8rK99sTuaBbzbtFhjCnrHU9twoNZ105sbto
 +fglrWVL48r4L7R0XbOHAredtGM1ddOJ/Oy+nY+PQv65NbF6dQ7yqhIOctoSuAlBagKT
 26SO/Ruocy/v2mcS5YADKp7SvOeTQwQArtCQYD+Qq2kgBNrVUdLd1Itd3FIjWZD7QXud
 v72yDIHTGOBHyc+pYhIG+k955ZnCgbW1nxgZIuTe+qmHaLx9JEEown5nDfGS6seUORa0
 y79w==
X-Gm-Message-State: AAQBX9czBDkhh1sJZ0d42dGxXSl/Yvibu1qTH/NF583l6a9IIMdyqZxA
 W/GOOfTEjbd1tJI/iL7QhmYqOUBIAY5coTOlD+qwFemZarrqLwH64djfpCX2iPOTWIO3mZJHlLK
 hCi8uA64SgI4ZDJjZLWd6vAadgVIY
X-Received: by 2002:a17:906:3193:b0:932:1af9:7386 with SMTP id
 19-20020a170906319300b009321af97386mr19946513ejy.27.1680108981179; 
 Wed, 29 Mar 2023 09:56:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350YVHTZvBZxx+nXtJ+TB2AN+cDxWMkJryVxV3BZ/90rOYcLZ9LxI7OiwDgdhO3tqZDEp61izDA==
X-Received: by 2002:a17:906:3193:b0:932:1af9:7386 with SMTP id
 19-20020a170906319300b009321af97386mr19946498ejy.27.1680108980908; 
 Wed, 29 Mar 2023 09:56:20 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 a20-20020a17090680d400b008def483cf79sm16498571ejx.168.2023.03.29.09.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 09:56:20 -0700 (PDT)
Message-ID: <4a60cf2a-193f-c06c-5747-766bca1ca01f@redhat.com>
Date: Wed, 29 Mar 2023 18:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
References: <20230329135401.105592-1-christian.koenig@amd.com>
 <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
 <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
 <cf2f0771-39b0-49d6-011c-66b60b6a95c9@gmail.com>
 <ab8ed64b-5c4a-4948-7067-bac5351a45f0@redhat.com>
 <7e2845db-0a8c-c9f2-b858-89d7cb09d098@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <7e2845db-0a8c-c9f2-b858-89d7cb09d098@gmail.com>
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

On 3/29/23 18:43, Christian König wrote:
>>
>>
>> 3) other uses of kmap() must switch to MMU-notifier protection.
> 
> I would rather suggest to return the page additionally to the pfn from 
> hva_to_pfn() when the function was able to grab a reference to it.
> 
> When the page is then not available you can't call kmap() on that either.
> 
>>
>> If the DRM people are okay with SetPageReserved() as a temporary hack, 
>> we can change or remove the WARN in kvm_is_zone_device_page(), since 
>> that is what you are referring to in the commit message.
> 
> Adding Daniel for additional comments on this, but essentially we have 
> changed quite some infrastructure to make sure that everybody uses 
> VM_PFNMAP to prevent stuff like this from happening.
> 
> I would really prefer a proper solution in KVM instead.

Hmm... Now that I think about it that would be

https://lore.kernel.org/kvm/Yc4H+dGfK83BaGpC@google.com/t/

Time to resurrect that work.

Paolo

