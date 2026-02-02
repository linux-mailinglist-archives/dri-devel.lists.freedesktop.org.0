Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHf3HJuygGn6AQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:20:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCCFCD40E
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3820910E126;
	Mon,  2 Feb 2026 14:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPZAouyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3118710E126
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 14:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770042006; x=1801578006;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7Zk2/+ALQDpLjYlCJjdXjZ9wk55AmI9c8QAVd3aYHDA=;
 b=IPZAouyFetTEUBf1g8TndqJ7E9ImcLIfEWiQu0XQldDD253JrhrV85pp
 5mYuvCBA2gPc84BtlAn+g77ZSHJy/RjoE/cE77tdqi7NcD+QXMNWHH7Ls
 IBLSKIEymZYora47PDgt+y+l7sez/cFJFIuj7yntmcxjNaN1Jigv3T56T
 ah1BcWpv1tHEa2iKle2xYLeDrJDxf2I4aEV0NrOAhmBzKI4SxwN9HBKAo
 FQa7t7iitrEdvSFJ+9x+Lb5YXFLu4oGarN66d7HdLEq2rYI2MxpmF8tP0
 PlsK9ngoEtvTxCeqDF4zO7vked07TFipImbixIM0QLlUncKG0ihzCmODh w==;
X-CSE-ConnectionGUID: S2ZozceORASm23N1SOw2wQ==
X-CSE-MsgGUID: abtEWU/jROKqPIzvSpPlQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75055378"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="75055378"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 06:20:05 -0800
X-CSE-ConnectionGUID: tNdXWA11TjyZLJ0/aDfrQw==
X-CSE-MsgGUID: Uv9w7Q2DTa6zJ2HJ55Uxng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="240213640"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.153])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 06:20:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nilesh Laad <nilesh.laad@oss.qualcomm.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, Jessica Zhang <jesszhan0024@gmail.com>,
 Ravi Agola <raviagol@qti.qualcomm.com>, Nilesh Laad
 <nilesh.laad@oss.qualcomm.com>
Subject: Re: [PATCH] drm/bridge: lt9611uxc: Increase EDID_NUM_BLOCKS from 2
 to 4 for extended EDID support
In-Reply-To: <20260202-extend-edid-support-v1-1-1355a21479b7@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260202-extend-edid-support-v1-1-1355a21479b7@oss.qualcomm.com>
Date: Mon, 02 Feb 2026 16:19:57 +0200
Message-ID: <ac8d2aec65611f57f0cb8d5f11cc774cfdec6bdc@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nilesh.laad@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:venkata.valluru@oss.qualcomm.com,m:jesszhan0024@gmail.com,m:raviagol@qti.qualcomm.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,gmail.com,qti.qualcomm.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: BDCCFCD40E
X-Rspamd-Action: no action

