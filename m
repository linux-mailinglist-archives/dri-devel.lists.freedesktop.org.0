Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0F0A03D54
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 12:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367BE8912D;
	Tue,  7 Jan 2025 11:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lND9oi4X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6612210E3F4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 11:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736248328; x=1767784328;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hT7bkN+E5xxsLEPSPqZgK9sCRWJzPwxKxpoe9TmSC3E=;
 b=lND9oi4XQha7SSTNpKEo0xd7gq4vAeeyNosPw/6wCdp6DHb+gYJJIxNd
 f4eO0qO+vd6vSS3INSTOxUot6Q6VzYqkD76317sOj6x/Dy1L95Uf8lWie
 zxZKBlV+ZSYULPwqdcErZkJdGWRPrltlPLEKqjaSSPN96LD1boVJrHWbo
 LcpNNVWlau1WMQB7BVIG9pSLstFC8jBExXHyYo+777M6IzLA0g9fgFLBn
 uLYsdxkSery3g2qKvr4+/b+S4tLENTMKTSHSF8tC8N1ane9G/Rl7ndAj+
 YfK4YYuqIkoYCWg5p9Nv3KTjvhXfLlHMQAd+vgecaQqYyw7xDynle/GG3 A==;
X-CSE-ConnectionGUID: 7wwqbQooT5eB0GJwDTxRUg==
X-CSE-MsgGUID: thzcDjgsSri2yHXqhxXvoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36646261"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36646261"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 03:12:06 -0800
X-CSE-ConnectionGUID: nXd5xfL7R2m/Y5gbe8x5NQ==
X-CSE-MsgGUID: DKSYkrNXSRO7Mvz/w0N/pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102609320"
Received: from derekcam-mobl.ger.corp.intel.com (HELO [10.245.83.121])
 ([10.245.83.121])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 03:12:02 -0800
Message-ID: <0037bef6-18f1-4eca-80be-29be6cb603b6@linux.intel.com>
Date: Tue, 7 Jan 2025 12:12:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] bus: mhi: host: Add a policy to enable image transfer
 via BHIe in PBL
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com,
 manivannan.sadhasivam@linaro.org, quic_yabdulra@quicinc.com,
 quic_mattleun@quicinc.com, quic_thanson@quicinc.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-3-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241213213340.2551697-3-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 12/13/2024 10:33 PM, Jeffrey Hugo wrote:
