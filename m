Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D30ABB706
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 10:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A8010E1DC;
	Mon, 19 May 2025 08:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnnAGXAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F9810E1DC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:20:57 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IKmKh5021031
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4jHLqJtJR/H3L9Lz2o55CQrsBxGQmwWALeH+iCx6r2k=; b=lnnAGXAkX9bvVc+c
 MDoiNeKyAZ6+YHh6Vm64VTQCAiO4OxKUniUBaOMq0tP2wWjDB7Iu6WWcTdkfdXz6
 jJUXmlPxXEyhicgAIkEwocycqLxUVMzw+jIhSA9Tp3zlNdU6hlOQGTAcrplMLPoA
 Fs3damtX6wYljLhPAsJ+cFNhp7v8mCP0GnsMASEjlJ9YQPY1vuIpUuOh/B940hSb
 eJKDHYKCBXRQnNhbpEa6la2zSQpTR2DULiV/mMIpBdx3VHIOmj5bJiaRpSAT6IvB
 NNHqF91fm3AOwMQSmnZBJBTO3AG7VjbZ33rSOFsx7DBNPRS8odkGqyosYAjbSSLY
 pNm27w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9uksd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:20:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b1f8069e9e0so154811a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747642856; x=1748247656;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4jHLqJtJR/H3L9Lz2o55CQrsBxGQmwWALeH+iCx6r2k=;
 b=YXwWBuK6CnuTNG9IWZ21fjUHKPl11ZX0Va4iqBG1A7ABUNcKXQsvEeWPF1A+7AdXcp
 S2p9TAN8xbPXIMZdhODLIV3Z5gOGIAoZnBlfH64w0yr8YoFoy263tblmctPOTQ3PDIN9
 fi9j79Me1MPbz8lUMzQn7/WSaMxmnQAzLDBbHuCGiC9tplmi58pGQ1UQgO/KIRZ9ccpG
 KI1DJla07sWv0klLupxKcaEsa9oD4IRICYGYxgdM3Mwc9JR4RNwJVnAw66J5VQuvA0oB
 F0ljcXdLzRfA8S9KscD6X2aNPICy4TKUc9KKLaedlj1yVX/Vc42s+cTQZh9oelTpQ3ZJ
 yThg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO2zHz90xeN8jHGYWH5Erj/m/tspnVvnyv86S08XYmak+FLWEa0W06v0RhbGZoetSkTbJ94pa14hU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY9jCH85EpkuTDRIfmHZ7y0D6ogMHClPqqLBivkLXyHuJXiSgS
 upragrRxeZiXQIzijthprNSlqDDXQTm3FgbrrkEejhA6Ps1cktQE7NY8Lxc30+cWDBDX7jG/pf6
 FGEriLIZhwc3QiEHXu2h7eaqPsWHpkGtyD9XuQ9BRPjTP/Til/PgzI2DR4m8kY2rWd6Pqp4M=
X-Gm-Gg: ASbGncuFgRHRqcZtDsSpLBAOIHvbdgCD3HT1dAiQmtA+9Qu8W1UaDWSmfqFoC4AdmwA
 4uvELKfm/HiqpEruoHm9y+JnotIvW2J9lgEP2KnBqWDSi9Adefl3LfaBE+cCHmTOwzXsFzJyZeF
 xm8Z+o0LnmQGuA0Bn21q1I40TANR8t4I9YTaLMe5BgooMtnhw0xqiqiq2758N/RWKyCkJdFZXFf
 0UXqRYltzBIqPBQBTffuIvUzTAwRvfwElQc17Mac/1WMEWVVHLDaER0tHE8D+VSMxedtrXxeaBI
 Z1psWgS2PA+kgxi3L+PHTX28bswgIlVEeNgI2MqNcKBrWgN14Rl2wETofWKctPaljHWcySmjSbh
 h
