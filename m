Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 607CD822497
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 23:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1167510E229;
	Tue,  2 Jan 2024 22:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2747810E213;
 Tue,  2 Jan 2024 22:13:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 402M0sHD000831; Tue, 2 Jan 2024 22:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=81lbXW4HImZGl+eDhFTN5fAxXcaost06Oz288uO0jaQ=; b=Qa
 FV9zW1EoWOM4jG3lejXyWdFpZnkFxrocibQp4TXCDJd2uJ/yWd8KWGLT43mARpfL
 szlezZMPE61NDiMWrpw2+i4Tdy2AOJjpSNldman6yV9XAHZuKQXR3aw3mbmEH+q9
 u2bX9SCy5QPMCF8EWQzq0YpeHSQkJpQYr0R+29g80syJy1LDmTibr+D17L9spQfH
 6vNP6RwzDYo98Keuzhv5YifL1u3KHfstdRaCyy99AP+iCY00kiuinpX1zrMlL9YK
 x0G6M4hTfUndSLfFC1PtQJGH3tA1TcRlQyvut84kEN9AedpsCtdq2LKsguyzBQQO
 3GWKdHlVRAiuZ1IB0Xqw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vch7n98pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jan 2024 22:13:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 402MDGMm013272
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 Jan 2024 22:13:16 GMT
Received: from [10.71.111.96] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 2 Jan
 2024 14:13:16 -0800
Message-ID: <48e19422-77ba-a876-4552-783d54ac9bf6@quicinc.com>
Date: Tue, 2 Jan 2024 14:13:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/msm/dpu: fix kernel-doc warnings
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
References: <20231231060823.1934-1-rdunlap@infradead.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <20231231060823.1934-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vVOOCgP4NBmMg3iT98FJWBz6hEU1c1Q9
X-Proofpoint-ORIG-GUID: vVOOCgP4NBmMg3iT98FJWBz6hEU1c1Q9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020165
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
Cc: Sean Paul <sean@poorly.run>, Vegard Nossum <vegard.nossum@oracle.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/30/2023 10:08 PM, Randy Dunlap wrote:
> Correct all kernel-doc warnings in dpu_encoder.c and dpu_rm.c:
>
> dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb' description in 'dpu_encoder_virt'
> dpu_encoder.c:212: warning: Excess struct member 'crtc_kickoff_cb_data' description in 'dpu_encoder_virt'
> dpu_encoder.c:212: warning: Excess struct member 'debugfs_root' description in 'dpu_encoder_virt'
>
> dpu_rm.c:35: warning: Excess struct member 'hw_res' description in 'dpu_rm_requirements'
> dpu_rm.c:208: warning: No description found for return value of '_dpu_rm_get_lm_peer'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Paloma Arellano <quic_parellan@quicinc.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vegard Nossum <vegard.nossum@oracle.com>
