Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66371B97B23
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 00:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A00610E1B2;
	Tue, 23 Sep 2025 22:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/h0kwTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAF510E1B2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 22:20:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFOVXn026360
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 22:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XCqgOa0zMg3bAGkPnVwXTeYirB6xruRZWHedTA8lg7c=; b=F/h0kwTpuzKJK9Si
 C/vHQHBGXHXHcpUGOYGpWXmSYEgDE3kQXgXBZXjBZRqWKVAwdmfXBOk1F1Kmsirm
 uEAScIhViYBsKBb6KarpaHr+0uWwz8czX2/9RqgY1YDFmb+ej+4IgAEkOz2hg506
 RS0z876GscswgrouDyiwKBaZgIRbYbAL3aliex+xmh/gfvERGfOJQTaZrB6/X00P
 zFoFuaotLPLHPa+lrD/ynOGx9YOBRvpa2+pYbQK5vtLiHMjQztJJ7kBYhJ6XJg5o
 hhTbqhVIKPDW53cHFvasOg3/LupMjWsBw84aysd/4Oe9OBpQhYAsWnX7AXzwxWYP
 hwQG9Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyetgrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 22:20:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b55735710f0so689659a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758666032; x=1759270832;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XCqgOa0zMg3bAGkPnVwXTeYirB6xruRZWHedTA8lg7c=;
 b=Fgow4Gh9lk0/ywCbiGPlNuoGhpENTbIAWQu2pbfkN1vaiUsyzTdO9WODwcZQTmND5b
 Zf0Jdqi3/f5gB2V7KZqXntfNUnrSGqWqYMa9TzYP+l2wnWE7RcF/Tw2IpMtm7/9m3MLa
 PH2rpeMxUahn5AGeJUNJ+dHroF6U60htwH7ilvIVpxM2rg/gcmsat1W96O1BgExzGClF
 cyjccn1y+GQ8kuejiB6seKf8zBEdFsYsWMTuZXmYRRm6Uan5OcT6DOSo0pJVV8jDhb7J
 tlbN5umJ0XUv6+EWSLQgy3UxG5Iypiycb05mvEqhBTAIM96/o0FIbrcNfVEMrOkLrX/G
 9ipw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnhDZWQaGz5X6Pj+6J/QyTjCcXSP+gDonOCaopJl2qUTojzPI4yiFnJxVS4Bc72qsp90GtHs3Pilw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOlQ/IqB7jkDuMBWkRVZvXcRBumjNb9Zm31Mjv/eEq3/2mH7xN
 RjBQ5QbgbTZGDR7ag3h7zeUIq79fUctHf9ZHBFQ49J9SWd/Nib9TLndfnDhBr/p6gsDWKUk/t3k
 SvzDz/ph1dVcoq8laFN7Graa9khuVPo7Cp/IqGeR1lzshaRn+HZWvbfme0QKOkjd1L4k5u+w=
X-Gm-Gg: ASbGncsBZNWgt/v33yDdH/6VQ0rMH1fHIKUVmC5pmX+XP9DU69b7unp55so/Cbcvz7h
 2xVUkFZPI18q+fxbQBhNDHaJ2b9lTWAfzM8M7EGzdpzRQaY+AWMXQM0Yg2B6szHD8vXMpik6MUr
 ol/XhL0l28pie5bWidwLnfM1XI5YynQhXAUX2DqeOLcjnfKzxKxTpFpyfajtOPuLepo+CQvQ+kL
 82wjezl54qNvbD/ByERItgSfqZU8FXcj4dXZ1sVoJI0L+7jUbYvYKUoV07VgkzsSfHHd6+jv1Ll
 Jlx72IhGuSM0gOAM5a3cNUEwcn2fpKHgNbC/M4vJ5awVe+yZSOoqFwjCyL3k8ame+/81uMESSBw
 rQx1Ts/bOuEP0h1rOqPJ2Vg==
X-Received: by 2002:a05:6a20:72a7:b0:2cc:692a:3a2b with SMTP id
 adf61e73a8af0-2cfdcfefdcbmr6109113637.16.1758666032117; 
 Tue, 23 Sep 2025 15:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrs2A71G+cFUsubAv+Vc1pQAa4dVVMm+2irnjFOxF6C7V/RXWnkIMo3dVaiu2z3htTxPtYpQ==
X-Received: by 2002:a05:6a20:72a7:b0:2cc:692a:3a2b with SMTP id
 adf61e73a8af0-2cfdcfefdcbmr6109080637.16.1758666031687; 
 Tue, 23 Sep 2025 15:20:31 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b554aa612e7sm6897265a12.8.2025.09.23.15.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 15:20:31 -0700 (PDT)
Message-ID: <19bf97ed-3cb7-4b69-8d54-3cfef15f93f8@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 15:20:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Don't adjust mode clock if 3d merge is
 supported
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
References: <20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com>
 <cjoxzwkvzjv7pqelcxcepafanauxjt7p5b3qevjdr5bsomifce@i67l2hzavctj>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <cjoxzwkvzjv7pqelcxcepafanauxjt7p5b3qevjdr5bsomifce@i67l2hzavctj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6unGD03rwfonn4NREIq_vs6t7cWyVz01
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d31d3a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1kqHEmTGbaOex8fRdXYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX3BmSDzMGCRoN
 az/gN5rzc5lb7gDXnZLVaPar4bVBcC2X4CUTOZ3WpMzhnHUnK2i9bLDfFv5e3I1acR7inY2j7UC
 WphO+HNwllydfUZNKIGuh31f3BQoek+vH/UQjtMNy5aoYaBUoWE5g3LcaRG6ndGA+npeXRtz7yp
 +dl/F5JitOwNYNRH6AwZ7MuvC/mWNLlMQCl1B5ijFY20zVbnt+xnSWswNICp0ZQtWkekkPytKxl
 VCiNgSshwkonEP8aUEUOjezyBAS1gTjdoyPPK18SI9QA6bZBhz3o+DJTHAScGfzUztqeewWGYQt
 liLsF7DytpnYhAyaEBssoTuM09/RpVUCuJR0taV5m/Doei4BdAffWK4wlnOaHZ9W9Z168JAZQAL
 KY3EaExD
X-Proofpoint-ORIG-GUID: 6unGD03rwfonn4NREIq_vs6t7cWyVz01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_06,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
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



On 9/22/2025 4:50 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 04:32:39PM -0700, Jessica Zhang wrote:
>> Since 3D merge allows for higher mode clocks to be supported across
>> multiple layer mixers, filter modes based on adjusted mode clocks
>> only if 3D merge isn't supported.
>>
>> Reported-by: Abel Vesa <abel.vesa@linaro.org>
>> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 4b970a59deaf..5ac51863a189 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1549,7 +1549,8 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>>   	 * The given mode, adjusted for the perf clock factor, should not exceed
>>   	 * the max core clock rate
>>   	 */
>> -	if (dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
>> +	if (!dpu_kms->catalog->caps->has_3d_merge &&
> 
> Well, not quite. If 3D merge is available, we should allow 2x of the
> clock, instead of skipping the check completely. I don't think that we
> should allow 8k or 16k just because the platform has 3D Mux.

Hi Dmitry,

Ack, I'll fix the math here.

Thanks,

Jessica Zhang

> 
>> +	    dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
>>   		return MODE_CLOCK_HIGH;
>>   
>>   	/*
>>
>> ---
>> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
>> change-id: 20250922-modeclk-fix-a870375d9960
>>
>> Best regards,
>> --
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 

