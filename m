Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBAFA176B1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 05:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996E810E4B5;
	Tue, 21 Jan 2025 04:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZT5anBnJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BF010E4B5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 04:52:19 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ef760a1001so8916091a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 20:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737435139; x=1738039939; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6tyLr89Oro7K4WmxXil5fUnVrn0buPsx3daOJhuEBhU=;
 b=ZT5anBnJCeArSP7wPDRrqAhUzAJ9N3h6JSLwiEJ8HX8EaP80WYUczY1ZMEqGYAA8Gy
 vUUt0TR7QzR3ITWpYC/ZMiLlh9r6A/q4d0Sa19JtTnwzV75D1ESsr8MSl8EwHv+tq0DW
 TTAQcUK8crNrsfSShcCk5tqaisWRn07gW652Os1JYciFXf1T8DIwBgnO8GXA5UldhdGe
 h9AODeivwzMYs9nzDjEtN5xA+VbejV7O1qu12955auQBLYbSi1vXaXuH7SHpU0MLSxmB
 qm0UPVdbI8yY03oxxx0D9zG07Co24/BIEAxCx92rlmcvxl1CmPA9sVLJ8JDdahEH+tKJ
 sEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737435139; x=1738039939;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6tyLr89Oro7K4WmxXil5fUnVrn0buPsx3daOJhuEBhU=;
 b=EOS7CIX2ujB8Owu2YItREm6nE/o7vLGVYnvq+x3Zu9qzn3RP9x0D7Mc0AKiFpjOmg7
 +h8jKzlYaa4IIMtOwdqJURyY0SuP+1Qbh2HOGATMd2HrnKaz3V8lRjlVkKg5p7DA4ZQ3
 J0TrbxakvI1tBmZWdB8tRuW5eFXHpAHy7+EAdKIx3tsOwiPQHmtEHd8zN2dWhzV05VR4
 N2UjX/9uU3Bxwf1OSpVKlyZw82Woj1hebSUabEB3yO28CG4ni6guCMM0+hghv50QXhkV
 UHXpzelVMBsAfhmginRIP2nQNSfX0CteZ14o72TaW/WOnt/B+if8aNUANN8oJMt54Fkf
 K7cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx/od8Flq+FXBJfG6OfdmHG15wWUQXwMR1bujpa6Wel4M1b5DPLZ0aNG+7YQUeM96DCgrISKUE0E4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfpGAHCzWm+S+YFNhu/wd8ckmFYL/o+OY/jipye5Cy4/xDt9g4
 zq16+ChO6s826dSbJINYNTkgxip7nkADBmoZunCLnxrRDAsI/8g7aLkNenSvsw==
X-Gm-Gg: ASbGncsmDfjW5ay94UL/yepqTiKAgUJzc8efTSVqmkh3lcg6bM3W7v3j88SKs4IJ+3N
 8BTIMi7xG0iZRtsc8Oaar+vxnWBHci2DIlxa4nNpSGtZdrprpLwCRnvkK6W78IhZtIM6JpPWi3Y
 pWLmIupyU3CztXBfQiVk1h1onAdWH+AqZXY6YdIMiOQtNhgMBj+0T3uwgNMu1ck8wmXZDujtU3I
 aLHF8Ha7mEhZfDlcLOEXHP7CwdtPTXtyC8SX2aAQU7sbw1odP0s+VRksSN1kuZ3DoAV6RELvlV3
 eAlZ+EY=
X-Google-Smtp-Source: AGHT+IFSWF/3fxqQyQ4PQAR3oXpx/J8EguJMfXK4TSYqPEZ0xRHtpPEOOVb2sMjou628AnuBYq4BxA==
X-Received: by 2002:a05:6a00:3c8a:b0:727:3c37:d5fb with SMTP id
 d2e1a72fcca58-72dafb6fef4mr22643451b3a.16.1737435139390; 
 Mon, 20 Jan 2025 20:52:19 -0800 (PST)
Received: from thinkpad ([117.213.102.234]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dabacdbd5sm8099841b3a.180.2025.01.20.20.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 20:52:18 -0800 (PST)
Date: Tue, 21 Jan 2025 10:22:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
 quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
 ogabbay@kernel.org, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 1/7] bus: mhi: host: Refactor BHI/BHIe based firmware
 loading
