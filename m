Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8B96A3EA5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 10:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B313310E39C;
	Mon, 27 Feb 2023 09:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11F410E39A;
 Mon, 27 Feb 2023 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677491596; x=1709027596;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dwUo3BFORgMJVeDfksL8jP7HkkuWEuVDbhgyCpyAFqs=;
 b=XiETXY2S2vPWGu9yDgaMGervupGgpNAWSnf2uSqMAHhwMJJL+zL/QsN2
 E7PMdb4TlNTzlZY5bCYQLkg3plUcz/9Wm8Z6h0W3T6Gkz/KBlUNhMg5mG
 iGxsJFULGkbNS3ee+lVGpI8OvkAIug+PHTZVCUh8n+Zs0a5iqZFItgFk6
 RhBSWw1Z5cUvjIQDd/EjeTZdl3SI2ZkHpxVUI4cLF25wC6C/ciJpIJRH3
 WVVvjqJuEo7Ne1DGMHjThUSQ644fO09YGnHNm9i0KMg7GycktKHBzTxwc
 dBkJVjchVfVnpXkdIxK8Jpdnp68mCta/TBVx9zhsJRapClhcz6j8iunkU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="336101817"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="336101817"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:53:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="847756370"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="847756370"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.41.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 01:53:07 -0800
Date: Mon, 27 Feb 2023 10:53:03 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 1/7] arch: rename all internal names
 __xchg to __arch_xchg
Message-ID: <Y/x9fxS1cFsa1ylP@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-1-andrzej.hajda@intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-snps-arc@lists.infradead.org,
 Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@rivosinc.com>, loongarch@lists.linux.dev,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Wed, Jan 18, 2023 at 04:44:44PM +0100, Andrzej Hajda wrote:
> __xchg will be used for non-atomic xchg macro.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> [m68k]
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com> [riscv]

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
