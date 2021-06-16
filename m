Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F93A90FE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 07:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861F46E4D0;
	Wed, 16 Jun 2021 05:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0334B6E4D0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 05:10:27 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id k16so1664685ios.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 22:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iLn8eUCvJy2CWcSIXe6ohsWZex4qVXD74p7z6FMJPUo=;
 b=jDOToH5ThQyIZ/Z8kPwh8R97YYJUPgyXIvwYI7ELfesGT1LRFmc0oQizSpW5Du/1jT
 n8n511S9H2jKWIPPzwbEGsCQVrh6jqMZwL99GOCEoFmIgU2xBUW+YvuQbG8TA+PazhFY
 uMdw/pNT41Ub0lKjlBja/JS0DV7IUisf06CVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iLn8eUCvJy2CWcSIXe6ohsWZex4qVXD74p7z6FMJPUo=;
 b=TJ6PQDslqx2tOMDixKLdUWNxohCwznTyiJAv07ZcYwP+0W1VkgDKQXZ773E/b0BY+d
 ekmzFFmakG00sVJs1UVDgoE7yMSTHgRSqAeZWecMd3qS99L8B7EToeyfZN+3YiXnV4cS
 8cf8/uPnoHWmqBDtwEDDtFb0uObNm0SDg6djieMTNvY+5fCi8SnQdqwNDJcJ3dt2vgHm
 tJj0fD4u8sxmBq+yfLO4buxeGsUCqqebDk+Gmojdcuf9YG4S9P8694pNh61fWbRPC820
 KF4rLEjFJztNUqq2zmjR5/1Yez8i4HpqOQHFHREOqpjuG2rz1I42SD1z6c1OLeihU/W8
 IfMg==
X-Gm-Message-State: AOAM533VMxO+eBE0p/YIOSzP358wQiAW374B/Qc0CT+UZA/YMdCIx5KW
 ZAXO4u7Mnij1T3W2oEvrbqcUi1sZZwZkmw==
X-Google-Smtp-Source: ABdhPJzWkzqyTZGMMS9b6Ofln9U9XIZfxpo2VOy/uHccufp3OStbrzwd9tLX8xYyhGUguS3yVHN07Q==
X-Received: by 2002:a05:6638:150a:: with SMTP id
 b10mr2477369jat.45.1623820225961; 
 Tue, 15 Jun 2021 22:10:25 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id w11sm652706ilc.8.2021.06.15.22.10.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 22:10:24 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id k5so1653975iow.12
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 22:10:23 -0700 (PDT)
X-Received: by 2002:a05:6638:151:: with SMTP id
 y17mr2452891jao.128.1623820213046; 
 Tue, 15 Jun 2021 22:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210616035240.840463-1-tientzu@chromium.org>
 <20210616035240.840463-10-tientzu@chromium.org>
 <CALiNf28=3vqAs+8HsjyBGOiPNR2F3yT6OGnLpZH_AkWqgTqgOA@mail.gmail.com>
 <20210616045918.GA27537@lst.de>
In-Reply-To: <20210616045918.GA27537@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 16 Jun 2021 13:10:02 +0800
X-Gmail-Original-Message-ID: <CALiNf2-+vL8rw5fi=DcR=V7d55Ls3-OXoxC87Pvrf1Kz14D_+A@mail.gmail.com>
Message-ID: <CALiNf2-+vL8rw5fi=DcR=V7d55Ls3-OXoxC87Pvrf1Kz14D_+A@mail.gmail.com>
Subject: Re: [PATCH v11 09/12] swiotlb: Add restricted DMA alloc/free support
To: Christoph Hellwig <hch@lst.de>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 16, 2021 at 12:59 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Jun 16, 2021 at 12:04:16PM +0800, Claire Chang wrote:
> > Just noticed that after propagating swiotlb_force setting into
> > io_tlb_default_mem->force, the memory allocation behavior for
> > swiotlb_force will change (i.e. always skipping arch_dma_alloc and
> > dma_direct_alloc_from_pool).
>
> Yes, I think we need to split a "use_for_alloc" flag from the force flag.

How about splitting is_dev_swiotlb_force into is_swiotlb_force_bounce
(io_tlb_mem->force_bounce) and is_swiotlb_force_alloc
(io_tlb_mem->force_alloc)?