X-Received: by 2002:a05:6a20:3d92:b0:215:e979:762f with SMTP id
 adf61e73a8af0-216219c656fmr6623528637.7.1747642856066; 
 Mon, 19 May 2025 01:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5PAUzn0GvTsPJRCt2MyJ3o5jDvz2ViCLBGKCluWBuApDplJDI6WCxq8gdmWk+kRTeXlzKjw==
X-Received: by 2002:a05:6a20:3d92:b0:215:e979:762f with SMTP id
 adf61e73a8af0-216219c656fmr6623485637.7.1747642855515; 
 Mon, 19 May 2025 01:20:55 -0700 (PDT)
Received: from [10.133.33.47] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eb0a9ac9sm5654824a12.78.2025.05.19.01.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 01:20:55 -0700 (PDT)
Message-ID: <84500975-eb32-471f-a64a-283e885ae84e@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:20:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/msm/dp: Add support for lane mapping configuration
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dmitry.baryshkov@oss.qualcomm.com
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 quic_xiangxuy@quicinc.com
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-5-09a4338d93ef@quicinc.com>
 <CAA8EJpoY8hySQd00yODGeHjSpVZpEBLjF3aBiKGJPUhpr-2mgw@mail.gmail.com>
 <d2a3cd6f-1077-4edb-9f0c-0c940a639050@quicinc.com>
 <zvapsvfftai4fp6vwrn33edqsyuuprq2pxz6spij6j7t4y6xmn@zzgp7gbsivbk>
 <93ddb63c-42da-43c8-9a77-c517ca5d6432@quicinc.com>
 <CAA8EJprAFYD6ykN10-r=JwHM4A4XeDDcZVcVWYp_5A5FP-=RyA@mail.gmail.com>
 <e647d143-dc6e-483d-ac81-2733fb526fc3@quicinc.com>
 <h6tmbuv26tdv633udphttsydpbvnwownulvglcxktdaxqdhtvw@ereftfs5hiso>
 <9fb34496-d823-414a-b7dc-54b4677829e5@quicinc.com>
 <td4dkb6qoxfa7lfmfszlowov6qxdukqq5qnwnhmajnskr5mu2u@todczb6inttv>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <td4dkb6qoxfa7lfmfszlowov6qxdukqq5qnwnhmajnskr5mu2u@todczb6inttv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MCuo_zNXYBXutk4BCgnx6SmVKk6kJmdS
X-Proofpoint-ORIG-GUID: MCuo_zNXYBXutk4BCgnx6SmVKk6kJmdS
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682ae9e9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=Oh2cFVv5AAAA:8
 a=JfrnYn6hAAAA:8 a=COk6AnOGAAAA:8 a=mb-A_Saak2OZ3Y13WnMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=7KeoIwV6GZqOttXkcoxL:22 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA3OCBTYWx0ZWRfXwF9j5icleer8
 oCY9aGWpg34baVHpRMlqHFp+cdmESa/Um3BTFpjxDyzLET5Ak1SKzJCwJRo9iqvHHi/yQTa5Vi4
 2DETQpyoBXs7t19av0kyC0TWeHKmrsnLyY6wC8GukSEF0DYJUEJ5t7LZJd8WZu8yQxCS140FMKp
 6N5Hozl+gVJSuugrj0bT1ad2pIqO4AqHMz5URqPg1nsg8goUtQ9JQgSbptCPKB+JWC1nI97C9pt
 iV/7/kUiqxW47zhjWTQlvv5JPCrdokRzcpaLfCGLtROaCvn35Bk2JUHvuHb8HV4iqvkrblNT8Pa
 w1IpavugUtojfwfiVDpNx1Qkcyd18xYeJBZijmVSM9rE/08OFFFFx/tiIKci0UrczjR86rlfFxR
 UTX54vIviaSh/MIhjjvMtiqd98TF7dd2tyL9prWvrSMHOL3nwQtUhz/ugUQOChNFXKOn2aBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190078
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



