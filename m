Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07251138651
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8932089E1A;
	Sun, 12 Jan 2020 12:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C9A6EA47;
 Fri, 10 Jan 2020 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fRa0AWajRky2XVf3fbVWPpWSKtLLfakhnhtk3oANo5Y=; b=BVVoA1vpiXxufgxsL4a/LbnYj
 fwc2ITR4+UHXAJ5R/Dli2qVrZH8rdmNrcGSJeUs51tjLHoNhHVTLhkA7Mir6U0P0qINfaA/r31mx3
 cb3i6YEHqUVkK1FOJ4prR0uRfIfIB7Qh/8ML0jYJUBu+xTX2O0OI/qD4qTnwH5vUEoRbt8sYBIZj7
 fUgaI3loPRo+VyUx5RpgnDI3o3ww1vJxDRtvEXm+lbU1ViXr7ijryQTo9VAjkwFZNrQJJ4nUQjZO6
 +90FnOw7NfHw1DOL/n5V9juNdFfKYMHp/novkigOm2fABgs7oVuVTkKk/HO+/p1SXKQZyWlDSypPE
 QYLIM/pMA==;
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipwqk-00083d-LR; Fri, 10 Jan 2020 16:09:26 +0000
Subject: Re: linux-next: Tree for Jan 10 (amdgpu)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20200110190737.65d8881b@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <eb8c8e0a-9fd8-07a3-3596-d57b48b220e0@infradead.org>
Date: Fri, 10 Jan 2020 08:09:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200110190737.65d8881b@canb.auug.org.au>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/20 12:07 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200109:
> 


on i386:

ld: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.o: in function `compute_mst_dsc_configs_for_link':
amdgpu_dm_mst_types.c:(.text+0x784): undefined reference to `__udivdi3'
ld: amdgpu_dm_mst_types.c:(.text+0x7a2): undefined reference to `__udivdi3'
ld: amdgpu_dm_mst_types.c:(.text+0x84a): undefined reference to `__udivdi3'
ld: amdgpu_dm_mst_types.c:(.text+0x868): undefined reference to `__udivdi3'
ld: amdgpu_dm_mst_types.c:(.text+0x8d0): undefined reference to `__udivdi3'
ld: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.o:amdgpu_dm_mst_types.c:(.text+0x8ee): more undefined references to `__udivdi3' follow


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
