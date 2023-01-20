Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D239675CC6
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211D410EAB6;
	Fri, 20 Jan 2023 18:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A57E210EAB6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 18:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674239526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wJDoWiidwyNQXt/e8BP08dspBFWMlOTDk0jEYPp9neI=;
 b=Y1YZM/zZPB6ccx3L8/gteO0SUyf2401D+plOtMZ2RNdUY8gCB7WH1Tthm0JIvGJ/wX1ILg
 7Z8pH1H+bL22qX5e0q43bsxuwzyr1CB+j6kbUT0O2f9DwWCJ+oMJsRuqdCKKMgG1sxQyix
 KlJ+iCdvbrUZRZ3GDBw3C/SrTDwwG8s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-VJ9_ionsOIq9Dj9ayjlq2g-1; Fri, 20 Jan 2023 13:32:05 -0500
X-MC-Unique: VJ9_ionsOIq9Dj9ayjlq2g-1
Received: by mail-ej1-f72.google.com with SMTP id
 wz4-20020a170906fe4400b0084c7e7eb6d0so4315292ejb.19
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 10:32:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wJDoWiidwyNQXt/e8BP08dspBFWMlOTDk0jEYPp9neI=;
 b=b7VqL3uhqWkUluGZy9x0h45uOnB5mSTKPUkEU+zZ6Z8XuUcX7tkzgZ8InqDK0N90AM
 RYo+Jgdi5fJ47D2nmGSjGpPARWDa6a034Bj+nuhDsgORHnN2uTujYHCAa1M+ZHqk6z+Y
 kGbuNO7iw4K4L3miidQwixp8wV+kYcrlpM8D5HDVrrbjTCY9w3kHZgk+tdRbm8CGZdDk
 vkj4eRd6sNQ6gf/mSQokUaJkXtS6pFOTXHMIpd76eUn9e04d8/Ew/Q9BDqT+OmGFx/ko
 R7giSNl70eRpsgn2b3W9ZoTXyP5HtzsB3me883eABBVcxK0CVSJOOXCjWJxiahD9L6lt
 oAyg==
X-Gm-Message-State: AFqh2kqxVb0BtrE0CvV9QW7QHAJWi3nAqKwH99vJN2PT7eMde37P/7dK
 qNf19erNtB8A32mF5Paf24nHWLJkujaGdGXKj1WJl1J1EaAy4erj7pDp7JYCvhqKvov3ynenFXO
 dQM6J69gcPv+6+gmfIdJgVDDi58RW
X-Received: by 2002:a05:6402:1c0c:b0:499:46c0:1269 with SMTP id
 ck12-20020a0564021c0c00b0049946c01269mr15138963edb.14.1674239523472; 
 Fri, 20 Jan 2023 10:32:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtEuNS8atE1OKn2f1jzZt9Vk2Ct1N5UdqZGmVoWXqtwfOKdGfX8o6OhpnCM4d/X5tXpJJd5uA==
X-Received: by 2002:a05:6402:1c0c:b0:499:46c0:1269 with SMTP id
 ck12-20020a0564021c0c00b0049946c01269mr15138943edb.14.1674239523201; 
 Fri, 20 Jan 2023 10:32:03 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 w1-20020aa7dcc1000000b0047a3a407b49sm17645658edu.43.2023.01.20.10.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 10:32:02 -0800 (PST)
Message-ID: <c4f7f126-4284-4227-34a7-a30e6f2bffcf@redhat.com>
Date: Fri, 20 Jan 2023 19:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH drm-next 03/14] drm: manager to keep track of GPUs VA
 mappings
