Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F3FC24308
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 10:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1085910EAE1;
	Fri, 31 Oct 2025 09:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNppK8iX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H1pkdngH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AA610EAE1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 09:35:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V4LdOi1826788
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 09:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AE9otBVBcEexeCfrvE/nk91Z9IAd1uol89Nt0hwiqRU=; b=WNppK8iXQ+5JkJmJ
 IK0p23JVD7GhYa8XpPx4aQKVzOWSw1aSe0VeQEEg9CEGajR7Y4XeujzHO4kojchR
 5QGH3jjf7snoIHG+iqLVoZDuanuXwMi3U6mihO9Ibi1VEB2VI4TT8DsyDK2KroSw
 zTfPe1uEYnlje2lrz9qp+T3kisdPxlf9VyxIJWz2xhgvcFJc8YYECFqVdD6JxqnD
 1VSZO+oDKfh1zP5SX+LX33ayD5hkoAIF/w0sfgimjTxhLjes3m2yKbJHmyUVgS0b
 V69mggpmosmgH4zXYHh0XF5da9s8hnsaQoOEZkfAS7ZgOcMi3q5yB0EWLS250vir
 ev2v4A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4p11rsk1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 09:35:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ecee4fdb80so2664371cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761903358; x=1762508158;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AE9otBVBcEexeCfrvE/nk91Z9IAd1uol89Nt0hwiqRU=;
 b=H1pkdngHvqL03xmGlrSxQztcZlHnlcpNRbUm7AdHmyW3Hn2APnfYhFgMHHbBDMoRNk
 fyB6TYhbwh1NeQznxkM79PNb9lDpHocfinatfVYIdAsij/AKWyg7p+vOtPOmQ445TqQX
 U84nXrtbyFcRoa60b4AwttGL8+7u4UbX00H7QnSOm4yPSh1q08yB9+wSglOfQNvir8it
 8AbOFKB7wnp/xFYklDRtxS6KWVlJLbglF5rlU/2N5axiXCvbKTImeXzpN/m325Uozuj5
 NDBT3KrpNM9chlGs6kqrA6oU2MZLH3f9hHw6i76kD/XscweEnQcPsTf8VSeM3/K8uKSK
 KpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761903358; x=1762508158;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AE9otBVBcEexeCfrvE/nk91Z9IAd1uol89Nt0hwiqRU=;
 b=he0uBLE4ltyFPfnsi3Z7yOxecuOgYOVDt57foCDxsZSzMeZ+F+s5V9SC6cRCrfw2hw
 lQORbyepETFlyl9RPZ3ZhDvWRqjiWAnVmsyBLIBxfTijKkToOtzvsQBgLhZ6eImM8A+o
 KLOvcVWmR2lMfkNb549JON4BiQJ0FAFqz0hNBHUU/fN5p8hxGl6tKvNcykY+MrqwkJa3
 /KipIe4kM5G8pAIDw+G0W7119riLYDU5OeFhIaD4zAbXLe3zSnQWuB4s5/hJ5uq9pBS5
 oP8/wyWTvhtCxrph2zj2q9JtNGvtdedrAKQQzEETP+hzX7r6FrrsID1+DskUZFXLFr7x
 J1kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsqU6npkir/EobjXtHoTrd63ScrclqDIiVZu3i4ycmZM9fyOQWKWWt9BhCUY8ZOYF6KCPYOsSpXXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypY/BNvloY46JVB00qCv0WsCdx7IU2Ayz+EuucRNgo+P8XFwk4
 y15obgyP4PvB8AGa3VMb4P7XTP8sVLoIoiOpL6ChZzWmEA3tZCOnQN5ucQFdzBUMXGZNe6i//Mm
 aGVvaJ+5mLoe8wtftgRi4RU6poepzfa9g8WMsqelMa5VVakN0E3MiqI9Gq+FKrIKpNfKDodo=
X-Gm-Gg: ASbGnct2ZO32fbL53CVHNhN3x82449K2pZzTL7d3BOswoIeUzsDhiuSH1F25Lx997B8
 yjQcCZZ5qg6vl6qYjrChFvyFcAdshpT/Ye5Pma8YjjWeizM9KN1oDsqQi4XDz82dYkZjDtYw9O0
 W6jqcFlgtQB7bMM5+1l3MUgWbTbpoNWhBGFfY6w3V/oCOhKx/CDEnAKFFvfDMvVGLQ8gKt7NMLE
 22Zdwi8YlJCFWBFMTPO32MDxLiVyinEkaaYJpWivyu43QtrWAer+kYO+T2KuaO1nL2eWEqTAjaK
 PX+els4KOuO/6eWZ5lutt+u1avilEgC82WLfB+ZCY4kc28Kuscs/6p3Y3Ls0w25svPJ87qa225y
 xOxSL44eiMXUMSFeBEz3eARwvYElv9ziRq8KJ6QNc6FmMROq9/ebc7kEH
