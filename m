Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F85A6E6C5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 23:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176BB10E1D3;
	Mon, 24 Mar 2025 22:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="iZhstfqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6BA10E170;
 Mon, 24 Mar 2025 22:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=8ZmTbketZ54QzeXCl26c7EEbeq37wz1sgZSmUcG15uI=; b=iZhstfqnCuvnLFoT9bPcLs3/u6
 ut/w2MtVGTo0F6T/umLB/1+ZIGMm93mM5OZeh/ttjOBtBDDftP8Jc+rguMdeKV5Xz8nJiUjMDdpvt
 wB43MG5f/xdjYGjrdSdwRUr4QVjECpYR+bLTjiaZJ4SDU9KdfU2pmsXsI0a57ovJE1O82dHAZj6Ya
 hdrn34MROSl/vvQEMajxxMXm4rQ07pSQgBdEvGwtWNF/vh1X8/AqYkedvof6pTCAQujVYRs4v40vz
 5cx1bPMBQ5VPBNNiTi+iCjK4CWFqmEa/COK4s7tMuYLvqmIMrj2kkfyFkoqPFIhQM9/eBSV7sRPU0
 6X6GBUcg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1twqZC-00000005Jfx-1c0u; Mon, 24 Mar 2025 22:46:47 +0000
Message-ID: <90eb07a0-1490-40af-9858-d357b922bbb8@infradead.org>
Date: Mon, 24 Mar 2025 15:46:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Mar 24 (drm/xe/xe_migrate)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250324230122.106602ef@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250324230122.106602ef@canb.auug.org.au>
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



On 3/24/25 5:01 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250321:
> 

on i386:

linux-next-20250324/X32/drivers/gpu/drm/xe/xe_migrate.c:1561:(.text+0x3074): undefined reference to `__udivdi3'


-- 
~Randy

