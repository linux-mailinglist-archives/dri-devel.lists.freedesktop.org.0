Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205E3C25E07
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 16:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7A610E90F;
	Fri, 31 Oct 2025 15:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/sQ4NRY";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXb2MVJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C6D10E2E6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:43:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59VAoDWK1571285
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4JFmZvuI7Px4Apbk0cnCG+kjMARdLNyYjmhmEWKvxe4=; b=K/sQ4NRYmSLBGIpo
 3uMcLBcwLEFQ+C6z/3XPMKqSqc4mBX+EkV6d/DvRjNvw9iypt1yAya5X/S9KCExX
 jPzBHOepU1TwzF+DbbckBcO9V73oNRbj9XDJtuOXROQKd8Fl9/etunalv3cGpJNr
 +OFlsLm5wX78l8cl4jzocBIYsrm+rmLXlnCy5hDdnHJmvcueAzLIg4OafpdCH+VM
 aVs02kgsr5LzO2nciYm0E2zFE97+GFWF5BUu3KOETNf0hThTTg8Mnsf0GIeOWW8O
 clrm9nyuThytGDYLPTMqS8DgNSL93P1aIRSYAmYnwlWZ78kXLsgkdzWwl/hTPBjd
 y6TdoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ksc23a3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 15:43:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4eba930d6ecso61145641cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761925408; x=1762530208;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4JFmZvuI7Px4Apbk0cnCG+kjMARdLNyYjmhmEWKvxe4=;
 b=VXb2MVJ/6z3QsGho+SfKJ+6t+6EE5Ov8Gj81nFO1oiS9yihvRcY9wLvfdrfGX1LEQs
 dKjG/8KeI0vLekdWm0znf3wmz3b8PBi/mgw0NwWeykh/zd9wVu67nbnNtWvLsDhYlSah
 LvE6HZzQxhJaJbgf+4zIG/V4zn0oEKmPQBxOv9h4gk9ce0K0Mi58a1ud2EvFACGK/Bux
 61cgQEbubRSnkMzkeYp+RWVzqkRVZJTFD1z4AhOLbNglbdWrASAjPMFjZYL3HwRwd4an
 iEG9z2laFhsr+aVmz3DfTjtzHQGHZL0pDSJuRO/jGqGC1Soh7INfKEMPp810IvBAmmPO
 doEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761925408; x=1762530208;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4JFmZvuI7Px4Apbk0cnCG+kjMARdLNyYjmhmEWKvxe4=;
 b=h9Etz0/mrrouO7BWyxx6yeHNa1V/J8jze+F0RecOKVuYbh38dsH6Fk5dUX0TmyyzZu
 jH0qFwzfViLaVA3Hpjy0DGN9gwTUD9kV+N5Q+ifsAIXKNff8C71yqtR+Tj6y/Blq8KL0
 E/cZWt/bJtyeYXn0ZCQxbm2SR2tAUa0AqzGfbWM6lxJh3rz2+eXGcV0igN1bfOwPcPlJ
 +jMn5CfqhdnveYu7MhCswnDwOtXKcsZIAzCJPhCN8/dQigHfZ4PUajwKaknfV3P9QSpn
 ndQjctxsnTVZMT6bQbPSkQksMu1axZaYIZjVyXfQSWjH6K2HiVN2cijVkUCIfND/TlAI
 hinQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJz7+udp1oUCnC8vXEiGmzcggY4NTOT405cXbVYIkGqC2ph1G2uoH62v/Nv6UczRBVyMaKTTklpeU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9HgpLv/qr5anhiqTYhWNlDkWSNiYSoaDZ3y4RzlkVaNdqgQkf
 nba12rcpOBoSL9ThuGmoh2PcT71+QB5l6vSki4iooLSpLVfIlT82o+W3xNwkweh9GmhwX4mAVIw
 MV0KynL6KOqdBKMCLWSaNKTFlHHmbTUJgHgPp4b3uaeohdBuTeAC6ALUw26sNWkSnFVXPVmE=
X-Gm-Gg: ASbGncurYx7HSFl67xceP5FahzDz1oqh6TquiMY3aOlHjqz+YQepYHtSMlgojHXNm8h
 H8UZVu8vHBCs4VuYZ0HZLYb3eMEm5Am7T5xOZ0/yGQYLXrEPTirCclYAlqRlnVs6G+cwgJugyEo
 sGkhI3gYC0ZRo4e+gNZtIDM4+4dcVSx8uwBz7WCjylYhLnEjWdnKhB/xXaGsJaBlnO/2mTjDwHy
 HjYSDUlG5A3srdxofVKaYwdK1X1p91DLzv53FWX/ABtzN/7AQ73QRi5JwoNzjFnwL75B64+oc+t
 8kWfiWfsuL51PCqkCO3Q+HRGy+u4N0NpjWkcF09UWIoDwEutGGtQNao/8h8z2F20l1w8DSd0mwp
 6IQG5CH8qXsKyKnn7gnS/OZEsl4anruOvcs/LRy+IhvOhF8Ek/BMYd6tNM4L+Zw==
X-Received: by 2002:a05:622a:153:b0:4ec:f035:d60 with SMTP id
 d75a77b69052e-4ed30d923e3mr43230801cf.5.1761925407727; 
 Fri, 31 Oct 2025 08:43:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQAWd1J7oWtcMPX3rnVkF6XNlyYFAMR5sObmDNnVQ/IctF28iJZltsP22Ps9WEpLaV+65wUw==
X-Received: by 2002:a05:622a:153:b0:4ec:f035:d60 with SMTP id
 d75a77b69052e-4ed30d923e3mr43230481cf.5.1761925407236; 
 Fri, 31 Oct 2025 08:43:27 -0700 (PDT)
