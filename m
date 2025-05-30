Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF5AC8B37
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 11:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4039C10E7FB;
	Fri, 30 May 2025 09:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wk24DIbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14C510E7FB
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748598175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zWtS7BX4jv3Md6oma03aZLTPAuckL46QoolFrxWb6FY=;
 b=Wk24DIbZVlV47aWW2EZJdRerdLBN+qlqN8yElEaCDRRNygo3kRaPYY+sCC17jB2i+v5UAB
 qycxPNmHtzG2C8U0xVE7NbFFb5VxsWxH67j2hmoSG1XWBtrCcFqNvogkMrpVz2GxMlM/w3
 wyxjkZRQq7UvCr9TbpjTRUxhGD/2F74=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-HQcJd80zPe2mD_P_y4BY4A-1; Fri, 30 May 2025 05:42:53 -0400
X-MC-Unique: HQcJd80zPe2mD_P_y4BY4A-1
X-Mimecast-MFC-AGG-ID: HQcJd80zPe2mD_P_y4BY4A_1748598172
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-450d9f96f61so3142535e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 02:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748598172; x=1749202972;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zWtS7BX4jv3Md6oma03aZLTPAuckL46QoolFrxWb6FY=;
 b=t4eNVfloircxejjiHviuKic6aawn6cbGK/5uecYM3airpys8fyAzy9bw23hbKEO7Dn
 kba2k7K5eEAQpHkduNp/q5epv7aV+xb+qW6yDNrQjuddBL/L5AjaaJBrjEAR4Hcz6AJl
 /SY4g4cEiTK6R1hs4XY52fv3KZyklH6M9Ju7cZPIZ5mh7gp6S7hLJNfyUw+LHGhZdpt+
 +4b310eHN6Ths/MSOEBR6j0EXoTOuywICyvmp0WUO+l7TGzKZmiM36rPhJs/VP/+J1m7
 y/XVjcmZ+Rp8E73NZNuhihKuJiy5hGcuosbYuEGRlJxCBdz6g4LQ7jAZqOkjKpblBYWU
 V1oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkY15ANXnDfcjQE/0UEScDOk8Om+K6nJNU02rDO2HbWqzx42juhUA02YAQmfNeYxJ+mU/nvTH0tzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwID+KLIorJchIDklEExCDeFfMrE2VBcUfI/7bFIA7szDSklGoV
 wI696czRJunPoGTdpzdiuHVwAxrbP+A0ky+Hk9wjbyUh9u52PgeEmAfDhNU8PZGt4XIgw9Y65xb
 dL/fr/yFLa+BKKvyBRTsZ2k7DYZeFpcn52KX32aSSrWWNX2FY26cyazwcDvaxvbUJYqYOhQ==
X-Gm-Gg: ASbGncsrjyYr+cS4hYZo2FcmwZjxB2FWg2uVkuviv0YETUbvzfFkDOizA7D6kWTVFw2
 IxgLpPBIeg4v0TmYwDd4C+Y9gulImB4IQ40+MIuKlD2X/GfOtZaawooW2fwvD3evylSfsNxQH+I
 Df1ib7RyWOFsdh8BndDkL1e4ALwLfvnvsyqG5+oFfZ/KgtV3U+P5/WMXjTfVoL9EHUc0KQfXu6A
 UhV7slDyjYWcX8VPaqQZi39p/o5eOdbzEEweD3BEOacT9Q/KUEIbZPzmrpTmz2Vzf0GAiVRmEYh
 37PxxZaldUFZ2BzJt7orXC6kcEHUqnzXDpJrD9oLz3d03Bgqt77AgLF109QPPKtbYk8/pBW1U6p
 rQCugJhgoqHevWWtMPTe077Qnv9B9Tv5GBCk8bIU=
X-Received: by 2002:a05:6000:1ac6:b0:39f:175b:a68d with SMTP id
 ffacd0b85a97d-3a4f7a3e745mr1997127f8f.11.1748598172254; 
 Fri, 30 May 2025 02:42:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE2cC4rOgIu1Bk0E4HwZEgbfvuVj5Yx/rDkAqlZuc3fKNMuN3WR3Ck+7U4WmY934x7i63eYg==
X-Received: by 2002:a05:6000:1ac6:b0:39f:175b:a68d with SMTP id
 ffacd0b85a97d-3a4f7a3e745mr1997108f8f.11.1748598171812; 
 Fri, 30 May 2025 02:42:51 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee?
 (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de.
 [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fc24d7sm13138915e9.36.2025.05.30.02.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 02:42:51 -0700 (PDT)
Message-ID: <473e974b-39a1-4ee1-b321-58f6a74c0155@redhat.com>
Date: Fri, 30 May 2025 11:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Cc: gerald.schaefer@linux.ibm.com, dan.j.williams@intel.com, jgg@ziepe.ca,
 willy@infradead.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ny7nJKUWlLLnkKUWv5RkLeBfbFwvCghfrf9wiQvV8LU_1748598172
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

On 29.05.25 08:32, Alistair Popple wrote:
> Previously dax pages were skipped by the pagewalk code as pud_special() or
> vm_normal_page{_pmd}() would be false for DAX pages. Now that dax pages are
> refcounted normally that is no longer the case, so add explicit checks to
> skip them.

Is this really what we want, though? If these are now just "normal" 
pages, they shall be handled as being normal.

I would assume that we want to check that in the callers instead.

E.g., in get_mergeable_page() we already have a folio_is_zone_device() 
check.

> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>   include/linux/memremap.h | 11 +++++++++++
>   mm/pagewalk.c            | 12 ++++++++++--
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 4aa1519..54e8b57 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -198,6 +198,17 @@ static inline bool folio_is_fsdax(const struct folio *folio)
>   	return is_fsdax_page(&folio->page);
>   }
>   
> +static inline bool is_devdax_page(const struct page *page)
> +{
> +	return is_zone_device_page(page) &&
> +		page_pgmap(page)->type == MEMORY_DEVICE_GENERIC;
> +}
> +
> +static inline bool folio_is_devdax(const struct folio *folio)
> +{
> +	return is_devdax_page(&folio->page);
> +}

Hm, nobody uses folio_is_devdax() in this patch :)


-- 
Cheers,

David / dhildenb

