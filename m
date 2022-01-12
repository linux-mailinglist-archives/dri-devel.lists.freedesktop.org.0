Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C38D48C2F2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 12:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E0410EDC1;
	Wed, 12 Jan 2022 11:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0518B10EDC1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641986176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvfHccyQZvOEcbK/VSQsdfq4siS9aIa44pr1d+OE6yo=;
 b=D2bSwqmqktCx8JqUBuCKZkxV+h0YRIJYwFt/tCXuARtk99NFqhpwLRnSR/Hafcgf/L4lwb
 T7Gywj8CEfJyb5Rq1EqNzfGk2+hmlY5D+RvTr714ZLD7Fek857O8qKuEEc/5YUQ1UxIJAt
 jx0odFtbuFS9+etJHfz8ENNe/WTdiUs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-ViamgUDMPs6RXvAq9XgwjQ-1; Wed, 12 Jan 2022 06:16:15 -0500
X-MC-Unique: ViamgUDMPs6RXvAq9XgwjQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 q15-20020a056402518f00b003f87abf9c37so1950980edd.15
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 03:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rvfHccyQZvOEcbK/VSQsdfq4siS9aIa44pr1d+OE6yo=;
 b=WFM73yzDvAiveWIcg9khR7kvzrxWF+WVZ2TamW4+CSIQKhr9poS+z2239ScXVERSSA
 NB5TOAg71PJQnuHCGDbCEHC8LAXgHGZ7j2BjiG/khqAr9AszIJO/+XOzSkkxLrK18md/
 /iQvjq5+bL5BqJ5tvEQ+9y8KXaRHn01vVU6LZuMfPyMOnYZE/X4Say5lh7+DdrbvWXDW
 wPSJ5jMJMK7mEbQNGgkjYfbCx7vcGRAWq2pTQma6ZQTnwIXUKfYVyFZ1gUCOEKFp18wM
 FUz+yxyIgEKf+dk8r4AkT80H16nqaJOvgjE1+bEDqOxk0gTifbNZvxXAPpaKvXQ7E7/C
 z8oQ==
X-Gm-Message-State: AOAM533ytYtUuI118fc9UtsaJwh1HgGvZ8E7PYhB8Te12Pwpdoljk8QF
 iInQaq0k7/5KlLXijPXQOtL9wwDmhjZ+88j4ffpHGjx9vHc2czBxc24IWgh2GI9xzQx7w2kzOGk
 cid7VdjpC1WWR3D7MAyjc7vNxueWb
X-Received: by 2002:a17:906:974a:: with SMTP id
 o10mr7201062ejy.226.1641986174549; 
 Wed, 12 Jan 2022 03:16:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylcjOYtqv8QO2gzLMiyLf36NeGdQwoe97SOgETUwT3484y0JFJN63XyHPi2xLKoaaQHMvZ5w==
X-Received: by 2002:a17:906:974a:: with SMTP id
 o10mr7201027ejy.226.1641986174194; 
 Wed, 12 Jan 2022 03:16:14 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id f18sm6068251edf.95.2022.01.12.03.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 03:16:13 -0800 (PST)
Message-ID: <8c4df8e4-ef99-c3fd-dcca-759e92739d4c@redhat.com>
Date: Wed, 12 Jan 2022 12:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
To: Alex Sierra <alex.sierra@amd.com>, akpm@linux-foundation.org,
 Felix.Kuehling@amd.com, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20220110223201.31024-1-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220110223201.31024-1-alex.sierra@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.01.22 23:31, Alex Sierra wrote:
> This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
> owned by a device that can be mapped into CPU page tables like
> MEMORY_DEVICE_GENERIC and can also be migrated like
> MEMORY_DEVICE_PRIVATE.
> 
> Christoph, the suggestion to incorporate Ralph Campbell’s refcount
> cleanup patch into our hardware page migration patchset originally came
> from you, but it proved impractical to do things in that order because
> the refcount cleanup introduced a bug with wide ranging structural
> implications. Instead, we amended Ralph’s patch so that it could be
> applied after merging the migration work. As we saw from the recent
> discussion, merging the refcount work is going to take some time and
> cooperation between multiple development groups, while the migration
> work is ready now and is needed now. So we propose to merge this
> patchset first and continue to work with Ralph and others to merge the
> refcount cleanup separately, when it is ready.
> 
> This patch series is mostly self-contained except for a few places where
> it needs to update other subsystems to handle the new memory type.
> System stability and performance are not affected according to our
> ongoing testing, including xfstests.
> 
> How it works: The system BIOS advertises the GPU device memory
> (aka VRAM) as SPM (special purpose memory) in the UEFI system address
> map.
> 
> The amdgpu driver registers the memory with devmap as
> MEMORY_DEVICE_COHERENT using devm_memremap_pages. The initial user for
> this hardware page migration capability is the Frontier supercomputer
> project. This functionality is not AMD-specific. We expect other GPU
> vendors to find this functionality useful, and possibly other hardware
> types in the future.
> 
> Our test nodes in the lab are similar to the Frontier configuration,
> with .5 TB of system memory plus 256 GB of device memory split across
> 4 GPUs, all in a single coherent address space. Page migration is
> expected to improve application efficiency significantly. We will
> report empirical results as they become available.

Hi,

might be a dumb question because I'm not too familiar with
MEMORY_DEVICE_COHERENT, but who's in charge of migrating *to* that
memory? Or how does a process ever get a grab on such pages?

And where does migration come into play? I assume migration is only
required to migrate off of that device memory to ordinary system RAM
when required because the device memory has to be freed up, correct?

(a high level description on how this is exploited from users space
would be great)

-- 
Thanks,

David / dhildenb

