Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA1B2DAA5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8BA10E6F3;
	Wed, 20 Aug 2025 11:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HDBz9s0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD8E10E6F2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:15:23 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9rvja002673
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0qOyFSkF1mdae5iDRyH3LBmMdqCqXxN25f67C6/GSMc=; b=HDBz9s0P0s4Kh+ni
 az8k8TI4qABStThkA0Z8IgzaEkIiqLLaLc+IRdUfQyQku2yvyoxsIqTFMyqs15td
 xcEZYPBY0X/a8SIOmUduYv0Y+VXWdamebto9yAlJkQau3IwMiTx2h0GUJFpDAVGp
 rhPlY4h3VHVsvD8cBsbcp4HGygJ9JTu/V8tOP2KhAf5kWsOAombcYXcP47NDPRZI
 XaPpInAx0kROt9ItCDG/ZaddcQedMrPW/P45zw4O0H1Sl4LAkOCG9wpGByXiOzn/
 Y9a+xebCg7AnpO15RT7LC4NcFfAeclEXTgYopfYmGCr8AHZiofnC+5Lp7V8/7RvL
 DsSRmg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528sffq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:15:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70ba7aa13dbso122564726d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 04:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755688521; x=1756293321;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0qOyFSkF1mdae5iDRyH3LBmMdqCqXxN25f67C6/GSMc=;
 b=vxZpYCY7MpVPtKj0ExDgG2Z8Exc0L4yoQuQOfW8edXsQm9OZ8SWNPDAsEK4RnGR6oo
 UkqtwQdDZwj2wbz6dj1z3yGlWsQ4Wqj4D7MECyoCsbz+O3EzfOLRfah/GyrlxyuWaxdB
 UpfnhrKmOHkxMlSVv5ybE9OFXpJTHiWOu4sdlgrVT1kl9q/gaDStcylIZOjGdj/sD739
 xm24Y0OwDGpt5dVs3Qj7jCeGDI5D2F/DFlwl//ET91hmg1C+7bKw1ErRxSW0zoCBLRre
 FpQTT+1T5B/Cx4/SxkSE+pmTtgz9fB04xouiGkaNbrIa3MtYFVs7zZvZHydzK2XKUGwW
 XqPA==
X-Gm-Message-State: AOJu0YzbUVLgF4OtRJXe7zW8BBi8CresCfNVs/SDQKfmgoX+3Hs96Oab
 3LpVGGlStttQamOkG7jI1BrdauUYmHpLP3c02oBs7LG+YQ0YdLTNr0gyZ3xXsGY+RTky7Yzl4KA
 EGAPraUhh0iK8x2vpFBLSaJ2DUTjM1sQjFdWipZIYUGVWRVyWgn2BFJ0U+PC8JcMQrEtIq1w=
X-Gm-Gg: ASbGnctv/UqNA2UqHrdpfLy1OCrel78i1vqqmH85zodio0yFwXO310oZ9rvt4hVsNPC
 QGiBz9wyCrynlbvTDm4AbrqQX7qG7zZJLJ7ewjr7pXuWKlI9HMg5rxdzbc2PPhfREfeXsQus5cy
 RWNA6rLtw17M/mgdyQUtn8y7qfmdP5k7Ekh85jjp1ab4u9n4lbljz/lF+EYsf5IjlUUub94i2f8
 Uw4sjIg37Tsglk9hJyDBWhqU/SkNEYhqj9PGdzCx5yCJI8xyWdjP+oKAQkL337OTOunxKou1XCM
 Erd8cEMeNndvXv+7RjHd0I2hbBEEjY56a2WHpetgn9s7NZmnTF90mmzuejOuatUMnP0dxxCCYEA
 ld5soMWF8xix/+IeAEQ==
X-Received: by 2002:a05:6214:1c47:b0:709:50b8:cb85 with SMTP id
 6a1803df08f44-70d76fb14a1mr20922226d6.20.1755688521459; 
 Wed, 20 Aug 2025 04:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH80qwENBGa8LZaS2l/vsPkoG89K8rwgcpZkHUFmG54urW6WuO247zB8LpY8iq/8kq4fh5zOA==
X-Received: by 2002:a05:6214:1c47:b0:709:50b8:cb85 with SMTP id
 6a1803df08f44-70d76fb14a1mr20921616d6.20.1755688520930; 
 Wed, 20 Aug 2025 04:15:20 -0700 (PDT)
