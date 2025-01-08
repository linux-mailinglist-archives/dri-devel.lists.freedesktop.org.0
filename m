Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45629A05296
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 06:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C370010E23D;
	Wed,  8 Jan 2025 05:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j/8VxDBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82D810E23D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 05:25:24 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2f441791e40so19454350a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 21:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736313864; x=1736918664; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QD6L0ujpzaRC/L59NoO6Z/+6+/oZeKQ9pKbwkOhBz1U=;
 b=j/8VxDBNAk9qh5pSfOTLp5Nv041ULEqb9RM2mAa8yYZiFgtQvgX3ZMbq4l3R2H1tlX
 onHX7AVAeMBNznkZp/IWUvs5WuXCUHvAZoMQ84SK6e4huCx6HzinMv8DzSEWfHvH/yye
 u9RO+qezvV0oI4j7ZvnDCmvRMS8FKO3l6OyPAIkkIF8J+azrn20syPASI0lncedfw28/
 w3Qm7K8q7JTdyhMTINgfZazYWwC5n4qI8gj6/OqLaIaTkqTzIWl/JzckKMfMQBC91oLz
 9/OMjI4zH2ijaf5V3rXrLtjIne1mVgTdEhqTJZJFQpi7gBmoFW5bCCwzphakEpi2zMSt
 T3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736313864; x=1736918664;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QD6L0ujpzaRC/L59NoO6Z/+6+/oZeKQ9pKbwkOhBz1U=;
 b=njOIyHdSiaqNTF+zZ/9OU9pL5lqnxNwztwzubUYFxG6GWZc8uob+IVGJ9TIsvZmnea
 kjGSt39B3s4HPe/Or62MUBh5E6sZncCbbXCE6cyy9Qv8uouqanR80zSNHbJhb/WUzVmW
 xA1C/X2E1O9IxpGrzirRqSXhdxtbeXxtXBwTnRtUgmZg6BAdd1vrqljWgz9MQail01ou
 Mip+RhR2DEx8w0w1rM7XcXzUYebz+7yEg5vVkGUtXZuAbcxUDWHQa9hOstuhbwvZj2L5
 9wcgRStBg147ekemObvg/h3WDrF5pkcOuTBQFabzKGfwYXX+mULe1b2jJLjuQMJ7qyuu
 zzmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAoSAEDrJ+yks2ORtAewzhsV1j9ZtN1uTXhIZImvFZ4EqrofLZJ6OuuBYGtZKiMc6en71DSzt558Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycPPIBvR+TvSSqnh0HuXOnpz5KTpr8U53GThTZzFZBofi0nJc5
 vm+Z0INQhfoYIChMuAXK3WnWNjYQau9QbtWd8b34O0567KMoh4aT//o59Xy9Xw==
X-Gm-Gg: ASbGncsZSROHzTXsuSsEbCE/RvFPPoTMMegPV2TVCs2CAlxUJHAqLRfz4vtvdv2Ykhr
 zeU+hlWgIAuXtjhVLkmbAqL51LJvYp5tBzxmvLd6fZfUEjQsm59wxEyRXTmW1mT5hNZulEv4PVz
 xj8xn+/Eavz99llkHQBaJb+h01cjJaAs+vxXmHLHVxcddSp+J0Fx4O4pobowPpkJ2xRaNkBa7io
 A/ao/Pyf6pWoklBXofKaZDK4rTiU0jWgnSKTdEtjrwUvNEDx0dfkDVnuJNJhdTqTUyZ
X-Google-Smtp-Source: AGHT+IFeyo2aY47f/bHnipeLkhHuGpmxHpg269EGkKbkJq3egoRjBog7l1tF3IalKZ3HcujkOf6x+Q==
X-Received: by 2002:a17:90b:2cc7:b0:2ee:5edc:4b2 with SMTP id
 98e67ed59e1d1-2f548f6a952mr2289084a91.20.1736313864340; 
 Tue, 07 Jan 2025 21:24:24 -0800 (PST)
Received: from thinkpad ([117.213.100.67]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9f5195sm317147125ad.194.2025.01.07.21.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 21:24:23 -0800 (PST)
Date: Wed, 8 Jan 2025 10:54:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
 quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
 ogabbay@kernel.org, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH 1/7] bus: mhi: host: Refactor BHI/BHIe based firmware
 loading
Message-ID: <20250108052416.cqfoxzvw42me2kub@thinkpad>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-2-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213213340.2551697-2-quic_jhugo@quicinc.com>
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

On Fri, Dec 13, 2024 at 02:33:34PM -0700, Jeffrey Hugo wrote:
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
> ---
>  drivers/bus/mhi/host/boot.c | 155 +++++++++++++++++++++++++-----------
>  1 file changed, 110 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index e8c92972f9df..e3f3c07166ad 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -177,6 +177,37 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
>  }
>  EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
>  
> +static inline void mhi_fw_load_error_dump(struct mhi_controller *mhi_cntrl)

No need to add 'inline' keyword in c files. You can trust the compiler.

> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
> +	void __iomem *base = mhi_cntrl->bhi;
> +	int ret;
> +	u32 val;
> +	int i;

int ret, i?

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

[...]

> +static int mhi_alloc_bhi_buffer(struct mhi_controller *mhi_cntrl,
> +				struct image_info **image_info,
> +				size_t alloc_size)
> +{
> +	struct image_info *img_info;
> +	struct mhi_buf *mhi_buf;
> +	int segments = 1;
> +
> +	img_info = kzalloc(sizeof(*img_info), GFP_KERNEL);
> +	if (!img_info)
> +		return -ENOMEM;
> +
> +	/* Allocate memory for entry */
> +	img_info->mhi_buf = kcalloc(segments, sizeof(*img_info->mhi_buf),
> +				    GFP_KERNEL);

Why do you need kcalloc for only 1 segment?

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
> +	img_info->entries = segments;
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
> @@ -364,9 +422,18 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  	return -ENOMEM;
>  }
>  
> -static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
> -			      const u8 *buf, size_t remainder,
> -			      struct image_info *img_info)
> +static void mhi_firmware_copy_bhi(struct mhi_controller *mhi_cntrl,
> +				  const u8 *buf, size_t size,
> +				  struct image_info *img_info)
> +{
> +	struct mhi_buf *mhi_buf = img_info->mhi_buf;
> +
> +	memcpy(mhi_buf->buf, buf, size);
> +}
> +
> +static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
> +				   const u8 *buf, size_t remainder,
> +				   struct image_info *img_info)
>  {
>  	size_t to_cpy;
>  	struct mhi_buf *mhi_buf = img_info->mhi_buf;
> @@ -390,10 +457,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
> @@ -452,17 +518,16 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
> +	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);

Why can't you directly use memcpy here? I know what you want to keep symmetry
with mhi_firmware_copy_bhie(), but it seems unnecessary to me.

Adding a comment like "Load the firmware into BHI vec table" is enough.

- Mani


-- 
மணிவண்ணன் சதாசிவம்
