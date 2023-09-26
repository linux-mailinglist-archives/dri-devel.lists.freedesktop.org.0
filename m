Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75BD7AF157
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 18:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D19E10E412;
	Tue, 26 Sep 2023 16:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8906210E40F;
 Tue, 26 Sep 2023 16:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695747233; x=1727283233;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=rXxZNbSX5Euwqp+xJs2N68raD/m0MepPtJTP7gxanB8=;
 b=dI2/DAm7JXxxkhp+g+plUuMx+7V7ZaCFusC3n9oe8Foo3UNsEQGRlbw3
 j4tVpY7duPdYCIMLsVv4HLnt/mIy/ytmp0REEPaaUOJaQChCIRr4IbbPj
 ntgP0AFEkeGbuaZ8OP1M+Wbywm/iZHp3h49x7LHgb9dAXVsmgN3v+Yo1e
 OFDes2Fq2IB9r0gjfW/K/bcLBFijWUgtAJdx31Z45o7oqPYLLruPmcZkK
 xIie1ghL4LxxxTzsLw0Qn9N8seqI5dmM2IA8a9FpDPlkl2243SfT2N0Rg
 6wB4jcZ1KVhLR7Ghts0GrA4kLGTdjGR48Bge3azE8OQwrWD9krqI7ZU4R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412530672"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="412530672"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="698538069"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="698538069"
Received: from hhalmen-mobl.ger.corp.intel.com ([10.251.219.207])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 09:53:25 -0700
Date: Tue, 26 Sep 2023 19:53:22 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 05/15] platform/x86/amd/pmf: change debugfs init sequence
In-Reply-To: <20230922175056.244940-6-Shyam-sundar.S-k@amd.com>
Message-ID: <ed71c8b3-b1cd-2efa-1369-8b55ce75eb7f@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-6-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, hdegoede@redhat.com, benjamin.tissoires@redhat.com,
 mario.limonciello@amd.com, linux-input@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

> amd_pmf_dbgfs_register() needs to be called before amd_pmf_init_features().

Please answer to why? question too here.

> Hence change the sequence.
>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 6f36c43e081e..dbfe7c1d6fc4 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -427,9 +427,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
> +	amd_pmf_dbgfs_register(dev);
>  	amd_pmf_init_features(dev);
>  	apmf_install_handler(dev);
> -	amd_pmf_dbgfs_register(dev);
>  
>  	dev_info(dev->dev, "registered PMF device successfully\n");
>  
> 

-- 
 i.

