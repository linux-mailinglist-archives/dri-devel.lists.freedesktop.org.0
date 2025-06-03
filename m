Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5F1ACC83B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B4310E619;
	Tue,  3 Jun 2025 13:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="koEjL5HP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E326110E619
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:48:16 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7c59e7039eeso777946885a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748958496; x=1749563296; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0ag2KSfmpizoceiuoj+cZXZUUA1usyi82jYygfJs/Bg=;
 b=koEjL5HPnlF3KURnEFWEECw4UwP0O6o7+ZqiLrshL+PP1LGHP2C65dYjDsuCkwHdNV
 0irIqWxzr3xcYiKKx4jIlq5Rl3hEmPj5Ux70vJ2ZPprmiSGtRjz4fibzcos3A8WFun5R
 N38+yUcRSu6QdFwOwiE1UvW3z4iVUa97Zt/IK5p5DPUNY2ttc4Q41VzhrK3ZmJOedvaH
 sZq0lse1z4qvqewtIay24hCDExLQZxHNF0jNxq5fylhWkxs/zgJhTI7oVjEhFmVvw7hS
 DvcHfhy5HDdtbb2pPdTjzQic8YL/vgjXQ5uVG1PztwuzH1qk18kyEG9TC5qmHLNy+n9n
 V7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748958496; x=1749563296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ag2KSfmpizoceiuoj+cZXZUUA1usyi82jYygfJs/Bg=;
 b=kdz+eL3204PGxvWFSsl7ssD8y+99B+HA7UFFzWBUj2vR2ZPKlvutj5gqlZal3UaWw3
 GaAxdNXcTb2S9DENIN5h1fxuIxSu/L26Wr4HPZcDchO5v0n7xFJlGjVkAO49uzVKmkRc
 XrYGPP/8vYj4o5pZGgZtjrFStbsamipN6hGiCqhvp5Vtq4IrEbQm51Rmx77bB6zB1fY2
 EEYexn6AsJWpNfv9m/6vVT43DXVMNGq65+UcGQs8rgWaVx8OMSnLTg/LFtclCAuyukFh
 KOgb2mpBKZVdLWZ6gVzKO2rm1qIrr+x5HNMWx7BXk9JMVXnyiAGg4Dj1VTo5DhdX5cAz
 HWLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7WOB/sQKUenkgz1lu1iBQnFgeHDDoUGmhdMIFtN9Y7dVtzubsXBilxDK0LQ79KlD9LRg8129HKNY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVE19Jl31LnffMmFFkV0r5vX1jtihZitarCcCR3c+2259P1CmA
 hk6VfV1PmxCVdtkc9fQbn+mEVvUQc9WTqVY3wti1p/QsoED0mlXlNHsp1Osr+3bB0+8=
X-Gm-Gg: ASbGncv4BjsdXg2n2ltHKQBzB12BCMa6ZPOt/5yYSdiOdk+rrKOedxjc8Ud51CBUzLo
 uO6IKPcUYOezgrBjSlrqogZjDMrW2BqJNNNEcHa/gcDwESZZjQPnJGDipY5Pvaeg15WVQMmxBPb
 1T2wiLCqcbgpyRGaZDJd4nJLk7epyDxgoDAfRD2vLna2o6XDY5WddW7Q26zYGItwHk6qJyzIL2p
 tsevUC3V9RAttknEk781AxAN3Nki7SGyd/1Ub6YZNBkHB5HJW2/kzA/AaECe8+0bnF9W+6AZAq3
 eI0L22nx56DcxAPpUtFHpibrDbYB+dmLR47G97i2j0yms7maWrwVSoYIX/M9gvCsXLvXllcFCpY
 x7gPfXbuGe5Opa7UDPBNvJFfL4Ps=
X-Google-Smtp-Source: AGHT+IEC7tetoyd4MWB27Cys7lEZRwLgg/tDNDKGL2nO8t1WlsQDGW4e4zhoToAJp9Wky9F+fr/2kQ==
X-Received: by 2002:a05:620a:290a:b0:7c5:544e:2ccf with SMTP id
 af79cd13be357-7d0a4e57644mr2655730585a.57.1748958495697; 
 Tue, 03 Jun 2025 06:48:15 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a0e3fa9sm838696585a.24.2025.06.03.06.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:48:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMRzy-00000001hBT-2tOq;
 Tue, 03 Jun 2025 10:48:14 -0300
Date: Tue, 3 Jun 2025 10:48:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <20250603134814.GH386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
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

On Thu, May 29, 2025 at 04:32:08PM +1000, Alistair Popple wrote:
> DAX was the only thing that created pmd_devmap and pud_devmap entries
> however it no longer does as DAX pages are now refcounted normally and
> pXd_trans_huge() returns true for those. Therefore checking both pXd_devmap
> and pXd_trans_huge() is redundant and the former can be removed without
> changing behaviour as it will always be false.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  fs/dax.c                   |  5 ++---
>  include/linux/huge_mm.h    | 10 ++++------
>  include/linux/pgtable.h    |  2 +-
>  mm/hmm.c                   |  4 ++--
>  mm/huge_memory.c           | 30 +++++++++---------------------
>  mm/mapping_dirty_helpers.c |  4 ++--
>  mm/memory.c                | 15 ++++++---------
>  mm/migrate_device.c        |  2 +-
>  mm/mprotect.c              |  2 +-
>  mm/mremap.c                |  5 ++---
>  mm/page_vma_mapped.c       |  5 ++---
>  mm/pagewalk.c              |  8 +++-----
>  mm/pgtable-generic.c       |  7 +++----
>  mm/userfaultfd.c           |  4 ++--
>  mm/vmscan.c                |  3 ---
>  15 files changed, 40 insertions(+), 66 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
