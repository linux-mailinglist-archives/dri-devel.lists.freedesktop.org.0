Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B09AFB848
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADD210E173;
	Mon,  7 Jul 2025 16:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3A8A910E173
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:06:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 636FD1BCB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 09:05:55 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 92E193F694
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 09:06:07 -0700 (PDT)
Date: Mon, 7 Jul 2025 17:05:58 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
Message-ID: <aGvwZn_EZNnwtxpZ@e110455-lin.cambridge.arm.com>
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
 <20241101134005.GA109739@nvidia.com>
 <20241104113237.GA11481@willie-the-truck>
 <CAE2F3rDcq-BQYM1yYq6RNSYSOovdoyRcbYw8Jy+BXCHLkrWN3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rDcq-BQYM1yYq6RNSYSOovdoyRcbYw8Jy+BXCHLkrWN3g@mail.gmail.com>
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

On Sat, Jul 05, 2025 at 01:12:09PM -0700, Daniel Mentz wrote:
> With the removal of arm_lpae_split_blk_unmap, I believe the following
> macros are now unused. Is there any interest in removing those as
> well? If so, I can draft a patch.
> 
> #define ARM_LPAE_PTE_ATTR_LO_MASK (((arm_lpae_iopte)0x3ff) << 2)
> /* Ignore the contiguous bit for block splitting */
> #define ARM_LPAE_PTE_ATTR_HI_MASK (ARM_LPAE_PTE_XN | ARM_LPAE_PTE_DBM)
> #define ARM_LPAE_PTE_ATTR_MASK (ARM_LPAE_PTE_ATTR_LO_MASK | \
> ARM_LPAE_PTE_ATTR_HI_MASK)
> #define iopte_prot(pte) ((pte) & ARM_LPAE_PTE_ATTR_MASK)

Yes, I think these can be removed as I cannot find any users.

Thanks for offering to clean it up!

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