> From: Matthew Leung <quic_mattleun@quicinc.com>
> 
> Currently, mhi host only performs firmware transfer via BHI in PBL and
> BHIe from SBL. To support BHIe transfer directly from PBL, a policy
> needs to be added.
> 
> With this policy, BHIe will be used to transfer firmware in PBL if the
> mhi controller has bhie regs, sets seg_len, and does not set
> fbc_download. The intention is to transfer firmware using BHIe in PBL
> without further BHIe transfers in SBL.
> 
> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/bus/mhi/host/boot.c     | 80 +++++++++++++++++++++++++++------
>  drivers/bus/mhi/host/init.c     |  2 +-
>  drivers/bus/mhi/host/internal.h |  8 ++++
>  3 files changed, 75 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index e3f3c07166ad..c9ecb6427209 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -452,12 +452,62 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>  	}
>  }
>  
> +static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *mhi_cntrl)
> +{
> +	enum mhi_fw_load_type ret = MHI_FW_LOAD_UNKNOWN;
> +
> +	if (mhi_cntrl->fbc_download) {
> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)
> +			ret = MHI_FW_LOAD_FBC;
> +	} else {
> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)
> +			ret = MHI_FW_LOAD_BHIE;
> +		else
> +			ret = MHI_FW_LOAD_BHI;
> +	}
> +	return ret;
> +}
> +
> +static int mhi_send_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
> +{
> +	struct image_info *image;
> +	int ret;
> +
> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +	if (ret)
> +		return ret;
> +
> +	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
> +
> +	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
> +	mhi_free_bhi_buffer(mhi_cntrl, image);
> +
> +	return ret;
> +}
> +
> +static int mhi_send_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
> +{
> +	struct image_info *image;
> +	int ret;
> +
> +	ret = mhi_alloc_bhie_table(mhi_cntrl, &image, size);
> +	if (ret)
> +		return ret;
> +
> +	mhi_firmware_copy_bhie(mhi_cntrl, fw_data, size, image);
> +
> +	ret = mhi_fw_load_bhie(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
> +	mhi_free_bhie_table(mhi_cntrl, image);
> +
> +	return ret;
> +}
> +
>  void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  {
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	enum mhi_fw_load_type fw_load_type;
>  	enum mhi_pm_state new_state;
> -	struct image_info *image;
>  	const char *fw_name;
>  	const u8 *fw_data;
>  	size_t size, fw_sz;
> @@ -481,6 +531,12 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	fw_name = (mhi_cntrl->ee == MHI_EE_EDL) ?
>  		mhi_cntrl->edl_image : mhi_cntrl->fw_image;
>  
> +	fw_load_type = mhi_fw_load_type_get(mhi_cntrl);
> +	if (fw_load_type == MHI_FW_LOAD_UNKNOWN) {
> +		dev_err(dev, "Cannot load FW as load type is UNKNOWN\n");
> +		return;
> +	}
> +
>  	/* check if the driver has already provided the firmware data */
>  	if (!fw_name && mhi_cntrl->fbc_download &&
>  	    mhi_cntrl->fw_data && mhi_cntrl->fw_sz) {
> @@ -518,20 +574,16 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	fw_sz = firmware->size;
>  
>  skip_req_fw:
> -	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> -	if (ret) {
> -		release_firmware(firmware);
> -		goto error_fw_load;
> -	}
> -	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
> -
> -	/* Download image using BHI */
> -	ret = mhi_fw_load_bhi(mhi_cntrl, image->mhi_buf);
> -	mhi_free_bhi_buffer(mhi_cntrl, image);
> +	if (fw_load_type == MHI_FW_LOAD_BHIE)
> +		ret = mhi_send_image_bhie(mhi_cntrl, fw_data, size);
> +	else
> +		ret = mhi_send_image_bhi(mhi_cntrl, fw_data, size);
>  
>  	/* Error or in EDL mode, we're done */
>  	if (ret) {
> -		dev_err(dev, "MHI did not load image over BHI, ret: %d\n", ret);
> +		dev_err(dev, "MHI did not load image over BHI%s, ret: %d\n",
> +			fw_load_type == MHI_FW_LOAD_BHIE ? "e" : "",
> +			ret);
>  		release_firmware(firmware);
>  		goto error_fw_load;
>  	}
> @@ -550,7 +602,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * If we're doing fbc, populate vector tables while
>  	 * device transitioning into MHI READY state
>  	 */
> -	if (mhi_cntrl->fbc_download) {
> +	if (fw_load_type == MHI_FW_LOAD_FBC) {
>  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
>  		if (ret) {
>  			release_firmware(firmware);
> @@ -575,7 +627,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	return;
>  
>  error_ready_state:
> -	if (mhi_cntrl->fbc_download) {
> +	if (fw_load_type == MHI_FW_LOAD_FBC) {
>  		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>  		mhi_cntrl->fbc_image = NULL;
>  	}
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index a9b1f8beee7b..13e7a55f54ff 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1144,7 +1144,7 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  	}
>  	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
>  
> -	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
> +	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size || mhi_cntrl->seg_len) {
>  		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF,
>  				   &bhie_off);
>  		if (ret) {
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 3134f111be35..afcf536083bc 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -29,6 +29,14 @@ struct bhi_vec_entry {
>  	u64 size;
>  };
>  
> +enum mhi_fw_load_type {
> +	MHI_FW_LOAD_UNKNOWN,
> +	MHI_FW_LOAD_BHI,	/* BHI only in PBL */
> +	MHI_FW_LOAD_BHIE,	/* BHIe only in PBL */
> +	MHI_FW_LOAD_FBC,	/* BHI in PBL followed by BHIe in SBL */
> +	MHI_FW_LOAD_MAX,
> +};
> +
>  enum mhi_ch_state_type {
>  	MHI_CH_STATE_TYPE_RESET,
>  	MHI_CH_STATE_TYPE_STOP,

