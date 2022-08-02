Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5316558777F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 09:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9359D12A0E5;
	Tue,  2 Aug 2022 07:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721C611AD09
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 07:06:35 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id h12so14656391ljg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=YyBYmLXFn5IFerrIXB88rk828Nzxi3yZBlN5vWZi/gM=;
 b=cqShYtc7B4W7+q0vK7VkTMRnsYgBNGzLw6e2P8pZuRkHXrMnlMerLmoE/2weJs4sSA
 ocXKFpxuWtWtb1fhSYbnxLu9yBchBRsggPdcY+GsiMqQxQzl00PcrID3nMwsn5j9ljUn
 Q2q45sZ0s6MZWe2aMQmOCqU3abPyz7zyeyliIBvgJZlj/OJ2VmjEBuPNg2NKYSZqJV2f
 Ba5lIM6m2qZ7Q8GEkOJJ7xmwxGbFeEGtWqzPlCAIjZVbwXph3xyaIznRTbSr/mrwh18N
 idKySTQiWRH+Y6UU3DZwyzzDiy5UABGQzp8uHK8B+9SG0ZaLpx4iZXISVU0aDf2GPW/L
 sVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=YyBYmLXFn5IFerrIXB88rk828Nzxi3yZBlN5vWZi/gM=;
 b=SZCmuqZMTdfq/R4Q4Ccn5/kUR7T2vYgfTxr/FNEC5qOH4ygG2Cahn3eAGBPmv2rZrr
 5fcw7ynsa361H5F/Rj01adxRel6e43DqMCkh7nGO75Z+92cSbbWCmqrCxBVg1iQhHY9c
 htoLl75h3okSJjRlt3v3wK6deyPV4uTsbTxzOWfLAbtvCTq2EFzd6mDvuv5VEzFZxK+W
 Og+mUcc1uU4gzacYvhNm2fSAgKW3rMYcELFV2ZXUg5lq9IHCc4KCsErZLwi56Gw2MzWn
 0TwaLwhlBfzof7Db3mUrQkTln3RQlwgteyzofJG1Sh7NDvIgSDTP/nCoQEKIBL74k8F0
 mBzw==
X-Gm-Message-State: AJIora+H2yT2JL0sKjLYRAkTfmLdcw6JNRaW5AmgdmXwTpWbdhAVheGF
 6kpthdagZx6SITl21cr0IZq3eQ==
X-Google-Smtp-Source: AGRyM1vyFzsFMTCPRJxtHWx7y5a7FMF92v+tAByHTMxUB/MOjUpdCznNzN7CY7oLLyxTnSAivEK0hg==
X-Received: by 2002:a2e:bd0a:0:b0:25d:d2a3:7366 with SMTP id
 n10-20020a2ebd0a000000b0025dd2a37366mr6103917ljq.35.1659423993628; 
 Tue, 02 Aug 2022 00:06:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a05651236c100b0048afa5daaf3sm629717lfs.123.2022.08.02.00.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 00:06:33 -0700 (PDT)
Message-ID: <43d19449-cf06-2302-b536-4ade5f79c5fd@linaro.org>
Date: Tue, 2 Aug 2022 10:06:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] clk: qcom: Allow custom reset ops
Content-Language: en-GB
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220730144713.2.I4b69f984a97535179acd9637426a1331f84f6646@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220730144713.2.I4b69f984a97535179acd9637426a1331f84f6646@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/07/2022 12:17, Akhil P Oommen wrote:
> Add support to allow soc specific clk drivers to specify a custom reset
> operation. A consumer-driver of the reset framework can call
> "reset_control_reset()" api to trigger this.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
>   drivers/clk/qcom/reset.c | 6 ++++++
>   drivers/clk/qcom/reset.h | 2 ++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/reset.c b/drivers/clk/qcom/reset.c
> index 819d194..4782bf1 100644
> --- a/drivers/clk/qcom/reset.c
> +++ b/drivers/clk/qcom/reset.c
> @@ -13,6 +13,12 @@
>   
>   static int qcom_reset(struct reset_controller_dev *rcdev, unsigned long id)
>   {
> +	struct qcom_reset_controller *rst = to_qcom_reset_controller(rcdev);
> +	const struct qcom_reset_map *map = &rst->reset_map[id];
> +
> +	if (map->op)
> +		return map->op(map);

This looks like a hack. For example, assert() and deassert() would still 
follow the usual pattern of updating the bits. Please at least make them 
return -EOPNOTSUP if map->op is defined.

A slightly better solution would be to make qcom_reset implementation 
optional (and depending on desc->num_resets being greater than 0). Then 
you can register your own reset controller implementation from the gpucc 
driver.


> +
>   	rcdev->ops->assert(rcdev, id);
>   	udelay(1);
>   	rcdev->ops->deassert(rcdev, id);
> diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
> index 2a08b5e..295deeb 100644
> --- a/drivers/clk/qcom/reset.h
> +++ b/drivers/clk/qcom/reset.h
> @@ -11,6 +11,8 @@
>   struct qcom_reset_map {
>   	unsigned int reg;
>   	u8 bit;
> +	int (*op)(const struct qcom_reset_map *map);
> +	void *priv;
>   };
>   
>   struct regmap;


-- 
With best wishes
Dmitry
