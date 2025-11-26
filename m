Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416F0C87F84
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 04:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643BE10E0FF;
	Wed, 26 Nov 2025 03:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7KY8YDw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDwltILo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C8610E0FF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 03:38:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APGgnBL3588312
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 03:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 agDGgzRr5TSP9r6ApCG+csfzr79eR2JTLEqjVq7+3mA=; b=N7KY8YDwtjzD/UFH
 IJROtuCni8d/hH3xIr/oAq2EbKamSvJrT/78Bu23z5mr6Nteg+4qRHepivPTIWbO
 LQyjIL8XPG+Fpvs7eN4rPfnqzbextZm/Aj5tVNP5keF68wxF+tu7gxoL5tvArjN2
 8+fIatH+I8374KbRcreucqqPleINny0ehcT42VgWI5mwAhR7K03EDHwjkBvD2lob
 tr8S8yetzqJxweUPyxvpeFWrC3UBtjGyBpmlJv3oAPwWyAEZ3R2oOZXlcgoca5Pb
 iZaYo+5dF1W3AM35yc9gyNvgx12LGRLYEe1YqzOX8WEp9ycyVCtEWF1t1ybX4IS7
 Ey9kSw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ang791fwm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 03:38:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7b89c1ce9cfso6041773b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 19:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764128309; x=1764733109;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=agDGgzRr5TSP9r6ApCG+csfzr79eR2JTLEqjVq7+3mA=;
 b=dDwltILo6Kapq0tF/JcwGAWNJ9WEceRnf54Mpd9NlYALZlIVW9p+LXkoLefhfEX29X
 KQmyL38obrjgfWal6M127hFzeYHZTqABQ0msGSAVxWPKLSRtgR9/wDvM9c/6EOvsGWEh
 HHoG76ksksocCbWTyNHQAG8Jbxo0K3p+MXTNAwuGyFtlkzEZix8POb9YNgV38XQx8ziF
 5Ba8Q7ZVjz0OLfuoaGyIlAHyBtn6beH9tw1IQFWly4q1jLH5B4emL/UYvuZ/FMfDShtJ
 jMZNkzVDMCQaCrY7cjMdXLqHUV9aiFoTrUr8PQIhgaf2yR255eYzVQbyHevDq/2WICdz
 q8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764128309; x=1764733109;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=agDGgzRr5TSP9r6ApCG+csfzr79eR2JTLEqjVq7+3mA=;
 b=YZJq6GuZUEvDy9xEXvBXEc+s6emFv3Jdleb3b0hydWwV9TGaWUNgoRRWTCWvA1qqY0
 JfSqwLvQZkS/dYFk8oKQnO9OO1ZbBAlRNHSeMRJrYWPNB3PQq+3L5+hGYFEC/lsg3yvX
 UK5v+3zqFsCyAJK1O+k1fYSQv74jKHKNJHdb4z41j4i/9FdslJV5iPMpZgzz7STjnrfd
 DIrSZk+sNlWPbRGkV2iHliZt+hLHcgw1gVOOPHULX4otzG3JfiU6Bs6+eidrh1FlAzsW
 yMJ3lcwilAbjcuKaj8yYb9e4gUy+ByHdR8/iWi+PwLB0CecFl14ThSZZuzY/iUBdhly8
 XYGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwe/skvceiV/9xjEsG7Tl4jSv+8J+5hiS6WirW5kVRfFzHjO8RPzNv3D3eiKyodIo7Rmzjrdet6Ns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkxbneFl8UtWnnu6pEdORIWR+WL0gDF8OCdTX3j54LuJpOn8H9
 iARC073Jk8XcDzIFMeMJ4PCQ5AtVmkoDjUcM0Kw93vpjAgqMFRUiJnZL8XHgGscBImu3TWfnMzE
 Qk49xfjiUJUgjy05iFGuBZlHY7OV2gH+6wtvpeXVH2Wsd8BnhW2d4rMwYVeZd95sGdqXZHCo=
X-Gm-Gg: ASbGncuViMVf2sPPat2G41Xvt3PTQn6OHElYe1wAz8iokavYyhcDe4BmBC7MItwP+lM
 HTeHct7tX+/ugBCZ87bCbe5D7euOQ/FOkI/j8wg+45hgjlziLjZIGQdkZTtnL7cwjGzWlVBxy+Y
 2oINfm+rIE1TCsu9/X6CPdB8WfWNP2TF947YXKP+f9yx5riPgHSpeGQDOVR7SPJvkmyMuCDVfOa
 KUgHpPt9fKs1UFCzXWXOXrQ7ELnUw/RjPqRXWcoxdUxXBf1kGFA2F2pub61ga6eWBqZhlQ85zNQ
 9pb8Qa2DhAlQQ8uOK/WuSqyiHB8yTnmB+zTIQYadsnnJvAyd2QLf98nmzW6B7zrNmALIpDxqHAp
 Qv6R9+0/SLTWpMDR2JONYbZWvirmEwzLY+LQ7m32GbWD8ZjwxtvrFJiqb3z1qbec4hhQNvw==
