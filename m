Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F7F69CAD9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 13:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B25710E115;
	Mon, 20 Feb 2023 12:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3066810E115
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 12:25:47 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id o14so1120475wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 04:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhuNX7zk4hZihBAY5sZG0csyVV6AYylCGdugAnsAC6c=;
 b=bPba3qLwuP3pL5YFqhCwvExtNWIznWHdFR4XAXSWPf0VlwLp3X4gk+vhiYZBF3OCJB
 +4ozenOOlX3dJ/BMfSl1I7nbv+4Wwr8BGYHqFrEq6/zebScqZhGU7To/OG33/EIlPRT7
 M+9e/UeO0I0d2UIeOy+DsB19ih2wSBOe8cRr0z1lTPt5VdBO5JdBzoebAvZnImBSg23A
 yK4OMN0MfJlj0WW4lStMk5mkiowmWQnxJ7CXOZT7yMuChSPRjKzssAqWKgPqqP6loVUg
 zuJEUUlNrRfJDRKiIE8sEXk2EDL6lrTw+gRTiWg1S6zzPItFUW1sJ/tohDunfoSjrsL8
 biaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhuNX7zk4hZihBAY5sZG0csyVV6AYylCGdugAnsAC6c=;
 b=XF+uUN8gILOOfpsrEae5e7gp+9SJdJsmKrDqLpR1jXkFu6o8nr2vPgb68cSJ60MCVc
 Em+1UO0f0jKtnosT79+9iaYfQ06EDNMkUAYoTyXMQb4gGTMZ/GDIsSnnfnLcAw0aFSYq
 Eoc1OaftQDgHGtaWUMVMa/PR6Hwbp6J8hWVTRmc+49r9HnLQ4aPRcdoNdvZNOr6tJ9V7
 KN+Jk29i7R/ri53poShK45332IyllpXlDcl3YeJjluxr+FitnqYQLm+dlL2ZQsAOkcP6
 DfMq4cyG6pPweJtp/Zw5CGJqaimgo4g33IchFacokmJp0Sd1CVDAWMqBI3ITN7qeKodg
 YzUA==
X-Gm-Message-State: AO0yUKXcgbhb57CXtWGLIDdy140wvKfdNxsejhIer0ZTLQScaHNWoG12
 ZHGkYXfOcXjwvPwX7b5ngXYxMg==
X-Google-Smtp-Source: AK7set8fM14qE0F61S6lht5sfkP3yhezdAmuiQBgst8exmUIwWFYJljR5sQgrg0d08gSACnwp/jIVA==
X-Received: by 2002:a05:600c:1d9c:b0:3df:9858:c032 with SMTP id
 p28-20020a05600c1d9c00b003df9858c032mr716208wms.7.1676895945499; 
 Mon, 20 Feb 2023 04:25:45 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 e16-20020adfe390000000b002c54c8e70b1sm1542169wrm.9.2023.02.20.04.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 04:25:44 -0800 (PST)
Date: Mon, 20 Feb 2023 12:25:42 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH] backlight: qcom-wled: Add PMI8950 compatible
Message-ID: <Y/NmxjZgo9V6Enad@aspen.lan>
References: <20221226-msm8953-6-2-wled-v1-1-e318d4c71d05@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221226-msm8953-6-2-wled-v1-1-e318d4c71d05@z3ntu.xyz>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 06, 2023 at 08:58:30PM +0100, Luca Weiss wrote:
> PMI8950 contains WLED of version 4. Add support for it to the driver.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> While adding dt-bindings and dts in a previous series I forgot to add the
> compatible to the driver. Fix that now.
> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 527210e85795..5f504883aca5 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1731,6 +1731,7 @@ static int wled_remove(struct platform_device *pdev)
>
>  static const struct of_device_id wled_match_table[] = {
>  	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
> +	{ .compatible = "qcom,pmi8950-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
>
> ---
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> change-id: 20221226-msm8953-6-2-wled-5f966bfa4db3
>
> Best regards,
> --
> Luca Weiss <luca@z3ntu.xyz>
>