Received: from [10.207.49.70] (84-253-220-51.bb.dnainternet.fi.
 [84.253.220.51]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a489f49sm26715321fa.35.2025.08.20.04.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 04:15:20 -0700 (PDT)
Message-ID: <db09dded-deff-4233-bacc-90d41346f52d@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:15:18 +0300
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
 <24392da1-02f4-4d57-a145-6285d46d3bad@oss.qualcomm.com>
 <185e3a1f-0d84-460f-a9b3-bc4bdc13e543@nxp.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <185e3a1f-0d84-460f-a9b3-bc4bdc13e543@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a5ae4a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=JdIsBVl79nXNK9flUcZCTw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8
 a=5lv965NAfe5egn04DU8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 0NSP72dXyaMxl07JE3w-nuLNpBzyxwUG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7oDeOXDCf9OK
 2LeE1q+uol+nXCO84gRPMwAvAaDykc0Q9rC5v4llP5odRb5tAvXrb9jNTgoXofJQV6R81lhgdih
 /v38so/wZTIfYFqJr9RoSAsCXTXaLO2XaBfKspenKM+6k+ZZNN4anBgAHkyWkDK+0E58JdAxL+W
 cdmiYLeHG8XasnCVxiP/Lq1W1F+/ZrRFjC1jBD+06k8BYox5qhs4OEgL7N5qQAugOYnDlNG6vh5
 Yz50tdiT9ea6B2o18PIYfF7DgbZbX4LQuATC7qriD1VXtMh31D3/wHFRfjg61D1vbp7CUYli3D2
 CcnrM1xzAXvwJyQlHSGpszUvhFOwzYjlwnJyGYqNZGzapong9kzImqClRtBduviTSzq76phSO5d
 jen6Unfh5tNIgnc7tmiK4EYj+T+feQ==
X-Proofpoint-ORIG-GUID: 0NSP72dXyaMxl07JE3w-nuLNpBzyxwUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On 20/08/2025 06:28, Liu Ying wrote:
> On 08/19/2025, Dmitry Baryshkov wrote:
>> On 19/08/2025 12:49, Liu Ying wrote:
>>> Hi Dmitry,
>>>
>>> On 08/16/2025, Dmitry Baryshkov wrote:
>>>> Declare which infoframes are supported via the .hdmi_write_infoframe()
>>>> interface.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/bridge/ite-it6263.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>
>>> For subject, s/it6232/it6263.
>>
>> Ack
>>
>>>
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
>>>> index cf813672b4ffb8ab5c524c6414ee7b414cebc018..b1956891a8388401c13cd2fc5c78f0779063adf4 100644
>>>> --- a/drivers/gpu/drm/bridge/ite-it6263.c
>>>> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
>>>> @@ -875,6 +875,7 @@ static int it6263_probe(struct i2c_client *client)
>>>>        it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>>>        it->bridge.vendor = "ITE";
>>>>        it->bridge.product = "IT6263";
>>>> +    it->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
>>>
>>> With supported_infoframes set, the two lines setting vendor and product
>>> are dead code.  I think it's worth dropping them and updating kerneldoc
>>> for vendor and product members because they don't have to be required if
>>> DRM_BRIDGE_OP_HDMI is set.  But, this could be done with future patch(not
>>> in this patch series).
>>
>> They are still required by the framework itself, see drmm_connector_hdmi_init().
> 
> Yes.  But it's a bit too strict since SPD infoframe is optional according
> to CTA standard documentation.
> 
>>
>> BTW: I don't have ITE datasheet. Do you know if it really supports only the AVI frame?
> 
> AFAICS, it seems that ITE6263 supports inforframes from 0x81 to 0x85, so
> including SPD inforframe.  Maybe, just keep those dead vendor&product
> settings for now and add SPD inforframe in future.

I don't have necessary hardware (nor programming manual). If you can 
extend support for those frames, a patch would be really appreciated.

> 
>>
>>
>>>
>>> Reviewed-by: Liu Ying <victor.liu@nxp.com>
>>>
>>>>          return devm_drm_bridge_add(dev, &it->bridge);
>>>>    }
>>>>
>>>
>>>
>>
>>
> 
> 


-- 
With best wishes
Dmitry