Message-ID: <20250121045212.jo5fi37n44lqab7u@thinkpad>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-2-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250117170943.2643280-2-quic_jhugo@quicinc.com>
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

On Fri, Jan 17, 2025 at 10:09:37AM -0700, Jeffrey Hugo wrote:
> From: Matthew Leung <quic_mattleun@quicinc.com>
> 
> Refactor the firmware loading code to have distinct helper functions for
> BHI and BHIe operations. This lays the foundation for separating the
> firmware loading protocol from the firmware being loaded and the EE it
> is loaded in.
> 
> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/bus/mhi/host/boot.c | 144 +++++++++++++++++++++++++-----------
>  1 file changed, 99 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index e8c92972f9df..9fe13d3f09f0 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -177,6 +177,36 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
>  }
>  EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
>  
> +static void mhi_fw_load_error_dump(struct mhi_controller *mhi_cntrl)
> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
> +	void __iomem *base = mhi_cntrl->bhi;
> +	int ret, i;
> +	u32 val;
> +	struct {
> +		char *name;
> +		u32 offset;
> +	} error_reg[] = {
> +		{ "ERROR_CODE", BHI_ERRCODE },
> +		{ "ERROR_DBG1", BHI_ERRDBG1 },
> +		{ "ERROR_DBG2", BHI_ERRDBG2 },
> +		{ "ERROR_DBG3", BHI_ERRDBG3 },
> +		{ NULL },
> +	};
> +
> +	read_lock_bh(pm_lock);
> +	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> +		for (i = 0; error_reg[i].name; i++) {
> +			ret = mhi_read_reg(mhi_cntrl, base, error_reg[i].offset, &val);
> +			if (ret)
> +				break;
> +			dev_err(dev, "Reg: %s value: 0x%x\n", error_reg[i].name, val);
> +		}
> +	}
> +	read_unlock_bh(pm_lock);
> +}
> +
>  static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
>  			    const struct mhi_buf *mhi_buf)
>  {
> @@ -226,24 +256,13 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
>  }
>  
>  static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
> -			   dma_addr_t dma_addr,
> -			   size_t size)
> +			    const struct mhi_buf *mhi_buf)
>  {
> -	u32 tx_status, val, session_id;
> -	int i, ret;
> -	void __iomem *base = mhi_cntrl->bhi;
> -	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	struct {
> -		char *name;
> -		u32 offset;
> -	} error_reg[] = {
> -		{ "ERROR_CODE", BHI_ERRCODE },
> -		{ "ERROR_DBG1", BHI_ERRDBG1 },
> -		{ "ERROR_DBG2", BHI_ERRDBG2 },
> -		{ "ERROR_DBG3", BHI_ERRDBG3 },
> -		{ NULL },
> -	};
> +	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
> +	void __iomem *base = mhi_cntrl->bhi;
> +	u32 tx_status, session_id;
> +	int ret;
>  
>  	read_lock_bh(pm_lock);
>  	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> @@ -255,11 +274,9 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
>  	dev_dbg(dev, "Starting image download via BHI. Session ID: %u\n",
>  		session_id);
>  	mhi_write_reg(mhi_cntrl, base, BHI_STATUS, 0);
> -	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH,
> -		      upper_32_bits(dma_addr));
> -	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_LOW,
> -		      lower_32_bits(dma_addr));
> -	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, size);
> +	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH, upper_32_bits(mhi_buf->dma_addr));
> +	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_LOW, lower_32_bits(mhi_buf->dma_addr));
> +	mhi_write_reg(mhi_cntrl, base, BHI_IMGSIZE, mhi_buf->len);
>  	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
>  	read_unlock_bh(pm_lock);
>  
> @@ -274,18 +291,7 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
>  
>  	if (tx_status == BHI_STATUS_ERROR) {
>  		dev_err(dev, "Image transfer failed\n");
> -		read_lock_bh(pm_lock);
> -		if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> -			for (i = 0; error_reg[i].name; i++) {
> -				ret = mhi_read_reg(mhi_cntrl, base,
> -						   error_reg[i].offset, &val);
> -				if (ret)
> -					break;
> -				dev_err(dev, "Reg: %s value: 0x%x\n",
> -					error_reg[i].name, val);
> -			}
> -		}
> -		read_unlock_bh(pm_lock);
> +		mhi_fw_load_error_dump(mhi_cntrl);
>  		goto invalid_pm_state;
>  	}
>  
> @@ -296,6 +302,16 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
>  	return -EIO;
>  }
>  
> +static void mhi_free_bhi_buffer(struct mhi_controller *mhi_cntrl,
> +				struct image_info *image_info)
> +{
> +	struct mhi_buf *mhi_buf = image_info->mhi_buf;
> +
> +	dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len, mhi_buf->buf, mhi_buf->dma_addr);
> +	kfree(image_info->mhi_buf);
> +	kfree(image_info);
> +}
> +
>  void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
>  			 struct image_info *image_info)
>  {
> @@ -310,6 +326,45 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
>  	kfree(image_info);
>  }
>  
> +static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
> +				struct image_info **image_info,
> +				size_t alloc_size)
> +{
> +	struct image_info *img_info;
> +	struct mhi_buf *mhi_buf;
> +
> +	img_info = kzalloc(sizeof(*img_info), GFP_KERNEL);
> +	if (!img_info)
> +		return -ENOMEM;
> +
> +	/* Allocate memory for entry */
> +	img_info->mhi_buf = kzalloc(sizeof(*img_info->mhi_buf), GFP_KERNEL);
> +	if (!img_info->mhi_buf)
> +		goto error_alloc_mhi_buf;
> +
> +	/* Allocate and populate vector table */
> +	mhi_buf = img_info->mhi_buf;
> +
> +	mhi_buf->len = alloc_size;
> +	mhi_buf->buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
> +					  &mhi_buf->dma_addr, GFP_KERNEL);
> +	if (!mhi_buf->buf)
> +		goto error_alloc_segment;
> +
> +	img_info->bhi_vec = NULL;
> +	img_info->entries = 1;
> +	*image_info = img_info;
> +
> +	return 0;
> +
> +error_alloc_segment:
> +	kfree(mhi_buf);
> +error_alloc_mhi_buf:
> +	kfree(img_info);
> +
> +	return -ENOMEM;
> +}
> +
>  int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  			 struct image_info **image_info,
>  			 size_t alloc_size)
> @@ -364,9 +419,9 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  	return -ENOMEM;
>  }
>  
> -static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
> -			      const u8 *buf, size_t remainder,
> -			      struct image_info *img_info)
> +static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
> +				   const u8 *buf, size_t remainder,
> +				   struct image_info *img_info)
>  {
>  	size_t to_cpy;
>  	struct mhi_buf *mhi_buf = img_info->mhi_buf;
> @@ -390,10 +445,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	enum mhi_pm_state new_state;
> +	struct image_info *image;
>  	const char *fw_name;
>  	const u8 *fw_data;
> -	void *buf;
> -	dma_addr_t dma_addr;
>  	size_t size, fw_sz;
>  	int ret;
>  
> @@ -452,17 +506,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	fw_sz = firmware->size;
>  
>  skip_req_fw:
> -	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
> -				 GFP_KERNEL);
> -	if (!buf) {
> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
> +	if (ret) {
>  		release_firmware(firmware);
>  		goto error_fw_load;
>  	}
> +	/* Load the firmware into BHI vec table */
> +	memcpy(image->mhi_buf->buf, fw_data, size);
>  
>  	/* Download image using BHI */
> -	memcpy(buf, fw_data, size);
> -	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
> -	dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
> +	ret = mhi_fw_load_bhi(mhi_cntrl, image->mhi_buf);
> +	mhi_free_bhi_buffer(mhi_cntrl, image);
>  
>  	/* Error or in EDL mode, we're done */
>  	if (ret) {
> @@ -493,7 +547,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  		}
>  
>  		/* Load the firmware into BHIE vec table */
> -		mhi_firmware_copy(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
> +		mhi_firmware_copy_bhie(mhi_cntrl, fw_data, fw_sz, mhi_cntrl->fbc_image);
>  	}
>  
>  	release_firmware(firmware);
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
