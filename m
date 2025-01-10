Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CE6A09BCB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 20:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFBD10E0FB;
	Fri, 10 Jan 2025 19:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KD/AQBH/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E942210E0FB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 19:24:26 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436341f575fso25961045e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736537065; x=1737141865; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ACopzyajfJRcuBL6kkHr9KV+I23S42u7LRA+BIOf1M=;
 b=KD/AQBH/iWff+B0O97nRDzMsOfGfqTh77e4YG5RZQQ0qJs/BF/CWcbRMkcJXVjY2NK
 GK3ZGKEZG347GAgWlWTWd0gdt+b8ebQ3DntXui+UN8hvrNdeMntfE8eFbzludXKFhQ6h
 Js4IBrmX796OpKbu3ygEbB5C91o8Vf6U4wj2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736537065; x=1737141865;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ACopzyajfJRcuBL6kkHr9KV+I23S42u7LRA+BIOf1M=;
 b=CP9d/QyvUIq4y9nK+lYRJM45AQ1zVYlY0oKRMTBl2jfUyKc33GC4Ep1LN8d18QErdi
 P1jm6Muj0jvutQ5YriliTUdbVl8+fi6iA1KAGT6JJU3UKQNSjifs864PiypX4Ng4Cze5
 /MQfhq8Aixo5FpHjtGby/fVskV9L8YlNkkEcAgFLohp/6UijO7flMrfyn1qvq9bjwWhg
 qYPqcUlBjGFORhX5M1Eij6h1zWVj9lW9/OTC5TMSL3lydLjQT6a0ABHsLmyIqaj6hVen
 f93YZXv+E6bKNMmw/I8GUqhEcouj8yX6O3/7/plJUmzORHMbcDOvyuv4Wsz22E6aSHXb
 dbxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc6LOHB8P7cfhpkpp8BnZ5Fdov3OOrF+kmoOCQI3PKUPavTFrdcGXCupsm4J2LCliN5CLlg9hGBro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXrPgXxhIjZ751Dq1zNdK3KPW2plWCR8xdUd9UEAExt91q2QsW
 dxGO/LS36nS0SGDoILNONpQEsPkm89KSgZficAKZv2siEPfsrPk06X+MNc6UqKY=
X-Gm-Gg: ASbGncucwAJJ2e5xLkciiwiBNoRwGwk2rOASF7RZl43RS6nLWapLxTaH/xiB/5S1lJX
 6qUN3wGVhzaEif3Git3FoP9arozNmr2suaWVenqso7B3AhdKAQVll7qyPiFebTPcIIuzvlblUNX
 bKDBQ00uAVk2Qr/psoQSUgUV2fkxsyvcOYXyXx0mbMra8MGeF2AqsTISP9HQB2v9jIQMA1WXBkd
 F0tIMDu0Nm1hCrUCkl0f9rDTG60LNxmjGb61Ds1zyOcC3ulgY663+lh/4JT9ONhzOTW
X-Google-Smtp-Source: AGHT+IGQsKQI4LrL1qdpFjuY9ZWEttHxIv9pv69yZaLOwftdrmmCEXmYM32sp7WuieWtkMyPIHFCuw==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id
 5b1f17b1804b1-436e25548e3mr2817985e9.0.1736537065429; 
 Fri, 10 Jan 2025 11:24:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d11csm5313117f8f.16.2025.01.10.11.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:24:24 -0800 (PST)
Date: Fri, 10 Jan 2025 20:24:22 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z4Fz5oiia1JGWIgG@phenom.ffwll.local>
Mail-Followup-To: Xu Yilun <yilun.xu@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z368Mmxjqa4U0jHK@yilunxu-OptiPlex-7050>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z368Mmxjqa4U0jHK@yilunxu-OptiPlex-7050>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Thu, Jan 09, 2025 at 01:56:02AM +0800, Xu Yilun wrote:
> > > > 5) iommufd and kvm are both using CPU addresses without DMA. No
> > > > exporter mapping is possible
> > > 
> > > We have customers using both KVM and XEN with DMA-buf, so I can clearly
> > > confirm that this isn't true.
> > 
> > Today they are mmaping the dma-buf into a VMA and then using KVM's
> > follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
> > dma-buf must have a CPU PFN.
> 
> Yes, the final target for KVM is still the CPU PFN, just with the help
> of CPU mapping table.
> 
> I also found the xen gntdev-dmabuf is calculating pfn from mapped
> sgt.

See the comment, it's ok because it's a fake device with fake iommu and
the xen code has special knowledge to peek behind the curtain.
-Sima
 
> From Christion's point, I assume only sgl->dma_address should be
> used by importers but in fact not. More importers are 'abusing' sg dma
> helpers.
> 
> That said there are existing needs for importers to know more about the
> real buffer resource, for mapping, or even more than mapping,
> e.g. dmabuf_imp_grant_foreign_access()
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
