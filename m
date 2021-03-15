Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A23A833B26A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 13:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A01F89E36;
	Mon, 15 Mar 2021 12:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB5889E36
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 12:22:02 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id jt13so65873795ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=68jlXxwTfNA20UssG/iOwv7H5x/KNjvMb7lpLxpsr3I=;
 b=yPJ9K0uCd7YGDEC+SW1zRnYgaV/ijooR+XEo2KF+DFUyskFZKPUPdupNDM1Bzmc5rQ
 TtZpoymKCPamfltgDPQxthzkNZAE2qzehzZ2i2V6Cd9dM2ZKH6NqCN3hiM6tljCNl1fU
 gkXSxSKbYCbmdKCB/RXQVP8VxFWWip56KDiq+t8B2hH0/3k/jqHAarwhuAH5DG4UQSZN
 t0YhY5h0cPCKBmQe9zy/rs6Poz+lMk8wKyhOpjT5mA8T6kYuPCUMkyUrqLiwd588bsR6
 9E58gCUZoI+2Nd78ZYNpRPgTV58Zi/zC/J863ffmLXeqQYu1FDchlegQf4BE4R1t+OAj
 e+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=68jlXxwTfNA20UssG/iOwv7H5x/KNjvMb7lpLxpsr3I=;
 b=a5IRgCcYZ0VaborxXmRQQoX9wIoK1Uv8k1dn20U7T2+uIg6a/Bx4YmBVqCVFf6794x
 4Zg+GA8/LZc68Fj9r2WEz5LrwnpwwHOsqUV6ulss06833DFMLkQa2cp4RyMT8cXlAem9
 AklDIB5wYeXzuts68M3R6tC5q5nk83aFfQpg4UaB3Yq13WhjpUY7FQSyu86Nzn1RavVB
 CR/cp/obSQd9WL+om+EKIGNeHBTZNBiPPw5aWBAumRD36MamEwXd6l33MJiADMA/bRR+
 1/jeHkjLXchOg6Dl3juNeyWedqrrt+9sVubnyuWh6YZ64VG7+GqZ1sO4P1/MCMCUsV02
 /k2w==
X-Gm-Message-State: AOAM530/mqJNpphfPpM0fSNPxGVGEb8UgKo7wga68rlpy2thmQWTKGWB
 spo3GtS5UiJCZb1B+WdhI8Ymsg==
X-Google-Smtp-Source: ABdhPJyOEJdU7zKKbglgyC3DnGahjOi0AdhGWWGjA6h4Bp8+9nk2Nlz0nQcAh6QvJyPGbwi3KZ/SCA==
X-Received: by 2002:a17:906:789:: with SMTP id
 l9mr22968222ejc.161.1615810920902; 
 Mon, 15 Mar 2021 05:22:00 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id z17sm7270134eju.27.2021.03.15.05.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 05:22:00 -0700 (PDT)
Date: Mon, 15 Mar 2021 12:21:58 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH] backlight: qcom-wled: Use sink_addr for sync toggle
Message-ID: <20210315122158.ptqi6xvngf6ihjum@maple.lan>
References: <20210314101110.48024-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210314101110.48024-1-marijn.suijten@somainline.org>
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
Cc: linux-fbdev@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
 Obeida Shamoun <oshmoun100@googlemail.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 14, 2021 at 11:11:10AM +0100, Marijn Suijten wrote:
> From: Obeida Shamoun <oshmoun100@googlemail.com>
> 
> WLED3_SINK_REG_SYNC is, as the name implies, a sink register offset.
> Therefore, use the sink address as base instead of the ctrl address.
> 
> This fixes the sync toggle on wled4, which can be observed by the fact
> that adjusting brightness now works.
> 
> It has no effect on wled3 because sink and ctrl base addresses are the
> same.  This allows adjusting the brightness without having to disable
> then reenable the module.
> 
> Signed-off-by: Obeida Shamoun <oshmoun100@googlemail.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

LGTM, although an acked-by from Kiran would be nice to have:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/video/backlight/qcom-wled.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 091f07e7c145..fc8b443d10fd 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -336,13 +336,13 @@ static int wled3_sync_toggle(struct wled *wled)
>  	unsigned int mask = GENMASK(wled->max_string_count - 1, 0);
>  
>  	rc = regmap_update_bits(wled->regmap,
> -				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
> +				wled->sink_addr + WLED3_SINK_REG_SYNC,
>  				mask, mask);
>  	if (rc < 0)
>  		return rc;
>  
>  	rc = regmap_update_bits(wled->regmap,
> -				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
> +				wled->sink_addr + WLED3_SINK_REG_SYNC,
>  				mask, WLED3_SINK_REG_SYNC_CLEAR);
>  
>  	return rc;
> -- 
> 2.30.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
