Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3C69F12AF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 17:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA9610F09D;
	Fri, 13 Dec 2024 16:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JItMc7rN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E8F10F09D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 16:48:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8PQqW032215;
 Fri, 13 Dec 2024 16:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TV4fvxr20xkDU5x3+d+HSlOf8l9QwuxUqiXP6pVDA1k=; b=JItMc7rNJFcxhj98
 V6OURYIcZKHWGyaQk76un/BsSyLjQVdfuf3tALjH3lw705YAk+xgjFWh80tuNmEQ
 WH95XWCrecjQbjayyFeZ0tg5K37ec/svf1/S3EFUiThlaPsgMnGDFXqc6S7uwlr3
 T4Jwi6hLY2FQ8PWU4VKBiKFyIqMOLXdlQUiwtksmnjQJaU6AgpSGY8c9i6ztsNN4
 2ENwyNzMgUWDElVfndyfkG+Ivd29VFadxz66Ju0RVQtMuOViDYoDzLj4W02MCBs0
 Lhgmx6tZH+auGvPtcMrbRQtJDXnKrpuBR+cFE7Z7EA7GJs2+BGzyPBWpWXHjLoNw
 +h8O/Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfg7bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 16:48:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDGmgAc003928
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 16:48:42 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 08:48:41 -0800
Message-ID: <043f5590-ecd0-46b5-7aba-3ee680563e26@quicinc.com>
Date: Fri, 13 Dec 2024 09:48:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 5/8] accel/amdxdna: Add query firmware version
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, <mario.limonciello@amd.com>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
 <20241206220001.164049-6-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241206220001.164049-6-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: n8drTW21rxAp1uLPNJiC7xoeW6ceGFxS
X-Proofpoint-ORIG-GUID: n8drTW21rxAp1uLPNJiC7xoeW6ceGFxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130118
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

On 12/6/2024 2:59 PM, Lizhi Hou wrote:
> Enhance GET_INFO ioctl to support retrieving firmware version.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Warning below through.

>   enum amdxdna_drm_get_param {
>   	DRM_AMDXDNA_QUERY_AIE_STATUS,
>   	DRM_AMDXDNA_QUERY_AIE_METADATA,
> @@ -382,7 +396,7 @@ enum amdxdna_drm_get_param {
>   	DRM_AMDXDNA_QUERY_CLOCK_METADATA,
>   	DRM_AMDXDNA_QUERY_SENSORS,
>   	DRM_AMDXDNA_QUERY_HW_CONTEXTS,
> -	DRM_AMDXDNA_NUM_GET_PARAM,
> +	DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,

This would normally be considered breaking the uAPI, but since this 
driver is not yet in a released kernel, this is allowed. Keep this in 
mind for the future (can add things, but not remove them).
