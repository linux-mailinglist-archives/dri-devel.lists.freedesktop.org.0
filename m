Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2247770CB99
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BC410E38B;
	Mon, 22 May 2023 20:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E0410E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:52:45 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f4b80bf93aso435664e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684788763; x=1687380763;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qzzot298H9S1xfQy884A/n0F+LWiqtlI5Y6iFzIpxTc=;
 b=oMmr8mt0z/vOfSJrCq3pVtuEPbsCeAhYSqZ1Rwwrlg4IlUvBrjx2h6IR6rcId/aR8z
 hQE74P0bv510AuIg0+IBRXLkFXdOfjlBxs/iQZzGYGtXhhvN8zzCIZSahgoMQHK4ao7T
 nqD6gXwgHX4+A2yM5PNd9j5N1StTv9YAimTnEzogoqYXArx1/COtpDYOJaCq20XLqsX8
 t77QiJuQ/NqXSs7FaC8IZOU/vza4UM2ldNmZMX8xiRUa+vjmtL05UxcT3YBInbSWwAVA
 34T9SQHgPrAb5NLBk1KXxvdFHzuzmBqMPJACBGq/6BzT2Fs2tjF+v62DdXXPFdM1dQdL
 dFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684788763; x=1687380763;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qzzot298H9S1xfQy884A/n0F+LWiqtlI5Y6iFzIpxTc=;
 b=fejb/1B6GZVwccn2PKapbdfbdvs3XMStGVVTjachRGQ1/qiTMT8Y85fDfeW0jO1YJV
 /QMhu3kkq6sx1MJ4p8BpXEE2FOZSBEwtZsFkps46iRjlK0Lal9NUBlNRna7wumtrBStm
 2eOtu9K1+qQKjsAVl8nlwqZhUDtUaDy7YycBLpce7k+X+oEWyumiUuHdlPhKf+y0PqdQ
 v6jDzsa2IwUxfrLQnltsipX9DT1UNXtvj/XNAHwy6QsnLeobhd6eFK71xigFuoRAYW3k
 aTe8Ww5ZXUev90t636pwQF2Rs0POBA4pMWB9CV8Rj/QfY+2JSld66Dwd/nzWBShO8Uqm
 dwjw==
X-Gm-Message-State: AC+VfDypscRObaE5avsiPZLgKMKBUmQ5IvPLjToj8pLzcMA4Z1SDQjjr
 tcObcp3Y6q01JKwHEdluLBABfA==
X-Google-Smtp-Source: ACHHUZ70BGA9Uob2tmq9vnnuOZF9GmElYbTbJOCcZ2XvSUohGie9tt0+BdXH0QSRUm7yrtoWpgHmbQ==
X-Received: by 2002:ac2:55a1:0:b0:4f2:4fd7:a11f with SMTP id
 y1-20020ac255a1000000b004f24fd7a11fmr3325386lfg.54.1684788762858; 
 Mon, 22 May 2023 13:52:42 -0700 (PDT)
Received: from [192.168.1.101] (abyk97.neoplus.adsl.tpnet.pl. [83.9.30.97])
 by smtp.gmail.com with ESMTPSA id
 b25-20020ac247f9000000b004f3b319ed4bsm1103692lfp.120.2023.05.22.13.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 13:52:42 -0700 (PDT)
Message-ID: <ecf22436-44f3-8809-1232-e9ae30f3864b@linaro.org>
Date: Mon, 22 May 2023 22:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/5] msm/drm/dsi: Round up DSC hdisplay calculation
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-1-15daf84f8dcb@quicinc.com>
 <eo7chb7m4cowvb53hnebi3bjtotm7x5ea5iv6ulmmfkr2hdt32@2nkoa5rco3qb>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <eo7chb7m4cowvb53hnebi3bjtotm7x5ea5iv6ulmmfkr2hdt32@2nkoa5rco3qb>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22.05.2023 22:44, Marijn Suijten wrote:
> On 2023-05-22 13:30:20, Jessica Zhang wrote:
>> Currently, when compression is enabled, hdisplay is reduced via integer
>> division. This causes issues for modes where the original hdisplay is
>> not a multiple of 3.
>>
>> To fix this, use DIV_ROUND_UP to divide hdisplay.
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> Nit: probably these should go in the opposite order.  And if they're
> all supposed to be chronological, I think it is:
> 
>     Suggested-by:
>     Fixes:
>     Signed-off-by:
>     Reviewed-by:
> 
> But unsure if that's a hard requirement, or even correct at all.
> 
> - Marijn
Or you can rely on b4 to pick that up if it comes from others

Konrad
> 
>> Fixes: 08802f515c3cf ("drm/msm/dsi: Add support for DSC configuration")
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 9223d7ec5a73..18d38b90eb28 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>  		 * pulse width same
>>  		 */
>>  		h_total -= hdisplay;
>> -		hdisplay = msm_dsc_get_bytes_per_line(msm_host->dsc) / 3;
>> +		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
>>  		h_total += hdisplay;
>>  		ha_end = ha_start + hdisplay;
>>  	}
>>
>> -- 
>> 2.40.1
>>