X-Received: by 2002:a05:6a00:a1e:b0:7ba:153f:5a40 with SMTP id
 d2e1a72fcca58-7ca879e956cmr5403807b3a.9.1764128309101; 
 Tue, 25 Nov 2025 19:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTiG66hdYeGYiaCl9f/OqCieCXEYUJQxdu0p5mNi7NxXuiHye2hU5fq6jbx44J0e52G9P8Vw==
X-Received: by 2002:a05:6a00:a1e:b0:7ba:153f:5a40 with SMTP id
 d2e1a72fcca58-7ca879e956cmr5403774b3a.9.1764128308544; 
 Tue, 25 Nov 2025 19:38:28 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f0243b3csm19469225b3a.36.2025.11.25.19.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 19:38:28 -0800 (PST)
Message-ID: <586c0ab5-ead1-4387-9f7a-d1943dffc7df@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:38:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/msm/dp: fix the intf_type of MST interfaces
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
 <3cnujrkkcui34wg3jrfoezradc5itm2paw5mgkii2d2snlac2a@lerj4ldbvf4l>
 <9515e743-b8bd-426c-9827-7d5a170445e0@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9515e743-b8bd-426c-9827-7d5a170445e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P9Q3RyAu c=1 sm=1 tr=0 ts=69267635 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=GrdrOO9Tebfov7ezxyYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -qt4fnjIV35r6H22INE0HVcVW5QoFN_N
X-Proofpoint-ORIG-GUID: -qt4fnjIV35r6H22INE0HVcVW5QoFN_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAyNiBTYWx0ZWRfX6p3HYMQAdO7Y
 MI9/h0LYDNXndp0EcrxqSIe7E2sFfGduzXY6GGCGM2wPePCXKlikE+Fx5aBht0RyC0gjl5LPpL0
 Tc/Uq7TMGFeRdikm5EsQ7pPIxnz/cHPZBoUFBegPuBFKPciY6++AYVPqZw4EOaBIQGfcv7ZP32n
 fwdESPdP+iLBfAZ5MyRp9+GyoM/Nj8CGSP0GQ7FguC24xRZ9tZC4zO7SL7HI1La20L+VHJvVuwh
 gLLpCwKlXQgJ+fjwduqwaPxRY9mxWY/o65EDsZQ/T+X02/ZbORR66dxRkuXzn1WUmf92mSBQGSK
 T/MO0iCtjtuaBf5YzU4QRkW55p0KjRWJjmTm5TY6F3J33xqrpFjEx53/tx0TXTclGhTqnxqfynL
 UhtV1EwnguqqTrcG9jzkk8HG1mTC+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260026
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



On 11/26/2025 10:50 AM, Yongxing Mou wrote:
> 
> 
> On 11/26/2025 8:36 AM, Dmitry Baryshkov wrote:
>> On Tue, Nov 25, 2025 at 04:22:12PM +0800, Yongxing Mou wrote:
>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> Interface type of MST interfaces is currently INTF_NONE. Update this to
>>> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
>>> dpu_8_4_sa8775p.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> This patch was split out from the MST V3 patch series:
>>> https://lore.kernel.org/all/20250825-msm-dp-mst- 
>>> v3-0-01faacfcdedd@oss.qualcomm.com/
>>> ---
>>> Changes in v4:
>>> - Splite chagne out from the MST V3 series.
>>
>> Why?
>>
> i just want to spelieete
Sorry, please ignore this message and move to the other reply.>> - Link 
to v3: https://lore.kernel.org/
> all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/
>>>
>>> Changes in v3:
>>> - Fix through the whole catalog
>>> - Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37- 
>>> a54d8902a23d@quicinc.com/
>>>
>>> Changes in v2:
>>> - Change the patch order in the series.
>>> - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3- 
>>> f8618d42a99a@quicinc.com/
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 +++++ 
>>> +------
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
>>>   3 files changed, 12 insertions(+), 12 deletions(-)
>>>
>>> @@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] 
>>> = {
>>>       }, {
>>>           .name = "intf_6", .id = INTF_6,
>>>           .base = 0x3A000, .len = 0x280,
>>> -        .type = INTF_NONE,
>>> +        .type = INTF_DP,
>>>           .controller_id = MSM_DP_CONTROLLER_0,    /* pair with 
>>> intf_0 for DP MST */
>>>           .prog_fetch_lines_worst_case = 24,
>>> -        .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
>>> -        .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>>> +        .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>>> +        .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
>>
>> This is a separate fix, it should be a separate patch.
>>
> 

