Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33142933A7E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 11:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6F410E091;
	Wed, 17 Jul 2024 09:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KaxFDYeV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92D110E091
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 09:58:05 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1fb457b53c8so53638985ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721210285; x=1721815085; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oFYkOL5E3FUWqtNNaC4rEpQsyl0OqCKhsiSOdcp83/4=;
 b=KaxFDYeV/OlAeXjGRtrAgXWMFAkamUZnnzbGbarufK8hTeqBVHSO+/L2w0nfC+dAYz
 zZXM0fVdoGN53dOoV6MM8F8frSAAWQBV8foQu5p/k8yOxOVzwVKpmu362jjrC+keOqQw
 R0u1gHXc204Rw17o7+QtIzdkCVR7Is80Dji5qN/DK0eVmu0pBpLKDlrpD5oUePpbXzsD
 Eu1x4JnGpoLGrRevho9crbFYIGpyUw1FRUQSqG85Ox1yB3Tq6BKFgSs+xhgkceAQEkgf
 oJTJM6xvbfNpQkopyAjCzm8reP1j3uAe4c13ZPCL12VfORtCGh2fmSAWoODkG2kU86S8
 PS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721210285; x=1721815085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oFYkOL5E3FUWqtNNaC4rEpQsyl0OqCKhsiSOdcp83/4=;
 b=VyMSd7Razyn3NktiBf2gKD7It+KYK1BdjSikdDeWW5gpUiROVnRjCBeUmmxhN1trYq
 QgOAqNvB96ZuMxoroNKmzIBk1Sf1KLFJ2I1LxNWKSA99NIVUunlEFQA4BQI40d341wvK
 Oy5JBV6OGtnrzdHJIQ0sFhiKKw/Dx02df6X2Mj4ZHmOLEMYjH4LczYDIdZsFilHXddw8
 YSPahjVRt/47adiKnCYwFP8gv5vuC9it4rjOANAE4cRgusfcx/jgTrsM+YGwI6eTXMj/
 royDxqrD7qwBl8AcpqQXftbLYEg14vvVhors0JcSL2Lzz8U4TwbB6L9pfUpbXJZhe5Qi
 vueQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbUO+KabWqlH/Ma9dTON2mPAXCxG1glQMooqyf147ki1ZZ2+yoB7nFdyqbhBaPrdZvGXfzc2y1bUmnQBRqbgLqhwgwdQaC5oUxCDQQ/EiA
X-Gm-Message-State: AOJu0Yz/AUP7ZxCqAi9+Ke3Kjqo0ePJoO+WQ3c/oV69YX7t3/lrNvsgC
 kfcl0IdUiu8UgvmQutfbgVhI5oET7tu072zFHt11kmAMkhfwEizQ
X-Google-Smtp-Source: AGHT+IF6jklU2qTTvW7oJDrVGWHRFiQz/zOOy3QZsnyKcee6qfXg0v/DPwwUFemay4LgIhgTbeO6Vg==
X-Received: by 2002:a17:902:e548:b0:1fb:7c7f:6447 with SMTP id
 d9443c01a7336-1fc4e56517emr7554345ad.25.1721210285141; 
 Wed, 17 Jul 2024 02:58:05 -0700 (PDT)
