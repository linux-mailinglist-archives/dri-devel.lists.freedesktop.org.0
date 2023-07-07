Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A57474B10D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9792210E57B;
	Fri,  7 Jul 2023 12:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445B710E579
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688733688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Pvx8BnPDazf3dvRsddP57JfF7wRhoQ8lQ+cKlGDP24=;
 b=dyNIakG1fca6a2lT6Ertq/Rp8AgwYIbAPVLzveJJTQT1ZdQoRQYOgfJj5HYsK34AFEfMdt
 nTCDIglyUlZu4GkreXUEWXdSXhs/l+F0DKU6NdGHvne185RRyUKPlmaf8PZzHpO/WBLzeT
 amKqYwe1hYnQCGeGq2XgnoD4UQX0Shs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-6bVOO-A8PlqQ2qy5g5bwvA-1; Fri, 07 Jul 2023 08:41:26 -0400
X-MC-Unique: 6bVOO-A8PlqQ2qy5g5bwvA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-993d5006993so36027066b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 05:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688733685; x=1691325685;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Pvx8BnPDazf3dvRsddP57JfF7wRhoQ8lQ+cKlGDP24=;
 b=X7UDYSB4hNCWMeoCZxAnsjQzi7EJGuHSWz10uOSBhh8tPs5EsV6mi5ygASVsvd8RDQ
 O0xnpYqlaIfuC/FShSFNJcZ7NoNJKiDCFWhjZxdI3k/sBuXDCrqjUnOAVw1o05zVtTjR
 ExUN/I3RyhbrwJfXTApyYY2GQlDWQTOVu/pqVZ+npyNwsYil5CWwxIJ3VyMrriTHD9GT
 PPdulbeIlYtxC1tKftPuYTGUgqLuGGevVGcFTo20fXW8PBqWWa5F+i6KsuqzHTocYkaq
 z+qHcIZVgrDffP/ISITXtV9NqqFz6wv5YZZI74hNv8N2MZNTKkpVQuIX/ndrE86eVGJM
 NmLw==
X-Gm-Message-State: ABy/qLaO3gJIPbGPFcJ3Zb289WzSpTdFPsIEu7ALqg9sTTaW891zQmJz
 2uDk+7DyHQE3Eyx/sK5upOFYrH1lCszl7KW23HdI027pAymcxS912DYqEWzCWU9xShefD/9nhO1
 EW0mPipdYm1VB+JuBhy1dfyz+ayY3
X-Received: by 2002:a17:906:7a0f:b0:974:1c98:d2d9 with SMTP id
 d15-20020a1709067a0f00b009741c98d2d9mr4407013ejo.3.1688733685809; 
 Fri, 07 Jul 2023 05:41:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEjteGIi3KT97fwOWlMdZkLiUsbSPeH2eror+aBLBU9/BQlYnfXmM4DYbHJ8zXHqJFnCi0/Wg==
X-Received: by 2002:a17:906:7a0f:b0:974:1c98:d2d9 with SMTP id
 d15-20020a1709067a0f00b009741c98d2d9mr4406995ejo.3.1688733685531; 
 Fri, 07 Jul 2023 05:41:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 qh27-20020a170906ecbb00b0098733a40bb7sm2148920ejb.155.2023.07.07.05.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 05:41:25 -0700 (PDT)
Message-ID: <e92219d7-77f7-a40a-39d9-ea7afc5f3687@redhat.com>
Date: Fri, 7 Jul 2023 14:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
 <20230707130010.1bd5d41b@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230707130010.1bd5d41b@collabora.com>
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net,
 Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/23 13:00, Boris Brezillon wrote:
> On Fri, 30 Jun 2023 00:25:18 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> +/**
>> + * drm_gpuva_for_each_va_range - iternator to walk over a range of &drm_gpuvas
>> + * @va__: &drm_gpuva structure to assign to in each iteration step
>> + * @mgr__: &drm_gpuva_manager to walk over
>> + * @start__: starting offset, the first gpuva will overlap this
>> + * @end__: ending offset, the last gpuva will start before this (but may
>> + * overlap)
>> + *
>> + * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
>> + * between @start__ and @end__. It is implemented similarly to list_for_each(),
>> + * but is using the &drm_gpuva_manager's internal interval tree to accelerate
>> + * the search for the starting &drm_gpuva, and hence isn't safe against removal
>> + * of elements. It assumes that @end__ is within (or is the upper limit of) the
>> + * &drm_gpuva_manager. This iterator does not skip over the &drm_gpuva_manager's
>> + * @kernel_alloc_node.
>> + */
>> +#define drm_gpuva_for_each_va_range(va__, mgr__, start__, end__) \
>> +	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__)); \
> 
> drm_gpuva_find_first() takes the range size as its last argument, not
> the range end:
> 
> 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
> 

Good catch! Originally this was

drm_gpuva_it_iter_first(&(mgr)->rb.tree, (start__), (end__) - 1)

but then I changed it since I did not want to expose the interval tree 
functions directly.

> 
>> +	     va__ && (va__->va.addr < (end__)) && \
>> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
>> +	     va__ = list_next_entry(va__, rb.entry))
> 
> If you define:
> 
> static inline struct drm_gpuva *
> drm_gpuva_next(struct drm_gpuva *va)
> {
> 	if (va && !list_is_last(&va->rb.entry, &va->mgr->rb.list))
> 		return list_next_entry(va, rb.entry);
> 
> 	return NULL;
> } >
> the for loop becomes a bit more readable:

Yes, it would. However, I don't want it to be confused with 
drm_gpuva_find_next(). Maybe I should rename the latter to something 
like drm_gpuva_find_next_neighbor() then.

> 
> 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
> 	     va__ && (va__->va.addr < (end__)); \
> 	     va__ = drm_gpuva_next(va__))
> 
>> +
>> +/**
>> + * drm_gpuva_for_each_va_range_safe - iternator to safely walk over a range of
>> + * &drm_gpuvas
>> + * @va__: &drm_gpuva to assign to in each iteration step
>> + * @next__: another &drm_gpuva to use as temporary storage
>> + * @mgr__: &drm_gpuva_manager to walk over
>> + * @start__: starting offset, the first gpuva will overlap this
>> + * @end__: ending offset, the last gpuva will start before this (but may
>> + * overlap)
>> + *
>> + * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
>> + * between @start__ and @end__. It is implemented similarly to
>> + * list_for_each_safe(), but is using the &drm_gpuva_manager's internal interval
>> + * tree to accelerate the search for the starting &drm_gpuva, and hence is safe
>> + * against removal of elements. It assumes that @end__ is within (or is the
>> + * upper limit of) the &drm_gpuva_manager. This iterator does not skip over the
>> + * &drm_gpuva_manager's @kernel_alloc_node.
>> + */
>> +#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
>> +	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__)), \
>> +	     next__ = va ? list_next_entry(va__, rb.entry) : NULL; \
>> +	     va__ && (va__->va.addr < (end__)) && \
>> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
>> +	     va__ = next__, next__ = list_next_entry(va__, rb.entry))
> 
> And this is the safe version using the drm_gpuva_next() helper:
> 
> 	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
> 	     next__ = drm_gpuva_next(va__); \
> 	     va__ && (va__->va.addr < (end__)); \
> 	     va__ = next__, next__ = drm_gpuva_next(va__))
> 
> Those changes fixed an invalid pointer access I had in the sm_unmap()
> path.
> 

Sorry you did run into this bug.

- Danilo

