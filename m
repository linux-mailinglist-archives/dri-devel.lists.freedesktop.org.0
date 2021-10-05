Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAEE4221AB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 11:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93796E372;
	Tue,  5 Oct 2021 09:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BF36E372
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 09:05:57 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 a131-20020a1c7f89000000b0030d4c90fa87so2327684wmd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 02:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Sch0aWxDBNQdpah51FulP42zKP3FSOyTJMCjs7CVLTM=;
 b=bY1lQ0osNyWKNqBAua4Kg5sBOYow4ldD0jTiPF6AlazJXq8jACkl3c0roM248Trihg
 IP1KhGgFlPLVdLbcJ1LQeVgaTZDTX8dl62IlXg5NzbZv3pc/nkiVxgPatKf/tZaHm1dL
 kWzZPcxsZ1+0mJeUm2cRo7GK1UtZzJCa6edlGwQPdzpIgr6QnEosRGm68aQsotwzRJXF
 CDbleSXqI0i4BrCEaC5F1nDeuw3Wo75cHlLNBDTaOZrwrqkmq0tiaCjWf2eIqL13yYp3
 wOpHJgeVAURft6aB7hMKER+PDuAzkvCD3WYlBBpsOe5ccbcbMWKY+sZV6UI69i1B+isa
 q/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sch0aWxDBNQdpah51FulP42zKP3FSOyTJMCjs7CVLTM=;
 b=pyB5K46npKSEZlHeSFZFr6mC/hC4y+cU7RPfeq65xvWXP9PJbsY1fVeydyNafDuyGS
 2KTXILmVO9QDUAzeL8TaE6cMhrJYK/At0Dn3TNMCGTaklGyQj2vh3l+kQdcqvo2fcn4B
 cP+GDF7t9pqk92ciT7pcNRFrkUXWhD84J/8n4fs4/7ouM0MivV80jJ9wZhE1Ev1/rXrL
 kh0aTmRd4d7ei5p+HV0DMKX/aZMOS21iohBwH0tkmh+8Z5AZ6AGAV75xIip5uEpaWSyI
 zTil0l1/E34GgkbwXKttCUdZtGeJdNa2XHLuN3jK3dy5Jb9U/+eWZzmCcTJvufhh5XzD
 v9VA==
X-Gm-Message-State: AOAM531Tc5Wm3Hpw76W8swhXwdYz0isWfhs20PMbEOz9PGtVxVf/Ib9i
 ogxEyBaNydACqEtG02I6VkoocQ==
X-Google-Smtp-Source: ABdhPJxihmBnUHQnbQ4fyua0XZJasSFmZfAkJOHSSqxnk0Vb1yLrCSgSEA7VR57yIqbCyZjlKhl21w==
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr2195141wmq.52.1633424756122; 
 Tue, 05 Oct 2021 02:05:56 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id k9sm16658777wrz.22.2021.10.05.02.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 02:05:55 -0700 (PDT)
Date: Tue, 5 Oct 2021 10:05:53 +0100
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
Subject: Re: [PATCH 01/10] backlight: qcom-wled: Pass number of elements to
 read to read_u32_array
Message-ID: <20211005090553.zoqzzz4767srvwzb@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-2-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004192741.621870-2-marijn.suijten@somainline.org>
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

On Mon, Oct 04, 2021 at 09:27:32PM +0200, Marijn Suijten wrote:
> of_property_read_u32_array takes the number of elements to read as last
> argument. This does not always need to be 4 (sizeof(u32)) but should
> instead be the size of the array in DT as read just above with
> of_property_count_elems_of_size.
> 
> To not make such an error go unnoticed again the driver now bails
> accordingly when of_property_read_u32_array returns an error.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/qcom-wled.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index d094299c2a48..6af808af2328 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1528,11 +1528,18 @@ static int wled_configure(struct wled *wled)
>  	string_len = of_property_count_elems_of_size(dev->of_node,
>  						     "qcom,enabled-strings",
>  						     sizeof(u32));
> -	if (string_len > 0)
> -		of_property_read_u32_array(dev->of_node,
> +	if (string_len > 0) {
> +		rc = of_property_read_u32_array(dev->of_node,
>  						"qcom,enabled-strings",
>  						wled->cfg.enabled_strings,
> -						sizeof(u32));
> +						string_len);
> +		if (rc) {
> +			dev_err(dev, "Failed to read %d elements from "
> +				"qcom,enabled-strings: %d\n",
> +				string_len, rc);
> +			return -EINVAL;
> +		}
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.33.0
> 
