Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44779716B62
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 19:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F3F10E0AE;
	Tue, 30 May 2023 17:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234E610E0AE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 17:43:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UEUMvM029742; Tue, 30 May 2023 17:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yWUsg6QimbYul7pErz2NZHFb7ycHxa+A6W4lnRDWMD0=;
 b=PlJVIEzp1Ic5WZU6rZLupxqcPDsUkDjWVm22HAR4HNFiXF8tvSvk98ukSs3+0FMFgUSC
 RX3maRACZoHkpGB+IBU3oGZjZ4I/lA7+ntKZDu4qpV9RZAuouJdZEGZ9xQdYI3iCA2Wj
 grgJpZ6dka7O3UouxS4nH5hjjfx0W+Quuuk8EgOoVEwm0DDJq4iLZrwjVlpnLfrBuJsn
 DronrZZ2b6etPEVyjF9gY+S6QkgEfdGCfBWFpcEsH1JAA4+Veg8FC7OnpzuxKhkfVb7E
 3jlLZ4BahOtfp6S7n6BljZYwzygZWVcUMwKM/rYbkVikaW/+yrzr7HD/Irfr/sdCiVJV NQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qwa34hn2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 17:43:45 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34UHhj1W030400
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 17:43:45 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 30 May
 2023 10:43:44 -0700
Message-ID: <a5b7d094-3e2a-f5e3-0c1e-90e95a3b7715@quicinc.com>
Date: Tue, 30 May 2023 10:43:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Visionox r66451 panel
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Neil Armstrong
 <neil.armstrong@linaro.org>
References: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
 <20230516-b4-r66451-panel-driver-v1-2-4210bcbb1649@quicinc.com>
 <3cca2809-fa26-f0cf-2ccc-6737d150b43d@linaro.org>
 <kc65fjf5xibvszx4afomzbmfrlld4vcnwfxqxefrupkaxw74fa@j2op4bj2recm>
 <2d9d7454-0e7d-b6f2-93ff-9eca69380e47@quicinc.com>
 <9d50bc4e-e747-47fa-03cf-4dbd33f778dd@quicinc.com>
 <5becf303-8a23-6ace-2379-0a002e9b48f7@linaro.org>
 <6enrlcmw6a2vxwzocsdbcx7yaltzh3kv4w3yiydzx7ylrtdozn@xzwdj35uj7na>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <6enrlcmw6a2vxwzocsdbcx7yaltzh3kv4w3yiydzx7ylrtdozn@xzwdj35uj7na>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: BVHgrVs6HbLQae_tgt4HA7Q0HLncqrP5
X-Proofpoint-GUID: BVHgrVs6HbLQae_tgt4HA7Q0HLncqrP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_13,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300141
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/29/2023 5:09 AM, Marijn Suijten wrote:
> On 2023-05-26 09:32:45, Neil Armstrong wrote:
> <snip>
>>>>>>> +static int visionox_r66451_bl_update_status(struct backlight_device *bl)
>>>>>>> +{
>>>>>>> +    struct mipi_dsi_device *dsi = bl_get_data(bl);
>>>>>>> +    u16 brightness = backlight_get_brightness(bl);
>>>>>>> +
>>>>>>> +    return mipi_dsi_dcs_set_display_brightness(dsi, cpu_to_le16(brightness));
>>>>>>
>>>>>> mipi_dsi_dcs_set_display_brightness() already converts the brightness,
>>>>>> so you don't need cpu_to_le16 here.
>>>>>
>>>>> Tread carefully here: we've had the same issue and conversation on our
>>>>> Sony panels where this extra inversion is required.
>>>>> set_display_brightness() sends the bytes as little-endian to the panel
>>>>> (and it even assumes little-endian in get_display_brightness()) but the
>>>>> spec for 16-bit brightness values states that they have to be sent in
>>>>> big-endian.  This is why c9d27c6be518b ("drm/mipi-dsi: Fix byte order of
>>>>> 16-bit DCS set/get brightness") added
>>>>> mipi_dsi_dcs_set_display_brightness_large().
>>>>>
>>>>> Jessica, if you need to have the endian swap here (should be very easy
>>>>> to test with a real panel, but it should be given the max_brightness
>>>>> value being over 8 bits) please switch to the _large() variant.
>>>>
>>>> Got it, thanks for the heads up!
>>>
>>> Hi Marijn,
>>>
>>> Just wanted to update this thread -- I've checked the backlight brightness values in the sysfs and it matches the value being given in the panel driver (255), so I think it should be fine to use *_set_display_brightness() without the _large() variant.
>>
>> Sure, I was also misleaded by you using cpu_to_le16() but as Dmitry said it's already
>> done in mipi_dsi_dcs_set_display_brightness() and a no-op on LE arm64 platforms anyway.
> 
> Yuck, right, it's cpu_to_le16 here and not cpu_to_be16.  @Jessica, can
> you please remove this misleading conversion?
> mipi_dsi_dcs_set_display_brightness() takes a native u16, not a specific
> __le16.

Hi Marijn,

Acked, will drop the conversion.

Thanks,

Jessica Zhang

> 
> - Marijn
