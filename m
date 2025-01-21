Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB98BA176B8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 05:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5608410E1C3;
	Tue, 21 Jan 2025 04:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qv9074b1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED0C10E1C3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 04:55:47 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2efb17478adso8898657a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 20:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737435287; x=1738040087; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VBH9834RN47Bq9S9SwBP5IhyNvK6QPWQqQCpbU4OxwM=;
 b=qv9074b1P88kjynmKYR9tHTLtAmZqvrnHNofKKBEtEA9aqlr3s/zqRib/51KRcc0O7
 uRO6+q+25yf1M3Z7fisUX4pGoO3tONgpgvlIHmJslA3tiBGM5ymBmS57zfUTYvXCgmfh
 sguSorZVyVgVA5pHoJBa8CWi8LquPZTAWaU7JlPXFePAaAZi9OkwuIw0RJkYyjBbXT3G
 CWxzLe/OM2+MyLvriVxrwi4qqb7k5H9wlzjrM8RkrD87fKHHmbaupnrvNpjNoAvtlVMY
 QtZ6qXiu9dEJqd6eARO23q39rS+rE84NqO3E+t+8Su7rjuX4khOcTLoN4Re6jjmCnjuK
 2wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737435287; x=1738040087;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VBH9834RN47Bq9S9SwBP5IhyNvK6QPWQqQCpbU4OxwM=;
 b=awtdXQ1QgSUqXxkONms4hvTPdEXwC/dJ6zKLNc8Tnvzu5TfPAP1nM4yoHsCvJfVvFS
 wwPrCEoyxr6lFCZLUfhtQRUWFbFkpzbbYm/QeBgdk4sNXGEuxuCizFOL2XK0zUOCHESW
 0NxRkG6TPF09FyUdz7viDuZEk2Y6fvyJLqH0Xe/EtDnnW8PlHjIw3QeMfjvEQdud6mgf
 1lRdh8s5H8CmPdjYKZpk+YK439v7wBpGbbKb7RLhMw2hq3IhDEb3z8HJR9JLoaSHv/dn
 D/1eVztiHbuPC3SIX8NxFVVaZApvDF20lxlUeIgRUwepQDULRVNsGs2xWHfcSXsubPrG
 WKJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ53cfnMNeKFZzf5R14h+pRz5wy3UfhllXXHdu/HAKh+vbWAFyTTp51Vyd50clKhAd8uPCvrBQHC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWxopXi5nX0b4adeQF14JwEnjsy72AH8maHS91XZveCUKxgzXC
 85gVxVh8yhd8cemmq89es1vN3CVJlSCjK4boQILaglss/cgW284F/yDl0sPZtg==
X-Gm-Gg: ASbGnctgmYN30HV3JKCQfox4b25hevY38eE9c/vZFx4n/pEbY1KjixnAV6Dt4PftMLK
 r1+N1KTvM7kejk+6w5UvagQsSEFJdloZO3DKqZWQx8ton6Sqhk61RWrTZojigMCcHOhWbvpI5cN
 CF8IbqCEJoXA5pvZcS8Fb/xWf9olEMcxqZQwZdPVXMvs4tVoyTDju8KRQeuXTW18H3rmAY3VTfj
 WCcZqiD8P/NejxCaTryHh1VRi7zvCY70nD0hOOccOgDRrzwY/SCkRAmeJs2W6Krufp6XHTecaZl
 TB3fYr8=
X-Google-Smtp-Source: AGHT+IFnlPleuzWBFHah/aSvvGeXWlFEbI6Y7OXKasiHzfXSeHwzASaQloX5bR0dSIgLZ53KYGnZ/g==
X-Received: by 2002:a05:6a00:2d19:b0:72a:8bb6:2963 with SMTP id
 d2e1a72fcca58-72dafa44141mr22175720b3a.13.1737435286796; 
 Mon, 20 Jan 2025 20:54:46 -0800 (PST)
Received: from thinkpad ([117.213.102.234]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-a9bdd30d03fsm7885724a12.54.2025.01.20.20.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 20:54:46 -0800 (PST)
Date: Tue, 21 Jan 2025 10:24:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
 quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
 ogabbay@kernel.org, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 2/7] bus: mhi: host: Add a policy to enable image
 transfer via BHIe in PBL
