Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1FA06515
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 20:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48B910E1A5;
	Wed,  8 Jan 2025 19:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="gGqd/9Qv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D350010E1A5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 19:10:09 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso1868055e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 11:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736363348; x=1736968148; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=biUOjGlssGWN8EwLhBP7GU2aZtnSDMl8F0vAilAylCg=;
 b=gGqd/9Qv745nsfvoKqCRaBZeMmE1Hk2L3D7i4kE6o9NqlF0IuISiG1oreb14PUMLYV
 qv3jj7I9YlTRbTuWb/+ZWdsS7sr3ngYnUV04zEhnsYAWFeBlaJrTDB9ZIXOzCDHI2848
 /vN7AAqCUVT9R1sQ/enkkPyyyxxdH7DM8DQcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736363348; x=1736968148;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=biUOjGlssGWN8EwLhBP7GU2aZtnSDMl8F0vAilAylCg=;
 b=dWcwUrsltwQht+nFCrz9ATt1CHk0IMD1RMgR10U5A1+HI+hjSX/JvkWfEHPkNC2HxH
 e3+9RncHNbyMoZBRNdDEhBmn9wDv4ijkL2op0W5UjT+jkB6KSYOvR1wLHshjHIwBeAii
 x9WosRptZyKYpnYB+RTgq2DRr9ZH04SzhDtLY2X4qQDg5UMUJvM9tcOn8zs8arP3NO1Y
 HoZZcl0T49+PO1V5KAWtjczbkQCCbvmw9g+9nTNOd2D90Io9sTECMFmfppxy+WDUPSpi
 H7VmDCTK5OuWSAWvYWRMgoeC530T0t5w9n1S4nVVk3lZlrD0iIMJTB94pYPB5HLOYOSA
 zcOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrOQ7HA1OOmr7brmLDHhoveeAjvyqn8Ub3cDAkcE9xe11YdTFaQgWu0ol//QDf+K6I/6I94KnDBIA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuOqm+SYa6UT+WgnDQs0jEKr2yXqGKhlGRy9IaEgU/TqzwJ9XP
 EvUJ9y60QO8KKZmrin8ywQM/l3e4OcktaiodrgSgb4lh95ZWkPjS33bUTs7jOs1JydKCGuWqkKO
 6
X-Gm-Gg: ASbGnctAcQILYY0ulGWv4ABLWfRxKx11lXoen9dW/zB1NENNZcBeaulQGs/4ylnnwmG
 QKc7qfNZ5XIgA6lxcjMuiMqnBGsCHyAzo+xzRBqXO+1wvFlEmTVgjBRiRrq2BgsEHIXtZ8KbV93
 umiRUQXCwc1h7cosn+lfQPjf2xc829b+gLQ1Qg6JClPtu9SY6EX628ZVPJ9tjaztH/ZtgovQT9T
 VYJLBfQj1YgDegtaCUNVY80xxvq50Z5A+MD2hrYBTViwZw2REMKpVXhQENosvUTE+i9
X-Google-Smtp-Source: AGHT+IExRhiMjUcJ+d2lZABMI97n3eXtXXWT0vriTVE6jNdGuPQr09X4d5/VTHHP1nckqDkKCH5ntA==
X-Received: by 2002:a05:600c:5801:b0:436:30e4:459b with SMTP id
 5b1f17b1804b1-436e26adf89mr31810775e9.18.1736361896818; 
 Wed, 08 Jan 2025 10:44:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2ddca2dsm29220505e9.21.2025.01.08.10.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 10:44:56 -0800 (PST)
Date: Wed, 8 Jan 2025 19:44:54 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108162227.GT5556@nvidia.com>
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

On Wed, Jan 08, 2025 at 12:22:27PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 08, 2025 at 04:25:54PM +0100, Christian König wrote:
> > Am 08.01.25 um 15:58 schrieb Jason Gunthorpe:
> > > I have imagined a staged approach were DMABUF gets a new API that
> > > works with the new DMA API to do importer mapping with "P2P source
> > > information" and a gradual conversion.
> > 
> > To make it clear as maintainer of that subsystem I would reject such a step
> > with all I have.
> 
> This is unexpected, so you want to just leave dmabuf broken? Do you
> have any plan to fix it, to fix the misuse of the DMA API, and all
> the problems I listed below? This is a big deal, it is causing real
> problems today.
> 
> If it going to be like this I think we will stop trying to use dmabuf
> and do something simpler for vfio/kvm/iommufd :(

As the gal who help edit the og dma-buf spec 13 years ago, I think adding
pfn isn't a terrible idea. By design, dma-buf is the "everything is
optional" interface. And in the beginning, even consistent locking was
optional, but we've managed to fix that by now :-/

Where I do agree with Christian is that stuffing pfn support into the
dma_buf_attachment interfaces feels a bit much wrong.

> > We have already gone down that road and it didn't worked at all and
> > was a really big pain to pull people back from it.
> 
> Nobody has really seriously tried to improve the DMA API before, so I
> don't think this is true at all.

Aside, I really hope this finally happens!

> > > 3) Importing devices need to know if they are working with PCI P2P
> > > addresses during mapping because they need to do things like turn on
> > > ATS on their DMA. As for multi-path we have the same hacks inside mlx5
> > > today that assume DMABUFs are always P2P because we cannot determine
> > > if things are P2P or not after being DMA mapped.
> > 
> > Why would you need ATS on PCI P2P and not for system memory accesses?
> 
> ATS has a significant performance cost. It is mandatory for PCI P2P,
> but ideally should be avoided for CPU memory.

Huh, I didn't know that. And yeah kinda means we've butchered the pci p2p
stuff a bit I guess ...

> > > 5) iommufd and kvm are both using CPU addresses without DMA. No
> > > exporter mapping is possible
> > 
> > We have customers using both KVM and XEN with DMA-buf, so I can clearly
> > confirm that this isn't true.
> 
> Today they are mmaping the dma-buf into a VMA and then using KVM's
> follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
> dma-buf must have a CPU PFN.
> 
> Here Xu implements basically the same path, except without the VMA
> indirection, and it suddenly not OK? Illogical.

So the big difference is that for follow_pfn() you need mmu_notifier since
the mmap might move around, whereas with pfn smashed into
dma_buf_attachment you need dma_resv_lock rules, and the move_notify
callback if you go dynamic.

So I guess my first question is, which locking rules do you want here for
pfn importers?

If mmu notifiers is fine, then I think the current approach of follow_pfn
should be ok. But if you instead dma_resv_lock rules (or the cpu mmap
somehow is an issue itself), then I think the clean design is create a new
separate access mechanism just for that. It would be the 5th or so (kernel
vmap, userspace mmap, dma_buf_attach and driver private stuff like
virtio_dma_buf.c where you access your buffer with a uuid), so really not
a big deal.

And for non-contrived exporters we might be able to implement the other
access methods in terms of the pfn method generically, so this wouldn't
even be a terrible maintenance burden going forward. And meanwhile all the
contrived exporters just keep working as-is.

The other part is that cpu mmap is optional, and there's plenty of strange
exporters who don't implement. But you can dma map the attachment into
plenty devices. This tends to mostly be a thing on SoC devices with some
very funky memory. But I guess you don't care about these use-case, so
should be ok.

I couldn't come up with a good name for these pfn users, maybe
dma_buf_pfn_attachment? This does _not_ have a struct device, but maybe
some of these new p2p source specifiers (or a list of those which are
allowed, no idea how this would need to fit into the new dma api).

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
