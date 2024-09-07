Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F969700E7
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 10:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CD610E204;
	Sat,  7 Sep 2024 08:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cvH8XOOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1EB10E204
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 08:32:32 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5e1b6e8720dso480532eaf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Sep 2024 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725697951; x=1726302751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9oKEoYV8xUI1GgTKhxgYDza28t2ifQzvK4btLf5o7Do=;
 b=cvH8XOOwkUSwq7GIUs8t/NXjO28zS5FRrMUs1fmVmIgxBZ2amo9zsUXaSKc6ufmnS9
 R23gzJaB70J/ac2Gf7J1Zo10sWLCsZqwILoDzcpjtLVOvepK09tYmdbyXyWzQ9JCdN+L
 oID117qbjkbRtNOry2MKy0gV+D58pRa+Vd6wNb1uWZz8DyOAabSmGJbA6MH1dCbIRM3X
 5eZgf9l10/fK9WbveltGoW5p1ayl7ZDUZ6rO9cez5MPzB8fLA5QjweC69ADfoIDkxHAb
 PRdiPBPpQ07X/ltEzd/iWTBD48E5MawOSdcY8uTnF2tTe49y8HJRzjATLvsgy87iCulG
 Okzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725697951; x=1726302751;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9oKEoYV8xUI1GgTKhxgYDza28t2ifQzvK4btLf5o7Do=;
 b=hoR7Cd9Uppz58vMyOGxiV4BXM0TDQq/+mzLdhq4ORx36VWlYQnlYxGnHkJMS7EjLtX
 NfPoOJgwy1iOP0ZPjlL27nNCDSUPaOJlzJbw1XkSiaP9eLlPmDdMnvF7pDdpo1S18KKZ
 AkWVSThJZJZScGTms6UZTh7elPgwX4cFiv877O80Oj+3r3N96xOceFcj3uxfYEzgshSI
 mOh8YkseaoDlW92SpA08znlop2BTvl45LBhjYwObTXmDwFQtUYphWahgdANdNcq17XZH
 N4LVPtpkuc5d3bis0P80dywxBYCA+PS/rX/Ws+8aPK+criRUhhKf18GwH+tioMbNCnQ8
 aY3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkMt7zgF+dtLyAOZX+OJssgoIokIVjVF7p8PKK6o2FOzCgflq66TaAnjopYq1sjIDq1Wt8oumkE5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxne8F3j/lx0dB6VVwRbCzerM0jwMxpTCiv1rBdj2ypAGnCg7D8
 Og6w0Sq7hZcQQf5obTELUuga/Vv8v152R36dMYbnFyiTV4Ep0B03
X-Google-Smtp-Source: AGHT+IE/nLcnyMO6Rfwuf1W5J0uq6akr6ynAJyxeX2C8vFon634p4hDsDQz0hDu/VicDFso4wwra+w==
X-Received: by 2002:a05:6870:558d:b0:278:a21:de9 with SMTP id
 586e51a60fabf-27b9dcc3a1dmr1840145fac.46.1725697951402; 
 Sat, 07 Sep 2024 01:32:31 -0700 (PDT)
Received: from [192.168.210.157] ([103.4.220.252])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-718e589652asm569112b3a.12.2024.09.07.01.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Sep 2024 01:32:31 -0700 (PDT)
Message-ID: <330174f9-bead-4411-b05e-ea9c009f765c@gmail.com>
Date: Sat, 7 Sep 2024 14:02:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: himax-hx83112a: transition to mipi_dsi wrapped
 functions
To: Jessica Zhang <quic_jesszhan@quicinc.com>, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240904141521.554451-1-tejasvipin76@gmail.com>
 <0bb94cc0-dd72-4da7-b0b6-9e1fe712709b@quicinc.com>
 <0e3bf87b-7d82-44eb-88d2-fddc8e33dd25@quicinc.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <0e3bf87b-7d82-44eb-88d2-fddc8e33dd25@quicinc.com>
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



On 9/7/24 3:53 AM, Jessica Zhang wrote:
> 
> 
> On 9/6/2024 3:14 PM, Jessica Zhang wrote:
>>
>>
>> On 9/4/2024 7:15 AM, Tejas Vipin wrote:
>>> Changes the himax-hx83112a panel to use multi style functions for
>>> improved error handling.
>>>
>>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>>
>> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Hi Tejas,
> 
> Just a heads up, it seems that this might be a duplicate of this change [1]?
> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] https://patchwork.freedesktop.org/patch/612367/?series=138155&rev=1

Ah, thanks for letting me know. I hadn't realized someone else had
started working on this too. 

However, I would argue that my patch [2] is a better candidate for merging
because of the following reasons:

1) Removes unnecessary error printing:
The mipi_dsi_*_multi() functions all have inbuilt error printing which
makes printing errors after hx83112a_on unnecessary as is addressed in
[2] like so:

> -	ret = hx83112a_on(ctx);
> +	ret = hx83112a_on(ctx->dsi);
>  	if (ret < 0) {
> -		dev_err(dev, "Failed to initialize panel: %d\n", ret);
>  		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>  		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> -		return ret;
>  	}

[2] also removes the unnecessary dev_err after regulator_bulk_enable as was
addressed in [3] like so:

>  	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +	if (ret < 0)
>  		return ret;
> -	}

2) Better formatting

The mipi_dsi_dcs_write_seq_multi statements in [1] aren't formatted
quite right according to what has been done so far. They are written as
such in [1]:

> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
>  			       0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);

Where they should be written as such in [2]:

> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
> +				     0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);

All in all, the module generated using my patch ends up being a teensy
bit smaller (1% smaller). But if chronology is what is important, then
it would at least be nice to see the above changes as part of Abhishek's
patch too. And I'll be sure to look at the mail in the drm inbox now
onwards :p

[1] https://patchwork.freedesktop.org/patch/612367/?series=138155&rev=1
[2] https://lore.kernel.org/all/20240904141521.554451-1-tejasvipin76@gmail.com/
[3] https://lore.kernel.org/all/CAD=FV=XRZKL_ppjUKDK61fQkWhHiQCJLfmVBS7wSo4sUux2g8Q@mail.gmail.com/
-- 
Tejas Vipin
