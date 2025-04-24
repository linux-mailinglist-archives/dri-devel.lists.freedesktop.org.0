Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52041A9B977
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 23:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E66210E866;
	Thu, 24 Apr 2025 21:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FShkbSK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159E510E0E5;
 Thu, 24 Apr 2025 21:00:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmqV3008499;
 Thu, 24 Apr 2025 21:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XXPxz/Z5pLP58PvYynOD5mVvk/ND5VB8It7BSBxw4UU=; b=FShkbSK+ExFQXFGD
 SCjZPPi//n5AroP8Rre4ut7e4dpKBtKaS80E/e9OAfBHwgh5Ky0cw7DazP1y7dVA
 N3uQx6szIH5jTY0jFTMaNN2I16HMZ7lbyRWCrgG/1+42Rw1hWf+PWEH3qK1BI3vG
 CiVLVEQ+DVo6S4MPGy3pIMC1W7Vl/0n4siQeGAm9rl/x8Nh0+Ob5SISSOnUnh3FW
 ltT5WdFuCOi1ScOVX9/+eJRkL9xQpZsHauYkViKx0pmXFI+77vZiyGvDMjG3/nsM
 1wOy9rKWBMxJdQBOMaqT7M4/kE7KV5jr7ntrDIR4vwiR6DfjBrWOaWPKZkGv0nwT
 D5MZ+A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3pur8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 21:00:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OL0f7d003134
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 21:00:41 GMT
Received: from [10.110.70.248] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 14:00:40 -0700
Message-ID: <402bbda7-33c6-49b2-89c7-37372cc07457@quicinc.com>
Date: Thu, 24 Apr 2025 14:00:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/msm/mdp4: switch LVDS to use
 drm_bridge/_connector
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-6-c983788987ae@linaro.org>
 <63e5ddf6-151a-42aa-b2cf-003d91b34a04@quicinc.com>
 <s63lvzn35d7xcvw3kkmtasyinxbqa35juyxosdscfk6vhty4pw@hu3dotyklo3r>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <s63lvzn35d7xcvw3kkmtasyinxbqa35juyxosdscfk6vhty4pw@hu3dotyklo3r>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: zdTf9LaoRtvs1lA0oDyUJNWd_05e8K3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE0OCBTYWx0ZWRfX76P3WhR8KFkP
 /7O8lDmjx22oQzWiYL/5/0VzIkCGY/3XgNVDmNbclQ5YLq+2+unLGpX+F5mAVCJmjwrUTdkvOwj
 D53EwXhd0yZ5ASEJ02pIFpXE/qelpCGyJn7WA48niS3etDww3ZYpbvqMnczADsilQFn1eki1hpK
 XCbFdkH3pB69HnIVYkggnrLZedtWnKfhkQPHItZ6lAcBAGQTgf54J/mE5aYmlgVrBFznaCPVC7+
 J24W8yRRRk9WnIcDGtqs6qNoWCcQlzBXXbidEV/ASxyD1WPwugzC7Hk+cOpuYifDRgjunkCmvJc
 7uDr5Kyb7Ehe6iirOrumM4PfWF23uGImDh114xc3iUcymOi7bPDVfCARTMzXCgTwFm7qEmevRCy
 GU+Csn1KYkjKTxkfvEgyeZ7gd/zGDhw515n5TKMgLlam9nX7lDZMx3zJr3Tt5DopQ6dXmmik
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680aa683 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=W7W8hWtOxRefk3OWsT0A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zdTf9LaoRtvs1lA0oDyUJNWd_05e8K3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240148
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



On 4/24/2025 3:23 AM, Dmitry Baryshkov wrote:
> On Wed, Apr 23, 2025 at 07:04:16PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
>>> LVDS support in MDP4 driver makes use of drm_connector directly. However
>>> LCDC encoder and LVDS connector are wrappers around drm_panel. Switch
>>> them to use drm_panel_bridge/drm_bridge_connector. This allows using
>>> standard interface for the drm_panel and also inserting additional
>>> bridges between encoder and panel.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/Makefile                       |   1 -
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 +++++--
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 +-
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  20 +----
>>>    .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 100 ---------------------
>>>    5 files changed, 28 insertions(+), 133 deletions(-)
>>>
>>> @@ -199,27 +201,43 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>>>    		 * bail out early if there is no panel node (no need to
>>>    		 * initialize LCDC encoder and LVDS connector)
>>>    		 */
>>> -		panel_node = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
>>> -		if (!panel_node)
>>> -			return 0;
>>> +		next_bridge = devm_drm_of_get_bridge(dev->dev, dev->dev->of_node, 0, 0);
>>> +		if (IS_ERR(next_bridge)) {
>>> +			ret = PTR_ERR(next_bridge);
>>> +			if (ret == -ENODEV)
>>> +				return 0;
>>> +			return ret;
>>> +		}
>>> -		encoder = mdp4_lcdc_encoder_init(dev, panel_node);
>>> +		encoder = mdp4_lcdc_encoder_init(dev);
>>>    		if (IS_ERR(encoder)) {
>>>    			DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
>>> -			of_node_put(panel_node);
>>>    			return PTR_ERR(encoder);
>>>    		}
>>>    		/* LCDC can be hooked to DMA_P (TODO: Add DMA_S later?) */
>>>    		encoder->possible_crtcs = 1 << DMA_P;
>>> -		connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
>>> +		ret = drm_bridge_attach(encoder, next_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>> +		if (ret) {
>>> +			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS panel/bridge: %d\n", ret);
>>> +
>>> +			return ret;
>>> +		}
>>
>> Can you pls point me to the lvds bridge used with this apq8064 board? I was
>> unable to find it. Just wanted to compare that against this while reviewing.
> 
> It's the panel bridge, wrapping one of the LVDS panels.
> 

Yes but what I wanted to check was which LVDS panel was being used so 
far. Looks like for arm32 the dts is missing? As I couldnt find the lvds 
out endpoint. So can you pls point me to the lvds panel you verified 
this with?


>>> +
>>> +		connector = drm_bridge_connector_init(dev, encoder);
>>>    		if (IS_ERR(connector)) {
>>>    			DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
>>> -			of_node_put(panel_node);
>>>    			return PTR_ERR(connector);
>>>    		}
>>> +		ret = drm_connector_attach_encoder(connector, encoder);
>>> +		if (ret) {
>>> +			DRM_DEV_ERROR(dev->dev, "failed to attach LVDS connector: %d\n", ret);
>>> +
>>> +			return ret;
>>> +		}
>>> +
>>>    		break;
>>>    	case DRM_MODE_ENCODER_TMDS:
>>>    		encoder = mdp4_dtv_encoder_init(dev);
> 

