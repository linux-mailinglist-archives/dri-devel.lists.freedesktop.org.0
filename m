Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5573F672196
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6DC89A1F;
	Wed, 18 Jan 2023 15:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A02D89A1F;
 Wed, 18 Jan 2023 15:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674056573; x=1705592573;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aPgeeJWQOnn/wjLQsky7MyljyMC9Wh8woJkejnByg+k=;
 b=U18BJT1jVmYtxAiJS3MyvyOR/9c5QfnnwI0SlwjIocxWI/s46bXLBIZR
 +vmfoUnxN7Kd4sKeOFO3YJNIhC8dWNdwyAcYJoRffGYn/haqVWKwJAAyc
 XffgM7NWtK/sTFvl/Mn3B/zd8ZKbJiYEmCeoWDHNxPDbh8wsckjM+7+Nz
 MmsxB5M01Mo6LBnALCOS79xhaGyZhYmTh3HRSqccT4yQhVOBWku9fPyC2
 iCsCLJP9PAnI3/6Y/o7l+IlGeAvDutA/ovdvZOLYyKNcBqQzCN0mL8mWl
 duzh5BHLuYQmDv2IAgqINYiqxxXHkz57AW+fUgIS4ns7+qc9/Cugw+3jm A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="325065054"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="325065054"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:42:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="690230915"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="690230915"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 18 Jan 2023 07:42:46 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 17:42:46 +0200
Date: Wed, 18 Jan 2023 17:42:46 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 10/22] drm/edid: add helper for HDMI VSDB audio
 latency field length
Message-ID: <Y8gTdsLisZ5byN2d@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <da4293203ef2ddeb0bf66a2bfdbc129ab609c543.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da4293203ef2ddeb0bf66a2bfdbc129ab609c543.1672826282.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 12:05:25PM +0200, Jani Nikula wrote:
> Add a helper for skipping the HDMI VSDB audio latency fields.
> 
> There's a functional change for HDMI VSDB blocks that do not respect the
> spec: "I_Latency_Fields_Present shall be zero if Latency_Fields_Present
> is zero". We assume this to hold when skipping the latency fields, and
> ignore non-zero I_Latency_Fields_Present if Latency_Fields_Present is
> zero.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 847076b29594..93067b8dd9f6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4695,6 +4695,16 @@ static bool hdmi_vsdb_i_latency_present(const u8 *db)
>  	return hdmi_vsdb_latency_present(db) && db[8] & BIT(6);
>  }
>  
> +static int hdmi_vsdb_latency_length(const u8 *db)
> +{
> +	if (hdmi_vsdb_i_latency_present(db))
> +		return 4;
> +	else if (hdmi_vsdb_latency_present(db))
> +		return 2;
> +	else
> +		return 0;
> +}
> +
>  /*
>   * do_hdmi_vsdb_modes - Parse the HDMI Vendor Specific data block
>   * @connector: connector corresponding to the HDMI sink
> @@ -4720,13 +4730,7 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len)
>  	if (!(db[8] & (1 << 5)))
>  		goto out;
>  
> -	/* Latency_Fields_Present */
> -	if (db[8] & (1 << 7))
> -		offset += 2;
> -
> -	/* I_Latency_Fields_Present */
> -	if (db[8] & (1 << 6))
> -		offset += 2;
> +	offset += hdmi_vsdb_latency_length(db);
>  
>  	/* the declared length is not long enough for the 2 first bytes
>  	 * of additional video format capabilities */
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
