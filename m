Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10226791F0D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 23:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E8210E409;
	Mon,  4 Sep 2023 21:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E72410E40A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 21:40:00 +0000 (UTC)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-Tj0kxspJO2K2lZoe6-NYqg-1; Mon, 04 Sep 2023 17:39:58 -0400
X-MC-Unique: Tj0kxspJO2K2lZoe6-NYqg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9a5d86705e4so122899966b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 14:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693863597; x=1694468397;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9K10tiG8Z3KF4U0DbRTHBaM7zSpmW9U1K994PJo61Gg=;
 b=NH4fzP+9minWMR6/y6a+EMWtQ+mywAhZOUCzRR3N2Q3Ier2Xhr2wtVrHm2LpQoKJYc
 N0mbcHhlTpwkznEIP91x/oV33ZJg+syWfJlh+pMKIIO3qxuAn6Bn7PFsZQtaLfIcXS+g
 e8OZLYKj7bgmJFmvAYJxyevrd6aqgD5VI7kA2LnmPjIOEwB96dPO57hbpZ5GWEsHpFba
 tgqAxGSVGcrCIfMezyp5K/YfWVUC+4zYeOA23EVJjyQAgnifGL69mP8Fmqi46tvaglM1
 boNSxelwX/MpMy4xAnX/NhLQ3G2IyaVdUHez6Kelw0u385AvE3oA/fByoqWkmzRHXEck
 H/8Q==
X-Gm-Message-State: AOJu0YzTzQC4Y+ipLshzXHHuRKxrI92Bm/nfrPLsbEYxjeQrCCPhtKx6
 +Isc2qf5yKDxEG5Uebpinbr+CeogEhvfsslKJaxd9rBjLRPFeUWmiecapYyFcNDDXRzvoXC0wh6
 I3j5s7b2+pwQ9Ed4hVmFZAF856JGO
X-Received: by 2002:a17:907:77d3:b0:9a1:fbfb:4d11 with SMTP id
 kz19-20020a17090777d300b009a1fbfb4d11mr8280355ejc.73.1693863597097; 
 Mon, 04 Sep 2023 14:39:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvnr+De3X6WB/1IpKxJXg+ik97aG4VgZLycMs/UcmRmvtoqRJv4dtDWh4eyUQOb5c5x4mP0g==
X-Received: by 2002:a17:907:77d3:b0:9a1:fbfb:4d11 with SMTP id
 kz19-20020a17090777d300b009a1fbfb4d11mr8280351ejc.73.1693863596739; 
 Mon, 04 Sep 2023 14:39:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a170906938e00b00992e94bcfabsm6658074ejx.167.2023.09.04.14.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 14:39:56 -0700 (PDT)
Message-ID: <24e70864-ce64-f2c3-4a09-6f252a1c6080@redhat.com>
Date: Mon, 4 Sep 2023 23:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/4] drm/doc/rfc: Mark GPU VA as complete.
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
 <20230829163005.54067-4-rodrigo.vivi@intel.com> <ZPDnT72UCgOyY/YC@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZPDnT72UCgOyY/YC@intel.com>
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/31/23 21:17, Rodrigo Vivi wrote:
> On Tue, Aug 29, 2023 at 12:30:04PM -0400, Rodrigo Vivi wrote:
>> Nouveau has landed the GPU VA helpers, support and documentation
>> already and Xe is already using the upstream GPU VA.
> 
> Danilo, although this is more on the Xe side and I wouldn't ask you
> to review our code entirely, I'd like to get your ack here as Daniel
> recommended. Meaning that we are aligned there and not creating any
> change on top of GPU VA. Xe is currently using GPU VA directly without
> any customization.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/ea4ae69e66b2940107e74f240ecb9dae87bf1ff1
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/commits/drm-xe-next?ref_type=heads

Acked-by: Danilo Krummrich <dakr@redhat.com>

Just one note: If we end up to agree on [1] few more adjustments are needed.

Otherwise, same as the other commit, where is the paragraph going?

- Danilo

[1] https://lore.kernel.org/dri-devel/202308221050.kTj8uFMA-lkp@intel.com/T/#m7f3b5a7ff70723332adeea32671578cb95c62f7c

> 
>>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   Documentation/gpu/rfc/xe.rst | 36 ++++++++++++++++++------------------
>>   1 file changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
>> index a115526c03e0..b67f8e6a1825 100644
>> --- a/Documentation/gpu/rfc/xe.rst
>> +++ b/Documentation/gpu/rfc/xe.rst
>> @@ -88,24 +88,6 @@ depend on any other patch touching drm_scheduler itself that was not yet merged
>>   through drm-misc. This, by itself, already includes the reach of an agreement for
>>   uniform 1 to 1 relationship implementation / usage across drivers.
>>   
>> -GPU VA
>> -------
>> -Two main goals of Xe are meeting together here:
>> -
>> -1) Have an uAPI that aligns with modern UMD needs.
>> -
>> -2) Early upstream engagement.
>> -
>> -RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
>> -track of GPU virtual address mappings. This is still not merged upstream, but
>> -this aligns very well with our goals and with our VM_BIND. The engagement with
>> -upstream and the port of Xe towards GPUVA is already ongoing.
>> -
>> -As a key measurable result, Xe needs to be aligned with the GPU VA and working in
>> -our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
>> -related patch should be independent and present on dri-devel or acked by
>> -maintainers to go along with the first Xe pull request towards drm-next.
>> -
>>   ASYNC VM_BIND
>>   -------------
>>   Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
>> @@ -230,3 +212,21 @@ Xe merged, it is mandatory to enforce the overall locking scheme for all major
>>   structs and list (so vm and vma). So, a consensus is needed, and possibly some
>>   common helpers. If helpers are needed, they should be also documented in this
>>   document.
>> +
>> +GPU VA
>> +------
>> +Two main goals of Xe are meeting together here:
>> +
>> +1) Have an uAPI that aligns with modern UMD needs.
>> +
>> +2) Early upstream engagement.
>> +
>> +RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
>> +track of GPU virtual address mappings. This is still not merged upstream, but
>> +this aligns very well with our goals and with our VM_BIND. The engagement with
>> +upstream and the port of Xe towards GPUVA is already ongoing.
>> +
>> +As a key measurable result, Xe needs to be aligned with the GPU VA and working in
>> +our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
>> +related patch should be independent and present on dri-devel or acked by
>> +maintainers to go along with the first Xe pull request towards drm-next.
>> -- 
>> 2.41.0
>>
> 

