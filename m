Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFFF861709
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 17:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC63D10EC53;
	Fri, 23 Feb 2024 16:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="k+zVQjvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC2D10EC54
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 16:08:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41NDNanl018265; Fri, 23 Feb 2024 16:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=SccUfYPJX3UO95qLD6HfOHJFsJDW0CMTKEANJbGg3V4=; b=k+
 zVQjvryPwSZKjaNrcsnhUstJ4UUyKh5p0H3KOJUUlvjxURSmLQJQ7Q+9KZZwxiTL
 tivnLzLcjkIq80ONJ6IRLx/Xs1rinAt7tQ0Nv3jqRO0oVIw3Ub5NnRcdZ+odbKjh
 q/7zichH2AR0qQv9c4PWSUKZmqYKDhUsYm+PiqG+xflrCK1hAQdbAqzw4YRL9cZ0
 cAvlKgKQmrtTg91D72M2L5XilucCwlHv44bc0ysXDoY1DBC9vILz0hgEbzVlD17H
 FYif6h+ZEIJq2uv5ruSd0AgWV8FK3wSkf1pu/pWw769rc6YonMppmECYT4VHGIZ0
 SwNJs52uQRkUWuZcL3Gg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wer8ms0m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 16:08:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41NG8GNA016082
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 16:08:16 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 08:08:12 -0800
Message-ID: <c1bd881c-2181-8fd1-e28c-1a34fee2ffa8@quicinc.com>
Date: Fri, 23 Feb 2024 09:08:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Constify aic100_channels
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Carl Vanderlip
 <quic_carlv@quicinc.com>, Pranjal Ramajor Asha Kanojiya
 <quic_pkanojiy@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240222-mhi-const-accel-qaic-v1-1-028db0dd9098@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240222-mhi-const-accel-qaic-v1-1-028db0dd9098@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qp9esPXD3y-RZVk2Q7fnVK_CtCQ7KlQF
X-Proofpoint-ORIG-GUID: qp9esPXD3y-RZVk2Q7fnVK_CtCQ7KlQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_02,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 mlxlogscore=741 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230117
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

On 2/22/2024 6:06 PM, Jeff Johnson wrote:
> MHI allows the channel configs to be const, so constify
> aic100_channels to prevent runtime modification.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Applied to drm-misc-next

-Jeff