Received: from [10.3.80.76] ([59.152.80.69]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bb6f4f3sm71986755ad.17.2024.07.17.02.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 02:58:04 -0700 (PDT)
Message-ID: <a05b4e6e-272a-43be-8202-2b81049a41a4@gmail.com>
Date: Wed, 17 Jul 2024 15:28:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mipi-dsi: Introduce macros to create mipi_dsi_*_multi
 functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dianders@chromium.org, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240716133117.483514-1-tejasvipin76@gmail.com>
 <p7fahem6egnooi5org4lv3gtz2elafylvlnyily7buvzcpv2qh@vssvpfci3lwn>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <p7fahem6egnooi5org4lv3gtz2elafylvlnyily7buvzcpv2qh@vssvpfci3lwn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/16/24 10:31 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 16, 2024 at 07:01:17PM GMT, Tejas Vipin wrote:
>> Introduce 2 new macros, DSI_CTX_NO_OP and MIPI_DSI_ADD_MULTI_VARIANT.
>>
>> DSI_CTX_NO_OP calls a function only if the context passed to it hasn't
>> encountered any errors. It is a generic form of what mipi_dsi_msleep
>> does.
>>
>> MIPI_DSI_ADD_MULTI_VARIANT defines a multi style function of any
>> mipi_dsi function that follows a certain style. This allows us to
>> greatly reduce the amount of redundant code written for each multi
>> function. It reduces the overhead for a developer introducing new
>> mipi_dsi_*_multi functions.
>>
>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>> ---
>>  drivers/gpu/drm/drm_mipi_dsi.c | 286 ++++++++++-----------------------
>>  1 file changed, 83 insertions(+), 203 deletions(-)
>>
> 
> [...]
> 
>> -void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
>> -				    enum mipi_dsi_dcs_tear_mode mode)
>> -{
>> -	struct mipi_dsi_device *dsi = ctx->dsi;
>> -	struct device *dev = &dsi->dev;
>> -	ssize_t ret;
>> -
>> -	if (ctx->accum_err)
>> -		return;
>> -
>> -	ret = mipi_dsi_dcs_set_tear_on(dsi, mode);
>> -	if (ret < 0) {
>> -		ctx->accum_err = ret;
>> -		dev_err(dev, "sending DCS SET_TEAR_ON failed: %d\n",
>> -			ctx->accum_err);
>> -	}
>> -}
>> -EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_on_multi);
>> +#define MIPI_DSI_ADD_MULTI_VARIANT(proto, err, inner_func, ...)	\
>> +proto {								\
>> +	struct mipi_dsi_device *dsi = ctx->dsi;			\
>> +	struct device *dev = &dsi->dev;				\
>> +	int ret;						\
>> +	\
>> +	if (ctx->accum_err)					\
>> +		return;						\
>> +	\
>> +	ret = inner_func(dsi, ##__VA_ARGS__);			\
>> +	if (ret < 0) {						\
>> +		ctx->accum_err = ret;				\
>> +		dev_err(dev, err, ctx->accum_err);		\
>> +	}							\
>> +}								\
>> +EXPORT_SYMBOL(inner_func##_multi);
>> +
>> +MIPI_DSI_ADD_MULTI_VARIANT(
>> +	void mipi_dsi_picture_parameter_set_multi(
>> +	struct mipi_dsi_multi_context *ctx,
>> +	const struct drm_dsc_picture_parameter_set *pps),
>> +	"sending PPS failed: %d\n",
>> +	mipi_dsi_picture_parameter_set, pps);
> 
> I'd say that having everything wrapped in the macro looks completely
> unreadable.
> 
> If you really insist, it can become something like:
> 
> MIPI_DSI_ADD_MULTI_VARIANT(mipi_dsi_picture_parameter_set
> 	MULTI_PROTO(const struct drm_dsc_picture_parameter_set *pps),
> 	MULTI_ARGS(pps),
> 	"sending PPS failed");
> 
> (note, I dropped the obvious parts: that the funciton is foo_multi, its
> return type is void, first parameter is context, etc).
> 
> However it might be better to go other way arround.
> Do we want for all the drivers to migrate to _multi()-kind of API? If
> so, what about renaming the multi and non-multi functions accordingly
> and making the old API a wrapper around the multi() function?
> 

I think this would be good. For the wrapper to make a multi() function
non-multi, what do you think about a macro that would just pass a 
default dsi_ctx to the multi() func and return on error? In this case
it would also be good to let the code fill inline instead of generating
a whole new function imo. 

So in this scenario all the mipi dsi functions would be multi functions,
and a function could be called non-multi like MACRO_NAME(func) at the
call site.

I also think there is merit in keeping DSI_CTX_NO_OP.

What do you think?

-- 
Tejas Vipin
