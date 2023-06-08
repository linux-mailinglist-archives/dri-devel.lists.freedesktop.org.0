Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0108727B6C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 11:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61F510E061;
	Thu,  8 Jun 2023 09:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721BF10E061
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686216693; x=1717752693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JMt8rb6ddYRdXl6MLi1i9h8w7FO4bvZFiK6fEY2DLE4=;
 b=hfVFgPtOGSAYyGIukl7vigtd7pD6SMZGfaf07c7gkPxKHStkRBdRB+VW
 A6vULakApbiE1jKzoGqVDyc/bocGRDhOgGpL94d+WhSLKhXay0Hvb42Qy
 SvBI/SD/T3muqwTAZGehiMCjKto/EP1i6DGrsxjy4o93TX+4vyMaFo5rQ
 z37cguXpexs3hSzpN6Zid3BlmH/PMH6BSKqnHhqabRjUL9JezRyOgHp5m
 lZUkkzkM/YecNYUQmvFK2PtSFBuycu3Kf/0W/30//z6o3uEgXYhQtyQUd
 YRb3WmQPwDuuqce+2EXjDQyNHah995l56VTjy2zJBZz6H/K7iR9IwmPK/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337617609"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="337617609"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 02:31:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739638211"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="739638211"
Received: from operepel-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.58.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 02:31:30 -0700
Date: Thu, 8 Jun 2023 11:31:22 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v2] drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO
Message-ID: <ZIGf6mKwX9RIm5a5@ashyti-mobl2.lan>
References: <20230608024207.581401-1-suijingfeng@loongson.cn>
 <ZIGAEZTJvq1GqFVD@aptenodytes>
 <aff664c7-b692-4fcf-ad61-8030cc648501@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aff664c7-b692-4fcf-ad61-8030cc648501@loongson.cn>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jingfeng,

On Thu, Jun 08, 2023 at 03:24:54PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> thanks a lot
> 
> On 2023/6/8 15:15, Paul Kocialkowski wrote:
> > Hi,
> > 
> > On Thu 08 Jun 23, 10:42, Sui Jingfeng wrote:
> > > drm/logicvc driver is depend on REGMAP and REGMAP_MMIO, should select this
> > > two kconfig option, otherwise the driver failed to compile on platform
> > > without REGMAP_MMIO selected:
> > > 
> > > ERROR: modpost: "__devm_regmap_init_mmio_clk" [drivers/gpu/drm/logicvc/logicvc-drm.ko] undefined!
> > > make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
> > > make: *** [Makefile:1978: modpost] Error 2
> > > 
> > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > Thanks for the fix, looks good to me!
> > 
> > Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> 
> After received this Acked-by, do a need append this tag to the patch, and
> resend this again?
> 
> I don't know about this.
> 
> I don't need to do anythings ales, you will push it to your repository,
> right?

no need... someone will pick it up and add the needed tags.

Andi
