Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0C1853947
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 19:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C04710E39F;
	Tue, 13 Feb 2024 18:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GZWk6ttF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDF910E252;
 Tue, 13 Feb 2024 18:00:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41DDAvjj029424; Tue, 13 Feb 2024 18:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=uHSjEZZv5LhPxGfb2xIn9VtOM3pAfHSS36rJfvlkgS8=; b=GZ
 Wk6ttFRJOi+4P/1ZuZpUj3dwKvYyFk/DQTvsbaNGAgpPaokcw//qqYysedh4jDtj
 9vT1WZ/CQhFzIhAyhZ2I6QBQLq8fVG1Wy7gMdVZ4PxASbjhjZwPxyxqq2xb3f/mc
 mHe/9MX1uEv02GBt93Ie2F7rWWhN1EqY+ZneAolpIRiwBohmag/JPLQYOzeArBkP
 1JGqVI4+BDY0NUQRwlUPPeZ9XgtLTV7LlNayDqneoFZOT4mmk5bV4V9IJcm3yfLQ
 OuvA07H8NtT+hZFH6rBR/Zt0Hdi7TVsTeE9yylUZF7pwU2xgaDcgpja6Ef4HJsuh
 bA6DChb6Bhpwk5IT+2dA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7q2y2q65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Feb 2024 18:00:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41DI0FWC015189
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Feb 2024 18:00:15 GMT
Received: from [10.110.23.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 13 Feb
 2024 10:00:14 -0800
Message-ID: <343710b1-f0f4-5c05-70e6-3c221cdc9580@quicinc.com>
Date: Tue, 13 Feb 2024 10:00:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drm/msm: DisplayPort regressions in 6.8-rc1
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>
CC: Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <regressions@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
References: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IDbmomjLwl_cvJs5QxFrpwNYt3hwSqIG
X-Proofpoint-ORIG-GUID: IDbmomjLwl_cvJs5QxFrpwNYt3hwSqIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_10,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130141
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

Hi Johan

Thanks for the report.

I do agree that pm runtime eDP driver got merged that time but I think 
the issue is either a combination of that along with DRM aux bridge 
https://patchwork.freedesktop.org/series/122584/ OR just the latter as 
even that went in around the same time.

Thats why perhaps this issue was not seen with the chromebooks we tested 
on as they do not use pmic_glink (aux bridge).

So we will need to debug this on sc8280xp specifically or an equivalent 
device which uses aux bridge.

Thanks

Abhinav

On 2/13/2024 3:42 AM, Johan Hovold wrote:
> Hi,
> 
> Since 6.8-rc1 the internal eDP display on the Lenovo ThinkPad X13s does
> not always show up on boot.
> 
> The logs indicate problems with the runtime PM and eDP rework that went
> into 6.8-rc1:
> 
> 	[    6.006236] Console: switching to colour dummy device 80x25
> 	[    6.007542] [drm:dpu_kms_hw_init:1048] dpu hardware revision:0x80000000
> 	[    6.007872] [drm:drm_bridge_attach [drm]] *ERROR* failed to attach bridge /soc@0/phy@88eb000 to encoder TMDS-31: -16
> 	[    6.007934] [drm:dp_bridge_init [msm]] *ERROR* failed to attach panel bridge: -16
> 	[    6.007983] msm_dpu ae01000.display-controller: [drm:msm_dp_modeset_init [msm]] *ERROR* failed to create dp bridge: -16
> 	[    6.008030] [drm:_dpu_kms_initialize_displayport:588] [dpu error]modeset_init failed for DP, rc = -16
> 	[    6.008050] [drm:_dpu_kms_setup_displays:681] [dpu error]initialize_DP failed, rc = -16
> 	[    6.008068] [drm:dpu_kms_hw_init:1153] [dpu error]modeset init failed: -16
> 	[    6.008388] msm_dpu ae01000.display-controller: [drm:msm_drm_kms_init [msm]] *ERROR* kms hw init failed: -16
> 	
> and this can also manifest itself as a NULL-pointer dereference:
> 
> 	[    7.339447] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> 	
> 	[    7.643705] pc : drm_bridge_attach+0x70/0x1a8 [drm]
> 	[    7.686415] lr : drm_aux_bridge_attach+0x24/0x38 [aux_bridge]
> 	
> 	[    7.769039] Call trace:
> 	[    7.771564]  drm_bridge_attach+0x70/0x1a8 [drm]
> 	[    7.776234]  drm_aux_bridge_attach+0x24/0x38 [aux_bridge]
> 	[    7.781782]  drm_bridge_attach+0x80/0x1a8 [drm]
> 	[    7.786454]  dp_bridge_init+0xa8/0x15c [msm]
> 	[    7.790856]  msm_dp_modeset_init+0x28/0xc4 [msm]
> 	[    7.795617]  _dpu_kms_drm_obj_init+0x19c/0x680 [msm]
> 	[    7.800731]  dpu_kms_hw_init+0x348/0x4c4 [msm]
> 	[    7.805306]  msm_drm_kms_init+0x84/0x324 [msm]
> 	[    7.809891]  msm_drm_bind+0x1d8/0x3a8 [msm]
> 	[    7.814196]  try_to_bring_up_aggregate_device+0x1f0/0x2f8
> 	[    7.819747]  __component_add+0xa4/0x18c
> 	[    7.823703]  component_add+0x14/0x20
> 	[    7.827389]  dp_display_probe+0x47c/0x568 [msm]
> 	[    7.832052]  platform_probe+0x68/0xd8
> 
> Users have also reported random crashes at boot since 6.8-rc1, and I've
> been able to trigger hard crashes twice when testing an external display
> (USB-C/DP), which may also be related to the DP regressions.
> 
> I've opened an issue here:
> 
> 	https://gitlab.freedesktop.org/drm/msm/-/issues/51
> 
> but I also want Thorsten's help to track this so that it gets fixed
> before 6.8 is released.
> 
> #regzbot introduced: v6.7..v6.8-rc1
> 
> The following series is likely the culprit:
> 
> 	https://lore.kernel.org/all/1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com/
> 
> Johan
