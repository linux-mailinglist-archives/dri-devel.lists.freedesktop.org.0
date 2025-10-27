Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA8C11F16
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 00:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAF210E061;
	Mon, 27 Oct 2025 23:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="rlZXBLI8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4892210E061
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 23:13:36 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-591eb980286so5485124e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761606814; x=1762211614;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cVb3sBQg3S7kfhJuRLHfxPiQ08+Bc1FaH34bvysQgyo=;
 b=rlZXBLI8X29SyRcAFVj7pSvB4qP7+M4SlY/FOYEeGPiqHnvGGpYC0NO6RHfZhc4e8G
 8zTCEbKglr8WXkYXwSah0ntRbaNnUn3pntvyqvGmEj91oLq9K09FVO9aCxRrLzpwEr8I
 ZZ1r06VrX/snEzpZDoP2Oq0/SrA4a00GrA2zrNck07G6Bik/0bq3luQSWufFI1xlvY4+
 XrVQBqgdrOEDNNmFoyNAspEBxyqDZ6n/R0kbRbuGO71Xrd1djmaZ0VVVQpohoqD45HPY
 3ZWSFhIEvC8dwwjG5QyqMG/8PpeZohbuvt1ReI16kYUu6nKEoO/EplV0wO7bNj8Jvdxp
 N9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761606814; x=1762211614;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cVb3sBQg3S7kfhJuRLHfxPiQ08+Bc1FaH34bvysQgyo=;
 b=u9/3u7qtsqMC8SXmd1LKjfH9qCgMbOO/6/rkLfF07BIbjLKfHcZm3nVdKYhSfrSUpW
 wgLtp/AkEW8HovAn7FEaKNCzx9Vu3paE3cNwrJFQc2YYiD4doA53KShuWQEVL73oqUnD
 /YJ0pgUZM+LguJEdRMWtHmTnVIoZtdnQCiDwAM96u3rdsrXMjCZD5QxzuOqJ6gD0GMu7
 Rl3dSzxyj2yg/PsRB/I+TsQyXtOuHzXKs/A94ygjGD5ABDmBOAx65s3xFaotdHbDdxNf
 8x5YUOFWaI31Zp/HKw/SJD2F55YzAcGupuQlxMdAIzCJJIry8iOp0nGMIoDsnRl1pDN5
 CV5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt30e1H2rABls2KeQx+g+h0SjOAhgrRg1ZEsJkFrTcgOmsXRkdi8YnkXbPFFB8bHIG5KfScj7vstc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeoIs7n19JN+V1ekBUOXibrxZ9yYARsjvhwPd3wGhYNwOzHiq/
 Yr0tKiSnSQNTpKPqw6nje76xsKC7gd1g8pw9lHgtH7uJTzIpuuLt6OkP1lD8933pIcDtQ5ConQf
 6ldqwsQ9d/CuhaNk6exeob0MkXUs1FRI+UATMwnDB
X-Gm-Gg: ASbGncsOcWhX3w30bf4kRlBHo69Vj/xLbQ79Qrf1/01y0q8CNQQx5Qaj8ttAP0ZAPbk
 dEBsaJhd0QS1My7sqIrfBlDbFNGiJBeIftdAJq3PQ1je57PI2xOX+wZP35zuWHgLP0V//EGVxdv
 2FVe/DvM7DGL+RJA2LQ1QTm1Ma/fFZgVRbOLU9PmRelbOMjFI0w6zZZDZusCbGlpufvIGA5sZ3X
 f24wSwxBulyJ7lQk3bwkdZ9xL0ELuV4shTWK1Ub13wTq0gftwAQRQYtXZaLr8hQWMvQeYU=
X-Google-Smtp-Source: AGHT+IGl3ca765JSYQeeeNWnOc4ez61Rh9cYHuTu2Z8wbfu4++aeMX3ejm6+mpCGbnxLweY96XJw4Qd/Jsw/gJioL2Q=
X-Received: by 2002:a05:6512:39ce:b0:585:c51e:e99d with SMTP id
 2adb3069b0e04-5930e98f2bbmr555951e87.3.1761606813913; Mon, 27 Oct 2025
 16:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
In-Reply-To: <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Mon, 27 Oct 2025 16:13:05 -0700
X-Gm-Features: AWmQ_blG76O58dB2_ktM5H7ZDlww5WUOcPernLo2oZm94nuYAfy2S9NihsUA1rg
Message-ID: <CALzav=cj_g8ndvbWdm=dukW+37cDh04k1n7ssFrDG+dN3D+cbw@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
To: Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>, 
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-mm@kvack.org, 
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Oct 13, 2025 at 8:44=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Add support for exporting PCI device MMIO regions through dma-buf,
> enabling safe sharing of non-struct page memory with controlled
> lifetime management. This allows RDMA and other subsystems to import
> dma-buf FDs and build them into memory regions for PCI P2P operations.

> +/**
> + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> + * regions selected.
> + *
> + * open_flags are the typical flags passed to open(2), eg O_RDWR, O_CLOE=
XEC,
> + * etc. offset/length specify a slice of the region to create the dmabuf=
 from.
> + * nr_ranges is the total number of (P2P DMA) ranges that comprise the d=
mabuf.
> + *
> + * Return: The fd number on success, -1 and errno is set on failure.
> + */
> +#define VFIO_DEVICE_FEATURE_DMA_BUF 11
> +
> +struct vfio_region_dma_range {
> +       __u64 offset;
> +       __u64 length;
> +};
> +
> +struct vfio_device_feature_dma_buf {
> +       __u32   region_index;
> +       __u32   open_flags;
> +       __u32   flags;
> +       __u32   nr_ranges;
> +       struct vfio_region_dma_range dma_ranges[];
> +};

This uAPI would be a good candidate for a VFIO selftest. You can test
that it returns an error when it's supposed to, and a valid fd when
it's supposed to. And once the iommufd importer side is ready, we can
extend the test and verify that the fd can be mapped into iommufd.

It will probably be challenging to meaningfully exercise device P2P
through a selftest, I haven't thought about how to extend the driver
framework for that yet... But you can at least test that all the
ioctls behave like they should.
