Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413364EDC2B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD7C10F1D9;
	Thu, 31 Mar 2022 14:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181EF10F1D9;
 Thu, 31 Mar 2022 14:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648738520; x=1680274520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UXlYwExRivydv644XUAK9KOf5/d0W5VFUzlg3Wlp0Os=;
 b=Ko0XOw/d1M6hqR72FtdvJ8V5mrMDk/ONpE4zFzScojIkd2qkWv1UDw/j
 BWSzcopaK/8COa9qi72rVYllLFEBnK3fySAC2ek/YU6fQvTXGgOzrYlc6
 6CEJcd0b+/ikgvug7SFTv4G2e9UuBMDPxI+HP8UGPJ2Sybf29po041Akl
 2Q8Wg2xa9ugwUUu681oVhDySJp2RjP1ybEuUANzEGqAf72KIonmBE+wuo
 tnTEC8yCrPVcQCIN/+zQ7dF7NnMxBtNtWuXKpEXvtlXFjoxCaAzNF0B5G
 gqds6xcD+iGTh0DQ3+AaKekyAX2A3CBRO7Ws1PinNgJDO2zZq6ripStDs Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284776438"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="284776438"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:55:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="640161088"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by FMSMGA003.fm.intel.com with SMTP; 31 Mar 2022 07:55:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 31 Mar 2022 17:55:16 +0300
Date: Thu, 31 Mar 2022 17:55:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 08/12] drm/edid: use a better variable name for EDID
 block read retries
Message-ID: <YkXA1CmIpW/DnRsy@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
 <5debef4cc1415504067e4fd69cd7be96f7077e06.1648578814.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5debef4cc1415504067e4fd69cd7be96f7077e06.1648578814.git.jani.nikula@intel.com>
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

On Tue, Mar 29, 2022 at 09:42:15PM +0300, Jani Nikula wrote:
> Just i is a bit terse, clarify what it's about.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 04eb6949c9c8..235d3cde2e97 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1971,25 +1971,25 @@ static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
>  	int *null_edid_counter = connector ? &connector->null_edid_counter : NULL;
>  	bool *edid_corrupt = connector ? &connector->edid_corrupt : NULL;
>  	void *edid;
> -	int i;
> +	int try;
>  
>  	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
>  	if (edid == NULL)
>  		return NULL;
>  
>  	/* base block fetch */
> -	for (i = 0; i < 4; i++) {
> +	for (try = 0; try < 4; try++) {
>  		if (get_edid_block(data, edid, 0, EDID_LENGTH))
>  			goto out;
>  		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
>  			break;
> -		if (i == 0 && edid_is_zero(edid, EDID_LENGTH)) {
> +		if (try == 0 && edid_is_zero(edid, EDID_LENGTH)) {
>  			if (null_edid_counter)
>  				(*null_edid_counter)++;
>  			goto carp;
>  		}
>  	}
> -	if (i == 4)
> +	if (try == 4)
>  		goto carp;
>  
>  	return edid;
> @@ -2027,7 +2027,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  			      size_t len),
>  	void *data)
>  {
> -	int i, j = 0, valid_extensions = 0;
> +	int j, valid_extensions = 0;
>  	struct edid *edid, *new, *override;
>  
>  	override = drm_get_override_edid(connector);
> @@ -2050,20 +2050,22 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
>  
>  	for (j = 1; j <= edid->extensions; j++) {
>  		void *block = edid + j;
> +		int try;
>  
> -		for (i = 0; i < 4; i++) {
> +		for (try = 0; try < 4; try++) {
>  			if (get_edid_block(data, block, j, EDID_LENGTH))
>  				goto out;
>  			if (drm_edid_block_valid(block, j, false, NULL))
>  				break;
>  		}
>  
> -		if (i == 4)
> +		if (try == 4)
>  			valid_extensions--;
>  	}
>  
>  	if (valid_extensions != edid->extensions) {
>  		struct edid *base;
> +		int i;
>  
>  		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
>  
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
