Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F6383DFE7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 18:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFB910F08B;
	Fri, 26 Jan 2024 17:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EFD10F08B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 17:22:27 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QBllT9023431; Fri, 26 Jan 2024 17:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=yfjqBl0rYomQQNdlxnGbMZUV1V7PBWcr2bAjuRzVfl0=; b=Hz
 ZH7uUGMhI4mGKRmHqsdX4nXrBdTeF2wPnOGdCM6imOwiJ2sVZsbHiooBMJe7H0Yr
 1PqYRezP9zu82MGXR++y5vR9WD4WGpoOM0BTQnp5HEEXbB/NFswXNKHvijxDbqVR
 ZadHbM+cfSaatvFzmbLIltJ2uwLZNFVH2eqQAjFZxtosyElhMSRP/UMWxKXs7gzm
 HVBgrExYXjcYoxbfrtvyiQoPDbLcrzvBwuhfju39P6f8ykaVNaluYYBPn9fPw4Zl
 437r9oqMb+Qm5IsymPs53TS/7cFS5w+1eBlREoKzvq0KAp35ZsOW5pC4hkEo5pUG
 FOF2GUDF4BVxb25ePxUA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv4f9hq89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 17:22:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QHLsFB021576
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 17:21:54 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 09:21:53 -0800
Message-ID: <64a6992e-a340-bebb-a053-a4bd59a29771@quicinc.com>
Date: Fri, 26 Jan 2024 10:21:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 7/9] accel/ivpu: Disable buffer sharing among VPU
 contexts
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
 <20240115134434.493839-8-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240115134434.493839-8-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: tZMech0fL17bBuGXLtHq0Ea_skX6l3J0
X-Proofpoint-GUID: tZMech0fL17bBuGXLtHq0Ea_skX6l3J0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=605 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260129
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
Cc: oded.gabbay@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/15/2024 6:44 AM, Jacek Lawrynowicz wrote:
> This was not supported properly. A buffer was imported to another VPU
> context as a separate buffer object with duplicated sgt.
> Both exported and imported buffers could be DMA mapped causing a double
> mapping on the same device.
> 
> Buffers imported from another VPU context will now just increase
> reference count, leaving only a single sgt, fixing the problem above.
> Buffers still can't be shared among VPU contexts because each has its
> own MMU mapping and ivpu_bo only supports single MMU mappings.
> 
> The solution would be to use a mapping list as in panfrost or etnaviv
> drivers and it will be implemented in future if required.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
