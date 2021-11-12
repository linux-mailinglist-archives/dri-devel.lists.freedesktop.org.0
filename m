Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49E44E62A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 13:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1086EBA5;
	Fri, 12 Nov 2021 12:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B92F6EBA5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 12:12:42 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i5so15177502wrb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 04:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5L2Z7i/0CCqj4qb/ptThJtLoV5s4peBITQWmOlmcr4w=;
 b=K6OPlt8n0su7sJba65ho82L+iscKRWX0PKA21FHR/DlVVcSdPnmjXAFbHnU6uaULW1
 S82bMEO6xvtuLAg5bZqiEOYmdUR2KM0upRnbx9vNPNvpgb4RSj58EUseN4AVjIRAkB5L
 MDGyD3qJDE4+KMUPiG4LtYCpirRCVvNnIUx/CHqYDaZ2MzeST1RZvG0xGbgaeUetOJdg
 hXc7fK0QTM0uNneghNMvOB4I3qVsNqTmJjOO2kEcGkKxDsEfxjYx5stvsVraiFayFLq8
 v0ciAQUv3amurEpu9TuZOZw+c5Zmq82M2ibXCzqqpJeZpJS9T4sYc/BibbUJORlVcYY/
 8o+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5L2Z7i/0CCqj4qb/ptThJtLoV5s4peBITQWmOlmcr4w=;
 b=1Ku1GT+3Qdg3NkHOKPwJe6FtmvdxXQDGNWwumkgPpps7JtVrU2NYFm+hEvmZ+8B4yT
 lDZ84F9zqONyd4Ej9x6TlrMPvHZ77uByxfV7cL1bh2e/crDX/zHT+xCZjyXlRb87Ay6z
 TSPFekl3jPhvWNbaMCsRHoWqircV7CIdHCFd8QRCo6oSidnFz0Epsr0Rc9bCmGKKHI1m
 VAom/um+m4CEPO1vrJb+0e+gFCUahfSlMAfy9WTB2iwGHYzkg/kpS6/rlo2GCkPtIZN4
 vsvcXyVj3WSOS/YwyKdt7qJdeIC0aOX4IZkAHEvGiN3jnvh5avm4I/etULIZhAlWQjXl
 M8Tw==
X-Gm-Message-State: AOAM530LZxBiZyTnBkGWJgYz6S5b70Vvoq8MkYse9JidrOiT/RrMf4eH
 koGPcRUFb4CH04OpUObr2SrMww==
X-Google-Smtp-Source: ABdhPJwSoDj507/aCQM/WzT+a0qkAA0exwa5MasbTkeo/oIGwJwB/uRaHhbTrB74j5Xw2jPJcG/3dg==
X-Received: by 2002:a5d:548d:: with SMTP id h13mr17640686wrv.30.1636719161128; 
 Fri, 12 Nov 2021 04:12:41 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id g13sm5234966wmk.37.2021.11.12.04.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 04:12:40 -0800 (PST)
Date: Fri, 12 Nov 2021 12:12:38 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [RESEND PATCH v2 05/13] backlight: qcom-wled: Override default
 length with qcom,enabled-strings
Message-ID: <20211112121238.kb3kkt6xzv5so26j@maple.lan>
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
 <20211112002706.453289-6-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112002706.453289-6-marijn.suijten@somainline.org>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 01:26:58AM +0100, Marijn Suijten wrote:
> The length of qcom,enabled-strings as property array is enough to
> determine the number of strings to be enabled, without needing to set
> qcom,num-strings to override the default number of strings when less
> than the default (which is also the maxium) is provided in DT.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index c5232478a343..9bfbf601762a 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1518,6 +1518,8 @@ static int wled_configure(struct wled *wled)
>  				return -EINVAL;
>  			}
>  		}
> +
> +		cfg->num_strings = string_len;

I still don't really understand why this wants to be a separate patch.

The warning text emitted by the previous patch (whatever text we agree
on) will be nonsense until this patch is applied.

If this patch cannot appear before the warning is introduces then there
is no correct order for patches 4 and 5 (which implies they should be the
same patch).


Daniel.
