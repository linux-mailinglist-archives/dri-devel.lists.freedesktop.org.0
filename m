Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C18D757E01
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 15:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F5F10E35C;
	Tue, 18 Jul 2023 13:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24DE10E356;
 Tue, 18 Jul 2023 13:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689687882; x=1721223882;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3n8B9qKWedav8KUIg0vwbJms/5FjUQE0+xaUtH+4LoE=;
 b=eTsqIinDeQI+Wcr28QNtXK5pTZjnP8JtJNiKQly4E8ho6aeEAaZzNwQG
 PlciYCSXLPpVVdl214LS3VSgxGQGoNspUs+RRiYOzTwZXex+3CogApMu9
 OgZEYTt3NPABURHYbUC40OXhTpswqC6e69HHlJG8auMiMKwI3yuiltLvX
 MELWb8Z9QR3W77CYA8A6JGFmnRoQHVVzi1s/zesSuTSl+Ywfwv565DC9B
 re+9KC3h+cbB0anmjJlcLQ8WBlgJbLG01mGwE6FXsqB9AWBsaRCod0dkH
 Co4Ve38CTNZos1+La1z9yqeWSUWFMIC3eV/2AQpTTLw+mLoEXtJRe38I2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345801308"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="345801308"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="847706952"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="847706952"
Received: from ygaydayc-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.242])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 06:44:31 -0700
Date: Tue, 18 Jul 2023 15:44:22 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v5 1/9] drm-tip: 2023y-07m-17d-16h-04m-53s UTC
 integration manifest
Message-ID: <ZLaXNstC95saShup@ashyti-mobl2.lan>
References: <20230718133836.574781-1-andi.shyti@linux.intel.com>
 <20230718133836.574781-2-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718133836.574781-2-andi.shyti@linux.intel.com>
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry! wrong format-patch :)
Please ignore patch 1.

Andi

On Tue, Jul 18, 2023 at 03:38:28PM +0200, Andi Shyti wrote:
> From: Robert Foss <rfoss@kernel.org>
> 
> ---
>  integration-manifest | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 integration-manifest
> 
> diff --git a/integration-manifest b/integration-manifest
> new file mode 100644
> index 0000000000000..8642016b34817
> --- /dev/null
> +++ b/integration-manifest
> @@ -0,0 +1,24 @@
> +drm drm-fixes 38d88d5e97c9032ebeca092b9372209f2ca92cdf
> +	Merge tag 'amd-drm-fixes-6.5-2023-07-12' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes
> +drm-misc drm-misc-fixes 05abb3be91d8788328231ee02973ab3d47f5e3d2
> +	dma-buf/dma-resv: Stop leaking on krealloc() failure
> +drm-intel drm-intel-fixes fdf0eaf11452d72945af31804e2a1048ee1b574c
> +	Linux 6.5-rc2
> +drm drm-next 6c7f27441d6af776a89147027c6f4a11c0162c64
> +	Merge tag 'drm-misc-next-2023-07-13' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
> +drm-misc drm-misc-next-fixes 59bba51ec2a50e3dc5c3ee80f0a23207346303ff
> +	drm/panel: Fine tune Starry-ili9882t panel HFP and HBP
> +drm-intel drm-intel-next-fixes f6cf3883df471abbcf1553127681dc244c8ff8dd
> +	drm/i915: use mock device info for creating mock device
> +drm-misc drm-misc-next 41639b3a8b0f1f194dfe0577d99db70613f78626
> +	drm/bridge: anx7625: Use common macros for HDCP capabilities
> +drm-intel drm-intel-next c5741c5c1122b7944d9af185c83ab7056153259e
> +	drm/i915/display: Do not use stolen on MTL
> +drm-intel drm-intel-gt-next 8529e3777b7644d41105a06141574a24795f8348
> +	drm/i915/gt: Do not use stolen on MTL
> +drm-intel topic/core-for-CI c0ea2fa0491287dea97b384bec1b5a614408b8e3
> +	drm/i915/gsc: define gsc fw
> +drm-misc topic/i915-ttm 1e3944578b749449bd7fa6bf0bae4c3d3f5f1733
> +	Merge tag 'amd-drm-next-5.16-2021-09-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
> +drm topic/nouveau-misc dfc4005f8c172eea359f9db08c3b2b0ff0153699
> +	drm/nouveau/disp: move DAC load detection method
> -- 
> 2.40.1
