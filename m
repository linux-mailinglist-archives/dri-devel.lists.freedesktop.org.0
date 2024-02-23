Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36843861A61
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 18:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCC310EC75;
	Fri, 23 Feb 2024 17:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OAIju6/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD34210EC75;
 Fri, 23 Feb 2024 17:47:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41NHNYom025195; Fri, 23 Feb 2024 17:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=xRoqTuKmOBF7JPUBA4wi7VVnck+vGevcA2k6v1yq9vw=; b=OA
 Iju6/ZhwX41Qo5tRd1FuICen7UW+2D1wz+JQeBYrdswXADkac3sVNPRfTo6y/BiS
 s08jc1jSbZM/aZEEaOmjlfj9KJMazFLf5D01FzcwZHsw+qEfV7X6CoEQomOPRaqm
 TMjrDN0tKi/TYNm6k8DBdpwm52BKEPxlKtSiuEJDsfjhyh4PN3ComJlDRq8mKZuM
 oIXdlJbuNLVgxfguwZeSILnwbb6n5DfZf+G1K19MzV/y3L6jXumdc6AXCTZkbhBX
 lOc1ch/ZOkPwKli6hJIpTVecbdBX6q1QZTLmI+LnNzk7kBf+3aRElsYTG8a6DQgz
 BRL4enju3+GvAWJYpyiA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wesgg127q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 17:47:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41NHlEoM023137
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 17:47:14 GMT
Received: from [10.110.76.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 09:47:13 -0800
Message-ID: <6ee1af5a-413c-1c09-5234-ceb8d8e605ad@quicinc.com>
Date: Fri, 23 Feb 2024 09:47:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: i915 build error on drm-misc-next
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, =?UTF-8?Q?Jouni_H=c3=b6gander?=
 <jouni.hogander@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <fe8b2841-cbf0-775e-6e74-50476b652f9f@quicinc.com>
 <ZdjPRzGLfV7RAEYu@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZdjPRzGLfV7RAEYu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _KXp9wmnd1KV9P48YI4yyY_92wQFNuGf
X-Proofpoint-ORIG-GUID: _KXp9wmnd1KV9P48YI4yyY_92wQFNuGf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_03,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 clxscore=1011 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402230129
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

CC Dmitry

Hi Rodrigo

On 2/23/2024 9:00 AM, Rodrigo Vivi wrote:
> On Fri, Feb 23, 2024 at 08:50:06AM -0700, Jeffrey Hugo wrote:
>> With the x86_64_defconfig I see the following when building drm-misc-next:
>>
>>    CC      drivers/gpu/drm/i915/display/intel_crt.o
>>    CC      drivers/gpu/drm/i915/display/intel_cx0_phy.o
>>    CC      drivers/gpu/drm/i915/display/intel_ddi.o
>>    CC      drivers/gpu/drm/i915/display/intel_ddi_buf_trans.o
>>    CC      drivers/gpu/drm/i915/display/intel_display_device.o
>>    CC      drivers/gpu/drm/i915/display/intel_display_trace.o
>>    CC      drivers/gpu/drm/i915/display/intel_dkl_phy.o
>>    CC      drivers/gpu/drm/i915/display/intel_dp.o
>>    CC      drivers/gpu/drm/i915/display/intel_dp_aux.o
>>    CC      drivers/gpu/drm/i915/display/intel_dp_aux_backlight.o
>>    CC      drivers/gpu/drm/i915/display/intel_dp_hdcp.o
>>    CC      drivers/gpu/drm/i915/display/intel_dp_link_training.o
>>    CC      drivers/gpu/drm/i915/display/intel_dp_mst.o
>>    CC      drivers/gpu/drm/i915/display/intel_dsi.o
>>    CC      drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.o
>>    CC      drivers/gpu/drm/i915/display/intel_dsi_vbt.o
>>    CC      drivers/gpu/drm/i915/display/intel_dvo.o
>>    CC      drivers/gpu/drm/i915/display/intel_gmbus.o
>>    CC      drivers/gpu/drm/i915/display/intel_hdmi.o
>>    CC      drivers/gpu/drm/i915/display/intel_lspcon.o
>>    CC      drivers/gpu/drm/i915/display/intel_lvds.o
>>    CC      drivers/gpu/drm/i915/display/intel_panel.o
>>    CC      drivers/gpu/drm/i915/display/intel_pps.o
>> drivers/gpu/drm/i915/display/intel_dp.c: In function
>> ‘intel_write_dp_vsc_sdp’:
>> drivers/gpu/drm/i915/display/intel_dp.c:4232:15: error: implicit declaration
>> of function ‘intel_dp_vsc_sdp_pack’; did you mean ‘drm_dp_vsc_sdp_pack’?
>> [-Werror=implicit-function-declaration]
>>   4232 |         len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
>>        |               ^~~~~~~~~~~~~~~~~~~~~
>>        |               drm_dp_vsc_sdp_pack
>>
>> Is this a known issue?
> 
> o.O - what a mistery!
> 
> it looks that drm-misc-next has only part of the patch:
> 31a5b6ed88c7 ("drm/i915/display: Unify VSC SPD preparation")
> 
> without the patch itself...
> 
> I couldn't even trace back to understand how the declaration is
> gone from the drm-misc-next...
> 

Looks like the issue here is that the below patch which landed in 
drm-misc-next

https://patchwork.freedesktop.org/patch/579128/?series=130145&rev=1

was based on top of drm-tip because the intel CI runs on drm-tip and not 
drm-misc-next.

But, https://patchwork.freedesktop.org/patch/572622/ is not present in 
drm-misc-next.

Hence this broke the compilation.

How would you prefer to fix this? We revert 
https://patchwork.freedesktop.org/series/130145/ from drm-misc and land 
it through i915 tree and can you provide us a tag from the i915 tree to 
rebase our msm-next tree on?

>>
>> -Jeff
