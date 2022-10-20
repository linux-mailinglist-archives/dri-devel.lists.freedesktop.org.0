Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76278606281
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 16:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D351110EACE;
	Thu, 20 Oct 2022 14:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824DC10E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 14:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dMCp05btcuXI/Vfak0Ns1kY73Ihp5xchTPYYZ+OGg34=; b=XEZ8Biow+m57ff3XRSiN+XBAlM
 b7wiEvsr4zNVIIrCLWESrBFQsEArMsDSsApERTbqf97n+Jfs9Dwy4OGX7mKBWideZ/4ZHaviHkIo/
 4Jfh8Wa3Tm9T3zf4jEDa1dcO7izgfr3ZvdySRPVhPya+RpMyUqbR2uWtVh1oSRTPbB+elEQjyVqdH
 /rVbVzbUwvOfc5x3ULxrgdvrppDuTZ51XMEVOmwP8b+8HyEdg+xjui4osAOMFL4eXFKt3Nxd0E8LG
 yYd2ooyFJEtvQOk+/i8G5xtOOrDa/VRlYoLBJenPjocIVPf9nI7oTbfChVgTmwoQLC8O/IQtqyXaZ
 nDW4o4aw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1olWFC-00CQkT-DY; Thu, 20 Oct 2022 14:09:58 +0000
Date: Thu, 20 Oct 2022 15:09:58 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Kwapulinski, Maciej" <maciej.kwapulinski@intel.com>
Subject: Re: [PATCH v4 01/10] gna: add PCI driver module
Message-ID: <Y1FWtqtX7QSafbGt@casper.infradead.org>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
 <20221020133525.1810728-2-maciej.kwapulinski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020133525.1810728-2-maciej.kwapulinski@intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 03:35:16PM +0200, Kwapulinski, Maciej wrote:
> +++ b/drivers/gpu/drm/gna/Kconfig
> @@ -0,0 +1,12 @@
> +#
> +# Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)
> +#
> +
> +config DRM_GNA
> +	tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
> +	depends on X86 && PCI
> +  help

This is mangled; 'help' should be indented by a tab, not two spaces.

