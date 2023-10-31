Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF47DCB93
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 12:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5530910E157;
	Tue, 31 Oct 2023 11:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CD210E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 11:16:07 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507c8316abcso7823671e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698750965; x=1699355765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hJu2yLllJ94MBomatNabmyNQ4Uloi0vS+isN5mDPCt0=;
 b=G5+2Qv2Fx1MOB2XtQBQLX1Jz0GRXq0uAJECTTzZpq+iBv5hhWY0sd/Zq+q1eu78Nzk
 ZXWZ0XwTRX54u9AJvsMn5fZqm4lZnJXVGXlPZODfHTgDbFi4sPnEHvZrJfkQej5snQIl
 oEfYg3PXC27ZchKdMkd31qw5TPy3STK4ra0Hq55wVspuDXbdVmDA6iCSEW9hJhc+Cfhb
 LFSedBzIOv7OdtfiSpTdiE5tjCL5tvFRowQDKD46GrYKyavWC3CSKIvi2L5CcsrYwED5
 bHAhT7ALlFbobJPim59RFPeKJNLuASfyieiP3MSXLXUh/wBJbHq+HrzGpqacQHV2HRLm
 ElrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698750965; x=1699355765;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hJu2yLllJ94MBomatNabmyNQ4Uloi0vS+isN5mDPCt0=;
 b=TAILRAQbDr87d+UJ+pAEusUzs7XgmQKo8x0HABSecNHe0IL09/viGCGWs59k5WhKIG
 ack8fa8xs7PdfjjRtMJVElfpaoEc65gt74N7gXGCwQJ+rO2d8DhyKg08DcB0becsmVo1
 4SzmRAZekhpBDbBxl8IPNmsDdHf1/0rhRThLpX0MrTR8LfcpDqJjEGP3WalJEfoczmx7
 XaiRHJBlnvti19u9mSR2Zmz8ejI0tTHppPPz1M21lppSF96Xa7IyGdTcuh6qIJBTwThq
 Na0NLqBukvVhh2E/Bvqj4LH0YM8+8xhLbqdmyEJ4xQQYVHxI0JIi4KOXh8OJd/Nwk6vw
 yBnQ==
X-Gm-Message-State: AOJu0Yy6ukcryYiA1CkwaTG5X4zfMSDuwn1DiZR+q1juRkz+SkctqDo1
 g37Nbq/HiCHzEoEL5H9nKL1abg==
X-Google-Smtp-Source: AGHT+IHxZpOgWXPogwfe9mGa8MdZqaC12TgzQiZMNeuhq/Y1ScximNnSKTqRhS/LRgGekXZxobp+yA==
X-Received: by 2002:a05:6512:370c:b0:503:1c58:8a46 with SMTP id
 z12-20020a056512370c00b005031c588a46mr8812041lfr.9.1698750965529; 
 Tue, 31 Oct 2023 04:16:05 -0700 (PDT)
Received: from [192.168.143.96]
 (178235177091.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.91])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a056512119400b0050318bdad45sm181224lfr.64.2023.10.31.04.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 04:16:05 -0700 (PDT)
Message-ID: <2202b6e6-afe0-4bce-bdb5-43a7c5c4162f@linaro.org>
Date: Tue, 31 Oct 2023 12:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] phy: qualcomm: add MSM8974 HDMI PHY support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-7-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <20230928111630.1217419-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.09.2023 13:16, Dmitry Baryshkov wrote:
> Add support for HDMI PHY on Qualcomm MSM8974 / APQ8074 platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
I only have a few style comments (and timers-howto.txt fixes)

[...]

