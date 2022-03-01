Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1504C9144
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 18:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F6210E6F0;
	Tue,  1 Mar 2022 17:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F98810E6F0;
 Tue,  1 Mar 2022 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646154892; x=1677690892;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xfA3Q2rNoGikcOpleBBhk8TcVgjijI+nX7d6AMT5f50=;
 b=jyJl5hVibsqZxkkVWbDzPzDH/dOfeRAo5euiKg1bdYMWcZc7dcBfl+Pl
 N0srpjWCPTvPITzojJFPoxOpQDrA2gf4Ajx/7GJ2xRyHs1rQqozoQO8qQ
 +NM2pqcJRkD313U5j1lwXpCWgZkAc66EZJsUiS+Dch46zWcYgvGvwfDWO
 E7Oe89XY3K6K1OdLGFDlSUJ34ARVbg9DDMtuyDBpinIbWGbiB8gNOsbOy
 q1QziYvLQ8EhLl0IGthh7UCiAPfNZSY48TRelkAxzDXLfVYfoiO6harc5
 MvqCM6BFakXYN8OvkvCWW3MtN+RjIBrdKO+OMTbY7VRXNGKhta7E1JZmv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233157674"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="233157674"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 09:14:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="550809589"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 01 Mar 2022 09:14:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Mar 2022 19:14:46 +0200
Date: Tue, 1 Mar 2022 19:14:46 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH][V2] drm/i915: make a handful of read-only arrays static
 const
Message-ID: <Yh5UhnaGMFFM1Nxs@intel.com>
References: <20220223120923.239867-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220223120923.239867-1-colin.i.king@gmail.com>
X-Patchwork-Hint: comment
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 12:09:23PM +0000, Colin Ian King wrote:
> Don't populate the read-only arrays on the stack but instead make
> them static const and signed 8 bit ints. Also makes the object code a
> little smaller.  Reformat the statements to clear up checkpatch warning.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks. Pushed to drm-intel-next.

> ---
> 
> V2: Make arrays signed 8 bit integers as requested by Ville Syrjälä
> 
> ---
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 3faea903b9ae..d49f66237ec3 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -378,10 +378,18 @@ calculate_rc_params(struct rc_parameters *rc,
>  {
>  	int bpc = vdsc_cfg->bits_per_component;
>  	int bpp = vdsc_cfg->bits_per_pixel >> 4;
> -	int ofs_und6[] = { 0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12 };
> -	int ofs_und8[] = { 2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12 };
> -	int ofs_und12[] = { 2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12 };
> -	int ofs_und15[] = { 10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12 };
> +	static const s8 ofs_und6[] = {
> +		0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
> +	};
> +	static const s8 ofs_und8[] = {
> +		2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12
> +	};
> +	static const s8 ofs_und12[] = {
> +		2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12
> +	};
> +	static const s8 ofs_und15[] = {
> +		10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12
> +	};
>  	int qp_bpc_modifier = (bpc - 8) * 2;
>  	u32 res, buf_i, bpp_i;
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
