Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C6BBD6DC
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 11:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0044F10E274;
	Mon,  6 Oct 2025 09:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bs0KoP7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E63E10E274
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 09:24:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595Lp9uB013071
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 09:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7K60QlJ82w8jj8i5uoLYN3GzdWOEyO3RBRWLo+2B9Oo=; b=bs0KoP7E4K2DZNRx
 c80iuQ/mm/ori1OuEZ5GuVEAym6B5UN+EQuyacoX5uROpeqXpCBFywcg3K/kknI6
 wOtqPLjNhmCoRphtuvAXQSe2OUsoZRQKif/xM8lfEEFtcaZHgMc5CMW7hq9aW90T
 R6ATtYgEjtRkbOJI7KaD/8K8U8GdIOxonMLySv8yqIvOzdis1lVWsHMq8Z1FDEkK
 WpucnlZlA7lmiScLUSROhosWOIjP3rvPvxTCzkIUEmX+JoAHlyPZCk09gVqvpwOS
 QKhylzGrgeH1PsUfec9YxCopUxWCsTXwTBUbgYb7cDeoyBmrslQFjrCifcC+j0kA
 82X2/w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6uck1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 09:24:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-879826c55c8so9922396d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 02:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759742680; x=1760347480;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7K60QlJ82w8jj8i5uoLYN3GzdWOEyO3RBRWLo+2B9Oo=;
 b=gI93aqQcXIm714K9geLuNpAj55py66ACe6Kg+ffkoapphsARU4xzxVdpJqBwGfgj+/
 RM05hXxZ3S5lmLzdgCGsc1DFLT2UYNEGlWyxvwOpeFC3uUBqAz1Tn4nxf+0ylsYZED0W
 rIFQwCD0Op6ZtWZ1K2Pexr/FPD10Q9S/oGRx2CwFAwXcZ9KxM5ervmZubSTzg11I+8GB
 JYiW0EXThlFWMbaGR2XwzZWVdyAega8jsiR0od7OFjmfUtoD8wDUqK1gUDGIPGU/TQ2E
 T8v9RTciXyu8T26QXGeRT9CAJJdp0a0kMn/V9f2+S60/Nm22DGeOmktLlAU7+tXZwiSI
 vUeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc8aS1mO0+BFhDzGPXd2LUU5Cj2OkeAR1m49QXlmMCQJ51Erc14UGPWT63an8wB38q2zBkdZnCvZs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz0OzQV4CVmHDgqw2sqaN/aFm0OF1XYf27lTH+u0bHjZr1i15a
 D+QYCVc2gWq1I4FcCSvd8oK2jyvQmw9AccxmCQcDvVjyfgUxk2aphWStXTK7VRgvV1cMLeuR/Gu
 ekCVUIHqtIYqUUwGkRhxLh/iZjXb23vGGNsPfX46u4eqA/qXaUG3VwKm/IR3zOXrFzVx/LME=
X-Gm-Gg: ASbGncvSP5lfd4MET6vqAEcpUbUgyw37cylfm6n79V5e3wrtDAZvZZFmREr2tloZMpt
 pYlyG8W8q4CD8IirOZH+tkYQ8UFWATWPuYYZJaH/AnNWYV+1/kjvrKrAEIrxaBWrtHSzsjfZvV5
 WkcIBUcsH/wdxBYQWoP8mpzkFPDaBtOtbxII4NETdjEPylqCkOxl/qTmXsClxYL80CZ1UZi3xUH
 +DC1O/Bygafc43v/Wxxu7d5D6omBiFrppiVcus++5DM+q24hbt7HjQOYotpirVZgy4Bxr5N7gI4
 6C7Mhra2JijKQ8bz9Z7127qdg2CBwmTTP4Ss+pXfXjXaAT7hf845ufMbyehN3yF0R9vBsgu+04Y
 KTUTr0TkEbTC5bpy842+MEJbPJQk=
X-Received: by 2002:a05:6214:2309:b0:784:4f84:22f9 with SMTP id
 6a1803df08f44-879dc8cad86mr107666176d6.7.1759742679787; 
 Mon, 06 Oct 2025 02:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp/ysV59MYtgw2kvE1S9hkzkaZeuT8sanAw6VLuCHYzQ6S4o6+kY7M3XEpDaiVC+6tvUGVqQ==
X-Received: by 2002:a05:6214:2309:b0:784:4f84:22f9 with SMTP id
 6a1803df08f44-879dc8cad86mr107665946d6.7.1759742679281; 
 Mon, 06 Oct 2025 02:24:39 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6397c9355c3sm3510239a12.0.2025.10.06.02.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 02:24:38 -0700 (PDT)
Message-ID: <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 11:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Junjie Cao <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e38ad8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=oCkFgi9b2cravLXa5egA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: WlWaMCzxk-gT9S7l3x3uflqwaWkPmPZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX6V7q6/PzfVPI
 Xm9efB68uT3uuzECCrdqVMC3zeEMra0uz7TQlN3LGVunWR+/V/qqbK7cm5znlL47z57fXlP4uFA
 h6QP5LWqHNCkULQ7eqrKmrkYHL9mGEc3f3G91VBpsxa43uVjOA3gsw1QpAImIky9LFAsCDZYFTi
 8Q9i5jhSZWb8kV4GsOBEUZyAgoYy2+hzrq1P2HOXxL1ZmYB3c4NdJTucro9t+QHX91sbw1Rn0Pg
 ZUQmvJ4JeE/W8j8fWcd8iGuebOSThTulR8/yPThhlVbC1f3U4fyI5ojcNFTjGZdiFmGE/vEhEKk
 e2lVCApAZRu2jLdDzHV+1CcRCcB5btkUrAhGwOBHmRGJsghdkWDK5DRTZUEVqek2mR/AQsUl9CR
 nDbadNbQD8JZzgQCZ6XUlM/RuToKHA==
X-Proofpoint-ORIG-GUID: WlWaMCzxk-gT9S7l3x3uflqwaWkPmPZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029
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

On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
>> tablets.
>>
>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>> ---
>>  MAINTAINERS                                   |   7 +
>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>>  4 files changed, 455 insertions(+)
>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
>>
>> +
>> +static const struct panel_info csot_panel_info = {
>> +	.width_mm = 250,
>> +	.height_mm = 177,
>> +	.lanes = 4,
>> +	.format = MIPI_DSI_FMT_RGB888,
>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
>> +		      MIPI_DSI_MODE_LPM,
>> +	.display_mode = csot_display_mode,
>> +	.dsc_slice_per_pkt = 2,
> 
> As this is not a part of the standard, what if the DSI host doesn't
> support this feature?

Shouldn't the core gracefully throw something like an -EINVAL?

Konrad
