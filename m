Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30FA363DB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6651110ED1C;
	Fri, 14 Feb 2025 17:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PhX/RBRs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FB810ED1C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:04:18 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EBXGPF011938;
 Fri, 14 Feb 2025 17:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WVh8C1XdQKbuPGslHvYwILu4Oo0lcqoZT4lNHUEx468=; b=PhX/RBRs8eSbv7uR
 VLjesZG94YjQqyg9dGVJtOxq+xHCGGVOX5Mld3Ia88nfbOi6qPOXnbmzJtFpGEYo
 8aHIvcxIRqX+L2JuvUMGm1Wi0Ldz/kIOdqxp5nQr8eu+F8Vlqgf0jn+c4d3eNrIQ
 3sCMAJnH/URO6oMS5GsW2bBSU6cHnEsJU5M0LkzMUkJKyVWlMTJLdJA2vMrp9GCi
 Qoar9d7D2Rz/psBIf+G4XfqTBJVJGZUiiRoqAQZwL9GueZBNluJCGJCkBz8Nx8de
 BhiRhitQAtjTSW9JbBc+AH6N+zZBbPQWWcpedN0uVpEN9xVpwfW0Ajsal1OPaaeN
 Jo3A/w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sfxwbxea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 17:04:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51EH4DGi032475
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 17:04:13 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 09:04:12 -0800
Message-ID: <a89af8ab-db02-84fa-2ed5-9f1addfdc241@quicinc.com>
Date: Fri, 14 Feb 2025 10:04:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 6/6] accel/ivpu: Implement D0i2 disable test mode
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <maciej.falkowski@linux.intel.com>, Karol
 Wachowski <karol.wachowski@intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
 <20250204084622.2422544-7-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250204084622.2422544-7-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: bRswPECobBXyb0_-kOI2Dk9Rj5UvcAng
X-Proofpoint-GUID: bRswPECobBXyb0_-kOI2Dk9Rj5UvcAng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=642 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140119
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
> Add power_profile firmware boot param and set it to 0 by default
> which is default FW power profile.

I don't think that patch does this. It looks like 
boot_params->power_profile is already defined. What am I missing?

-Jeff
