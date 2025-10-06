Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D1FBBDC8C
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC94210E412;
	Mon,  6 Oct 2025 10:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUcwFQ9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB2110E412
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 10:50:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595MvYYR017726
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 10:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IN3CVmizwhnegBcGc3ulurAszyJXyt4uRPeWQ6uV/vI=; b=WUcwFQ9SMmiTZbx2
 NCNeZ1nWtZj9SZeY0FBSxzXMH2IzPbeI3uKZPRyDG5mIBhrMbs10/bHJuffXN1S6
 48ULwM2+mereT1CMxjpteWfk2W6DE7SpPaMQsKBSaw72XyizRA1Vb59NKoU3BYF2
 kN/HEYqbQueAvdOe+N8mgH21IY8fPnz6c8f/WGVRE8w18TQTDEZPzYlp5pOUh0lf
 zq+LbL8Whz/R/nlEOxyrky6T8KZI+AHAWTJxHzZr4qHilz/JFh5CmyACSz8HviOr
 Spq4Ys3qsT8/OfP0FULlcV0FUoOP+wws6TueECzH/vCxhsEMrC864LP8WoN/bm5A
 MH9+MA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1kjqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 10:49:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-85db8cb38ccso143971485a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 03:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759747798; x=1760352598;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IN3CVmizwhnegBcGc3ulurAszyJXyt4uRPeWQ6uV/vI=;
 b=H9u23OBbIspOpxKHXFC9O2kgYea0/kLIGxB1osg/i7MOScvl+widmi+BoqRQMMPdIX
 21xHmOhrW1+u7P9N/nGYFo/R4mQL2VpCnpELpHXjMRZreIosdZyRjQLNPW5b1tw5NgKm
 mQKwJHDAzXG2js4no4mCKoOMNddG1onMgeb3jjW9FbaVxibq5jzo9QIxTQ0xnh6u3bkn
 f2aCbFdjJlGaTppWJ11/0cHGIFFsejgYNQhIal6toSsNJYAix+gouNG3z/89bBwPJ65v
 npyYVJbOHs1eIGd9cRRH3uoVNxnrpkX9z5ggTV07PiHVmsFrlBdYriSwGY3E5odvLi/w
 Q+wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkawDT0YDvvJS1pPoHlx+t7CmRIFhBD+LO05lq1AOy7KCCBzIlxQXSSXqOpsIc0PmOLYJ/ivRAWhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWTEVI64Q+Qx0xIVKP+ueBzElALzO1oh4UFwodMQpYFWWxCh6f
 JZNeT5xkYeRNxgIBZJRL5MhgvCLZAxi6C02mThkJaW9j8HYJ2EeiEbqD3RTuonEa8lEgEPHq7Av
 tCNq0aJflNcAfMNxDq6RvkUk9vnKoDgvq4lEpG6cQAYz0eyq5Iq/IIgMmlMElaOyr7x5uzoI=
X-Gm-Gg: ASbGncuvAJdkPPb45iljzuN1t87nHPWYrKIEWPm5aynZ3f3Euj8s8n9xVepNZ4dnluc
 CiHcZPQFB1yr9YLKrdJDBhN/NLUY7HeGm+jITStODvPmGR4d7k+QWT802uEJBKHRTVpvO4G11Vt
 oN1B2zfWgk+9AtUBTcyLfkxNRx3NCJNbQkF3tVycpGfMsiBm70vSyUJQtJ03fBA3ZXvLuor5IAL
 kDbb0BYJswvoVhjcAe2TBkCpqdLi3H7lj1eteeNGrnIzrggsg01y7uXH4UruyWlqzxKQvjd30A9
 ceDFlyooNhrAyuiLDpBC1VqPYjgYe5ycWogjvQKILlXED+a0PWYT8fnuwKWTGWrxFoHdh1YonjD
 l5X/yyWP+T3zZQMCsdvi7EgHlwms=
X-Received: by 2002:a05:622a:60f:b0:4dc:fc58:c50c with SMTP id
 d75a77b69052e-4e576a45606mr94443301cf.5.1759747798227; 
 Mon, 06 Oct 2025 03:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSEU8VjnAr3dc4CRE1tKa0vgiLD4zAxaPVFZcAL5lIiyFY/V+S9ZVpzOWmv+pNPBnQHAcwzQ==
