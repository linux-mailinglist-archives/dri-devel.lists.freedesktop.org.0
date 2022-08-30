Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B1A5A60A1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 12:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970A610E028;
	Tue, 30 Aug 2022 10:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0763910E028
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 10:22:18 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m7so5948600lfq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 03:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ewFvocVNfh/1BMVRJJhj6y+q9DXa1cklPYO4jJJ+ZPI=;
 b=G9w+EHsaYTf3RTd0wF+VIfFaIZEtTiw4ylQgi2J4gfawcB7MJij1hAOQqp127Cp3sV
 9Tzei6RF70Zq7P0eHDXPdurkyOZKpYeFgoxBN0D5cMrM0uLxYqhKS0l/yQ44wCBmxaY1
 AUBPV/+Z8fqfQYJ8GHWpjeAs5IfSkBqKmy7vOWlOkf8c5T+fXxDFhYycK2i6UO53EhTY
 cG5QhtsblzJeRgBxxQjOmn9uK0CJfYkOLVZ3wmGlUZ6MuDmSfKC5y/ZbnjyB+sUEmXyL
 jv0sIEergg/34/jqdrJr6jA1UbDviYTis75trAfEUisn8YAmdt9KwvPDvprXRBd0r+Wp
 1VSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ewFvocVNfh/1BMVRJJhj6y+q9DXa1cklPYO4jJJ+ZPI=;
 b=U6lphUKOmJdPipooi4qU+VUf/O8Cen16DRIkCz/apa6/AMxxwYDClT9p7O+oJON1Ab
 cZeAQzOzFuWJMHyWwMcqZ94dimDR6kWYnJAdDT7d9whpPk6j4voZ52Fg2v7uOlR+rbCn
 PEvwpVURC2HL9EmLdYHdDSiaR28BnbuvDN0mhm/aWgHRkw5fDNLyELa9U3UF7sMqdCHa
 5HQuEIt0QKGSIv8fFgIihaxfTDP0yt65JumjmkTfZRBjj9XOLZtcqxz0bmP9mV0hDJlq
 s2tXqS8OW76+3kGRd+jT4Bpqk07pb53DwCDZw4DlKoxNA9bIgV1l62cawSiCMw8ujNbz
 5rlw==
X-Gm-Message-State: ACgBeo0frdgttzhToA2fh2qhX9pt9peKrdjp3DBD2rxRVjUWK6c3tI26
 K87E8sGF7Q/31tUq1Qfj7tA=
X-Google-Smtp-Source: AA6agR6roG+6pfy1GbA43X3JSuD5tBGJOEwN6P3O5bTo8eY5FYH8nUbstwZW9bi3uCb39lJN5D/lvA==
X-Received: by 2002:a19:911d:0:b0:494:6701:1d17 with SMTP id
 t29-20020a19911d000000b0049467011d17mr3991390lfd.31.1661854936337; 
 Tue, 30 Aug 2022 03:22:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1?
 (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
 by smtp.gmail.com with ESMTPSA id
 t17-20020ac25491000000b004946d1f3cc4sm613954lfk.164.2022.08.30.03.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 03:22:15 -0700 (PDT)
Message-ID: <a97be2ae-b7d2-2ecf-fa17-de2d8755fb83@gmail.com>
Date: Tue, 30 Aug 2022 13:22:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v9 05/10] lib: add linear range index macro
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, jic23@kernel.org, lars@metafoo.de,
 deller@gmx.de, broonie@kernel.org, andriy.shevchenko@linux.intel.com
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-6-peterwu.pub@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20220830034042.9354-6-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 szunichen@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com,
 andy.shevchenko@gmail.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/30/22 06:40, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add linear_range_idx macro for declaring the linear_range struct simply.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
> 
> v9
> - Revise LINEAR_RANGE() and LINEAR_RANGE_IDX()
> ---
>   include/linux/linear_range.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
> index fd3d0b3..2e4f4c3 100644
> --- a/include/linux/linear_range.h
> +++ b/include/linux/linear_range.h
> @@ -26,6 +26,17 @@ struct linear_range {
>   	unsigned int step;
>   };
>   
> +#define LINEAR_RANGE(_min, _min_sel, _max_sel, _step)		\
> +	{							\
> +		.min = _min,					\
> +		.min_sel = _min_sel,				\
> +		.max_sel = _max_sel,				\
> +		.step = _step,					\
> +	}
> +
> +#define LINEAR_RANGE_IDX(_idx, _min, _min_sel, _max_sel, _step)	\
> +	[_idx] = LINEAR_RANGE(_min, _min_sel, _max_sel, _step)
> +
>   unsigned int linear_range_values_in_range(const struct linear_range *r);
>   unsigned int linear_range_values_in_range_array(const struct linear_range *r,
>   						int ranges);


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
