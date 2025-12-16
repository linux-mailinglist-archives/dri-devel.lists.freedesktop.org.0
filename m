Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2E4CC39A4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 15:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AF610E05B;
	Tue, 16 Dec 2025 14:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l52Ekt3/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsGrp4Dn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBA310E05B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 14:32:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BGD9E1F2573201
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 14:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sSSMICGICe2f0YIccl2tqHqDQh0xExPvbuAKbmzyLo4=; b=l52Ekt3/3tztiqwG
 gVwiPPv7VlpREtpqvlh+JR4YQIKRXVgsl88qyfDFPt12ZTOjlfN5AA9jXn1Iq6kt
 UnlEGkX5kemeL+qfmIY+CzLK+ZE/zCZAXTIuOO7IsLnhJjZdzciHhcw2GaMcdfdS
 x48nkxLCX4zvGJJSEVk8Mw6wnQ1UQiRpzNGIZrn5zzU5EwzwH8W59EGWehMlzvv9
 6U/Qk4IdbXbdQdJqzIYM+FONRucm04VVmDXNa1ac05LWk/38iB7KZjMUdd1TwsdE
 vxkW16kHscGUYs5HMVlKxdoJe8nnmHBzGyNvxosPwSUCEJUH9lypLw09kziVWvas
 pSOhlw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33thsgh6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 14:32:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5dbfaf0bdb6so2994612137.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 06:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765895568; x=1766500368;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sSSMICGICe2f0YIccl2tqHqDQh0xExPvbuAKbmzyLo4=;
 b=JsGrp4DnLxrxmt/jtnwmVL3GgWom4DJXyptOOiJY5U9KnjqO/xZr09bT8D1HBFYPKv
 zoJrPH4G7DolKWR4pJXnCkoCEuiGcQNV0HfNHXaaW40fCSGa1VnCZERWQ9ZWaS/vajW7
 qFykriDprPzf8Wi1+zRX+0MtI5MtXxmblhbbgobISokwM94dShXtMAiFIDo2saoTcvRt
 acj6I7yMyvKwxO2VUa+dXIUUo3hbZBaCSyXK4yz1l/GWhbE6iw2DkYuZClpbHD4C7w1m
 vbL4I/aDeQ4sDd5Glo4QkH+iSyQ6g/gyjyVgvrADXp5pkDTmCNHvLcf4I6Fyj4Kvgpb8
 AeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765895568; x=1766500368;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sSSMICGICe2f0YIccl2tqHqDQh0xExPvbuAKbmzyLo4=;
 b=Cvr9LIldlr8ixFwV2zl8WJsLVNOUOe8pSVk4x+g09NR2IGYsscjaKl9C4Kk2u5R1fR
 9VW5J/no+qWVEtSoNVWs89TiXAnp6LygoSRobTHzIBi3mGLHBr/qvVzQVh3qXBtvjiz8
 qR4PsdSay6qlg1QWckA9gyoRAJXWWo41/2m3p/QaOT2NibcJqmWQo7/6IXh/QbDG5STO
 pMAkXINj/3U1PijkgIVmP6nNs/VhaItkyZ+sHRoBDnSHx9RL+Bo56jca/cU19DRDCDTs
 u1lXN+2ru4qCaKw1xQO6Q1SV1ZYvoOmyurGfaA8sWkCsz854RenxuFoeYgKW1kYLxZHG
 JH1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMoRFz0JbWFIUsL8HD3fi8RT95Nt5Qq0e4XtlNh0Irt3Dl7s/S0cB6NxXWHJt2l9/3y6jfw6YK5vc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdoZyZbB8AmlaY2PyAUy4fXVXyq1UQ4oaOrirJULd8e1BfUO60
 VXaygsmX65mVQ2q+q8IBAx1xbM5biOm6eWmENMn5Qa8Ue1iG6iWdu4DUDtQseq2q8hYvSrS7VwY
 wN7BCeCcSD5OGq5GMCuyymxE/I6XVsxnN96cHriP5Qacq/HmKOA6vE7nSk8c7OeO9X8EtwTI=
