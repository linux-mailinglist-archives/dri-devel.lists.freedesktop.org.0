Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A642C9956
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6133A6E519;
	Tue,  1 Dec 2020 08:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB206E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 16:19:53 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id p126so3699580oif.7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 08:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BODYfYTeDSugp1RxBgS7anYBagSna9CL1uemvUvDkss=;
 b=Z64+fGze7U4fK9y//5Jw+dCXti/GNHvXBUKcQ5kt7bBRn3l30mVR9h+HisK1syj/ag
 q8cUQVjzMmRi35Nx4lDFD2rBEsLt5wAr16JA9xwke+XjnKg+RpdJqf6zQcbxtrOMXOHL
 EIl9VtOIZTrgRty8fmpLST1u+bJwqYCUSmci5rIMaYnQKgraHvAeV99VESAS9E+VHjBN
 UlFahOSzmKSwQuTaLzozKP+cuouHrtNvK7tr0AcmxLQoVwrKrzbYNodrVJH1/5f0z1YV
 VrNzuK8U9A1GDdCamxsbu1k5ZaRcOJOtOGgUa6e3gwKQSW37geLZUEAyCOTaW1sDyg8N
 a8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BODYfYTeDSugp1RxBgS7anYBagSna9CL1uemvUvDkss=;
 b=aeNOAVWwwacZOIUBM28KZB9E7t0HwuTkYeQMx5FiNthAJFBWRbfaUILWIojWqKLZBF
 nazf9D7F1c7qoz5ik8GusvX/kN3SXVLkjeHAEVLJfS/H4aLQRedbJQOyHdpUg3Ut3wZq
 J1qBlSBlVfNirPJg7rnUc36VbqkAvlAu8eneTJFgF4/Udx0yrVBqKeZIMVY68oyreRSC
 9MtNWj/pzCLOZiUxjvMJ2AtZ76uWD/FeTu4fOJXcU0SdGbvKUq1s31gdp3SqSqiJuT1U
 RRYtJP452VxBEyzDlBQ2LpgLwQaqP0xgO0KcU9taYOQtV76vLP/beMvkaPD8/2DadRbB
 yVEQ==
X-Gm-Message-State: AOAM531Es/NAv+cc6UCcqe23Toq5bsATph4O5benj5e/Ifr7fVAWfYbk
 N7IdD4IEvdyYk67CQ1c5oRZQAA==
X-Google-Smtp-Source: ABdhPJxbRslQGEjyt6Cd+u2rMfIzAuqSmYGsdkYghoA43A9HKWbbqhWgDXAW9Jxi8x9KxlLSfFqcdA==
X-Received: by 2002:aca:90c:: with SMTP id 12mr15118936oij.15.1606753192894;
 Mon, 30 Nov 2020 08:19:52 -0800 (PST)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com.
 [173.175.113.3])
 by smtp.gmail.com with ESMTPSA id a4sm10047503oot.6.2020.11.30.08.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 08:19:52 -0800 (PST)
Subject: Re: [PATCH] Revert "i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630"
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, Akash Asthana <akashast@codeaurora.org>,
 Mukesh Savaliya <msavaliy@codeaurora.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Wolfram Sang <wsa@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
References: <20201124185743.401946-1-bjorn.andersson@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <f5aca410-f964-07d4-e18a-e438881e37cc@kali.org>
Date: Mon, 30 Nov 2020 10:19:51 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201124185743.401946-1-bjorn.andersson@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/24/20 12:57 PM, Bjorn Andersson wrote:
> A combination of recent bug fixes by Doug Anderson and the proper
> definition of iommu streams means that this hack is no longer needed.
> Let's clean up the code by reverting '127068abe85b ("i2c: qcom-geni:
> Disable DMA processing on the Lenovo Yoga C630")'.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index dce75b85253c..046d241183c5 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -353,13 +353,11 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  {
>  	dma_addr_t rx_dma;
>  	unsigned long time_left;
> -	void *dma_buf = NULL;
> +	void *dma_buf;
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> -		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> -
> +	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else
> @@ -394,13 +392,11 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  {
>  	dma_addr_t tx_dma;
>  	unsigned long time_left;
> -	void *dma_buf = NULL;
> +	void *dma_buf;
>  	struct geni_se *se = &gi2c->se;
>  	size_t len = msg->len;
>  
> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> -		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
> -
> +	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>  	if (dma_buf)
>  		geni_se_select_mode(se, GENI_SE_DMA);
>  	else

Tested-by: Steev Klimaszewski <steev@kali.org>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
