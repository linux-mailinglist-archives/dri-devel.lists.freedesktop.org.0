Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEBD861647
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 16:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC1210EC4D;
	Fri, 23 Feb 2024 15:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Xq9oa2sn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C38F10EC4B;
 Fri, 23 Feb 2024 15:50:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N6wkh5025091; Fri, 23 Feb 2024 15:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:to:cc:from:subject:content-type
 :content-transfer-encoding; s=qcppdkim1; bh=3exk5qV0X1GJG2wbXB2Z
 JX1n03Di0j+dJ8xw5YC41kY=; b=Xq9oa2snBrxmOaOMoOUGaBvPqwE+wtlNpL7A
 jab5ddtsH2+IFMe9RUjFd4hVD6GyzU1gmY4vvQRB3P68fCHXyByMWyqDPzlCNCzN
 Sd20jQTg3T3/7f8TOCLJ4d9hBcpvOhQBfpZSJ0WqhcmWSU4UBbakUVHmWOq22ppm
 Qq+9NTLV6OeUMoiob9IlSYa/evLX6CTPXTgpJxu0t8lBJKM3tep27xKJwHKZ9vOG
 BfVSlKqURpp2zF/dMeUBCj1ehKt6I7EHf1qv7Og1pX6tTU8J5FwzoOQYpSVN09zn
 N7e+vrRBwjophQD00y8Yllrjdtp7BWvN733Pea+EBzMyHduLQQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3weg88swec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 15:50:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41NFo8Eq032361
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 15:50:08 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 07:50:07 -0800
Message-ID: <fe8b2841-cbf0-775e-6e74-50476b652f9f@quicinc.com>
Date: Fri, 23 Feb 2024 08:50:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "open
 list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: i915 build error on drm-misc-next
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4CyBkN13sxwokaB0aDhMkzWFlnt-n7av
X-Proofpoint-GUID: 4CyBkN13sxwokaB0aDhMkzWFlnt-n7av
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_02,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=823
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1011 adultscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230113
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

With the x86_64_defconfig I see the following when building drm-misc-next:

   CC      drivers/gpu/drm/i915/display/intel_crt.o
   CC      drivers/gpu/drm/i915/display/intel_cx0_phy.o
   CC      drivers/gpu/drm/i915/display/intel_ddi.o
   CC      drivers/gpu/drm/i915/display/intel_ddi_buf_trans.o
   CC      drivers/gpu/drm/i915/display/intel_display_device.o
   CC      drivers/gpu/drm/i915/display/intel_display_trace.o
   CC      drivers/gpu/drm/i915/display/intel_dkl_phy.o
   CC      drivers/gpu/drm/i915/display/intel_dp.o
   CC      drivers/gpu/drm/i915/display/intel_dp_aux.o
   CC      drivers/gpu/drm/i915/display/intel_dp_aux_backlight.o
   CC      drivers/gpu/drm/i915/display/intel_dp_hdcp.o
   CC      drivers/gpu/drm/i915/display/intel_dp_link_training.o
   CC      drivers/gpu/drm/i915/display/intel_dp_mst.o
   CC      drivers/gpu/drm/i915/display/intel_dsi.o
   CC      drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.o
   CC      drivers/gpu/drm/i915/display/intel_dsi_vbt.o
   CC      drivers/gpu/drm/i915/display/intel_dvo.o
   CC      drivers/gpu/drm/i915/display/intel_gmbus.o
   CC      drivers/gpu/drm/i915/display/intel_hdmi.o
   CC      drivers/gpu/drm/i915/display/intel_lspcon.o
   CC      drivers/gpu/drm/i915/display/intel_lvds.o
   CC      drivers/gpu/drm/i915/display/intel_panel.o
   CC      drivers/gpu/drm/i915/display/intel_pps.o
drivers/gpu/drm/i915/display/intel_dp.c: In function 
‘intel_write_dp_vsc_sdp’:
drivers/gpu/drm/i915/display/intel_dp.c:4232:15: error: implicit 
declaration of function ‘intel_dp_vsc_sdp_pack’; did you mean 
‘drm_dp_vsc_sdp_pack’? [-Werror=implicit-function-declaration]
  4232 |         len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
       |               ^~~~~~~~~~~~~~~~~~~~~
       |               drm_dp_vsc_sdp_pack

Is this a known issue?

-Jeff
