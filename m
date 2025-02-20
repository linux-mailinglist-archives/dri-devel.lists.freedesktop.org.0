Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177AAA3D675
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B3910E913;
	Thu, 20 Feb 2025 10:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WQladiNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279B810E913
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740047055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PCfNk2irYZhiAVEAeMF3jzWLVhPjMhVSnPe0uvp0LKw=;
 b=WQladiNX3kmGPXs7DkYsk/LemS+Koi5CQvbK3ZRxhAG35j0e+QQxUxOGC01mhOPPTwzU1U
 GBGtyV/PQvRs0Fw8ulI6loCUNh75jSKYnkw9lDSXYwY04A2PVhl18HLF3D4R4Qkmwuhsb5
 KcPXBXMHUdMKRlA6ur6SIvX9SJ7tsWU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-5IuC_ZneOsmc5tYg1chtEQ-1; Thu, 20 Feb 2025 05:24:11 -0500
X-MC-Unique: 5IuC_ZneOsmc5tYg1chtEQ-1
X-Mimecast-MFC-AGG-ID: 5IuC_ZneOsmc5tYg1chtEQ_1740047051
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-220d9d98ea6so25025175ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047050; x=1740651850;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PCfNk2irYZhiAVEAeMF3jzWLVhPjMhVSnPe0uvp0LKw=;
 b=TaQLf076Tk3MCh3PnI3fYyhsC0xAm6HUrBlC673OBsiYiULBGTreOg++XpHm2+1L+w
 bR1dr+KnXRchk2kT6vHQoKMZCmlCJCApnFs319MgCZr45endy9xag9ng/nXqkl1VanSQ
 99KDUjrgiu6OH3U/++BisLsUuw4f9zu7pRg7NhkrMjCrs254nP7mwkT+YZmc886nc8vu
 2KpsnCYrsmZ+2TovCEG32z1M+kLg3ssP70Ga6fZP10d+JJTRYgYmXwDIEGjrY6ePzpsv
 DWCUi+8vkWdwqBGrCrINlnsnU91mXVDE7HiGQ+WxBb73x5JDNArHm8N2bTSjT6cvjXx6
 YO8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfA1Uko51WDd4S5ouledBb3G5nddcHQhQVJrbPJkvT3xlgAzW6L45r5nCMO9+NR4tBqIWOIgUay3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWimzOMxL5vluRvRl0WFyNIQ7LoiNCJUo/V+KNMKoQR3Ym0ZKT
 W6/PmwHIv93deHOMgCOgA52tfiZAy4C31qX5pYGHw0wULF5IcCguXCfVtG/OAb9zW5tCPsV/IV+
 0wkviJLEUu3TPmfhBACHW+trbcXmlV4AyaqB1zJmfkVcHRtlVZhkaK6JDLH6v6tNLpN4d9JPjGu
 V4VIAewntAXyHAfzHndeRRTPxpHRNBEStzKvvRME9t
X-Gm-Gg: ASbGncv3eXb5pcFUdXrVSjjrowuXaR+IZ97IOxd4ttp0XXkoeYB1mo1o111u3q0VKao
 I7bunzGFGlEY+dsgVe7g+7ZnGKHE88/LH3z8HfG/rI2rpKxONBFdFzSVpCQ==
X-Received: by 2002:a17:902:e803:b0:216:1543:196c with SMTP id
 d9443c01a7336-221040620b2mr340108555ad.27.1740047050645; 
 Thu, 20 Feb 2025 02:24:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhBmKY/Jd/FJcL0J0umaKdIJTK407yNESWW6lHPZ4yPs84G32nsvPhs1j0n5aPenBrC+US2evK7mAnibRfM8Q=
X-Received: by 2002:a17:902:e803:b0:216:1543:196c with SMTP id
 d9443c01a7336-221040620b2mr340108255ad.27.1740047050275; Thu, 20 Feb 2025
 02:24:10 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Feb 2025 02:24:08 -0800
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <1f9a86a5-97d6-41d5-9a30-0422fc9ec137@collabora.com>
References: <20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com>
 <20250214-virtio-shm-page-size-v2-4-aa1619e6908b@redhat.com>
 <1f9a86a5-97d6-41d5-9a30-0422fc9ec137@collabora.com>
MIME-Version: 1.0
Date: Thu, 20 Feb 2025 02:24:08 -0800
X-Gm-Features: AWEUYZlfgST3-O9VCrzw5HD0jnPovA3jL5BWDBB878el2RF0dCmg4Z8bMopNsuE
Message-ID: <CAAiTLFXihV_DUpd25Mc-OcgsNJ5tVJx7XYsETgxh+7cFuicuHA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/5] virtio-mmio: read shm region page size
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Verkamp <dverkamp@chromium.org>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, fnkl.kernel@gmail.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9KsPzj_mdiEFISBF5T0P6i5VeMMxuCuc4YTtBSPQ6oQ_1740047051
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:

> On 2/14/25 18:16, Sergio Lopez wrote:
>> Use the newly introduced SHM_PAGE_SHIFT register to read the page shift
>> for the shared memory region, derive the page size from it and store the
>> resulting value into virtio_shm_region.
>>
>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>> ---
>>  drivers/virtio/virtio_mmio.c     | 11 ++++++++++-
>>  include/uapi/linux/virtio_mmio.h |  3 +++
>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
>> index 1f594b626d7a7734e8ec58766737a118c26bad94..0f892770739ea84b3e7be5615332773049b10ab1 100644
>> --- a/drivers/virtio/virtio_mmio.c
>> +++ b/drivers/virtio/virtio_mmio.c
>> @@ -537,6 +537,7 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
>>  			      struct virtio_shm_region *region, u8 id)
>>  {
>>  	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
>> +	u8 page_shift = 0;
>>  	u64 len, addr;
>>
>>  	/* Select the region we're interested in */
>> @@ -560,7 +561,15 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
>>
>>  	region->addr = addr;
>>
>> -	region->page_size = 4096;
>> +	/* If supported by the device transport, read the region page size.
>> +	 * The page_shift variable is initialized to zero above, so if this
>> +	 * feature isn't supported it will result in a page_size of 4096, a
>> +	 * default safe value.
>> +	 */
>> +	if (__virtio_test_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE))
>> +		page_shift = (u8) readl(vm_dev->base + VIRTIO_MMIO_SHM_PAGE_SHIFT);
>> +
>> +	region->page_size = 1 << (page_shift + 12);
>>
>>  	return true;
>>  }
>> diff --git a/include/uapi/linux/virtio_mmio.h b/include/uapi/linux/virtio_mmio.h
>> index 0650f91bea6c70f935764070d825d181a2379afb..43348be30eff90ee228b6490b9d3c35ba4c50aa5 100644
>> --- a/include/uapi/linux/virtio_mmio.h
>> +++ b/include/uapi/linux/virtio_mmio.h
>> @@ -133,6 +133,9 @@
>>  #define VIRTIO_MMIO_SHM_BASE_LOW        0x0b8
>>  #define VIRTIO_MMIO_SHM_BASE_HIGH       0x0bc
>>
>> +/* Shared memory region page shift */
>> +#define VIRTIO_MMIO_SHM_PAGE_SHIFT      0x0c4
>
> What's the logic behind choosing 0x0c4, why not 0x0c0?

It seems like Linux doesn't support it yet, but in the specs 0x0c0 is
already reserved for QueueReset.

Sergio.