Received: from [192.168.10.38] (91-154-146-251.elisa-laajakaista.fi.
 [91.154.146.251]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37a1bfb45easm4478091fa.16.2025.10.31.08.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 08:43:25 -0700 (PDT)
Message-ID: <e758dc56-a5eb-4c4a-9ab0-74e9b9b86c7c@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 17:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
 <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
 <4bnvh2ydtrmejknzpsxoalxoyjpq5g5cjbrico5ezbek24r52s@u5zy6ekh6lps>
 <aQF0zzUpLeUu4lrC@yuanjiey.ap.qualcomm.com>
 <5hftxsuqz745mxxk2hjpwfxwrm73p2l3dxn2mb2uqb2c44fd2w@l5xvadj7gvvg>
 <aQLInjBCbeNJVanK@yuanjiey.ap.qualcomm.com>
 <r3sbg5r5pesrfrave7l6nx4ws62eogfn7m4f5c3ur2a6xkhsss@f5vfre2hd2cr>
 <aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDE0MSBTYWx0ZWRfX5nFB2j3yCmXx
 0AEcCjHM8MrE0GT56DFg4eK90Bxaac3iM26Sk3A2GdqeLT/7fsFt1s86FUsJKevuVvFy+5kvXR1
 cjGHK1OWYWRyjh3LzgUqixoLjlG1L/B3LYCGsiOJhxIJqwqiR2pXaYPplhjMlU2RxlesLsp4iZJ
 U22MbB623iY0RDMqEQwP5Nh4MrkDE2CIk2QtT5MGgffKamWYTZIiFe7rEZayjslijkmZ6C92RKd
 4I1bOzs6Z4hWSj545S0YbeMc3cZrOD44fIdGXdnp3aBIzB7YWXrBdBa1vHNeOHKipGamTJmyGtO
 MAcatHrNUJl6HMVZ26ycNzWoRTToJLKbKVJGrR3KJb/QXcY/F5CVfG5nvaCyX/oYrmA84SI4+pQ
 eWaXrBsCCw7fL/xMvRfhap9G9RUqNQ==
X-Authority-Analysis: v=2.4 cv=Q8PfIo2a c=1 sm=1 tr=0 ts=6904d920 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=CKk/IlMN6Gw3Dq31eR3Dfg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=Gjd6gEmqAeAVqTANhbgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: tVKwdIqoGM4IswZbNNjE8X0IO3aGOhtY
X-Proofpoint-GUID: tVKwdIqoGM4IswZbNNjE8X0IO3aGOhtY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310141
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

On 31/10/2025 04:21, yuanjiey wrote:
> On Thu, Oct 30, 2025 at 07:57:46PM +0200, Dmitry Baryshkov wrote:
>> On Thu, Oct 30, 2025 at 10:08:30AM +0800, yuanjiey wrote:
>>> On Wed, Oct 29, 2025 at 02:20:13PM +0200, Dmitry Baryshkov wrote:
>>>> On Wed, Oct 29, 2025 at 09:58:39AM +0800, yuanjiey wrote:
>>>>> On Mon, Oct 27, 2025 at 02:22:04PM +0200, Dmitry Baryshkov wrote:
>>>>>> On Fri, Oct 24, 2025 at 02:00:50PM +0800, yuanjiey wrote:
>>>>>>> On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>>>>>>>>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
>>>>>>>>>   1 file changed, 5 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
>>>>>>>>> index d6a37d7e0cc6..7eda16e0c1f9 100644
>>>>>>>>> --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
>>>>>>>>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
>>>>>>>>> @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
>>>>>>>>>   	if (ret < 0)
>>>>>>>>>   		return ret;
>>>>>>>>>   
>>>>>>>>> +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
>>>>>>>>> +				    1650000, 1950000);
>>>>>>>>
>>>>>>>> This should be done in the DT. Limit the voltage per the user.
>>>>>>> Two reason:
>>>>>>> 1.
>>>>>>> I see https://patchwork.freedesktop.org/patch/354612/
>>>>>>>
>>>>>>> panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
>>>>>>> so I do the same work.
>>>>>>
>>>>>> Please look for the majority rather than the exceptions. Out of all
>>>>>> panel drivers only two set the voltage directly.
>>>>>>
>>>>>>>
>>>>>>> 2.     Kaanapali vddio regulator:
>>>>>>>
>>>>>>> 		vreg_l12b_1p8: ldo12 {
>>>>>>> 			regulator-name = "vreg_l12b_1p8";
>>>>>>> 			regulator-min-microvolt = <1200000>;
>>>>>>> 			regulator-max-microvolt = <1800000>;
>>>>>>>
>>>>>>> 	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
>>>>>>> 	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.
>>>>>>
>>>>>> DT has to list the voltage values that work for the devices on that
>>>>>> particular platform. So, ldo12 should be listing 1.64 - 1.8 V.
>>>>> get it. I check downstream DT,
>>>>>    dosnstream DT:
>>>>>     regulator-min-microvolt = <1800000>;
>>>>>     regulator-max-microvolt = <1800000>;
>>>>>
>>>>>    I test 1.8V works, So I will add 1.8V in next patch, do you think it is ok?
>>>>
>>>> What does panel's datasheet say?
>>>
>>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>>> VDDI=1.65V~1.95V.
>>>
>>> So I should follow datasheet to set DT ldo12: 1.64 - 1.8V ?
>>
>> If the panel declares minimum voltage to 1.65 V, why are you declaring
>> 1.64 V as the mimimal voltage for the rail?
> 
> Corrcet here:
> 
> DT ldo12 will be  1.65 - 1.8V

Yep.

> 
> Thanks,
> Yuanjie
> 
>   
>>>
>>> if you think it is ture, I will fix it in next patch.
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
