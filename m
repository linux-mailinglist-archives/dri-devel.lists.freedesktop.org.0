Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8530B832BF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 08:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4186210E663;
	Thu, 18 Sep 2025 06:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PEi5s4iU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95C210E669
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:40:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I4jiFE017946
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LjaNkwEord8IuaS2Ix8rlcQtQCl3eabfxMXBeTRj034=; b=PEi5s4iU6KYwPSv2
 idItjN3VAXrFN0lg13BbjJbAv5ozq/cA4AFCzZdrlNJp6gWJMtOKz/jy96u71rRo
 NrO6UvNnYQ1JtvJMtLgpFhc3FM0aJcjQ1vmqgIuFyd9koEHWPQTcFEyWxKC3iGbP
 yK2ORo7+AVDcCIy51gzwVU1X++S6nhE2gsccFlYqVfxRz8UcWeTTbLTDzGwZBWsU
 M1JF9K74zyuUQH3aGiBaAprvPSg+17JAqg+qFjHV91W/SOxAs83jZC+bfpL8DwmG
 Ad67IExQ9hjx6FMs4nnpkUAfopoDdEtw2EqALnCU8DLcR90T8LUA/E24RbUFrsFc
 46Cv6w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4982de9rar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:40:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-32ed282183bso200849a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 23:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758177621; x=1758782421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LjaNkwEord8IuaS2Ix8rlcQtQCl3eabfxMXBeTRj034=;
 b=B6Db3yoRjrDvvniwkNZ2dMlm6LUh+vSTCwP9+6VPxkdsemTnlYFxTg9mtNk+5SQRss
 AKYw3bQdnmlfswF8VpUwFonA/P/O9hXA2j0hAzlZ5+2kUjAR5aJcwDthVucK0JudNOoK
 4bX//vxctJAJNSQBjyymRIlRjrH+G/IQyD55mhJFjHOtQauRc1qr1/e7n/vfVWRUeart
 Vcmi/Zi1a/1rjsK4fIgk1hsK9ThkOnS8Dy5CxZeaOA/cJqBiWwpQa6vpmbFp306spSv7
 t/MKCrxlhNTnnY/EJwKJO6rT87Cjp5yiXPn2mUQJau6Gqix40BWjyRVJHp7ifJUQrIgQ
 qqlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN6mFwlPVEEcEwj5XQ1WlX3Wt7638hP5pnur5REInM9xIg4akNp5EEj4sXFUpSgEum8WL6n2Eo0dA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaporsZIxrYCB39DNYR8XbmhKoiv+shXF71qYcHGX8+Oe8TMv5
 UHKFluQwGbpfxfnsIwrAY9/VeXRpDbKcRLnAfrQCU2wU5Z0Z8R0R95BWHKsPc0WkNATqhjXKPsa
 y4ak+HpBh0vBQa85XoE0tmw0uk7gccHON/x9bNbNZqwBn5PXOiFPQgGDIUaHvxX06/7Br/tQ=
X-Gm-Gg: ASbGnctN+AqojeC672vMPEVCbEypIO28wivbEuW+y8TxrJy7Tn6RkDTKsUzntrYtBHL
 NACUWRj0gZSep+ba0pyVm+w112nCzVT+DLBoWgMxJ+TSo44aoaK5EDMB1sumq+e14ad1rVDMJQF
 7mzFi0teXu9DqRhbIOsop8QX4w/iGprBHGVuPK4kE1p8ThRhRNmZktEn+4YGggvggkWAvelylpY
 btURGjMIbNIrB8lXuUz7I+YbDh9SQTI8VLesPAqgZa9JJ0oCZ1nJET8SHMLpmsp9gWlFfw2TvFB
 JQqE7ZySgvjXZ5U/Jfo4SNRDEECd0SDMtu6h0MIv9btl+gY3q7OIjMVRYjOqg8wiDGCDEjKBBVD
 Uhy4kVM/A64J0cNT1fQJMpJpNBb0KQqjR0Q==
X-Received: by 2002:a17:90b:1a85:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-32ee3f81fb9mr3115596a91.5.1758177621297; 
 Wed, 17 Sep 2025 23:40:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5qY1sAAfH7rgQLI8TMzDM81toKk94++RXJMv41XuxHoyUPZDYMls2v+1O0U+ZGupHT65xDA==
X-Received: by 2002:a17:90b:1a85:b0:32b:dfd7:e42c with SMTP id
 98e67ed59e1d1-32ee3f81fb9mr3115576a91.5.1758177620860; 
 Wed, 17 Sep 2025 23:40:20 -0700 (PDT)
