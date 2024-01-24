Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B171F83B437
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 22:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D4B10EA6E;
	Wed, 24 Jan 2024 21:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D8610EA6E;
 Wed, 24 Jan 2024 21:44:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40OLMmjP008386; Wed, 24 Jan 2024 21:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=ZvtW8/gdwVSU4Gl3PcM0FHD6g/x9Z8g4PWTBC4BWs+U=; b=g+
 SZTOtDNqMu8oqLTxqIxTzkYwEyojZl6z2uUjL1Ctt51O2teunEMURr5bi/+LiKcy
 D7N4yfeZiAdemc9W16anp/o17YWdAflsl/ieGpGO2NdYQnUU7mSXp0YM0wVqZKcJ
 9+3KXLpEiQ2LP629VnWPrR1uK876DnHJARC/adXhlH0TyHYdyinCStcny6P6gtMA
 19rZQzPb61dcfN+VlRqwN7yxExbWNM8RfyMJi7RvCvy7MAswWK6rf7L6rFX9mDyM
 APtMzksrjeG5L0jcdXpg+6uZRfY0yDutgzCRewc5yjkNTdxc2oZ5f0YK8qshWlFL
 eC1BHenpu4vQXqK8uNXw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtyxysmb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jan 2024 21:44:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40OLi430002576
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jan 2024 21:44:04 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 13:44:04 -0800
Message-ID: <deba88bb-5fdc-4b92-5419-637194835d41@quicinc.com>
Date: Wed, 24 Jan 2024 13:44:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: fix kernel-doc warnings
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
References: <20231231060823.1934-1-rdunlap@infradead.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231231060823.1934-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LmaCaBXXN6FJlJH3p21_uhULGVJD8WqZ
X-Proofpoint-GUID: LmaCaBXXN6FJlJH3p21_uhULGVJD8WqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_10,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240158
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
Cc: freedreno@lists.freedesktop.org, Vegard Nossum <vegard.nossum@oracle.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
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

Adding below tags:

Reported-by: kernel test robot <lkp@intel.com>
Closes: 
https://lore.kernel.org/oe-kbuild-all/202312170641.5exlvQQx-lkp@intel.com/
Fixes: 62d35629da80 ("drm/msm/dpu: move encoder status to standard 
encoder debugfs dir")
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