Message-ID: <20250121045439.xx6mavzwklfnlvhf@thinkpad>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-3-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250117170943.2643280-3-quic_jhugo@quicinc.com>
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

On Fri, Jan 17, 2025 at 10:09:38AM -0700, Jeffrey Hugo wrote:
> From: Matthew Leung <quic_mattleun@quicinc.com>
> 
> Currently, MHI host only performs firmware transfer via BHI in PBL and
> BHIe from SBL. To support BHIe transfer directly from PBL, a policy
> needs to be added.
> 
> With this policy, BHIe will be used to transfer firmware in PBL if the
> MHI controller has BHIe regs, sets seg_len, and does not set
> fbc_download. The intention is to transfer firmware using BHIe in PBL
> without further BHIe transfers in SBL.
> 
> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/bus/mhi/host/boot.c     | 73 ++++++++++++++++++++++++++-------
>  drivers/bus/mhi/host/init.c     |  2 +-
>  drivers/bus/mhi/host/internal.h |  7 ++++
>  3 files changed, 66 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index 9fe13d3f09f0..a206c3f0fcfd 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -440,12 +440,59 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>  	}
>  }
>  
> +static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *mhi_cntrl)
> +{
> +	if (mhi_cntrl->fbc_download) {
> +		return MHI_FW_LOAD_FBC;
> +	} else {
> +		if (mhi_cntrl->seg_len)
> +			return MHI_FW_LOAD_BHIE;
> +		else
> +			return MHI_FW_LOAD_BHI;
> +	}
> +}
> +
> +static int mhi_load_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
> +{
> +	struct image_info *image;
> +	int ret;
> +
> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +	if (ret)
> +		return ret;
> +
> +	/* Load the firmware into BHI vec table */
> +	memcpy(image->mhi_buf->buf, fw_data, size);
> +
> +	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
> +	mhi_free_bhi_buffer(mhi_cntrl, image);
> +
> +	return ret;
> +}
> +
> +static int mhi_load_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
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
> @@ -506,21 +553,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	fw_sz = firmware->size;
>  
>  skip_req_fw:
> -	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> -	if (ret) {
> -		release_firmware(firmware);
> -		goto error_fw_load;
> -	}
> -	/* Load the firmware into BHI vec table */
> -	memcpy(image->mhi_buf->buf, fw_data, size);
> -
> -	/* Download image using BHI */
> -	ret = mhi_fw_load_bhi(mhi_cntrl, image->mhi_buf);
> -	mhi_free_bhi_buffer(mhi_cntrl, image);
> +	fw_load_type = mhi_fw_load_type_get(mhi_cntrl);
> +	if (fw_load_type == MHI_FW_LOAD_BHIE)
> +		ret = mhi_load_image_bhie(mhi_cntrl, fw_data, size);
> +	else
> +		ret = mhi_load_image_bhi(mhi_cntrl, fw_data, size);
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
> @@ -539,7 +582,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * If we're doing fbc, populate vector tables while
>  	 * device transitioning into MHI READY state
>  	 */
> -	if (mhi_cntrl->fbc_download) {
> +	if (fw_load_type == MHI_FW_LOAD_FBC) {
>  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
>  		if (ret) {
>  			release_firmware(firmware);
> @@ -564,7 +607,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
> index 3134f111be35..ce566f7d2e92 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -29,6 +29,13 @@ struct bhi_vec_entry {
>  	u64 size;
>  };
>  
> +enum mhi_fw_load_type {
> +	MHI_FW_LOAD_BHI,	/* BHI only in PBL */
> +	MHI_FW_LOAD_BHIE,	/* BHIe only in PBL */
> +	MHI_FW_LOAD_FBC,	/* BHI in PBL followed by BHIe in SBL */
> +	MHI_FW_LOAD_MAX,
> +};
> +
>  enum mhi_ch_state_type {
>  	MHI_CH_STATE_TYPE_RESET,
>  	MHI_CH_STATE_TYPE_STOP,
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
