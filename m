Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0267D81F9EC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 17:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05FA10E0E3;
	Thu, 28 Dec 2023 16:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0920F10E0E3;
 Thu, 28 Dec 2023 16:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703780767; x=1735316767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cquyNjhYzpwCizk15rHvGi0L/xABUbBm6EGekJs4+08=;
 b=W4wAEZlteqYxn20YJa14AdGnGk8CPc5tkC/SBKukVPbu1wFnQt9s9SNc
 5LTWslu/fYDIGdQLQALI+c29OYepTimQc6ASiFYYqBXR/FTqmGu2LZpS7
 QGw3PIO3qBB7wuZM1QuZIoZCr3E60Tufl0AyMLF0cfyarEvgTjUZkp3+p
 Q9SL5ZY+6T6NvDHC8zStpRcoU++Z+kmpY68PBM79XGjIHTx8/Ki8VOjMe
 xsxtao0NtVF6uZV/9eHc0GZMzJ9/pf4zny/QM4Fehlj9Y4eL8zjFNwHIi
 l4bMrHIH1oSY8LSbxxn+Sc2lOpV5subpJvqDu23gB/EWMoSYta8nq4Lqw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="3855078"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="3855078"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 08:26:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="728350199"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; d="scan'208";a="728350199"
Received: from ceyeghel-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.252.50.226])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 08:26:03 -0800
Date: Thu, 28 Dec 2023 17:25:59 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 2/4] drm/i915/gt: reconcile Excess struct member
 kernel-doc warnings
Message-ID: <ZY2hl-8-iucCogQP@ashyti-mobl2.lan>
References: <20231226195432.10891-1-rdunlap@infradead.org>
 <20231226195432.10891-2-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231226195432.10891-2-rdunlap@infradead.org>
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
Cc: intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

...

>  /**
>   * struct intel_gsc - graphics security controller
>   *
> - * @gem_obj: scratch memory GSC operations
> - * @intf : gsc interface
> + * @intf :	gsc interface
> + * @intf.adev :	MEI aux. device for this @intf
> + * @intf.gem_obj : scratch memory GSC operations
> + * @intf.irq :	IRQ for this device (%-1 for no IRQ)
> + * @intf.id :	this interface's id number/index
>   */

I don't really like the tabs here and the space before the ':',
which makes it a bit harder to read. Besides it doesn't look
consistent with the rest of the documentation.

Otherwise, looks good.

Andi
