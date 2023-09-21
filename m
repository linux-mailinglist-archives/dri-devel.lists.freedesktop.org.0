Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685717A9392
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E6910E5AA;
	Thu, 21 Sep 2023 10:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D45A10E5AA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 10:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695292203; x=1726828203;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mOKaeD2FiSepumlPU3sDmSYKEn2XxDrBzsroSzZbSRo=;
 b=AemXEa60v+BLk0Dy8wfjWr9NTXv5zLfQ3E+uP0KmT6qQ/gICYHs8+EWt
 O1fk8r2kDmnv5UEQVj9M/Hg++pS5CafzTWVsPxdcbCHlVOO+UY7jKh1PI
 OtujifU44oReQFHIvyVCTARBrrzlZtOs+PHhPbx6+6SNJXxeAmifjrrmG
 007BFrm5XH87GrCyYzMp0RZrYEdH1WSHhMFss6dqLuOWFR370BYbjUiP6
 iz8nluSC1ZY1nRzC39aFHrxplVAazxMYDHMYOnbbmGsi0xCcDxARxwFvC
 XWVpQmvMtEQSAo7034QIZW5kw8IHSh39NekFWGef4phnl0GauaTSIwZk8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379367583"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="379367583"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 03:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696683912"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="696683912"
Received: from idubinov-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.52.72])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 03:29:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ian Ray <ian.ray@ge.com>, peter.senna@gmail.com,
 martyn.welch@collabora.co.uk, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 1/2] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch
 to drm_do_get_edid()
In-Reply-To: <20230921101534.53214-1-ian.ray@ge.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230921101534.53214-1-ian.ray@ge.com>
Date: Thu, 21 Sep 2023 13:29:56 +0300
Message-ID: <87r0mrq0nv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Sep 2023, Ian Ray <ian.ray@ge.com> wrote:
> Migrate away from custom EDID parsing and validity checks.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ian Ray <ian.ray@ge.com>

So this is v2 of [1]. For future reference, people can get really fussy
about preserving authorship. I don't really mind in this case, because
most of the work was actually following through with it, testing, etc.
But maybe add

Co-developed-by: Jani Nikula <jani.nikula@intel.com>

immediately above my Signed-off-by.

Thanks,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/20230901102400.552254-1-jani.nikula@intel.com


> ---
>  .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   | 57 ++++------------------
>  1 file changed, 9 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 460db3c..e93083b 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -65,12 +65,11 @@ struct ge_b850v3_lvds {
>  
>  static struct ge_b850v3_lvds *ge_b850v3_lvds_ptr;
>  
> -static u8 *stdp2690_get_edid(struct i2c_client *client)
> +static int stdp2690_read_block(void *context, u8 *buf, unsigned int block, size_t len)
>  {
> +	struct i2c_client *client = context;
>  	struct i2c_adapter *adapter = client->adapter;
> -	unsigned char start = 0x00;
> -	unsigned int total_size;
> -	u8 *block = kmalloc(EDID_LENGTH, GFP_KERNEL);
> +	unsigned char start = block * EDID_LENGTH;
>  
>  	struct i2c_msg msgs[] = {
>  		{
> @@ -81,53 +80,15 @@ static u8 *stdp2690_get_edid(struct i2c_client *client)
>  		}, {
>  			.addr	= client->addr,
>  			.flags	= I2C_M_RD,
> -			.len	= EDID_LENGTH,
> -			.buf	= block,
> +			.len	= len,
> +			.buf	= buf,
>  		}
>  	};
>  
> -	if (!block)
> -		return NULL;
> +	if (i2c_transfer(adapter, msgs, 2) != 2)
> +		return -1;
>  
> -	if (i2c_transfer(adapter, msgs, 2) != 2) {
> -		DRM_ERROR("Unable to read EDID.\n");
> -		goto err;
> -	}
> -
> -	if (!drm_edid_block_valid(block, 0, false, NULL)) {
> -		DRM_ERROR("Invalid EDID data\n");
> -		goto err;
> -	}
> -
> -	total_size = (block[EDID_EXT_BLOCK_CNT] + 1) * EDID_LENGTH;
> -	if (total_size > EDID_LENGTH) {
> -		kfree(block);
> -		block = kmalloc(total_size, GFP_KERNEL);
> -		if (!block)
> -			return NULL;
> -
> -		/* Yes, read the entire buffer, and do not skip the first
> -		 * EDID_LENGTH bytes.
> -		 */
> -		start = 0x00;
> -		msgs[1].len = total_size;
> -		msgs[1].buf = block;
> -
> -		if (i2c_transfer(adapter, msgs, 2) != 2) {
> -			DRM_ERROR("Unable to read EDID extension blocks.\n");
> -			goto err;
> -		}
> -		if (!drm_edid_block_valid(block, 1, false, NULL)) {
> -			DRM_ERROR("Invalid EDID data\n");
> -			goto err;
> -		}
> -	}
> -
> -	return block;
> -
> -err:
> -	kfree(block);
> -	return NULL;
> +	return 0;
>  }
>  
>  static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
> @@ -137,7 +98,7 @@ static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
>  
>  	client = ge_b850v3_lvds_ptr->stdp2690_i2c;
>  
> -	return (struct edid *)stdp2690_get_edid(client);
> +	return drm_do_get_edid(connector, stdp2690_read_block, client);
>  }
>  
>  static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)

-- 
Jani Nikula, Intel