On Mon, 02 Feb 2026, Nilesh Laad <nilesh.laad@oss.qualcomm.com> wrote:
> From: Ravi Agola <raviagol@qti.qualcomm.com>
>
> The lt9611uxc driver previously limited EDID reading to 2 blocks, which
> restricted support for displays that provide more than two EDID blocks.
> This change enables the driver to read and pass up to 4 EDID blocks from
> the LT9611UXC to drm_edid calls.
> As a result, the driver now supports displays with up to 4 EDID block.
>
> Signed-off-by: Ravi Agola <raviagol@qti.qualcomm.com>
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 93 ++++++++++++++++++++++++++----
>  1 file changed, 82 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 4d989381904c..7fe481c7acf8 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -28,7 +28,7 @@
>  #include <drm/display/drm_hdmi_audio_helper.h>
>  
>  #define EDID_BLOCK_SIZE	128
> -#define EDID_NUM_BLOCKS	2
> +#define EDID_NUM_BLOCKS	4
>  
>  #define FW_FILE "lt9611uxc_fw.bin"
>  
> @@ -61,6 +61,11 @@ struct lt9611uxc {
>  	/* can be accessed from different threads, so protect this with ocm_lock */
>  	bool hdmi_connected;
>  	uint8_t fw_version;
> +
> +	bool edid_available;
> +	unsigned int num_edid_blocks;
> +	uint8_t edid_raw[EDID_BLOCK_SIZE * EDID_NUM_BLOCKS];
> +
>  };
>  
>  #define LT9611_PAGE_CONTROL	0xff
> @@ -170,8 +175,12 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
>  	connected = lt9611uxc->hdmi_connected;
>  	mutex_unlock(&lt9611uxc->ocm_lock);
>  
> -	if (!connected)
> +	if (!connected) {
>  		lt9611uxc->edid_read = false;
> +		lt9611uxc->edid_available = false;
> +		lt9611uxc->num_edid_blocks = 0;
> +		memset(lt9611uxc->edid_raw, 0, EDID_BLOCK_SIZE * EDID_NUM_BLOCKS);
> +	}
>  
>  	drm_bridge_hpd_notify(&lt9611uxc->bridge,
>  			      connected ?
> @@ -387,10 +396,32 @@ static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
>  			msecs_to_jiffies(500));
>  }
>  
> +static int lt9611uxc_read_edid_block(struct lt9611uxc *lt9611uxc, unsigned int block)
> +{
> +	int ret;
> +
> +	lt9611uxc_lock(lt9611uxc);
> +
> +	regmap_write(lt9611uxc->regmap, 0xb00a, (block%2) * EDID_BLOCK_SIZE);
> +
> +	ret = regmap_noinc_read(lt9611uxc->regmap, 0xb0b0,
> +			&lt9611uxc->edid_raw[block*EDID_BLOCK_SIZE], EDID_BLOCK_SIZE);
> +	if (ret) {
> +		dev_err(lt9611uxc->dev, "edid block %d read failed: %d\n", block, ret);
> +		lt9611uxc_unlock(lt9611uxc);
> +		return -EINVAL;
> +	}
> +	lt9611uxc_unlock(lt9611uxc);
> +
> +	return ret;
> +}
> +
>  static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>  {
>  	struct lt9611uxc *lt9611uxc = data;
> -	int ret;
> +	int ret = 0;
> +	int retry_cnt = 10;
> +	int edid_ext_block;
>  
>  	if (len > EDID_BLOCK_SIZE)
>  		return -EINVAL;
> @@ -398,19 +429,59 @@ static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, siz
>  	if (block >= EDID_NUM_BLOCKS)
>  		return -EINVAL;
>  
> -	lt9611uxc_lock(lt9611uxc);
> +	/*
> +	 * if edid is read once, provide same edid data till next hpd event
> +	 */

If you want caching, you should cache the result of
drm_edid_read_custom() at lt9611uxc_bridge_edid_read(). I don't see the
point of having a separate array for this.

Please just try to provide a mechanism to read one block for
drm_edid_read_custom() instead of adding completely separate logic and
then memcpying that.

> +	if (lt9611uxc->edid_available && (block < lt9611uxc->num_edid_blocks))
> +		memcpy(buf, &lt9611uxc->edid_raw[EDID_BLOCK_SIZE*block], EDID_BLOCK_SIZE);

While it is true that drm_edid.c *currently* only passes EDID_BLOCK_SIZE
for len, it's bad form to not respect the passed in len parameter.

BR,
Jani.

> +	else {
> +		/*
> +		 * read number of block available in edid data
> +		 */
> +		if (block == 0) {
> +			lt9611uxc_lock(lt9611uxc);
> +			ret = regmap_read(lt9611uxc->regmap, 0xb02a, &edid_ext_block);
> +			if (ret)
> +				dev_err(lt9611uxc->dev, "edid block read failed: %d\n", ret);
> +			else
> +				lt9611uxc->num_edid_blocks = edid_ext_block & 0x7;
> +			lt9611uxc_unlock(lt9611uxc);
> +		}
>  
> -	regmap_write(lt9611uxc->regmap, 0xb00b, 0x10);
> +		/* read edid block */
> +		ret = lt9611uxc_read_edid_block(lt9611uxc, block);
> +
> +		/* compare first 4 bytes of 0th and 2nd block to confirm
> +		 * that 2nd edid block data is read successfully by lt9611uxc
> +		 */
> +		while ((block == 2) && 0 == memcmp(&lt9611uxc->edid_raw[block*EDID_BLOCK_SIZE],
> +				&lt9611uxc->edid_raw[(block%2)*EDID_BLOCK_SIZE], 4)
> +						&& retry_cnt-- > 0) {
> +			msleep(100);
> +			ret = lt9611uxc_read_edid_block(lt9611uxc, block);
> +		}
>  
> -	regmap_write(lt9611uxc->regmap, 0xb00a, block * EDID_BLOCK_SIZE);
> +		/* if more than 2 edid block are available, reset edid ready
> +		 * flag once 0th and 1st edid block read is completed
> +		 * so lt9611uxc read 2nd and 3rd block
> +		 */
> +		if (block == 1 && lt9611uxc->num_edid_blocks > 2) {
> +			lt9611uxc_lock(lt9611uxc);
> +			regmap_write(lt9611uxc->regmap, 0xb02a, (edid_ext_block & (~BIT(3))));
> +			lt9611uxc_unlock(lt9611uxc);
> +			msleep(100);
> +		}
>  
> -	ret = regmap_noinc_read(lt9611uxc->regmap, 0xb0b0, buf, len);
> -	if (ret)
> -		dev_err(lt9611uxc->dev, "edid read failed: %d\n", ret);
> +		/* set edid available to true once all edid blocks read successfully */
> +		if (block == (lt9611uxc->num_edid_blocks-1) && ret == 0)
> +			lt9611uxc->edid_available = true;
>  
> -	lt9611uxc_unlock(lt9611uxc);
> +		/* copy edid block data into buffer */
> +		if (ret == 0)
> +			memcpy(buf, &lt9611uxc->edid_raw[EDID_BLOCK_SIZE*block], EDID_BLOCK_SIZE);
> +	}
>  
> -	return 0;
> +	return ret;
>  };
>  
>  static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *bridge,
>
> ---
> base-commit: 3ea699b56d31c2a5140d9fac309ff5e0f2041411
> change-id: 20260202-extend-edid-support-b5a4f76d1832
> prerequisite-message-id: 20260202-lt9611uxc-reset-edid-v2-1-b1e1d72edc90@oss.qualcomm.com
> prerequisite-patch-id: bbe63ef7dc85903a286cefd9aa09f1e2e96351b1
>
> Best regards,
> --  
> Nilesh Laad <nilesh.laad@oss.qualcomm.com>
>

-- 
Jani Nikula, Intel
