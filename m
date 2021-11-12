Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A70744EE55
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 22:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2BD6E0D0;
	Fri, 12 Nov 2021 21:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E6B6E0B9;
 Fri, 12 Nov 2021 21:04:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E791961073;
 Fri, 12 Nov 2021 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636751087;
 bh=2qqkfvtrJGfj9ZmJlWd38i/WX7gF70C3dBf8RQ5wumo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nWKXnUDGWsUMLljZWwy6cLNXVB7K6pvM4TVC63shKrCJ5ntl7jiI7TyjgjN/DaUgG
 1tszX3FTcILOCU+Nzwm1U1DTeeCfmc/WUEkmjj0f2OPtZuWxsclChON1UpBvydc0VV
 4NhNTvosABJqwc7rr070zxyPklpS/MA+wM61TaEwbyFSLKlpKflfSgfjzebN7VrtDp
 Olj/uhTTwVazAwg4w2O8yXqbf3mnsbcd++WIU1H6g9zf7z2EhgQoVCfrBTIgSNHU4X
 Tzyg3w+4BNBZsfP4xd3pLcCvxFOtB5vPBNK2VyW4vLOnAv9iFTU+8bLAw0Zw0cp0A5
 kWvXSr6aG3QmA==
Message-ID: <d7c27a98-a2da-17c8-22c3-e13fadbb9a8c@kernel.org>
Date: Fri, 12 Nov 2021 13:04:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/2] Nuke PAGE_KERNEL_IO
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 x86@kernel.org
References: <20211021181511.1533377-1-lucas.demarchi@intel.com>
From: Andy Lutomirski <luto@kernel.org>
In-Reply-To: <20211021181511.1533377-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/21/21 11:15, Lucas De Marchi wrote:
> Last user of PAGE_KERNEL_IO is the i915 driver. While removing it from
> there as we seek to bring the driver to other architectures, Daniel
> suggested that we could finish the cleanup and remove it altogether,
> through the tip tree. So here I'm sending both commits needed for that.
> 
> Lucas De Marchi (2):
>    drm/i915/gem: stop using PAGE_KERNEL_IO
>    x86/mm: nuke PAGE_KERNEL_IO
> 
>   arch/x86/include/asm/fixmap.h             | 2 +-
>   arch/x86/include/asm/pgtable_types.h      | 7 -------
>   arch/x86/mm/ioremap.c                     | 2 +-
>   arch/x86/xen/setup.c                      | 2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 4 ++--
>   include/asm-generic/fixmap.h              | 2 +-
>   6 files changed, 6 insertions(+), 13 deletions(-)
> 

Acked-by: Andy Lutomirski <luto@kernel.org>
