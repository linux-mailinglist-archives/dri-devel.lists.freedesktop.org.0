Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06BDA35A15
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 10:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D33610EC14;
	Fri, 14 Feb 2025 09:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E5fG16Ab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B1210EC1A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739524818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZR/58w+1L+EYFW6tjt18wTp/81X9JhLePAFSHTKPVMs=;
 b=E5fG16AbQrfmpenbBrXUHI2EQ5+OjnzxAUGEn7iaM/HlO7KKCl2qNcbzqqXZ+1bXb/o5m9
 o17rnh34Tpsi4bAvoXQ+KHknYisG0MypKlIWbOcBd4aXP7A/+ATnyk/nBjknni2TCxOhiq
 6gUXJb0AvGkdX2PDXbGIyMuHuQS37bY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-04Kw6J5IMjqnpTObaF8Frg-1; Fri, 14 Feb 2025 04:20:17 -0500
X-MC-Unique: 04Kw6J5IMjqnpTObaF8Frg-1
X-Mimecast-MFC-AGG-ID: 04Kw6J5IMjqnpTObaF8Frg
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2fc1c7c8396so2906640a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 01:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739524816; x=1740129616;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZR/58w+1L+EYFW6tjt18wTp/81X9JhLePAFSHTKPVMs=;
 b=LvX5gHktbdtpyYrOhxWrEKXfxwW2QW/mAZaDU8ijkeRBcutolW7TSdWE/KxIUryhpz
 BMpv8oFBKQUOx6iUd33X6xRVm76e6YE9KTyRMNe2qrEjp5qczZMqEiRbUihICEIflYkY
 ulh/KEZIoOmjG2cZ0oRkTBgaN1EE+kA8QJlEAAwf5ZgLdFIvcAmWHD4We/qyPSk9gW9N
 liTnyKe20gQR7oty4mdNqkauS0V05HunXk8Oq5tv6ILC9owpRSnh0tcrzail3HYn5xRb
 4M+fHBvVLc2ewmpcvnaKw1qIyDLDvwNSLDEFxIkMrsDln8lpV13rFEa/+4YjjJ4oZ4N/
 7EVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwjEnpgnG8WYUMG6L08YS1vgI74zng4qrPxSTNovX8QRTvEgrPftMuMpI+dUvL14GeODfNxjzfExc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEBsvlFdG1ZdHaZHv9okGPhZe9YPA2G64yYsArpL+ykXJ3BWW0
 cZaAXjBe3llWszqxZNbl0UYEJZ2/AbgW43wyNytGcAokkNfW4faLrcTuNMbJwghP9JFtdZOolgv
 2j02bjmURTMbb6RD+tuMWG9EQvD2AxOgaQacDOB7grPYpPAjPIHvXgXKVfppwB8Lp7cTTy/9B5G
 QpzR08/w6UYrk9vsg30THEYqKFsGTeaXNHmBnGuh8F
X-Gm-Gg: ASbGncvyv2Ls4acyDO214JsI9HKeDgqEQZiyANFeEBuiRsjhLtU3gqLJJEwC4oScw6R
 3p25ibOVvbpmgxAdfhTxG+oS4eoTHzltMZirzscYJNMaMiWHSf5ZdwYIi0A==
X-Received: by 2002:a17:90a:c88e:b0:2fa:20f4:d277 with SMTP id
 98e67ed59e1d1-2fbf5c59edamr17083869a91.24.1739524815978; 
 Fri, 14 Feb 2025 01:20:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGV70tYKaoD72ZWgJewS3S3Ws/yTe5Co7t1AkVMiygQbOPGvw6IrjqyLyAEgiPWE34Qlyn+BspH/JPNCc6Sah8=
X-Received: by 2002:a17:90a:c88e:b0:2fa:20f4:d277 with SMTP id
 98e67ed59e1d1-2fbf5c59edamr17083840a91.24.1739524815700; Fri, 14 Feb 2025
 01:20:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Feb 2025 01:20:15 -0800
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20250213105231-mutt-send-email-mst@kernel.org>
References: <20250213-virtio-shm-page-size-v1-0-5ee1f9984350@redhat.com>
 <20250213105231-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Date: Fri, 14 Feb 2025 01:20:15 -0800
X-Gm-Features: AWEUYZkLDCiAVkg75a5t11ITS9fRDi5xZ4oLEnr_uyiN6ZHVdlUxn8cPTzWG8SU
Message-ID: <CAAiTLFViXr7gVPd3oRhfHSnUxxexPDEJ-MJJOuFrctrr+XvTfQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] virtio: obtain SHM page size from device
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, fnkl.kernel@gmail.com, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zFur_FCN_AdZQeERI0zmWWhGTB12tLBxMONm1RhmsC0_1739524816
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

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Feb 13, 2025 at 04:49:14PM +0100, Sergio Lopez wrote:
>> There's an incresing number of machines supporting multiple page sizes
>> and, on these machines, the host and a guest can be running with
>> different pages sizes.
>>
>> In addition to this, there might be devices that have a required and/or
>> preferred page size for mapping memory.
>>
>> In this series, we extend virtio_shm_region with a field to hold the
>> page size. This field has a 16-bit size to accommodate into the existing
>> padding virtio_pci_cap, simplifying the introduction of this additional
>> data into the structure. The device will provide the page size in format
>> PAGE_SIZE >> 12.
>>
>> The series also extends the PCI and MMIO transports to obtain the
>> corresponding value from the device. For the PCI one, it should be safe
>> since we're using an existing 16-bit padding in the virtio_pci_cap
>> struct. For MMIO, we need to access a new register, so there's a risk
>> the VMM may overreact and crash the VM. I've checked libkrun,
>> firecracker, cloud-hypervisor and crosvm, and all of them should deal
>> with the unexpected MMIO read gracefully. QEMU doesn't support SHM for
>> the MMIO transport, so that isn't a concern either.
>>
>> How the SHM page size information is used depends on each device. Some
>> may silently round up allocations, some may expose this information to
>> userspace. This series includes a patch that extends virtio-gpu to
>> expose the information via the VIRTGPU_GETPARAM ioctl, as an example of
>> the second approach.
>>
>> This patch series is an RFC because it requires changes to the VIRTIO
>> specifications. This patch series will be used as a reference to
>> propose such changes.
>>
>> Signed-off-by: Sergio Lopez <slp@redhat.com>
>
>
> don't you want to negotiate the page size with the
> driver then?

It's not really a negotiation. If the device presents the feature, the
driver must honor the page size, either directly by rejecting or
rounding up allocations, indirectly by informing userspace, or both.

If the driver can't accomodate to the page size, it must refrain from
using the Shared Memory Region.

Thanks,
Sergio.

