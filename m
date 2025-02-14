Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA28A36397
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:51:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3130110E11A;
	Fri, 14 Feb 2025 16:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aPHa5xlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF5E10E11A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:51:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E9LehL001231;
 Fri, 14 Feb 2025 16:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hhnCpmXYLjwcXQGf8+iSoeGIpo0rvnoQEW3wekBynxY=; b=aPHa5xlCtjkjsMS6
 NbKSP7aoI0xKFt4khxswVbhjgRbZoKoG3SeOaQBV9J6QHJcSFLHciKaS3sMWOEKK
 c5u6juwUmIquCqN6M/gg8NuCU2zQ6CFJXbDDwenPUwrfbAMt9x2akPub3KoR+LBA
 yVsszGDzmRp799XTgcJpVm6xUvz/NejVJIDcdGOpJi0vIuv99OGsjKsoWFKDKwrp
 7cuokd3bYFAfW+7RAtfm0GqzajxJuPLOodcVdB+gQzcyXPwjM+8ofNxnagSDDM5C
 mZ3Ig3axNu237rlwrFR2TsPBccozW2GJy+IlBrtp+ZTbO15mA+3BveVCSS+kc859
 yQVZAg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq045vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 16:51:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51EGpTAU013636
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 16:51:29 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 08:51:28 -0800
Message-ID: <7d38bbd0-2d5e-1475-ee16-fa72c3083215@quicinc.com>
Date: Fri, 14 Feb 2025 09:51:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/6] accel/ivpu: Add debugfs interface for setting HWS
 priority bands
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <maciej.falkowski@linux.intel.com>, Karol
 Wachowski <karol.wachowski@intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <20250204084622.2422544-4-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250204084622.2422544-4-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: L4YtSl9jpcE5rFQChJDPIn0oBZhYJJMh
X-Proofpoint-ORIG-GUID: L4YtSl9jpcE5rFQChJDPIn0oBZhYJJMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140118
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

On 2/4/2025 1:46 AM, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Add debugfs interface to modify following priority bands properties:
>   * grace period
>   * process grace period
>   * process quantum
> 
> This allows for the adjustment of hardware scheduling algorithm parameters
> for each existing priority band, facilitating validation and fine-tuning.
> 
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

As a stand alone patch, seems ok to me.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
