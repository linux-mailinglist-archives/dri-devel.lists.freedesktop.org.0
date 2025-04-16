Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B24A90D97
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 23:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A956710E9C6;
	Wed, 16 Apr 2025 21:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="TGDrdZtT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D7F10E9C6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=0w/kAowjf0/Esq+S+Hnq1h5rUl1XdtQLJLWBVSHPLM8=; b=TGDrdZtT/VWa6Xyi/HuKS9l/Pl
 v6Psom7YrVEpb0Rr6FjeBCWHxAakFtXGaI+KGzZe0+yDv3YAbyp7ZUHxi0V8m/nk62QxxJrggoWxB
 o62/EWlVajMOsw2jNCbZukel14eD1H4qP5IVOSE1GzhhEMDDEzTRexoRAES0Y5o6ygj3xnmek+Oj5
 jrGPVZb2NWEma4AzXZogX+44IcVsB+espRdoQdCDlO46yDdp/URo85RYdlAV3m9OzKsNCWv6y5Z6j
 VqsfFZp4CMqNPnlyDWkbTbnoEdZMSdSboBbKsdavsyqBZNCAe8KkMHm+pGE9iFq2uQy23nnN5CHdY
 ZF3gIRnA==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
 id 1u59zj-0000000AAtw-087K; Wed, 16 Apr 2025 21:08:32 +0000
Message-ID: <c8dd5ca0-4bb1-413e-81f2-4dff1cf0fafe@infradead.org>
Date: Wed, 16 Apr 2025 14:08:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 16 [drivers/gpu/drm/ttm/ttm.ko]
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250416162556.3191a75e@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250416162556.3191a75e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/15/25 11:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next releases this coming Friday or Monday
> or next Friday.
> 
> Changes since 20250415:

on x86_64:
# CONFIG_SHMEM is not set
CONFIG_DRM_TTM=m


ERROR: modpost: "shmem_writeout" [drivers/gpu/drm/ttm/ttm.ko] undefined!


-- 
~Randy

