Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E42338E771
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EC86E578;
	Mon, 24 May 2021 13:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85F86E581
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 13:27:48 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id r5so40644692lfr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WlD4zojrALQJ3lMjLIav5M7SKi5ELnimDryncsQ/eew=;
 b=n+janOnwDY0e+M/oqh/h5lp+KO3spsFId0m8fYDlrunNShBYLSDx99+oihuZFnQrKb
 p+yan76rURm+le3301pH9UEAHBSF0dey5vrlm3Gz229XQARguK7u66/P97HssAFcT/kL
 Q49eHUPqimmyUiQr6+ylw0QD1G4lGXs8AkPEBnBLotdqPQBDLtjMzykFtPq2T5Ws7ji4
 T3939zY0oAjChf4BxQA6FJtqXJ9v7+VEwVKHVz5rrYoQHKzTxSqRSuy7obS/A1EYKgEC
 QvRJpo3uM/ObkgZRe1RsNhDvL4Ba93MVrtleRksDndDfVqsZFcD2SfNhkyuXJhMWVZCc
 NIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WlD4zojrALQJ3lMjLIav5M7SKi5ELnimDryncsQ/eew=;
 b=uByEyeNuwBQ1JfIAXQaiyElWNAyH7Q9PySAIGRNXEBU1pZpQ2gpwfyRViV4ReZBrns
 xFU/aQiDw+rrP1Z4m7zfdlg+HiFzu/oafEPTQnu08BM+jeTl20xsn5tVrJiQYZp2J+kK
 Hofef0x7yBpXs1nk4fOJr2R6/bqR77ceJoKgMUAKdAlAHnytrEepWekj43VUevqSnrFM
 AN9ExbCAscqAQbRlNWRQHZBLJtSNXTqKI67TNOrqxgMKHKTdPOLZrQ1sBP30fG3xrAQq
 XRYd/cmwn91LOkUfBwc/c/nhLBnGqpgyC4A0YT3O/0B6teXtFHDGGCHKCwPso7TwWf7S
 k2Fw==
X-Gm-Message-State: AOAM530AT08THUtb2XVYBW+neH6qEi45//NRHchOHRJ4L6pB3wjzPdim
 V39r4o/Ejpf50UiXILzc5sw=
X-Google-Smtp-Source: ABdhPJx21C2ia2YRPJ+KM6HGkOOUDyuFOa4OvvZsYw21/Dc6XaNds85PS5+Mk5I/jXr0R6uagP0uBw==
X-Received: by 2002:a05:6512:3dac:: with SMTP id
 k44mr10709502lfv.256.1621862867427; 
 Mon, 24 May 2021 06:27:47 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru.
 [109.252.193.110])
 by smtp.googlemail.com with ESMTPSA id a25sm1763802ljp.11.2021.05.24.06.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 06:27:47 -0700 (PDT)
Subject: Re: [PATCH -next] media: staging: tegra-vde: Fix error return code in
 tegra_vde_probe()
To: Wei Yongjun <weiyongjun1@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210524133550.2363884-1-weiyongjun1@huawei.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <db911ac9-2d08-ae30-03ea-dfb7db964441@gmail.com>
Date: Mon, 24 May 2021 16:27:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210524133550.2363884-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Hulk Robot <hulkci@huawei.com>, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

24.05.2021 16:35, Wei Yongjun пишет:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: dc8276b78917 ("staging: media: tegra-vde: use pm_runtime_resume_and_get()")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> index e025b69776f2..321d14ba2e56 100644
> --- a/drivers/staging/media/tegra-vde/vde.c
> +++ b/drivers/staging/media/tegra-vde/vde.c
> @@ -1071,7 +1071,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
>  	 * power-cycle it in order to put hardware into a predictable lower
>  	 * power state.
>  	 */
> -	if (pm_runtime_resume_and_get(dev) < 0)
> +	err = pm_runtime_resume_and_get(dev);
> +	if (err < 0)
>  		goto err_pm_runtime;
>  
>  	pm_runtime_put(dev);
> 

pm_runtime_resume_and_get() doesn't return positive values, the previous
variant was okay.

You should also version your patches and add changelog.
