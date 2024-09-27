Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BAA988B7C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 22:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D318D10ED1F;
	Fri, 27 Sep 2024 20:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kuGgjpRy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A0E10ED1F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 20:49:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RFQUTx026743;
 Fri, 27 Sep 2024 20:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 otv00Udqi/7htHLlEYXL1OiwhT7Y2r3eM6wixb2ZipI=; b=kuGgjpRyNFDbzESl
 ZyZR0bpiHGnzbcm4G7bVTS5Zp4WVOc3C4PVagk1l12muOXC6Gnmbt4woOScX0jE4
 Q233k8iTas0d6za35FXqFgY+O29tUSxWTs4OudMpp9SuKHa9JqNtom3ewWxOjQgu
 kNfu+cK6DhKdl07Jn0ZFaScha0r9WbNsbA3En30yq47ySeQwAlJcn2XHSTNlJzo9
 9ulXWlOiD9LrWkCJiQZF80N//OFKlzlelNOMQpXpzitjz+uKqhk8kO8UUA/UfdNy
 84dQ5UZN4VnJKcDiPYrvsHSJT4HBYnhho3arFrpnPuwVKmUdUVhtUA2pnkyBL57b
 GYgnbA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snfhc9w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 20:49:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RKnm54006916
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 20:49:48 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Sep
 2024 13:49:47 -0700
Message-ID: <cdfd03b6-b167-d43f-98bf-09b42dde8298@quicinc.com>
Date: Fri, 27 Sep 2024 14:49:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 08/29] accel/ivpu: Turn on autosuspend on Simics
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, Karol Wachowski <karol.wachowski@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-9-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240924081754.209728-9-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lw88guy4TTck3gQZmj3bLvUOBIGW18vg
X-Proofpoint-GUID: lw88guy4TTck3gQZmj3bLvUOBIGW18vg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=799
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270152
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

On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> With recent Simics update DVFS flows using cdyn were fixed
> and it is possible to enable D0i3/D3 entry flows on autosuspend.
> Set autosuspend timeout to 100 ms by default on Simics.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
