Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED42EACC846
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555BE10E5F6;
	Tue,  3 Jun 2025 13:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZwYIWN93";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8590010E5F6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:49:07 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4a4323fe8caso36973451cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 06:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1748958546; x=1749563346; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=;
 b=ZwYIWN93FtWwL1rQobyyFhfMSm4Ck76HMBp46Glv1mUk/0S0jlHDwr/3vocFVB7NeK
 xtgukd9bvkQXNQVl1ecTKMpyuVDnES/2+i4wkiAclla7XUCNCxuflh3aWG3idNs/VeDr
 n6RJNmPagv8N4fmyHAjtdQ88OIyozvaMKQ+WOHL9onJUMI98Yd36shpOFyZUBrJeGrYq
 6LABvEkpLB9ijFbrmL3duZUEGhtHp1qD23zzluimDP9oOq5NzfPWYGw154JRflgO854A
 lQTbixlrINGG8o4wH0GsU2FolC40gi03yE4qpKksAGYUUkqm7lMN2US+Re2j+AsVWStZ
 c5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748958546; x=1749563346;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=;
 b=TArQSX2cwdpbACmA3RXcWbxo3YqAWsWucF/UcVFJ+Uq3vHEDlqU9lmSmGgKXe1twxp
 6Mq0+gW6BNwLPsSSvTKrABQ7bKhLRgk4viV/PbtKnTvfjQbmfKmqDieRXXzjecUVPYBA
 NQsoPNlSBgDrj8bwL0sjuNoSP/tTYWBW7E9a3guNsxntleQyAuTNJiMoSu/1eMfKIkNW
 di80Y+Qg/5x+kgmUncEgRVN/Jr7oAVDbDZ82cgbybOfLmIvnE+mANHr9uAIIqD8v2TtF
 +cEKa1X4yFPdAOsSk5rRVt2Ugkm8iPsn1q7d3FZw6Ae9E18Kxnjy/Q/qxNF4c/qXnGyk
 Pnbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRlPdgSnmN0WPRqH2z3FDWnsSwnbLzJ05BKrPb/WceHcWLGIVQQj34RyJSZ14kbqnr1kaVdTiTY1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/aCz+WLKFasRMWIbw3Ym6v3364jRvPybfS/PkuuckMlgjVJ/7
 RkYN6HqdhsIGwm8LQmryjvdu4trSaFitJDCMcjN0EgyT8YRPq68Pqzynnz/GlYV/Bt8=
X-Gm-Gg: ASbGncvNTIghlaQcwUOAWFiGlamI7Eo1mcQIZ84KhKpy7WopbjmHORmqY5D6235Z17/
 cUaYTaO6X3bzToCFxqNaq2jyKok/qZMtLyInITw4Qrfx9dbat9uZncOsdWj5exRviM4T7EDKDBR
 ssO2oYF1oO/zuDjaNtl1oLPCUEQmR2XC1vGQrKZS2meHc7ymW3kZk8sfO8jGkX5va8SSPB/fB4w
 GSXmc4XleRXLTI0/GBechM6DaUv/hUpHD7dmn9w+6mhWREcVDCUznBqdXkO+pAXdcjhRLuSMQY7
 CKg+bESGU/S2k8saqcKwSu07H5Uk/BEKgu3LtXPr7AQjAOz8sS65rOmA+zQx5G7JNA4SQSFoKoc
 3Ep/x2dblgs0lSsQRAaDvxVxR4yA=
X-Google-Smtp-Source: AGHT+IGIU1g+493Q79vIGhbP57BxcXzG4cORozjsE0WNUaw+m77zFEPhKIIEfe6WhON7WEL1UbHK4w==
X-Received: by 2002:a05:622a:5a98:b0:494:b914:d140 with SMTP id
 d75a77b69052e-4a4aed8a697mr209908281cf.43.1748958546430; 
 Tue, 03 Jun 2025 06:49:06 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a435772a19sm74189111cf.1.2025.06.03.06.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 06:49:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uMS0n-00000001hCF-1wNL;
 Tue, 03 Jun 2025 10:49:05 -0300
Date: Tue, 3 Jun 2025 10:49:05 -0300
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
Subject: Re: [PATCH 09/12] powerpc: Remove checks for devmap pages and
 PMDs/PUDs
Message-ID: <20250603134905.GJ386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <b837a9191e296e0b9f4e431979bab1f6616beab6.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b837a9191e296e0b9f4e431979bab1f6616beab6.1748500293.git-series.apopple@nvidia.com>
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

On Thu, May 29, 2025 at 04:32:10PM +1000, Alistair Popple wrote:
> PFN_DEV no longer exists. This means no devmap PMDs or PUDs will be
> created, so checking for them is redundant. Instead mappings of pages that
> would have previously returned true for pXd_devmap() will return true for
> pXd_trans_huge()
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  arch/powerpc/mm/book3s64/hash_hugepage.c |  2 +-
>  arch/powerpc/mm/book3s64/hash_pgtable.c  |  3 +--
>  arch/powerpc/mm/book3s64/hugetlbpage.c   |  2 +-
>  arch/powerpc/mm/book3s64/pgtable.c       | 10 ++++------
>  arch/powerpc/mm/book3s64/radix_pgtable.c |  5 ++---
>  arch/powerpc/mm/pgtable.c                |  2 +-
>  6 files changed, 10 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
