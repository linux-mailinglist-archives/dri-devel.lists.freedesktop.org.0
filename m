Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFABA54D98D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 07:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBCD113EDA;
	Thu, 16 Jun 2022 05:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEDA113EDA;
 Thu, 16 Jun 2022 05:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655356271; x=1686892271;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NkEFYvNXfkRiyQzrKr5w73UFu/bNjvCsd8osZsw1FkQ=;
 b=Wq5Wbr5j20sn2CgBp1V83crUtBiroXWV06ScgHoTxBgfvFlPg1mmqNvo
 d3f+NQgHx5zWAC4CdqTiMCTDx7xOQvHoFFm/KDGFCmPynC1YVwz3KPvUf
 QdAFsW9tC314fJSapnN5G/G3oj0OuKYMh9j/iJteIFzKSxD6akjyRzTbZ
 JDa8Wbsj+goGQWRmIEx6cjU6IEUjj+NLY6Rgyz8CRFo1MdIDBdjI4mezm
 +ZAHlhq2PKGlF6lfU37QQVnnuvIFagDR6MY66Zb0QZaH9iEzJvCm+r6EA
 se8ZDauOW1R2JKRcv9JEW7rkDWthcSYE1P2DPWBIGjCq29bw7h4M4uIWS g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="259630621"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="259630621"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 22:11:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="641365226"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.174.230])
 ([10.249.174.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 22:11:05 -0700
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <7a9f0c2d-f1e9-dd2f-6836-26d08bfa45a0@intel.com>
Date: Thu, 16 Jun 2022 13:11:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-parport@lists.infradead.org, kvm list <kvm@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 linux-staging@lists.linux.dev, bpf <bpf@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/26/2022 4:32 PM, Arnd Bergmann wrote:
> On Wed, May 25, 2022 at 11:35 PM kernel test robot <lkp@intel.com> wrote:
>> .__mulsi3.o.cmd: No such file or directory
>> Makefile:686: arch/h8300/Makefile: No such file or directory
>> Makefile:765: arch/h8300/Makefile: No such file or directory
>> arch/Kconfig:10: can't open file "arch/h8300/Kconfig"
> 
> Please stop building h8300  after the asm-generic tree is merged, the
> architecture is getting removed.
> 
>          Arnd
> 

Hi Arnd,

Thanks for the advice, we have stopped building h8300 for new kernel.

Best Regards,
Rong Chen