To: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-4-dakr@redhat.com> <Y8jDsqGc5gXoIBAO@debian.me>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y8jDsqGc5gXoIBAO@debian.me>
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
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/23 05:14, Bagas Sanjaya wrote:
> On Wed, Jan 18, 2023 at 07:12:45AM +0100, Danilo Krummrich wrote:
>> This adds the infrastructure for a manager implementation to keep track
>> of GPU virtual address (VA) mappings.
> 
> "Add infrastructure for ..."
> 
>> + * Analogue to drm_gpuva_sm_map_ops_create() drm_gpuva_sm_unmap_ops_create()
>> + * provides drivers a the list of operations to be executed in order to unmap
>> + * a range of GPU VA space. The logic behind this functions is way simpler
>> + * though: For all existent mappings enclosed by the given range unmap
>> + * operations are created. For mappings which are only partically located within
>> + * the given range, remap operations are created such that those mappings are
>> + * split up and re-mapped partically.
> 
> "Analogous to ..."
> 
>> + *
>> + * The following paragraph depicts the basic constellations of existent GPU VA
>> + * mappings, a newly requested mapping and the resulting mappings as implemented
>> + * by drm_gpuva_sm_map_ops_create()  - it doesn't cover arbitrary combinations
>> + * of those constellations.
>> + *
>> + * ::
>> + *
>> + *	1) Existent mapping is kept.
>> + *	----------------------------
>> + *
>> + *	     0     a     1
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	     0     a     1
>> + *	req: |-----------| (bo_offset=n)
>> + *
>> + *	     0     a     1
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *
>> + *	2) Existent mapping is replaced.
>> + *	--------------------------------
>> + *
>> + *	     0     a     1
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	     0     a     1
>> + *	req: |-----------| (bo_offset=m)
>> + *
>> + *	     0     a     1
>> + *	new: |-----------| (bo_offset=m)
>> + *
>> + *
>> + *	3) Existent mapping is replaced.
>> + *	--------------------------------
>> + *
>> + *	     0     a     1
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	     0     b     1
>> + *	req: |-----------| (bo_offset=n)
>> + *
>> + *	     0     b     1
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *
>> + *	4) Existent mapping is replaced.
>> + *	--------------------------------
>> + *
>> + *	     0  a  1
>> + *	old: |-----|       (bo_offset=n)
>> + *
>> + *	     0     a     2
>> + *	req: |-----------| (bo_offset=n)
>> + *
>> + *	     0     a     2
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *	Note: We expect to see the same result for a request with a different bo
>> + *	      and/or bo_offset.
>> + *
>> + *
>> + *	5) Existent mapping is split.
>> + *	-----------------------------
>> + *
>> + *	     0     a     2
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	     0  b  1
>> + *	req: |-----|       (bo_offset=n)
>> + *
>> + *	     0  b  1  a' 2
>> + *	new: |-----|-----| (b.bo_offset=n, a.bo_offset=n+1)
>> + *
>> + *	Note: We expect to see the same result for a request with a different bo
>> + *	      and/or non-contiguous bo_offset.
>> + *
>> + *
>> + *	6) Existent mapping is kept.
>> + *	----------------------------
>> + *
>> + *	     0     a     2
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	     0  a  1
>> + *	req: |-----|       (bo_offset=n)
>> + *
>> + *	     0     a     2
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *
>> + *	7) Existent mapping is split.
>> + *	-----------------------------
>> + *
>> + *	     0     a     2
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	           1  b  2
>> + *	req:       |-----| (bo_offset=m)
>> + *
>> + *	     0  a  1  b  2
>> + *	new: |-----|-----| (a.bo_offset=n,b.bo_offset=m)
>> + *
>> + *
>> + *	8) Existent mapping is kept.
>> + *	----------------------------
>> + *
>> + *	      0     a     2
>> + *	old: |-----------| (bo_offset=n)
>> + *
>> + *	           1  a  2
>> + *	req:       |-----| (bo_offset=n+1)
>> + *
>> + *	     0     a     2
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *
>> + *	9) Existent mapping is split.
>> + *	-----------------------------
>> + *
>> + *	     0     a     2
>> + *	old: |-----------|       (bo_offset=n)
>> + *
>> + *	           1     b     3
>> + *	req:       |-----------| (bo_offset=m)
>> + *
>> + *	     0  a  1     b     3
>> + *	new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
>> + *
>> + *
>> + *	10) Existent mapping is merged.
>> + *	-------------------------------
>> + *
>> + *	     0     a     2
>> + *	old: |-----------|       (bo_offset=n)
>> + *
>> + *	           1     a     3
>> + *	req:       |-----------| (bo_offset=n+1)
>> + *
>> + *	     0        a        3
>> + *	new: |-----------------| (bo_offset=n)
>> + *
>> + *
>> + *	11) Existent mapping is split.
>> + *	------------------------------
>> + *
>> + *	     0        a        3
>> + *	old: |-----------------| (bo_offset=n)
>> + *
>> + *	           1  b  2
>> + *	req:       |-----|       (bo_offset=m)
>> + *
>> + *	     0  a  1  b  2  a' 3
>> + *	new: |-----|-----|-----| (a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)
>> + *
>> + *
>> + *	12) Existent mapping is kept.
>> + *	-----------------------------
>> + *
>> + *	     0        a        3
>> + *	old: |-----------------| (bo_offset=n)
>> + *
>> + *	           1  a  2
>> + *	req:       |-----|       (bo_offset=n+1)
>> + *
>> + *	     0        a        3
>> + *	old: |-----------------| (bo_offset=n)
>> + *
>> + *
>> + *	13) Existent mapping is replaced.
>> + *	---------------------------------
>> + *
>> + *	           1  a  2
>> + *	old:       |-----| (bo_offset=n)
>> + *
>> + *	     0     a     2
>> + *	req: |-----------| (bo_offset=n)
>> + *
>> + *	     0     a     2
>> + *	new: |-----------| (bo_offset=n)
>> + *
>> + *	Note: We expect to see the same result for a request with a different bo
>> + *	      and/or non-contiguous bo_offset.
>> + *
>> + *
>> + *	14) Existent mapping is replaced.
>> + *	---------------------------------
>> + *
>> + *	           1  a  2
>> + *	old:       |-----| (bo_offset=n)
>> + *
>> + *	     0        a       3
>> + *	req: |----------------| (bo_offset=n)
>> + *
>> + *	     0        a       3
>> + *	new: |----------------| (bo_offset=n)
>> + *
>> + *	Note: We expect to see the same result for a request with a different bo
>> + *	      and/or non-contiguous bo_offset.
>> + *
>> + *
>> + *	15) Existent mapping is split.
>> + *	------------------------------
>> + *
>> + *	           1     a     3
>> + *	old:       |-----------| (bo_offset=n)
>> + *
>> + *	     0     b     2
>> + *	req: |-----------|       (bo_offset=m)
>> + *
>> + *	     0     b     2  a' 3
>> + *	new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
>> + *
>> + *
>> + *	16) Existent mappings are merged.
>> + *	---------------------------------
>> + *
>> + *	     0     a     1
>> + *	old: |-----------|                        (bo_offset=n)
>> + *
>> + *	                            2     a     3
>> + *	old':                       |-----------| (bo_offset=n+2)
>> + *
>> + *	                1     a     2
>> + *	req:            |-----------|             (bo_offset=n+1)
>> + *
>> + *	                      a
>> + *	new: |----------------------------------| (bo_offset=n)
>> + */
> 
> Factor out lists from the big code block above:
> 
> ---- >8 ----
> 

