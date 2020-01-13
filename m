Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8232413A2CA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 09:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078AA6E30C;
	Tue, 14 Jan 2020 08:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489E66E13C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 18:45:54 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id m13so4658321pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 10:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TRPXa/X1Mc7UsbFtxb3zNyLDA7j12ID+Zjq7lbcmmkk=;
 b=oGUwSjjsO4Vl87AgYtTvHpWWrbUyrWHbiD9ePlNH7Ulh4V1z95rtqNvDPUVJhG1RoE
 rzpNKMiYj/oabZuPdZLbpVW4zISIAGyzY4YI0s6a1LPm1ZSojYpLjS0pBLiLBequ3p2A
 DQ4pgyjVXzyTHvSosqJBdtdlXGytXdt1P8L7GPygwnkbsYq5D6MxJMllKuS7aAo336IZ
 ZZzwGocvwdYMI18zCm29pX/afEz7En6nq4SSaHEtbRHeiFW1oNuX3Flo8zJ5kSQ/rgHm
 XS/XbbdRddwCnQKQrwC4i2S9Pz1FcNp3ttTy8sRwIx8cCC0zoIRRCC8xCGTfzHfgQzdb
 P+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TRPXa/X1Mc7UsbFtxb3zNyLDA7j12ID+Zjq7lbcmmkk=;
 b=PjabsBM8ktx0U+/fn1i/ZwZvUuNyn2KZtp33WTK31oB1W3mLIFtM1aBXEOTaBXRz81
 rBOi5yp6uR4Ap+QxjiWLSLgb4oRBfjTq6RNSl27Z8hC4rVXDruAzZmcnWcGn2FpFIdnM
 6mpiByI2ndAG0MHaAeuoc1WmG2wzaN3E+sBeaIUm0Exir6YbmHJt57rAhinvPPUAPdiL
 DRPXrNebpLSvGA21aVR4hOySklgPSdisTxkc0R1dvZRmiBxvgGNAUEgQ6W9Za+yJxZ8G
 x5RDRblry+MUzXpZoFjXa9dBxfgE+Ex0jc5B4P0H27rIaY2Kbh9M+iLH8uR3i7OH7Dpn
 vKAw==
X-Gm-Message-State: APjAAAXZlYIVS7geqtsLJdGrfXAu6pkhBZ8KAoWlRLgowqgKqphbXH96
 H92iZK0AiOfo8YHYm6U48m58cw==
X-Google-Smtp-Source: APXvYqxBBleDnBHycO1RtJCKMDtjbqTGZuiZXIov6MJMxK2XiiFFVzBdNS0dPqd4OtvpBNqLhBrY7g==
X-Received: by 2002:a17:90a:950b:: with SMTP id
 t11mr9450982pjo.79.1578941153872; 
 Mon, 13 Jan 2020 10:45:53 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id m3sm14191638pgp.32.2020.01.13.10.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 10:45:53 -0800 (PST)
Date: Mon, 13 Jan 2020 10:45:50 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 1/4] drm/msm: support firmware-name for zap fw (v2)
Message-ID: <20200113184550.GC1511@yoga>
References: <20200112195405.1132288-1-robdclark@gmail.com>
 <20200112195405.1132288-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200112195405.1132288-2-robdclark@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 14 Jan 2020 08:19:25 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Thomas Gleixner <tglx@linutronix.de>, freedreno@lists.freedesktop.org,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun 12 Jan 11:53 PST 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Since zap firmware can be device specific, allow for a firmware-name
> property in the zap node to specify which firmware to load, similarly to
> the scheme used for dsp/wifi/etc.
> 
> v2: only need a single error msg when we can't load from firmware-name
>     specified path, and fix comment [Bjorn A.]
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 30 ++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 112e8b8a261e..456bb5af1717 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -26,6 +26,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  {
>  	struct device *dev = &gpu->pdev->dev;
>  	const struct firmware *fw;
> +	const char *signed_fwname = NULL;
>  	struct device_node *np, *mem_np;
>  	struct resource r;
>  	phys_addr_t mem_phys;
> @@ -58,8 +59,31 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  
>  	mem_phys = r.start;
>  
> -	/* Request the MDT file for the firmware */
> -	fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	/*
> +	 * Check for a firmware-name property.  This is the new scheme
> +	 * to handle firmware that may be signed with device specific
> +	 * keys, allowing us to have a different zap fw path for different
> +	 * devices.
> +	 *
> +	 * If the firmware-name property is found, we bypass the
> +	 * adreno_request_fw() mechanism, because we don't need to handle
> +	 * the /lib/firmware/qcom/* vs /lib/firmware/* case.
> +	 *
> +	 * If the firmware-name property is not found, for backwards
> +	 * compatibility we fall back to the fwname from the gpulist
> +	 * table.
> +	 */
> +	of_property_read_string_index(np, "firmware-name", 0, &signed_fwname);
> +	if (signed_fwname) {
> +		fwname = signed_fwname;
> +		ret = request_firmware_direct(&fw, fwname, gpu->dev->dev);
> +		if (ret)
> +			fw = ERR_PTR(ret);
> +	} else {
> +		/* Request the MDT file from the default location: */
> +		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	}
> +
>  	if (IS_ERR(fw)) {
>  		DRM_DEV_ERROR(dev, "Unable to load %s\n", fwname);
>  		return PTR_ERR(fw);
> @@ -95,7 +119,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  	 * not.  But since we've already gotten through adreno_request_fw()
>  	 * we know which of the two cases it is:
>  	 */
> -	if (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY) {
> +	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
>  		ret = qcom_mdt_load(dev, fw, fwname, pasid,
>  				mem_region, mem_phys, mem_size, NULL);
>  	} else {
> -- 
> 2.24.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