On 3/6/2025 5:14 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 05, 2025 at 06:16:45PM +0800, Xiangxu Yin wrote:
>>
>>
>> On 12/20/2024 5:45 AM, Dmitry Baryshkov wrote:
>>> On Thu, Dec 19, 2024 at 06:36:38PM +0800, Xiangxu Yin wrote:
>>>>
>>>>
>>>> On 12/5/2024 7:40 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, 5 Dec 2024 at 13:28, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 12/2/2024 6:46 PM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Dec 02, 2024 at 04:40:05PM +0800, Xiangxu Yin wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 11/29/2024 9:50 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>>>>>>>
>>>>>>>>>> Add the ability to configure lane mapping for the DP controller. This is
>>>>>>>>>> required when the platform's lane mapping does not follow the default
>>>>>>>>>> order (0, 1, 2, 3). The mapping rules are now configurable via the
>>>>>>>>>> `data-lane` property in the devicetree. This property defines the
>>>>>>>>>> logical-to-physical lane mapping sequence, ensuring correct lane
>>>>>>>>>> assignment for non-default configurations.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>>  drivers/gpu/drm/msm/dp/dp_catalog.c | 11 +++++------
>>>>>>>>>>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>>>>>>>>>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
>>>>>>>>>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 ++++++++++---
>>>>>>>>>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +++
>>>>>>>>>>  5 files changed, 20 insertions(+), 11 deletions(-)
>>>>>>>>>>
>>>>>>>
>>>>>>>>>> @@ -461,6 +460,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>>>>>>>>>>         struct msm_dp_panel_private *panel;
>>>>>>>>>>         struct device_node *of_node;
>>>>>>>>>>         int cnt;
>>>>>>>>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3};
>>>>>>>>>>
>>>>>>>>>>         panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>>>>>>>>>         of_node = panel->dev->of_node;
>>>>>>>>>> @@ -474,10 +474,17 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>>>>>>>>>>                 cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>>>>>>>>>>         }
>>>>>>>>>>
>>>>>>>>>> -       if (cnt > 0)
>>>>>>>>>> +       if (cnt > 0) {
>>>>>>>>>> +               struct device_node *endpoint;
>>>>>>>>>> +
>>>>>>>>>>                 msm_dp_panel->max_dp_lanes = cnt;
>>>>>>>>>> -       else
>>>>>>>>>> +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
>>>>>>>>>> +               of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
>>>>>>>>>> +       } else {
>>>>>>>>>>                 msm_dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
>>>>>>>>>> +       }
>>>>>>>>>
>>>>>>>>> Why? This sounds more like dp_catalog or (after the refactoring at
>>>>>>>>> [1]) dp_ctrl. But not the dp_panel.
>>>>>>>>>
>>>>>>>>> [1] https://patchwork.freedesktop.org/project/freedreno/series/?ordering=-last_updated
>>>>>>>>>
>>>>>>>> We are used the same prop 'data-lanes = <3 2 0 1>' in mdss_dp_out to keep similar behaviour with dsi_host_parse_lane_data.
>>>>>>>> From the modules used, catalog seems more appropriate, but since the max_dp_lanes is parsed at dp_panel, it has been placed here.
>>>>>>>> Should lane_map parsing in msm_dp_catalog_get, and keep max_dp_lanes parsing at the dp_panel?
>>>>>>>
>>>>>>> msm_dp_catalog_get() is going to be removed. Since the functions that
>>>>>>> are going to use it are in dp_ctrl module, I thought that dp_ctrl.c is
>>>>>>> the best place. A better option might be to move max_dp_lanes and
>>>>>>> max_dp_link_rate to dp_link.c as those are link params. Then
>>>>>>> lane_mapping also logically becomes a part of dp_link module.
>>>>>>>
>>>>>>> But now I have a more important question (triggered by Krishna's email
>>>>>>> about SAR2130P's USB): if the lanes are swapped, does USB 3 work on that
>>>>>>> platform? Or is it being demoted to USB 2 with nobody noticing that?
>>>>>>>
>>>>>>> If lanes 0/1 and 2/3 are swapped, shouldn't it be handled in the QMP
>>>>>>> PHY, where we handle lanes and orientation switching?
>>>>>>>
>>>>>> I have checked the DP hardware programming guide and also discussed it with Krishna.
>>>>>>
>>>>>> According to the HPG section '3.4.2 PN and Lane Swap: PHY supports PN swap for mainlink and AUX, but it doesn't support lane swap feature.'
>>>>>>
>>>>>> The lane swap mainly refers to the logical to physical mapping between the DP controller and the DP PHY. The PHY handles polarity inversion, and the lane map does not affect USB behavior.
>>>>>>
>>>>>> On the QCS615 platform, we have also tested when DP works with lane swap, other USB 3.0 ports can works normally at super speed.
>>>>>
>>>>> "Other USB 3.0 ports"? What does that mean? Please correct me if I'm
>>>>> wrong, you should have a USB+DP combo port that is being managed with
>>>>> combo PHY. Does USB 3 work on that port?
>>>>>
>>>>> In other words, where the order of lanes is actually inverted? Between
>>>>> DP and combo PHY? Within combo PHY? Between the PHY and the pinout?
>>>>> Granted that SM6150 was supported in msm-4.14 could you possibly point
>>>>> out a corresponding commit or a set of commits from that kernel?
>>>>>
>>>> For "Other USB 3.0 ports", as replied in USBC driver, USB3 primary phy works for other four USB type-A port.
>>>
>>> So if that's the USB3 primary, then why do you mention here at all? We
>>> are taling about the secondary USB3 + DP.
>>>
>> OK, sorry for confusing you.
>>>> The REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING mapping determines how logical lanes (0, 1, 2, 3) map to physical lanes sent to the PHY.
>>>> This ensures alignment with hardware requirements.
>>>> The PHY’s polarity inversion only adjusts signal polarity and doesn’t affect lane mapping.
>>>> Both DP ctrl and PHY lane related config will not affect USB phy.
>>>
>>> Probably we misundersand each other. The DP PHY should have orientation
>>> switch register, which controls whether 2-lane DP uses lanes 0/1 or 2/3.
>>> Can you use that register?
>>>
>> Yes, DP PHY have orientation register as below.
>> DP_PHY_DP_PHY_CFG_1(0x88e9014) bit(7) SW_PORTSELECT
>>> Also, could you _please_ answer the question that I have asked? Is the
>>> order of lanes inverted between the DP controller and DP PHY? Or between
>>> DP PHY and the DP connector? If one uses USB3 signals coming from this
>>> port (yes, on the other board, not on the Ride), would they also need to
>>> switch the order of USB3 lanes? If one uses a DP-over-USB-C, are DP
>>> lanes are swapped?
>>>
>> It's inverted between the DP controller and DP PHY.
>> If other use USB3 on the other board, will not need switch order of USB3 lanes,
>> If one use DP-over-USB-C, then need DP lanes swap.
> 
> Thanks!
> 
>>>> Without extra Type-C mapping, the DP controller’s mapping indirectly decides how signals are transmitted through Type-C.
>>>> Mapping ensures proper data transmission and compatibility across interfaces.
>>>>
>>>> We only found sm6150 need this lane mapping config, 
>>>> For msm 4.14, please refer these links,
>>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/arch/arm64/boot/dts/qcom/sm6150-sde.dtsi (qcom,logical2physical-lane-map)
>>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_parser.c (dp_parser_misc)
>>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c (dp_catalog_ctrl_lane_mapping_v200)
>>>>
>>>> If need process orientation info like dp_catalog_ctrl_lane_mapping_v200, 
>>>> then 
>>>> if implement in DP phy, then we need config dp_link register in PHY,
>>>> if implement in DP link, then we need pass orientation info to DP driver, perhaps we could add a new attribute to the phy_configure_opts_dp structure to pass this.
>>>> Do you have any suggestions?
>>>
>>> Does SW_PORTSEL_VAL affect the DP lanes on this platform?
>>>
>> SW_PORTSEL_VAL for USB3PHY_PCS_MISC_TYPEC_CTRL will not affect DP lanes in this DP or USB3 chip series.
>> USB3 will use USB3PHY_PCS_MISC_TYPEC_CTRL(SW_PORTSEL_VAL BIT_0) and DP will use DP_PHY_DP_PHY_CFG_1(SW_PORTSELECT BIT_7)
> 
> Is it possible to set this bit from the PHY driver rather than remapping
> the lanes in the DP driver?
> 
I have verified and confirmed with chip verification team.

We configured the logical2physical mapping primarily to correct the PHY output mapping.
Currently, the logical2physical mapping defines the input-to-output mapping for the DP controller, 
while the SW_PORTSELECT in PHY determines the swapping between PHY input ports 0↔3 and 1↔2.
When the DP controller input to PHY output mapping is correctly configured, PHY's SW_PORTSELECT can be used to implement flip operations. 
However, due to the improper mapping implementation on Talos platforms, using SW_PORTSELECT would require additional modifications to the logical2physical mapping.

For example, other platform except Talos implementations the data-lanes mapping follows <0 1 2 3> sequence. 
A proper flip operation should produce <3 2 1 0>, which can be equivalently achieved either through DP driver configuration or PHY portselect.
But in the Talos where the initial mapping is arranged as <3 2 0 1>, the expected post-flip sequence should be <0 1 3 2>. 
then when applying PHY SW_PORTSELECT setting 1, the PHY output becomes <1 0 2 3> which mismatches the expected pattern.

To maintain cross-platform compatibility between Talos and other platforms, recommend the flip handling at the DP driver level such like dp_catalog_ctrl_lane_mapping_v200 in sm6150.
>>>>
>>>>>>
>>>>>> Additionally, if it were placed on the PHY side, the PHY would need access to dp_link’s domain which can access REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING.
>>>>>
>>>>> I was thinking about inverting the SW_PORTSEL_VAL bit.
>>>>>
>>>>>> Therefore, we believe that the  max_dp_link_rate,max_dp_lanes and lane_map move to dp_link side is better.
>>>>>>
>>>>>>>>>> +
>>>>>>>>>> +       memcpy(msm_dp_panel->lane_map, lane_map, msm_dp_panel->max_dp_lanes * sizeof(u32));
>>>>>>>>>>
>>>>>>>>>>         msm_dp_panel->max_dp_link_rate = msm_dp_panel_link_frequencies(of_node);
>>>>>>>>>>         if (!msm_dp_panel->max_dp_link_rate)
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
>>>>>>>>>> index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7603b92c32902bd3d4485539bd6308537ff75a2c 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>>>>>>>>>> @@ -11,6 +11,8 @@
>>>>>>>>>>  #include "dp_aux.h"
>>>>>>>>>>  #include "dp_link.h"
>>>>>>>>>>
>>>>>>>>>> +#define DP_MAX_NUM_DP_LANES    4
>>>>>>>>>> +
>>>>>>>>>>  struct edid;
>>>>>>>>>>
>>>>>>>>>>  struct msm_dp_display_mode {
>>>>>>>>>> @@ -46,6 +48,7 @@ struct msm_dp_panel {
>>>>>>>>>>         bool video_test;
>>>>>>>>>>         bool vsc_sdp_supported;
>>>>>>>>>>
>>>>>>>>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES];
>>>>>>>>>>         u32 max_dp_lanes;
>>>>>>>>>>         u32 max_dp_link_rate;
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> --
>>>>>>>>>> 2.25.1
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> --
>>>>>>>> linux-phy mailing list
>>>>>>>> linux-phy@lists.infradead.org
>>>>>>>> https://lists.infradead.org/mailman/listinfo/linux-phy
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>
> 

