Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 495154C01A5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 19:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE69910EAFC;
	Tue, 22 Feb 2022 18:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F8810EAD4;
 Tue, 22 Feb 2022 18:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645555976; x=1677091976;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uMEn3/RL/6dx3e9JgmoY9I85ruMCvWBhcJaWvAtSINE=;
 b=CIr8beof42eYv3xqdCE6FY66DYnkUT22D4iZdkMSzdEvKbH/RuZduYFB
 z/9oVgohVLYPK3JRrJoemnX89jNIumN/rtiWPfUuHNzhrg1MslG+6mV4h
 iIrwWvaVcBYFlpIVV/UP6taFO/uP3DL07NGO6VFD3yFCmWZFX2gHCn1A+
 eA4MELw1RLdzvL7UqPTOjYXdPxsUmRZECm4DyB/WynFbVfWXswq18D4eB
 hI1xv00l4Jo4D7/99S1AC15WIh4Ei9SbMwVZwKA46f4TX6yZS5/qwz94+
 3QyHZkSPF/gBRkaGGGvWkx9HmJIBzxmu+Z+rxHPsqX4hxeH9OfFSz/0+6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="251973590"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="251973590"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 10:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="543042479"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga007.fm.intel.com with SMTP; 22 Feb 2022 10:52:52 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 22 Feb 2022 20:52:51 +0200
Date: Tue, 22 Feb 2022 20:52:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: make a handful of read-only arrays
 static const
Message-ID: <YhUxA5NeTLYOBBWK@intel.com>
References: <20220222120323.86480-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220222120323.86480-1-colin.i.king@gmail.com>
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

On Tue, Feb 22, 2022 at 12:03:23PM +0000, Colin Ian King wrote:
> Don't populate the read-only arrays on the stack but instead make
> them static const. Also makes the object code a little smaller.
> Reformat the statements to clear up checkpatch warning.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
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
> +	static const int ofs_und6[] = {
> +		0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
> +	};
> +	static const int ofs_und8[] = {
> +		2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12
> +	};
> +	static const int ofs_und12[] = {
> +		2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12
> +	};
> +	static const int ofs_und15[] = {
> +		10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12
> +	};

Please shrink to s8 while at it.

>  	int qp_bpc_modifier = (bpc - 8) * 2;
>  	u32 res, buf_i, bpp_i;
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
