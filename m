Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476A589A0F8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBD810EB3C;
	Fri,  5 Apr 2024 15:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hgDXZY3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3321110EB3C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 15:23:44 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435Ai728018916; Fri, 5 Apr 2024 15:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=F8F3PRWqqyCaXDW1VzcTvyDtZn92A0QhCIRzrlp9qBg=; b=hg
 DXZY3ohh+B0tAJui6GLEeZTu2X70QiCNP53ZOx5SeGmdwyuvX7xYdwZR7Mf+8Tqx
 qgjVJbuIs0C1e/KJAkEj3wjVuk5zPi/f4bezECYI9B5HU2MtLvNusLXpwp/t2MNd
 SSSrYIcztyx9zU9SUaTfdqE3ooqvA5Om3teAK2s41Bbj8wPoD/YmdhAtBbSY88+V
 Bam55rKivT4caEQa4jTGGnFle8Kkqwc8Da3GXdIPAxNDl/fzrSKxSRSnEht6hiYc
 ZRItNqq5TdPh7tD/f/KcQPbNTfh2Zb30416Fr77bSNcHcnctQ0SOM0gaOmiMV7hh
 V213DjRvHMUhAfuEXTNQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xad7h0xv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 15:23:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435FNb4Z025929
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Apr 2024 15:23:37 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 08:23:37 -0700
Message-ID: <5c0f737a-b312-dd24-76f2-e0072aad81d4@quicinc.com>
Date: Fri, 5 Apr 2024 09:23:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 5/8] accel/ivpu: Improve clarity of MMU error messages
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, "Wachowski, Karol" <karol.wachowski@intel.com>
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
 <20240402104929.941186-6-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240402104929.941186-6-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gWHsIq6cMTxqjvFpz1hJBpnCTLhU5g9D
X-Proofpoint-ORIG-GUID: gWHsIq6cMTxqjvFpz1hJBpnCTLhU5g9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_16,2024-04-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 mlxlogscore=765 clxscore=1015 mlxscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404050110
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

On 4/2/2024 4:49 AM, Jacek Lawrynowicz wrote:
> From: "Wachowski, Karol" <karol.wachowski@intel.com>
> 
> This patch improves readability and clarity of MMU error messages.
> Previously, the error strings were somewhat confusing and could lead to
> ambiguous interpretations, making it difficult to diagnose issues.
> 
> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
