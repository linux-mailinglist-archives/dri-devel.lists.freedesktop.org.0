Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13FD37AC2E
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 18:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74236EA7B;
	Tue, 11 May 2021 16:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3526E6E5B2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 16:42:40 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so584765pjn.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 09:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I574vs+oxpmw2RaQkdeqT3TmVa8C0vE6HCQzgLmVaEk=;
 b=EO4zcKQD13cnMpJi5k5sqZg36m/uhjFrv+x7tUEK/JnHkDgZTOULzljGCah93D1FN5
 SwmaT+lt9As201TL9V65C0BiJShCnGyDe8UgjgY5Jm1YBpkuQxrN8+e9OJjS8RpeP4ih
 4tasAkIoShr42ndvrMVih2QtviIwqYbb0WQHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I574vs+oxpmw2RaQkdeqT3TmVa8C0vE6HCQzgLmVaEk=;
 b=UXNiTpCwTnUDVED7vP/G8L3AXTblcw9TNMd/YYVHg06MN4XcMkp59Ygt2kW6UnMj94
 ZCe0SVY7TOhA3C69Eo+0YL3AyRgiyjBfGLK92K43wiq+WUcfq7JOGfz90ptgCIRVnO+w
 lvL7ZEBKj99IOmjTxGfxrE7GYmEYnrTmx17CIW5ICA2NCoFs746dWpWI/8w61t51Hiuo
 YejmWgfhYp8KbnNrpFx87ikZSut0q4fBQl1IcgA2qRCrO769I3SKZyJ+OZArR7qvYm03
 mnUym+Rt/I6Qz2UvXBAxv97Z7foIJ/2A9NumpRQUnJf6P5Hx1tz2LKR+TuVi76STBisp
 NoEw==
X-Gm-Message-State: AOAM533VyEASSEemo6xL8sYMjglXzqmAI1EuSowDhBOfdOF/7DA3Hx5w
 78CFjxe4/w7xvvHEskuHWjwG1WxA7bYMyg==
X-Google-Smtp-Source: ABdhPJzrBUKYDin76jDAXyiQcXiRxJUMCtC31OEXNxeXVC78eN9HVS29gdBBUlLeFZL+G0nfbu2esQ==
X-Received: by 2002:a17:902:e051:b029:ed:7646:49c4 with SMTP id
 x17-20020a170902e051b02900ed764649c4mr30861032plx.55.1620751359605; 
 Tue, 11 May 2021 09:42:39 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com.
 [209.85.210.176])
 by smtp.gmail.com with ESMTPSA id b2sm2519757pji.28.2021.05.11.09.42.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 09:42:38 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id i13so16614165pfu.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 09:42:37 -0700 (PDT)
X-Received: by 2002:a92:6804:: with SMTP id d4mr27241366ilc.5.1620751346868;
 Tue, 11 May 2021 09:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095026.3477496-1-tientzu@chromium.org>
 <20210510095026.3477496-9-tientzu@chromium.org>
 <20210510150516.GE28066@lst.de>
In-Reply-To: <20210510150516.GE28066@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 12 May 2021 00:42:15 +0800
X-Gmail-Original-Message-ID: <CALiNf2-x8Gw0TPLdeRnfPmUTeuK9dsLbDXN4hPnc08y21uuUXQ@mail.gmail.com>
Message-ID: <CALiNf2-x8Gw0TPLdeRnfPmUTeuK9dsLbDXN4hPnc08y21uuUXQ@mail.gmail.com>
Subject: Re: [PATCH v6 08/15] swiotlb: Bounce data from/to restricted DMA pool
 if available
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
 Nicolas Boichat <drinkcat@chromium.org>, nouveau@lists.freedesktop.org,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 11:05 PM Christoph Hellwig <hch@lst.de> wrote:
>
> > +static inline bool is_dev_swiotlb_force(struct device *dev)
> > +{
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     if (dev->dma_io_tlb_mem)
> > +             return true;
> > +#endif /* CONFIG_DMA_RESTRICTED_POOL */
> > +     return false;
> > +}
> > +
>
> >       /* If SWIOTLB is active, use its maximum mapping size */
> >       if (is_swiotlb_active(dev) &&
> > -         (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
> > +         (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE ||
> > +          is_dev_swiotlb_force(dev)))
>
> This is a mess.  I think the right way is to have an always_bounce flag
> in the io_tlb_mem structure instead.  Then the global swiotlb_force can
> go away and be replace with this and the fact that having no
> io_tlb_mem structure at all means forced no buffering (after a little
> refactoring).

Will do in the next version.
