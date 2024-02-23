Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD213861D56
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 21:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF33410EABD;
	Fri, 23 Feb 2024 20:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TIzazWVT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B20910EABD
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 20:16:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41NKGpfK031207; Fri, 23 Feb 2024 20:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=U0ZRQoJaJPpJvR6PuPc304sliy9Q4lfFDnk1itAKK8Y=; b=TI
 zazWVTLZumoW8HyT5i9VVXnaIUxs3PUC1QswzzFAGY5qmwDO7cAys1XMWLyOndwO
 cTF4gox8EqJC0HKg1BMmCwJulf9AtlXsLYu1/LsA/iUWFcULExwNT/SPSBaTag+e
 Zbv96pX90y76Pq1qYqMJFhc1pwe8vUhxj+gVEx4tvYoXoLQW9c0v192NpBDes3Dj
 CtwdZ/buqqxpZnRbEXAII0vKogIStdtbLgaylFGuqmL8HPQYhSDbBimlw8GgVHUX
 vsjZE7x2NdkUH9iaCXPK4PhJ/MTDfS5Rg+3hNuWjRK23rgDk44V2O5qHCbbLIiz8
 21XMCWtlv/KKSsm7th1w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3weu32h175-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 20:16:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41NKGnRm025938
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 20:16:49 GMT
Received: from [10.110.76.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 12:16:49 -0800
Message-ID: <ba31209a-baf8-d649-96d4-f7b1aace28b3@quicinc.com>
Date: Fri, 23 Feb 2024 12:16:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/i915: convert remaining intel_dp_vsc_sdp_pack
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>
CC: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>
References: <20240223191548.392185-1-rodrigo.vivi@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240223191548.392185-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: hNQRXyrOAZPVMFWrn2-9jbMAAhnipW-7
X-Proofpoint-ORIG-GUID: hNQRXyrOAZPVMFWrn2-9jbMAAhnipW-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_06,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 mlxlogscore=874 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230150
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



On 2/23/2024 11:15 AM, Rodrigo Vivi wrote:
> Commit 47f419e07111 ("drm/dp: move intel_dp_vsc_sdp_pack() to generic helper")
> and commit b55b88d86fec ("drm/dp: drop the size parameter from drm_dp_vsc_sdp_pack()")
> were based on top of a tree containing the
> commit 31a5b6ed88c7 ("drm/i915/display: Unify VSC SPD preparation") but
> landed in a tree where this commit didn't exist, leaving behind a spurious
> case calling for a removed function: intel_dp_vsc_sdp_pack()
> 
> Let's convert the remaining case here so we can port this patch to
> any tree that doesn't contain
> commit 31a5b6ed88c7 ("drm/i915/display: Unify VSC SPD preparation")
> 
> In in kind of merge where this commit does exist, this line here will
> be gone anyway and not needed any longer.
> 
> Fixes: 47f419e07111 ("drm/dp: move intel_dp_vsc_sdp_pack() to generic helper")
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
