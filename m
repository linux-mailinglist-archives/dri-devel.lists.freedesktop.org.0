Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C3B9BF301
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 17:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC2510E169;
	Wed,  6 Nov 2024 16:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="SqaY7mdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7DE10E169
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 16:15:23 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6cbd12b38b4so40521216d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 08:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1730909722; x=1731514522; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6nSgGdK6NvqqFV9LyhiXVQ/e823UrG8JIi5eQbgWpwM=;
 b=SqaY7mdWpyWKFbWBmlVNowz6AvEsKUMdwMEdkMSFq6SLlN746rKJ4zLKp2wZ/ludC4
 JM/r9cfTMH1tXeg3i/7ZEB9QgwGjKL46goVpoeJCn+SyPTzkBK69n/DL9mxgDMrm++vB
 BU8TEMVhdRCPseOqhX3sljl8zOZQ7e94nO+4zar1fwbQDzP1+WjpX/FdOYPshYO3nsTt
 qYkrkLzcx4JRzjOKYY891XCQ53iPlEYu/MF1VwSWffhd89SX+jgzdzmARWRmwpoUa/sm
 2qLr8oC8Ier8nYD/hWF4hvHWroxiIAYaovEQkT1w9GnR7zXY0jm6fV+zmFMpl3NAWh89
 Et8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730909722; x=1731514522;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6nSgGdK6NvqqFV9LyhiXVQ/e823UrG8JIi5eQbgWpwM=;
 b=V81I6aAfnKCG93TDXPAv1oCyzRX9Cc/lPmhmVNAnMISxOhvIVe3FfHhpRg4fVWKGYi
 vorgP1NTP0OnsD6DQkYmU36ZD1VBvJAQMSQ0/S897SpFPfdBS2tT07ditH+rV04Xk5F/
 A9sO7GpCKE/CJVq3XH8kyGfpozIsyXnmEF+M0Tnvp/X6B7hLOlKg+OIdNqeeFcd+YJtt
 FMSKZ2R7J1ZkgCWS5AeKFfau/8gnQ9JNgreDXFjK03OYXDwwBkMfu2cWVpVUmJ/q0Q7f
 g0DyPb9ON7sGrVJ3cAcw/sWkQn9kuQn+RteXzlXgNds8uTgNmU5x0CRgnT/9dF4cdKLa
 FSgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv/9waZ1bLN6kNIaPYY4brPXIkMKPtL09fDIBDMh/i3LdSNvL6R441vtQlb00ofjD5BzbL+uk9kAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkplS0V/7Rd/TEQIcwTBg4Y/kqRzBgAV1KNkUnkEnKzSGPllrs
 F856YUpkqJ5vKtKyZiKLWrLLMgP1npeB0ujDI7HRIt0SFnJcC4NUorVumkNp670=
X-Google-Smtp-Source: AGHT+IEwombH/Npcr6xgQKI4hUOBNWDndBBc7puCreP3V/CqgxTRomKyutXho3m/FUi9CO1Dgd2M5Q==
X-Received: by 2002:a05:6214:2c13:b0:6cb:f654:55ac with SMTP id
 6a1803df08f44-6d185683569mr561328396d6.11.1730909722261; 
 Wed, 06 Nov 2024 08:15:22 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b2f39ebaadsm644777685a.2.2024.11.06.08.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 08:15:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1t8igi-00000002BDj-3v7y;
 Wed, 06 Nov 2024 12:15:20 -0400
Date: Wed, 6 Nov 2024 12:15:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, catalin.marinas@arm.com,
 kernel-team@android.com, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 0/3] Remove split on unmap behavior
Message-ID: <20241106161520.GJ35848@ziepe.ca>
References: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
 <173090505900.4167208.10850898110820689849.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173090505900.4167208.10850898110820689849.b4-ty@kernel.org>
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

On Wed, Nov 06, 2024 at 03:53:23PM +0000, Will Deacon wrote:
> On Tue, 05 Nov 2024 14:14:23 -0400, Jason Gunthorpe wrote:
> > This is the result of the discussion on removing split. We agreed that
> > split is not required, and no application should ask for anything that
> > would not unmap a full large IOPTE.
> > 
> > Instead of split the two ARM drivers will now WARN_ON and return 0. This
> > is in contrast to what several other drivers do of removing the whole
> > IOPTE and returning 0.
> > 
> > [...]
> 
> Applied to iommu (arm/smmu), thanks!
> 
> [1/3] iommu/io-pgtable-arm: Remove split on unmap behavior
>       https://git.kernel.org/iommu/c/33729a5fc0ca
> [2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap behavior
>       https://git.kernel.org/iommu/c/fd50651636fb
> [3/3] iommu: Add a kdoc to iommu_unmap()
>       https://git.kernel.org/iommu/c/6ac7dffe7cca

Thanks, can you add this hunk to fix the W=1 warning?

--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -820,7 +820,7 @@ static int __init arm_v7s_do_selftests(void)
                .pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M,
        };
        unsigned int iova, size;
-       unsigned int i, loopnr = 0;
+       unsigned int i;
        size_t mapped;
 
        selftest_running = true;
@@ -868,7 +868,6 @@ static int __init arm_v7s_do_selftests(void)
                        return __FAIL(ops);
 
                iova += SZ_16M;
-               loopnr++;
        }
 
        /* Full unmap */


Jason