> +#define HDMI_8974_VCO_MAX_FREQ 1800000000UL
> +#define HDMI_8974_VCO_MIN_FREQ  600000000UL
> +
> +#define HDMI_8974_COMMON_DIV 5
> +
> +static void qcom_uniphy_setup(void __iomem *base, unsigned int ref_freq,
> +			      bool sdm_mode,
> +			      bool ref_freq_mult_2,
> +			      bool dither,
> +			      unsigned int refclk_div,
> +			      unsigned int vco_freq)
> +{
> +	unsigned int int_ref_freq = ref_freq * (ref_freq_mult_2 ? 2 : 1);
> +	unsigned int div_in_freq = vco_freq / refclk_div;
> +	unsigned int dc_offset = div_in_freq / int_ref_freq - 1;
> +	unsigned int sdm_freq_seed;
> +	unsigned int val;
> +	unsigned int remain = div_in_freq - (dc_offset + 1) * int_ref_freq;
> +	sdm_freq_seed = mult_frac(remain, 0x10000, int_ref_freq);
> +
> +	val = (ref_freq_mult_2 ? BIT(0) : 0) |
> +		((refclk_div - 1) << 2);
> +	writel(val, base + UNIPHY_PLL_REFCLK_CFG);
> +
> +	writel(sdm_mode ? 0 : 0x40 + dc_offset, base + UNIPHY_PLL_SDM_CFG0);
> +
> +	writel(dither ? 0x40 + dc_offset: 0, base + UNIPHY_PLL_SDM_CFG1);
> +
> +	writel(sdm_freq_seed & 0xff, base + UNIPHY_PLL_SDM_CFG2);
The ternary operator doesn't really improve readability here, imo

> +
> +	writel((sdm_freq_seed >> 8) & 0xff, base + UNIPHY_PLL_SDM_CFG3);
> +
> +	writel(sdm_freq_seed >> 16, base + UNIPHY_PLL_SDM_CFG4);
> +
> +	ref_freq = ref_freq * 5 / 1000;
> +	writel(ref_freq & 0xff, base + UNIPHY_PLL_CAL_CFG8);
> +
> +	writel(ref_freq >> 8, base + UNIPHY_PLL_CAL_CFG9);
> +
> +	vco_freq /= 1000;
> +	writel(vco_freq & 0xff, base + UNIPHY_PLL_CAL_CFG10);
> +
> +	writel(vco_freq >> 8, base + UNIPHY_PLL_CAL_CFG11);
> +}
> +
> +static unsigned long qcom_uniphy_recalc(void __iomem *base, unsigned long parent_rate)
> +{
> +	unsigned long rate;
> +	u32 refclk_cfg;
> +	u32 dc_offset;
> +	u64 fraq_n;
> +	u32 val;
> +
> +	refclk_cfg = readl(base + UNIPHY_PLL_REFCLK_CFG);
> +	if (refclk_cfg & BIT(0))
Can we name this bit?

> +		parent_rate *= 2;
> +
> +	val = readl(base + UNIPHY_PLL_SDM_CFG0);
> +	if (val & 0x40) {
BIT(6)? can we name it?

> +		dc_offset = val & 0x3f;
GENMASK?

> +		fraq_n = 0;
> +	} else {
> +		dc_offset = readl(base + UNIPHY_PLL_SDM_CFG1) & 0x3f;
GENMASK?
> +		fraq_n = readl(base + UNIPHY_PLL_SDM_CFG2) |
> +			(readl(base + UNIPHY_PLL_SDM_CFG3) << 8);
FIELD_PREP?

> +	}
> +
> +	rate = (dc_offset + 1) * parent_rate;
> +	rate += mult_frac(fraq_n, parent_rate, 0x10000);
> +
> +	rate *= (refclk_cfg >> 2) * 0x3 + 1;
3 would be more clear than 0x3 imo

[...]
> +	udelay(50);
usleep_range

[...]

> +	udelay(200);
usleep_range

> +
> +	return 0;
> +}
> +
> +static int qcom_hdmi_msm8974_phy_pll_enable(struct qcom_hdmi_preqmp_phy *hdmi_phy)
> +{
> +	int ret;
> +	unsigned long status;
> +
> +	/* Global enable */
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_GLB_CFG, 0x81);
> +
> +	/* Power up power gen */
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8x74_PD_CTRL0, 0x00);
> +	udelay(350);
usleep_range

> +
> +	/* PLL power up */
> +	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x01);
> +	udelay(5);
> +
> +	/* Power up PLL LDO */
> +	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x03);
> +	udelay(350);
usleep_range

> +
> +	/* PLL power up */
> +	hdmi_pll_write(hdmi_phy, UNIPHY_PLL_GLB_CFG, 0x0f);
> +	udelay(350);
usleep_range

> +
> +	/* Poll for PLL ready status */
> +	ret = readl_poll_timeout(hdmi_phy->pll_reg + UNIPHY_PLL_STATUS,
> +				 status, status & BIT(0),
magic bit name?

> +				 100, 2000);
> +	if (ret) {
> +		dev_warn(hdmi_phy->dev, "HDMI PLL not ready\n");
> +		goto err;
> +	}
> +
> +	udelay(350);
usleep_range

Konrad