X-Received: by 2002:a05:622a:60f:b0:4dc:fc58:c50c with SMTP id
 d75a77b69052e-4e576a45606mr94443021cf.5.1759747797738; 
 Mon, 06 Oct 2025 03:49:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865f741f1sm1118572366b.39.2025.10.06.03.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 03:49:57 -0700 (PDT)
Message-ID: <65d0012c-4c06-4b39-9375-89d635f8abeb@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 12:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Junjie Cao <caojunjie650@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
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
 <e36572bf-4fb4-425e-8d10-c5efa5af97f3@oss.qualcomm.com>
 <rxm67cbwkp2qyxdlgqb3fz7fhiskmnhidhjvl4mhqn67iq2x4n@wfueruiiq7kp>
 <53aafa84-6d6a-4963-827e-c1600270662f@oss.qualcomm.com>
 <2do3dk7gqvbloocsv46t3zrc4ghvhrpiqre6djk6heese3wz75@dlqwkdsnrkbr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2do3dk7gqvbloocsv46t3zrc4ghvhrpiqre6djk6heese3wz75@dlqwkdsnrkbr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IcekJdEME_iK4MWpB_-wkdB103NaJRTB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX2BXAj3FFns9m
 0zHnOMznXQkeu81fqSLzHIiCbpMH4Ujrt24h6BsYDgRQOt+vNgFoRAyVnZRr0QZULzQrBPft57a
 lxV8fsxUE0yhmTLtH5H8SwDDtTaNJvpzTUFFClLsDFlv/xFUCby+odjOE5dP3LFj0Gpo7XKZYkL
 PxKHkBdwL1LVEX7yOGDdUjlj8OPwn1R2f8ZFCrvbPcGCxHNXFSfpMifTQMquu+lqTz/Oe3F8sj3
 BOsU9oGTfQVJgn9W8RgCmx8xc1nbkLsxsxqcu38w3HNyuwDGyCu3+0aA7TJb8+uwv/RX1SraVsz
 hzDFWLmnUH7WF8RPt9vR5X47B5Xa/Tih4ncCbPPLSbjFixrUQRUreucfPOvLbQXflyIoAnhWEEe
 tw8cMcXHrBnChvMMpPnIqwYXtWRPeQ==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e39ed8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=zTkMZ0gcjxiqpFU4bxAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: IcekJdEME_iK4MWpB_-wkdB103NaJRTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027
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

On 10/6/25 12:39 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 06, 2025 at 12:10:05PM +0200, Konrad Dybcio wrote:
>> On 10/6/25 12:02 PM, Dmitry Baryshkov wrote:
>>> On Mon, Oct 06, 2025 at 11:24:35AM +0200, Konrad Dybcio wrote:
>>>> On 10/2/25 4:04 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
>>>>>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
>>>>>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
>>>>>> tablets.
>>>>>>
>>>>>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>>>>>> ---
>>>>>>  MAINTAINERS                                   |   7 +
>>>>>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>>>>>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>>>>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>>>>>>  4 files changed, 455 insertions(+)
>>>>>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
>>>>>>
>>>>>> +
>>>>>> +static const struct panel_info csot_panel_info = {
>>>>>> +	.width_mm = 250,
>>>>>> +	.height_mm = 177,
>>>>>> +	.lanes = 4,
>>>>>> +	.format = MIPI_DSI_FMT_RGB888,
>>>>>> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |
>>>>>> +		      MIPI_DSI_MODE_LPM,
>>>>>> +	.display_mode = csot_display_mode,
>>>>>> +	.dsc_slice_per_pkt = 2,
>>>>>
>>>>> As this is not a part of the standard, what if the DSI host doesn't
>>>>> support this feature?
>>>>
>>>> Shouldn't the core gracefully throw something like an -EINVAL?
>>>
>>> There is no 'core' here. Each DSI DRM host manages DSC on their own.
>>
>> drm_dsc_helper?
> 
> No, that's just for calculating PPS and some other values. It's one of
> the problems of the DSI model, which I tried to solve a year ago, but
> failed up to now to do it completely and clearly. The DSI device can't
> check host's capabilities. It declares what it needs inside struct
> mipi_dsi_device and hopes for the best.

Alright, thanks for the explanation

Konrad
