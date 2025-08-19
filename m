Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53661B2BF77
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 12:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5E910E2AE;
	Tue, 19 Aug 2025 10:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKzL53i4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEFE10E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:56:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90ci5018098
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7ghZKUm2aSWn//5Tci+9wfrDSWfLO9oHcOcQ8IQR6Q4=; b=lKzL53i4X+RI5ARV
 H6dGQrFJ5FDOsQfKbKoJAdcIu+/8dkobyoybJx1JjkFSzIC6f+Xwv8DMNGhEEJ0d
 fnYhCiEyndv/Ktj0OVZOFXa3J3Lh5njFVhfyuaqIQghosZIm/YW6pweyW7vnNQCl
 HO7hJ80aHk/ulVaRuPMikMrakI7cYzhPoLeG2pSbHEgVG6196wUZmYBYDZeW2mLR
 fq5WH/v4wsCNoFduSYa2Al6DbUv7xQCShvFy5qAVHdkX+0MUWlgHRvHF0znA/B0V
 T37O/Q1kBZh8Ueju6ywf7DrqxyEKcQgUl1FwmSgS4jNl7m9Fx3+aFC2Q42EjPuPB
 yUDEtg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhah05x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:56:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70a94f3bbdbso107627486d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755600966; x=1756205766;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ghZKUm2aSWn//5Tci+9wfrDSWfLO9oHcOcQ8IQR6Q4=;
 b=mtUjwsRuMU3k0+zOlkLN7q3PoUYxhDLYgjX6wViTv/wxomI5HcCmqT+67witZTD18M
 ggydRrL7nNbrdx8BWTZwhV2tknX7UQh+OLy/fmv9tV1GEmd7/FvWjNrs8Am/gliyFGQm
 UF5SqWXESnA4tLaTJM3Wak/6dW/tSFxNtIvDn4f/ma/I/dolQm0G1S/gORWCSkc4MiXV
 2Vk7VH0l8wW16cju0zsjg+ExEXRuIaRaQSfWnEgWKAbpewPfPjohJfWMk5Rgbg+aUQtG
 FAK50fvSfq3WzUJiffO6mywuBm0UOyVDQOPghThcY9R74rUXs74z3PLcMJU6r2WRtHYO
 3sgA==
X-Gm-Message-State: AOJu0Yw9uQUGGkGecrfRH0cAcMCczWor/ZzCuf6Oncmo8f4ozl6BFjm7
 4NVin22Yq+8U6yzIbNvdxujXCtKHAJx48pU2QlkXnXhitcPF70VLKZ2eZEtgDPOPTNyM3aJ4U0Q
 wnk5Lg5rOhMI6iHPeUaVWFip3U625tqd/5zkTXZAiYVL5/ex/sfjHFgPO4x1Qg4bb7mX34rA=
X-Gm-Gg: ASbGncsxFTsHwe+6pm/83eLGI9xGgoBaTicM6Da+byehSA3lSsOpqwjwNU9KBOMaJ07
 h+rw/XQshfvusAm8h9uvVqCcCMYMmTZQzMNRswXjWn08gBC18gWgCpzV9dCU5q+26GALWYCGxOJ
 Gul8P3JZQ1blHH01oiQKg+QZ7caSfaIfX4TMVY6T9kKCH4vlIzI9Sz3fGwNL/uBMlkY5y0AhKZI
 Wv6Z127tKrySAS7iW+9/7eiwIFo0qOhkE9U45ZIHNYA2Zoc9ornyxfdrGPslhbfW2MnPkahHtgz
 eDb5vF54RYwWuPCmiYXjDRL1dJdFzWr8ZkP9gSaFUrMZBT3krKLLruBn70H6SBGrT1FBGKnSirQ
 1OvjWkGGHgnv+12Wrug==
