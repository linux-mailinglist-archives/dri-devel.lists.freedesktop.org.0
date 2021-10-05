Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E805F4221EE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 11:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DD76EB4C;
	Tue,  5 Oct 2021 09:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49736EB4C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 09:14:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r7so20581759wrc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 02:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NdfxKvwbENEe6Qc28QrxcXsenUkhHTp7Cx9+Cb+DWBQ=;
 b=Efqd2Q6eEJAmcWuAAVFU98HgD4okcWec+ZKyewYNsa7dSzFs+zvykWUBTtEzMmfQ2u
 du+rJ6pUDCijqMKMYTgIgMRXbYYkvglg9NHkPbDPvmk0xMPTrFmo90JsXz+prbiQMy0/
 CYC1K5q5Eqv82eA50uOTT9fQokTBTE+C72GdsOP/3dz7A/lvdxLKl5zTHfyVLoiBmh9n
 Cdb81R+PRorVerxid1gu491ZkGFfJYnK/E4Rjtc+vVXe6B92+p8v+OaNfeazhKr3q3Bp
 iVhafOGu5YhMAX5XUJWCUEg6dmD9eJlXM5BFsn4qfP6+v1KNFfMYNSHg/qxnzP3eyGn5
 N5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NdfxKvwbENEe6Qc28QrxcXsenUkhHTp7Cx9+Cb+DWBQ=;
 b=hhhigEnQk3fMFpxB+VdY+7hYLP6dlUqZJHNVwdhKAKxrT6U9UW/+waravmF6csDYCq
 LDP32gmOv720DCNQ7Ct8xDhh3GpkcYx5weHGBM4V4q8GC1QyH/LNz7E1KuHoAyXkW+cH
 wEWZB/R1uDc6ZVUGs+eHUEBcZvhwHrHhcO2IB0f8eoUSlr6UPwVLnO0CkUs1p0Acc692
 25FilahU0kiwNtH1D4DkeC9kSfYUHkAfXtlWMAb1EBkH1NGVU+DqG1mh9nuPCqxVDAqb
 lhs5gQa1rgX7jsDpO3wQVOyHvXuk4gryA2ck77PsSoLDSvJWpSIfM+czwySAnt4DqWmM
 G/Ug==
X-Gm-Message-State: AOAM531QUekbP79oLvYmFPeoADb/QYLSjQW6XWQl6lCe6a2cSTjvSwZG
 NZI2MdAJ6OI3QiYYzTw6rTYIgg==
X-Google-Smtp-Source: ABdhPJxddGuja7rll9i8p+SZfqM/20MrEF8aoH0Y9DCaLDlXhXEhZqI9KnYMjFb95M7v/NbuPP3lUw==
X-Received: by 2002:adf:e604:: with SMTP id p4mr11158789wrm.79.1633425295215; 
 Tue, 05 Oct 2021 02:14:55 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id f18sm3590265wrg.3.2021.10.05.02.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 02:14:54 -0700 (PDT)
Date: Tue, 5 Oct 2021 10:14:52 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Courtney Cavin <courtney.cavin@sonymobile.com>,
 Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] backlight: qcom-wled: Validate enabled string
 indices in DT
Message-ID: <20211005091452.4ecqhlhrdxdgvs3c@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-5-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004192741.621870-5-marijn.suijten@somainline.org>
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

On Mon, Oct 04, 2021 at 09:27:35PM +0200, Marijn Suijten wrote:
> The strings passed in DT may possibly cause out-of-bounds register
> accesses and should be validated before use.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")

The first half of this patch actually fixes patch 1 from this patch set.
It would be better to move that code there.


Daniel.


> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 29910e603c42..27e8949c7922 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1526,6 +1526,12 @@ static int wled_configure(struct wled *wled)
>  						     "qcom,enabled-strings",
>  						     sizeof(u32));
>  	if (string_len > 0) {
> +		if (string_len > wled->max_string_count) {
> +			dev_err(dev, "Cannot have more than %d strings\n",
> +				wled->max_string_count);
> +			return -EINVAL;
> +		}
> +
>  		rc = of_property_read_u32_array(dev->of_node,
>  						"qcom,enabled-strings",
>  						wled->cfg.enabled_strings,
> @@ -1537,6 +1543,14 @@ static int wled_configure(struct wled *wled)
>  			return -EINVAL;
>  		}
>  
> +		for (i = 0; i < string_len; ++i) {
> +			if (wled->cfg.enabled_strings[i] >= wled->max_string_count) {
> +				dev_err(dev, "qcom,enabled-strings index %d at %d is out of bounds\n",
> +					wled->cfg.enabled_strings[i], i);
> +				return -EINVAL;
> +			}
> +		}
> +
>  		cfg->num_strings = string_len;
>  	}
>  
> -- 
> 2.33.0
> 