Thanks for your feedback and the patch, it's highly appreciated.

- Danilo

> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> index e665f642689d03..411c0aa80bfa1f 100644
> --- a/drivers/gpu/drm/drm_gpuva_mgr.c
> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> @@ -129,15 +129,14 @@
>    * the given range, remap operations are created such that those mappings are
>    * split up and re-mapped partically.
>    *
> - * The following paragraph depicts the basic constellations of existent GPU VA
> + * The following diagram depicts the basic relationships of existent GPU VA
>    * mappings, a newly requested mapping and the resulting mappings as implemented
> - * by drm_gpuva_sm_map_ops_create()  - it doesn't cover arbitrary combinations
> - * of those constellations.
> + * by drm_gpuva_sm_map_ops_create()  - it doesn't cover any arbitrary
> + * combinations of these.
>    *
> - * ::
> - *
> - *	1) Existent mapping is kept.
> - *	----------------------------
> + * 1) Existent mapping is kept.
> + *
> + *    ::
>    *
>    *	     0     a     1
>    *	old: |-----------| (bo_offset=n)
> @@ -149,8 +148,9 @@
>    *	new: |-----------| (bo_offset=n)
>    *
>    *
> - *	2) Existent mapping is replaced.
> - *	--------------------------------
> + * 2) Existent mapping is replaced.
> + *
> + *    ::
>    *
>    *	     0     a     1
>    *	old: |-----------| (bo_offset=n)
> @@ -162,8 +162,9 @@
>    *	new: |-----------| (bo_offset=m)
>    *
>    *
> - *	3) Existent mapping is replaced.
> - *	--------------------------------
> + * 3) Existent mapping is replaced.
> + *
> + *    ::
>    *
>    *	     0     a     1
>    *	old: |-----------| (bo_offset=n)
> @@ -175,8 +176,9 @@
>    *	new: |-----------| (bo_offset=n)
>    *
>    *
> - *	4) Existent mapping is replaced.
> - *	--------------------------------
> + * 4) Existent mapping is replaced.
> + *
> + *    ::
>    *
>    *	     0  a  1
>    *	old: |-----|       (bo_offset=n)
> @@ -187,12 +189,14 @@
>    *	     0     a     2
>    *	new: |-----------| (bo_offset=n)
>    *
> - *	Note: We expect to see the same result for a request with a different bo
> - *	      and/or bo_offset.
> + *    .. note::
> + *       We expect to see the same result for a request with a different bo
> + *       and/or bo_offset.
>    *
>    *
> - *	5) Existent mapping is split.
> - *	-----------------------------
> + * 5) Existent mapping is split.
> + *
> + *    ::
>    *
>    *	     0     a     2
>    *	old: |-----------| (bo_offset=n)
> @@ -203,12 +207,14 @@
>    *	     0  b  1  a' 2
>    *	new: |-----|-----| (b.bo_offset=n, a.bo_offset=n+1)
>    *
> - *	Note: We expect to see the same result for a request with a different bo
> - *	      and/or non-contiguous bo_offset.
> + *    .. note::
> + *       We expect to see the same result for a request with a different bo
> + *       and/or non-contiguous bo_offset.
>    *
>    *
> - *	6) Existent mapping is kept.
> - *	----------------------------
> + * 6) Existent mapping is kept.
> + *
> + *    ::
>    *
>    *	     0     a     2
>    *	old: |-----------| (bo_offset=n)
> @@ -220,8 +226,9 @@
>    *	new: |-----------| (bo_offset=n)
>    *
>    *
> - *	7) Existent mapping is split.
> - *	-----------------------------
> + * 7) Existent mapping is split.
> + *
> + *    ::
>    *
>    *	     0     a     2
>    *	old: |-----------| (bo_offset=n)
> @@ -233,8 +240,9 @@
>    *	new: |-----|-----| (a.bo_offset=n,b.bo_offset=m)
>    *
>    *
> - *	8) Existent mapping is kept.
> - *	----------------------------
> + * 8) Existent mapping is kept.
> + *
> + *    ::
>    *
>    *	      0     a     2
>    *	old: |-----------| (bo_offset=n)
> @@ -246,8 +254,9 @@
>    *	new: |-----------| (bo_offset=n)
>    *
>    *
> - *	9) Existent mapping is split.
> - *	-----------------------------
> + * 9) Existent mapping is split.
> + *
> + *    ::
>    *
>    *	     0     a     2
>    *	old: |-----------|       (bo_offset=n)
> @@ -259,104 +268,113 @@
>    *	new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
>    *
>    *
> - *	10) Existent mapping is merged.
> - *	-------------------------------
> + * 10) Existent mapping is merged.
>    *
> - *	     0     a     2
> - *	old: |-----------|       (bo_offset=n)
> + *     ::
>    *
> - *	           1     a     3
> - *	req:       |-----------| (bo_offset=n+1)
> + *	      0     a     2
> + *	 old: |-----------|       (bo_offset=n)
>    *
> - *	     0        a        3
> - *	new: |-----------------| (bo_offset=n)
> + *	            1     a     3
> + *	 req:       |-----------| (bo_offset=n+1)
> + *
> + *	      0        a        3
> + *	 new: |-----------------| (bo_offset=n)
>    *
>    *
> - *	11) Existent mapping is split.
> - *	------------------------------
> + * 11) Existent mapping is split.
>    *
> - *	     0        a        3
> - *	old: |-----------------| (bo_offset=n)
> + *     ::
>    *
> - *	           1  b  2
> - *	req:       |-----|       (bo_offset=m)
> + *	      0        a        3
> + *	 old: |-----------------| (bo_offset=n)
>    *
> - *	     0  a  1  b  2  a' 3
> - *	new: |-----|-----|-----| (a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)
> + *	            1  b  2
> + *	 req:       |-----|       (bo_offset=m)
> + *
> + *	      0  a  1  b  2  a' 3
> + *	 new: |-----|-----|-----| (a.bo_offset=n,b.bo_offset=m,a'.bo_offset=n+2)
>    *
>    *
> - *	12) Existent mapping is kept.
> - *	-----------------------------
> + * 12) Existent mapping is kept.
>    *
> - *	     0        a        3
> - *	old: |-----------------| (bo_offset=n)
> + *     ::
>    *
> - *	           1  a  2
> - *	req:       |-----|       (bo_offset=n+1)
> + *	      0        a        3
> + *	 old: |-----------------| (bo_offset=n)
>    *
> - *	     0        a        3
> - *	old: |-----------------| (bo_offset=n)
> + *	            1  a  2
> + *	 req:       |-----|       (bo_offset=n+1)
> + *
> + *	      0        a        3
> + *	 old: |-----------------| (bo_offset=n)
>    *
>    *
> - *	13) Existent mapping is replaced.
> - *	---------------------------------
> + * 13) Existent mapping is replaced.
>    *
> - *	           1  a  2
> - *	old:       |-----| (bo_offset=n)
> + *     ::
>    *
> - *	     0     a     2
> - *	req: |-----------| (bo_offset=n)
> + *	            1  a  2
> + *	 old:       |-----| (bo_offset=n)
>    *
> - *	     0     a     2
> - *	new: |-----------| (bo_offset=n)
> + *	      0     a     2
> + *	 req: |-----------| (bo_offset=n)
>    *
> - *	Note: We expect to see the same result for a request with a different bo
> - *	      and/or non-contiguous bo_offset.
> + *	      0     a     2
> + *	 new: |-----------| (bo_offset=n)
> + *
> + *     .. note::
> + *        We expect to see the same result for a request with a different bo
> + *        and/or non-contiguous bo_offset.
>    *
>    *
> - *	14) Existent mapping is replaced.
> - *	---------------------------------
> + * 14) Existent mapping is replaced.
>    *
> - *	           1  a  2
> - *	old:       |-----| (bo_offset=n)
> + *     ::
>    *
> - *	     0        a       3
> - *	req: |----------------| (bo_offset=n)
> + *	            1  a  2
> + *	 old:       |-----| (bo_offset=n)
>    *
> - *	     0        a       3
> - *	new: |----------------| (bo_offset=n)
> + *	      0        a       3
> + *	 req: |----------------| (bo_offset=n)
>    *
> - *	Note: We expect to see the same result for a request with a different bo
> - *	      and/or non-contiguous bo_offset.
> + *	      0        a       3
> + *	 new: |----------------| (bo_offset=n)
> + *
> + *     .. note::
> + *        We expect to see the same result for a request with a different bo
> + *        and/or non-contiguous bo_offset.
>    *
>    *
> - *	15) Existent mapping is split.
> - *	------------------------------
> + * 15) Existent mapping is split.
>    *
> - *	           1     a     3
> - *	old:       |-----------| (bo_offset=n)
> + *     ::
>    *
> - *	     0     b     2
> - *	req: |-----------|       (bo_offset=m)
> + *	            1     a     3
> + *	 old:       |-----------| (bo_offset=n)
>    *
> - *	     0     b     2  a' 3
> - *	new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
> + *	      0     b     2
> + *	 req: |-----------|       (bo_offset=m)
> + *
> + *	      0     b     2  a' 3
> + *	 new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
>    *
>    *
> - *	16) Existent mappings are merged.
> - *	---------------------------------
> + * 16) Existent mappings are merged.
>    *
> - *	     0     a     1
> - *	old: |-----------|                        (bo_offset=n)
> + *     ::
>    *
> - *	                            2     a     3
> - *	old':                       |-----------| (bo_offset=n+2)
> + *	      0     a     1
> + *	 old: |-----------|                        (bo_offset=n)
>    *
> - *	                1     a     2
> - *	req:            |-----------|             (bo_offset=n+1)
> + *	                             2     a     3
> + *	 old':                       |-----------| (bo_offset=n+2)
>    *
> - *	                      a
> - *	new: |----------------------------------| (bo_offset=n)
> + *	                 1     a     2
> + *	 req:            |-----------|             (bo_offset=n+1)
> + *
> + *	                       a
> + *	 new: |----------------------------------| (bo_offset=n)
>    */
>   
>   /**
> 
> However, the relationship scenario descriptions are too generic (different
> diagrams are described by the same text). Please rewrite them, taking into
> account bo_offset values in each scenario.
> 
> Thanks.
> 