X-Received: by 2002:ac8:7f94:0:b0:4ec:efbe:804c with SMTP id
 d75a77b69052e-4ed30fbae1amr19443851cf.11.1761903358296; 
 Fri, 31 Oct 2025 02:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM64Dqu4qewULsJFetcmJmwTPjhEdUVf5uOKf3Q05MzwfWGWCLJH888ksuI5tZfx6XDLpCCQ==
X-Received: by 2002:ac8:7f94:0:b0:4ec:efbe:804c with SMTP id
 d75a77b69052e-4ed30fbae1amr19443691cf.11.1761903357777; 
 Fri, 31 Oct 2025 02:35:57 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6407b438536sm1183628a12.26.2025.10.31.02.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 02:35:57 -0700 (PDT)
Message-ID: <60a8f86b-f529-47d0-92fd-90ffebe28243@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
 "Nikula, Jani" <jani.nikula@intel.com>, "lumag@kernel.org"
 <lumag@kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sean@poorly.run" <sean@poorly.run>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
 <78679e08-2a38-477b-a080-be0442465fbe@oss.qualcomm.com>
 <e8902945b65cee777e14bd47ac6e27ff4a0bd281.camel@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e8902945b65cee777e14bd47ac6e27ff4a0bd281.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aRk5z10Xi22jtq2OQG080ssgvMKmzNZI
X-Authority-Analysis: v=2.4 cv=RbCdyltv c=1 sm=1 tr=0 ts=690482fe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=1UTDxpAJyHcS0dvM0xQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aRk5z10Xi22jtq2OQG080ssgvMKmzNZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4NiBTYWx0ZWRfX0ElIo1q1+lSM
 Zk1TraL+jgcVOZUUVui5yxkAfShn9eF4WDyKY8LA4TRXFwNM0y1NbZkQ0k7PWetlrRzJS/T13ll
 iDWFZUypaNji1bzqBg5IJNZJXUpMLQb+lB6QnpXBCgH/+WBElCEW9/0smh5uGxy34CjPj2+7ah5
 jFktB+iOr23eqcjvx13Z8tSSnS6t00+8PfmcbqrD7PYORUONiHUXalHcj9n/3B0rrZudhhjKRxQ
 dw3IM8C2XFy0Ggw7eaqhiYWsRxftbhpjdXT7YIzuIt8B+iarxPkHl1q6Yz5zEYc6G3GJge0+vWx
 QzBI18/5TWwMt4vecFEDD9m3K7lTtebFseQNtZwXpmtGg6CXeqd2tVIoC1K6XoBYGliHR2a1EVl
 j2Tc+ecJtd8mdB/fWWVH5l4hg4E9sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310086
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

On 10/29/25 10:42 PM, Almahallawy, Khaled wrote:
> On Wed, 2025-10-29 at 10:42 +0100, Konrad Dybcio wrote:
>> On 10/28/25 11:28 PM, Khaled Almahallawy wrote:
>>> The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3
>>> spec.
>>> Update its name to align with the DP 2.1 definition and reflect its
>>> actual use in the code. No functional changes.
>>>
>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
>>> Cc: Dmitry Baryshkov <lumag@kernel.org>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Cc: Sean Paul <sean@poorly.run>
>>> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
>>> ---
>>>  drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
>>>  include/drm/display/drm_dp.h     | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
>>> b/drivers/gpu/drm/msm/dp/dp_link.c
>>> index 66e1bbd80db3..5d465cf4dbc2 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>>> @@ -665,7 +665,7 @@ static int msm_dp_link_parse_request(struct
>>> msm_dp_link_private *link)
>>>  		return rlen;
>>>  	}
>>>  
>>> -	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
>>> +	if (!data || (data ==
>>> DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {
>>>  		drm_dbg_dp(link->drm_dev, "link 0x%x not
>>> supported\n", data);
>>>  		goto end;
>>>  	}
>>> diff --git a/include/drm/display/drm_dp.h
>>> b/include/drm/display/drm_dp.h
>>> index e4eebabab975..610b8cbf1125 100644
>>> --- a/include/drm/display/drm_dp.h
>>> +++ b/include/drm/display/drm_dp.h
>>> @@ -849,7 +849,7 @@
>>>  # define DP_TEST_LINK_VIDEO_PATTERN	    (1 << 1)
>>>  # define DP_TEST_LINK_EDID_READ		    (1 << 2)
>>>  # define DP_TEST_LINK_PHY_TEST_PATTERN	    (1 << 3) /* DPCD >=
>>> 1.1 */
>>> -# define DP_TEST_LINK_FAUX_PATTERN	    (1 << 4) /* DPCD >=
>>> 1.2 */
>>> +# define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE	    (1 << 4)
>>
>> I think it'd be useful to keep a comment of what it was before the
>> deprecation and rename
> 
> Given that msm is currently the only driver that reads this bit and
> correctly interprets it when handling automated test requests to
> determine 128b/132b support—and following the style used throughout
> this file, since I don’t see other examples referencing deprecated
> names in comments
> 
> what do you think about using something like this instead?
> 
> #define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE  (1 << 4) /* DP 2.1 */

Makes sense, let's do it

Konrad
