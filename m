Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 804176050A8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 21:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A28B10E03B;
	Wed, 19 Oct 2022 19:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2718810E03B;
 Wed, 19 Oct 2022 19:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666208694; x=1697744694;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+3kZlZEGRvtiJVmNgd2rRnMYReb1kwuwBjSaw2ijIhk=;
 b=Z7oI9HS5xof1B1wZlYmrZS3yaO8oBOcVf+AWQhon9rnCKXGNAKJ7vf+j
 3vvXMAMv+Harqxc71teA9Bm8SMy+YHKPy5YzOLa9Gnh46k2eoYtKeDleZ
 qr357A08euCEGg9HwSdwnkwHuZtZ0wuc80jNjWTEcROxYNgGNXmhrrWUD
 iYEaq6PA9DdWzhk25uO0aGkQRw531FjFTNFuvYEv/Fc9E8pPvN6g251BH
 3RRlX0h6bDftT+koP/GvLDijCRPbaQGSGy55PeRV1nbydJveIfMta656k
 TMFfpPM3JECN3EEDxh1FTHbM7uxx9s6ENiuCEsw44AX0iIMJ7QjC16lW9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="306504885"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="306504885"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 12:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="958503047"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="958503047"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga005.fm.intel.com with SMTP; 19 Oct 2022 12:44:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 22:44:50 +0300
Date: Wed, 19 Oct 2022 22:44:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 07/15] drm/edid: split drm_edid block count helper
Message-ID: <Y1BTst482oWCWuaj@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
 <d573b83a4a55f3da6949b2e89c001a74d1932d96.1665496046.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d573b83a4a55f3da6949b2e89c001a74d1932d96.1665496046.git.jani.nikula@intel.com>
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

On Tue, Oct 11, 2022 at 04:49:41PM +0300, Jani Nikula wrote:
> Split the drm_edid block count helper to a base version that reports the
> block count indicated by EDID contents, and another on top that limits
> the block count based on size allocated for the EDID.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 8baa46dc2537..616c1cdc7507 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1613,7 +1613,8 @@ static const void *edid_extension_block_data(const struct edid *edid, int index)
>  	return edid_block_data(edid, index + 1);
>  }
>  
> -static int drm_edid_block_count(const struct drm_edid *drm_edid)
> +/* EDID block count indicated in EDID, may exceed allocated size */
> +static int __drm_edid_block_count(const struct drm_edid *drm_edid)
>  {
>  	int num_blocks;
>  
> @@ -1633,12 +1634,18 @@ static int drm_edid_block_count(const struct drm_edid *drm_edid)
>  			num_blocks = eeodb;
>  	}
>  
> -	/* Limit by allocated size */
> -	num_blocks = min(num_blocks, (int)drm_edid->size / EDID_LENGTH);
> -
>  	return num_blocks;
>  }
>  
> +/* EDID block count, limited by allocated size */
> +static int drm_edid_block_count(const struct drm_edid *drm_edid)
> +{
> +	/* Limit by allocated size */
> +	return min(__drm_edid_block_count(drm_edid),
> +		   (int)drm_edid->size / EDID_LENGTH);
> +}
> +
> +/* EDID extension block count, limited by allocated size */
>  static int drm_edid_extension_block_count(const struct drm_edid *drm_edid)
>  {
>  	return drm_edid_block_count(drm_edid) - 1;
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
