Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E37886944AA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE6910E56C;
	Mon, 13 Feb 2023 11:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BA710E56C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:38:37 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id jg8so31094480ejc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 03:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r8vF+glCGL/TIHZAeFd6umlQYUbpkh549EdL910Nq6g=;
 b=pbzrgTDa/e/4xlg4PGDTCGTOAIrar5NNyj1XRDqVj2OW2kFztgpd8dfuWPW2mMUB5/
 Kam3Hmw6s1u9RG7HZC8au2k//hLg4JZ+MdamafPtasioKUV8usFJ+bR+VDvQZSuTDc8c
 DTQCRhiuXbjC6otr2LbJS9OWT5S7jNCs+X2eCIzRzyhdOnPm5rzYZBroC5YSQGpCQzMR
 KQYXwL0XuYBbZiHOnjZkRocRjs5WQnddxMVHQaJtbPZUzz2lnE000ZBWOg04wz6tXkAb
 rTgkgL0CfKG2SfKyeioa/MzemDIdfpFlwBjHMCs5qdhfbukBEnQD8tHbuD8DkDTKEUgi
 YIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r8vF+glCGL/TIHZAeFd6umlQYUbpkh549EdL910Nq6g=;
 b=RZ7ZQ4id3Ua3ZBnDFtUUnlRcwvnrPUyiNCojErWSfiftpN/FGe5CeSjnfmyI1FENkW
 sdsTQTWBQBRcrbZNW+cI5XrN1khR/lTp2FsZXNSxg20GulXwOchv2UGhrsI4A1VewIrk
 gcqUVLKNaYURcgx55Kfladlljl7xnbtvL48jXgz6h6pIsTn38oqoJmt1ncrRi3aCI1PI
 18dEurZgs9tgGrcgBaFOv947sCtP2u82fiGFtQQd/k7sGXTcsnc2dxBlbk0NwYwsNOd5
 Ndj0a7TwK77hKwdl3rLU0/BgXEGS8JoGfK2ztPlI3OFCd1+nrKfV1tbbgZkoQQ2Zw658
 rbyg==
X-Gm-Message-State: AO0yUKX6duoftKf/i6ZD04L8cWmOTwCV0xqUBD1lIBNLtcDkJ6ncVeNX
 zCp4mV7t2poPPT9S9qRYMMXf3Q==
X-Google-Smtp-Source: AK7set8vw+ntyrLewHqJOjyeT2fk0N1lSDwSYCQMzlHCi7qiYZ98Cc2LOazfM4b9+yhsYZF/cbKmtA==
X-Received: by 2002:a17:906:9b96:b0:8af:370a:c1f8 with SMTP id
 dd22-20020a1709069b9600b008af370ac1f8mr20437423ejc.23.1676288315728; 
 Mon, 13 Feb 2023 03:38:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a1709065e0800b0087fa83790d8sm6755316eju.13.2023.02.13.03.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 03:38:35 -0800 (PST)
Message-ID: <e6653ceb-bce1-9552-019d-278f455ba8a5@linaro.org>
Date: Mon, 13 Feb 2023 13:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/10] drm/msm/dpu: Allow variable SSPP/INTF_BLK size
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-6-konrad.dybcio@linaro.org>
 <20230213111220.ietr4aro6xu4emtu@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213111220.ietr4aro6xu4emtu@SoMainline.org>
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
Cc: freedreno@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, agross@kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 13:12, Marijn Suijten wrote:
> On 2023-02-11 13:26:51, Konrad Dybcio wrote:
>> These blocks are of variable length on different SoCs. Set the
>> correct values where I was able to retrieve it from downstream
>> DTs and leave the old defaults (0x1c8 for sspp and 0x280 for
>> intf) otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 242 +++++++++---------
>>   1 file changed, 121 insertions(+), 121 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 802050118345..d9ef1e133c1e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> [..]
>> @@ -1848,10 +1848,10 @@ static struct dpu_dsc_cfg sm8150_dsc[] = {
>>   /*************************************************************
>>    * INTF sub blocks config
>>    *************************************************************/
>> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
>> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
> 
> Dmitry and I discussed in #freedreno to instead add the INTF_BLK_DSI_TE
> macro that accounts for the INTF TE registers using this higher register
> area, as well as an extended signature to configure extra interrupts.

Yes, that's still the plan. It's slightly painful that we are touching 
this are simultaneously.

> 
> (Besides, I think the len is currently only used for snapshot dumping
> and no validation for out-of-blk reads/writes)

Yes. Because in most of the cases non-existing registers seem to be RAZ/WI.

> 
>>   	{\
>>   	.name = _name, .id = _id, \
>> -	.base = _base, .len = 0x280, \
>> +	.base = _base, .len = _len, \
>>   	.features = _features, \
>>   	.type = _type, \
>>   	.controller_id = _ctrl_id, \
> [..]
> 
> - Marijn

-- 
With best wishes
Dmitry