X-Gm-Gg: AY/fxX7MQgQeQMXk47qlV3fq1FWaB1y6L6DZnNPjwOToecM66Ei5p4HA4pCIvPEOi6d
 u2WSx7ImnJcZScUThKQMk3TEHfJrGY5RSIqwBP4KuPTYZfaQz4/Cj7cUZa2A9inlTtFZLvH1i2c
 47PvvlUHOd464OR5r8QLTF8DfO4WWFVRqt3iEjtzILCwJymZ6g+QVo9D/XpJZYlgdUfILkgUPBf
 5bfLi7q+/qkcXxGtVaQRZrLs48UeiVfsu9PvER3/h7QHqNZFohZM+NNaiR8oiGXNcDrln+oUAD9
 eiilRPmhIFd9b5k1AkjphPYLRn3NXHem3bZS21vaZ3QlHVoVjhoExekU45Do9Tv1B/zm49fq0oM
 jaUlbfmFfyOYM+oVxWlGQ5/gxl/a6ZvUSkObwyNL4rPMqwq1TqRYl6VgsjNIAh473QhbA
X-Received: by 2002:a05:6102:4487:b0:5db:f615:1819 with SMTP id
 ada2fe7eead31-5e827488c7fmr4127722137.3.1765895567465; 
 Tue, 16 Dec 2025 06:32:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5bvKhIUfXMFuxDOHV/Y5m3VNAwV/RECgvjwhUnC/dgoHjCv0Ee4gAMKdHTBXr7UcOFJElvA==
X-Received: by 2002:a05:6102:4487:b0:5db:f615:1819 with SMTP id
 ada2fe7eead31-5e827488c7fmr4127698137.3.1765895566843; 
 Tue, 16 Dec 2025 06:32:46 -0800 (PST)
Received: from [10.193.196.209] (82-128-196-119.bb.dnainternet.fi.
 [82.128.196.119]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da1a7d8sm954688e87.37.2025.12.16.06.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 06:32:46 -0800 (PST)
Message-ID: <0e9c0f8d-c1f6-4c84-b467-37e11837882e@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 16:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Enable support for eDP v1.4+ link rates table
To: Dale Whinham <daleyo@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Steev Klimaszewski <threeway@gmail.com>
References: <20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com>
 <s43zm7ljm5cipjgkjllvplk6jcxrjo445rboirikivtr3n2alh@fvu66mkwkb5q>
 <2c1656ff-cba9-4122-a414-d22958f5857b@gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <2c1656ff-cba9-4122-a414-d22958f5857b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZIPaWH7b c=1 sm=1 tr=0 ts=69416d90 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=UP4AmmvVc3sGQHJQO2VA4Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8z4_Mw9kuIkUejV11uIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: cicNHtHYHRL0ZYWsD8YPMO9ABQOtFC9A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEyNCBTYWx0ZWRfX6nX+rFfXofod
 HohzDMiDc7PrLK6v0cL7M1W4Zq786u/TWN1KmTMK05dhPwB982X7qnIjumzegsNNYyAxjPncdDT
 uFoz2Gbs0khdLHzD9EEs16/3lczxrkLUiioavj1TaC8nt0UbjTiKkdHMGZDrI8Wg2m/+O2NgmiH
 zefQ3CFA2u0zwvQ3q8UEIImkEjsOPew04u6WkbWIw2MW3eYhZ5TIVsT4v+jC/vJqZ2ddEjb7sMN
 xzPZT9l6LnBPKQo35RLkdAvUL6DoLu5uMiqo6TPrHPW2GCcA/ycsx+j6vteMPRWFC/5ArH89u6t
 cTwuX7oxzRkVrh1wEGBZbTpHnE1SPWqMWxnPuy8DTLQgw5qmQ9T4K7S46bgN00Urkg52gyQU08j
 Laxu5621+EkATg3Tr36/uELyaxCe+w==
X-Proofpoint-ORIG-GUID: cicNHtHYHRL0ZYWsD8YPMO9ABQOtFC9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160124
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

On 16/12/2025 16:31, Dale Whinham wrote:
> On 15/12/2025 22:15, Dmitry Baryshkov wrote:
>> I'd suggest following i915 and writing DP_LANE_COUNT_SET before
>> DP_LINK_BW_SET.
> 
> Thank you - made this change for v2.
> 
>>> +    /* For eDP v1.4+, parse the SUPPORTED_LINK_RATES table */
>>> +    if (link_info->revision >= DP_DPCD_REV_14) {
>>
>> No, eDP has separate versioning register. DP revision != eDP revision.
> 
> You're absolutely right, this was a mistake.
> Does something like this seem reasonable for v2?

Yes.

> 
>      if (msm_dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
>          u8 edp_rev;
> 
>          rc = drm_dp_dpcd_read_byte(panel->aux, DP_EDP_DPCD_REV, &edp_rev);
>          if (rc)
>              return rc;
> 
>          if (edp_rev >= DP_EDP_14) {
>              // parse the rates
>              // ...
>          }
>      }


-- 
With best wishes
Dmitry