X-Received: by 2002:a05:6214:c28:b0:70b:c900:c554 with SMTP id
 6a1803df08f44-70c35d70672mr17885436d6.51.1755600966278; 
 Tue, 19 Aug 2025 03:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGUxbouQ23f5n9Nb/Ax/PRMhBNA4fuV1P2n23CV0Mrc7Iqs7S7DSWRnZn8F0Lk+cpHItsHnA==
X-Received: by 2002:a05:6214:c28:b0:70b:c900:c554 with SMTP id
 6a1803df08f44-70c35d70672mr17884996d6.51.1755600965717; 
 Tue, 19 Aug 2025 03:56:05 -0700 (PDT)
Received: from [10.207.49.70] (84-253-220-51.bb.dnainternet.fi.
 [84.253.220.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a41d325sm21592351fa.5.2025.08.19.03.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 03:56:04 -0700 (PDT)
Message-ID: <24392da1-02f4-4d57-a145-6285d46d3bad@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 13:56:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/bridge: ite-it6232: declare supported infoframes
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
 <20250816-drm-limit-infoframes-v1-3-6dc17d5f07e9@oss.qualcomm.com>
 <9e77615a-9d5b-4971-b1db-74d6bed39533@nxp.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <9e77615a-9d5b-4971-b1db-74d6bed39533@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a45847 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=JdIsBVl79nXNK9flUcZCTw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8
 a=y4d4D-FnMFCReEbV-5EA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: EBZj2j2IQj82Eqt7H10iqfJQSJ3SdaCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfXzcCqnOomqBcp
 J3VVpodQecJyRnmgdPZJeO2H1OJLdJeXPCIB66p5U0BiEya8IhxJUDStyQ3MiP3GkfuHbalZY7W
 Bbos3HD9gI2wgP0kYxfhQsstTWf68uwRQFvIQBXM9hFzmtlz4yTf9WCF0FTIzNQVAoG+6FeJUda
 y3nsnVbwVYlr4YCSqd7J4asYDZQoYaDCBC+6zKa26OiwtIykHGipGJSeFvnqJlpj9yq0kahw23V
 ddT5M2fDpTLB9Eih8Ht5scVD7Sd6+8ZThsE0w1ZOlkJ0XzNVG5TrrAokb9nZ6tqBSZ7k9eNGQd3
 kYQxPj8hWC7F6FyfRn4l3Mi5bVpnBziYQENkwTed1kwFSe/lRAr7FOci+JowASWnGXfSFCHKq6u
 RKvB40LM
X-Proofpoint-GUID: EBZj2j2IQj82Eqt7H10iqfJQSJ3SdaCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
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

On 19/08/2025 12:49, Liu Ying wrote:
> Hi Dmitry,
> 
> On 08/16/2025, Dmitry Baryshkov wrote:
>> Declare which infoframes are supported via the .hdmi_write_infoframe()
>> interface.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/bridge/ite-it6263.c | 1 +
>>   1 file changed, 1 insertion(+)
> 
> For subject, s/it6232/it6263.

Ack

> 
>>
>> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
>> index cf813672b4ffb8ab5c524c6414ee7b414cebc018..b1956891a8388401c13cd2fc5c78f0779063adf4 100644
>> --- a/drivers/gpu/drm/bridge/ite-it6263.c
>> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
>> @@ -875,6 +875,7 @@ static int it6263_probe(struct i2c_client *client)
>>   	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>   	it->bridge.vendor = "ITE";
>>   	it->bridge.product = "IT6263";
>> +	it->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
> 
> With supported_infoframes set, the two lines setting vendor and product
> are dead code.  I think it's worth dropping them and updating kerneldoc
> for vendor and product members because they don't have to be required if
> DRM_BRIDGE_OP_HDMI is set.  But, this could be done with future patch(not
> in this patch series).

They are still required by the framework itself, see 
drmm_connector_hdmi_init().

BTW: I don't have ITE datasheet. Do you know if it really supports only 
the AVI frame?


> 
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> 
>>   
>>   	return devm_drm_bridge_add(dev, &it->bridge);
>>   }
>>
> 
> 


-- 
With best wishes
Dmitry
