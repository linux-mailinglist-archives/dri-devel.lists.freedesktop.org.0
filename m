Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD97A133CE2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93C26E86F;
	Wed,  8 Jan 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E966E156
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 05:00:59 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 2so973275pfg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 21:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=X37F/PBhiA4LwJm08uRB6YNKHdDjwop2i2GIlG0JFWg=;
 b=NUiVu62v3HRo0eFiWC89LLpUuaBgLMcU8567eZd8RGwJUXIP+hwUtxWw8qdZtAROrx
 2GyZJNn4cYwyKjXe6VBoV/hrPM33WX1ytgGf4qSj2tLY22f2BIJMKVQ6dOkxd6PTQ8Pq
 eJ/pyeosrxmzpzdK3TaGdcozwHQqbOUG8giwUJSV+gRo3mPTVZD3qOTIKRC6uz/fFeTT
 lIlDuMbPhceLob0Z0hDXw4JwJUXA3JE/mlKM1bMBsAlcrjBj2oZjcV+G4b1oEDcNZ0Il
 okqbzPeowrV9S2F+/bJ+fBL3Dpz4FPNBz7i9pxMizR9CAhIKo4IL3gRIAAfuV/TjYhbm
 Ic6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X37F/PBhiA4LwJm08uRB6YNKHdDjwop2i2GIlG0JFWg=;
 b=hKNOyxsVC8vQlYA1usyW8OclA8IdKSbXYFHoudAw+2nZtkFG7Up2jJdap0BUGjp1YN
 glG4vRKrRFRksp5GGn7jLM4mQZYSgukWLG+xdJu+mXn854PDZGswb2ZBImu2rgbWpN0v
 V+R88jDagX9guY1s/0xvyYbp7I5gwvQ49kDT2ibHOLOPKLvKD6QPlxnLpw2TfpJCT8AA
 o9tPe7zh4q1PFwbsLTTLRvwvOOjibu6waVs2IDMZthxCVGflidu8968Rw6BlCE9vsg6M
 vkk4xhtYP5c7N3qVpyGVtYTAjPWVZFXnJkTeXIXvr9z9my2HgCf5v99b+G1z5tAyQpTJ
 8dsA==
X-Gm-Message-State: APjAAAXTyaXcdvtWrKW6Tu664xegVhSiGS20pwav8Azm/ZAbxxHDK9sB
 Ry8AcuDkJ35WeoFFHg5E475tjA==
X-Google-Smtp-Source: APXvYqwjTVtnryOd1gkgsIYiny/IO42W3vQYflxFzhsS6U/6YKIfqzOoivrrcRW9DWuo9N0ausldWA==
X-Received: by 2002:a62:1c88:: with SMTP id c130mr3132646pfc.195.1578459658738; 
 Tue, 07 Jan 2020 21:00:58 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id n14sm1349243pff.188.2020.01.07.21.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 21:00:58 -0800 (PST)
Date: Tue, 7 Jan 2020 21:00:55 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/3] drm/msm: support firmware-name for zap fw
Message-ID: <20200108050055.GJ738324@yoga>
References: <20200108013847.899170-1-robdclark@gmail.com>
 <20200108013847.899170-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108013847.899170-2-robdclark@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, freedreno@lists.freedesktop.org,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 07 Jan 17:38 PST 2020, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Since zap firmware can be device specific, allow for a firmware-name
> property in the zap node to specify which firmware to load, similarly to
> the scheme used for dsp/wifi/etc.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 32 ++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 112e8b8a261e..aa8737bd58db 100644
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
> @@ -58,8 +59,33 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
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
> +		ret = request_firmware_direct(&fw, signed_fwname, gpu->dev->dev);
> +		if (ret) {
> +			DRM_DEV_ERROR(dev, "could not load signed zap firmware: %d\n", ret);
> +			fw = ERR_PTR(ret);

Perhaps just return ret; here, or omit the error print here any rely
solely on the one below?

> +		}
> +	} else {
> +		/* Request the MDT file for the firmware */

How about changing this to "Request the MDT file from the default
location" or something like that?

Rest looks good.

Regards,
Bjorn

> +		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> +	}
> +
>  	if (IS_ERR(fw)) {
>  		DRM_DEV_ERROR(dev, "Unable to load %s\n", fwname);
>  		return PTR_ERR(fw);
> @@ -95,7 +121,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
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
