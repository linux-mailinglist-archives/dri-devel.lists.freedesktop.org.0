Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96028AA0BA1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 14:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5554510E02E;
	Tue, 29 Apr 2025 12:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="n04sVarT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A5710E433
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 12:28:36 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7c96759d9dfso610500285a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1745929715; x=1746534515; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wQwVdhGc8RVLmHm5c3vmlOp5OAvwkuVbhR+V+Jg2Z1U=;
 b=n04sVarTEEhlooOVcExgxtNpK9AU0eitrasAZ6l0qQIdogRiHuwhJHfBQCTU3aD/wL
 JJgXrpt6ZOYTbLoOAGLPERMbHPHOFKtAuf2InLPpryqP93WFJOoelyoVub1OI3yqiPfY
 U/K+0VARa/jthCPf5vS0tCO08ClWCYkUMmUSZ8N5lgYJQrz2uZhn2nu7girvaOypTu73
 6xPg349lESWw1FCRHZuAoyDbnB227EbbnEY/jiYLGT29YAJhEuyjGmz1NfSTq4aliRGv
 jqpfqDRyvIpEHS3E0VtvAkK2a7WrcBt/buFw07BUVU+L+UXpYXcY2Svk2/ozc1ZIUvhJ
 dDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745929715; x=1746534515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQwVdhGc8RVLmHm5c3vmlOp5OAvwkuVbhR+V+Jg2Z1U=;
 b=MRPZLeLlNySN6mKwmZZB58zDd2KybXa1ej2lM7+FBEfWIe7W2IGlfNtLA/DoMNBpdI
 RoL+94Fj63U7Ziz+jCuwn7Jyu8ABx/gCe5KtZnSIS/Srzf/UNTtW+DeeVVVABA663Mpw
 570cBkdG2UeHZxyVV9mrwUUkuCrOxZJRoKasWHwqaCktjOpm6AgrKTDTHrl/Nf8Wh+Xl
 c/M4J4/BEl/4x9d+mN5vuichnGnCGGLpJ7zhWMFZ1EEE3nqwF/cquXXcbkBdld54Fj61
 gEDveDY0ZZTTSqRgkiMXu/PYyxHwjpJZQ9t3yBfQxsFAUXqRyQVpajYLX9pE/Xgg5tY2
 DyZg==
X-Gm-Message-State: AOJu0YwmY1p4TkN4IoE1S9O+9MDvvbYBG5VaW+8N2EVygPjukTX0ysDL
 XsC0CdysmaUTuFDcun40LF7xZOXlo9L/hLIolFq85CqvhxKZGBvZ80M1bbofKjE=
X-Gm-Gg: ASbGncufKHHs3qjOhjD3znF256yvBeYaFVTKjbIfZEpAOabmJgNZqoAoQM863holn40
 aECLq97E8ielysB7vzUEtbVL5zplWJQi8FurFFwNkF5E7If9YxrlENNEi+sLMxg0iJCC0LBo/To
 HkaKke2P58EBudElZLOnBNFIF/YC07mtL22z+sK8UqkYdVg2CLuAXBD3jl0LFWjw1/1tZea3J50
 /kGGgzgjYHst/qDg2bC6iP3t2/92c8T2dnJEevHn2t9EcRGkopRGOD30PMUGEKabfXf/N2n5WAA
 TPr6ovlZLzzTzxC8gjPRSvVOnBPUJLMHuuohVHF/+pNWGP/+8CxRpoTr7gxQappruCFxrx5JxA2
 SZc0rm3kM2SaEM/gxw5M=
X-Google-Smtp-Source: AGHT+IFMhbf9NGzyK/N2zlhF/+Cuicwqh6Ml7VdJKCsWNEjD0dprXI5tx5siEqKxqV9DQ7d+ym50CQ==
X-Received: by 2002:a05:620a:1a12:b0:7c5:3e89:c6df with SMTP id
 af79cd13be357-7c9668496famr2024432685a.12.1745929715358; 
 Tue, 29 Apr 2025 05:28:35 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.219.86]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c958cbd048sm729195085a.43.2025.04.29.05.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 05:28:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1u9k4g-0000000A4bg-179H;
 Tue, 29 Apr 2025 09:28:34 -0300
Date: Tue, 29 Apr 2025 09:28:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/33] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
Message-ID: <20250429122834.GA2260621@ziepe.ca>
References: <20250428205619.227835-1-robdclark@gmail.com>
 <20250428205619.227835-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428205619.227835-4-robdclark@gmail.com>
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

On Mon, Apr 28, 2025 at 01:54:10PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In situations where mapping/unmapping squence can be controlled by
> userspace, attempting to map over a region that has not yet been
> unmapped is an error.  But not something that should spam dmesg.

I think if you want to do something like that using the iommu API the
expectation is for the caller to do a iova_to_phys to check what is
mapped first? That seems kind of lame..

Maybe page table driver should not not be doing these WARNs at all. If
we want to check for that the core iommu code should have the WARN_ON?

eg iommufd already has a WARN_ON around iommu_unmap failures so having
one in the ARM page table is a double WARN.

Don't really like using a quirk to change the API contract.

Jason