Received: from [10.133.33.13] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfec3dadbsm1329619b3a.68.2025.09.17.23.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 23:40:20 -0700 (PDT)
Message-ID: <50346565-20d0-4ef9-80a5-e08070fdefb6@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 14:40:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] drm/msm/dp: Add support for lane mapping
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-13-2702bdda14ed@oss.qualcomm.com>
 <oex5463riqvvyfyntxcyissaznnfsd6xogcniqouqcn6yokgwu@dwhje4i5inj6>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <oex5463riqvvyfyntxcyissaznnfsd6xogcniqouqcn6yokgwu@dwhje4i5inj6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfO95xRf c=1 sm=1 tr=0 ts=68cba956 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zEApyEmNphHiV2Xtq7IA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 8mqBATR2IUdST0rAY0j2CcpL7noSb-cx
X-Proofpoint-ORIG-GUID: 8mqBATR2IUdST0rAY0j2CcpL7noSb-cx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDE4MiBTYWx0ZWRfX8zeLZJUmHhpg
 3MKCNux4Eiq9B2iL1m30oZC1+Yu2iMnKHZYOhuR3GYI7H+H3d0aULsuXLBcXE/fUVxMmYj+ubEb
 WVvbRuujKb2AX/ezdTqBSgjf2/zzQQCMPnwlWg8RQL2kaCcaxaRQYURULsdILPp2phkLZ2qH01U
 tROM41mYIbg1bkVwvp0iLUA3GfLrpi+SQl7x1JKn0f2nJCU29D+6ImuZEmK9SuTvTSNUZ5pngyg
 JqHDF8h6ofDsBIKWXKdr+j5l4J3vrDg90B5WncAJhiVDXn0LJ5lJaiZiibC/txta19vVEsacJ13
 G6Rsim7w2gFEaL/kma87JWJVMxVRnR+64kXXxsD1ildxq3uUNHMd92UJwdmuDBhwSzcqQ337v7n
 myCbISro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170182
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


On 9/12/2025 6:42 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:10PM +0800, Xiangxu Yin wrote:
>> QCS615 platform requires non-default logical-to-physical lane mapping due
>> to its unique hardware routing. Unlike the standard mapping sequence
>> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
>> configuration via the data-lanes property in the device tree. This ensures
>> correct signal routing between the DP controller and PHY.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++++-----
>>  drivers/gpu/drm/msm/dp/dp_link.c | 12 ++++++++++--
>>  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
>>  3 files changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index c42fd2c17a328f6deae211c9cd57cc7416a9365a..cbcc7c2f0ffc4696749b6c43818d20853ddec069 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -423,13 +423,13 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>>  
>>  static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
>>  {
>> -	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
>> +	u32 *lane_map = ctrl->link->lane_map;
>>  	u32 ln_mapping;
>>  
>> -	ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
>> -	ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
>> -	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
>> -	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
>> +	ln_mapping = lane_map[0] << LANE0_MAPPING_SHIFT;
>> +	ln_mapping |= lane_map[1] << LANE1_MAPPING_SHIFT;
>> +	ln_mapping |= lane_map[2] << LANE2_MAPPING_SHIFT;
>> +	ln_mapping |= lane_map[3] << LANE3_MAPPING_SHIFT;
>>  
>>  	msm_dp_write_link(ctrl, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
>>  			ln_mapping);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
>> index caca947122c60abb2a01e295f3e254cf02e34502..7c7a4aa584eb42a0ca7c6ec45de585cde8639cb4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> @@ -1242,6 +1242,7 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
>>  	struct msm_dp_link_private *link;
>>  	struct device_node *of_node;
>>  	int cnt;
>> +	u32 lane_map[DP_MAX_NUM_DP_LANES] = {0};
>>  
>>  	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
>>  	of_node = link->dev->of_node;
>> @@ -1255,10 +1256,17 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
>>  		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>>  	}
>>  
>> -	if (cnt > 0)
>> +	if (cnt > 0) {
>> +		struct device_node *endpoint;
>> +
>>  		msm_dp_link->max_dp_lanes = cnt;
>> -	else
>> +		endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
>> +		of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
>> +	} else {
>>  		msm_dp_link->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
>> +	}
>> +
>> +	memcpy(msm_dp_link->lane_map, lane_map, msm_dp_link->max_dp_lanes * sizeof(u32));
> This will break all the cases when data-lanes is not present in DT: you
> are storing the empty lane map instead of the 1:1 lane mapping that was
> in place beforehand.


You are right. It would overwrite the mapping with zeros when data-lanes is missing.

In the next patch I will:
1. Initialize to a default 1:1 mapping (<0 1 2 3>).
2. Validate and apply data-lanes only if present and valid.
3. Always produce a full 4-lane mapping, filling unused lanes with remaining physical lanes.


>>  
>>  	msm_dp_link->max_dp_link_rate = msm_dp_link_link_frequencies(of_node);
>>  	if (!msm_dp_link->max_dp_link_rate)
