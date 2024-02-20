Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CC685BEFB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF6710E48D;
	Tue, 20 Feb 2024 14:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="E1jmWDZ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7CE10E48F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:42:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41K8C5M5005901; Tue, 20 Feb 2024 14:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=gywO5KlRYoyZxLVBs+qpht4VcwEvojhEY7Lx5GCIaxE=; b=E1
 jmWDZ21s8KzqmG1cuJtOSN4xRZHByIpnHrr5eUTMKA/z6n2MxSz+8I6gKabV72Mb
 k2RrSxXKpY2kx+wOKaO/DZwJyPdXwO5pbes9vJo7c/R5nIb1vJDO/XIhfHUa2D0D
 t15aYowFJFAJuVi+kJ21cQyb+Z2GqtDt1RzmCZAAqb6FU2MNAshWksJJ0dQQ7MFy
 HyDPMapjTJ52u3N+s3QMbncAzHWizW3MsYGYWqwa/GcfZ/YZ68K/20AQbhi5VMnu
 U8kcoe+joRe/5LU+NbYA7JyvcuLH5v8j5OM52SOTDxKzC1+JnCrtzAbHLyR0V0tG
 fmnwuT6uXormQUiH5PfQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wcrc08sq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 14:42:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KEgRTk010817
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Feb 2024 14:42:27 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 06:42:26 -0800
Message-ID: <88cd6030-f8ff-40f1-51e5-d29939e0beb0@quicinc.com>
Date: Tue, 20 Feb 2024 07:42:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] accel/ivpu: Don't enable any tiles by default on
 VPU40xx
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 <stable@vger.kernel.org>
References: <20240220110830.1439719-1-jacek.lawrynowicz@linux.intel.com>
 <20240220131624.1447813-1-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240220131624.1447813-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: vEShbTYdwXxpQC0wHEC-hPozURu3YCIw
X-Proofpoint-GUID: vEShbTYdwXxpQC0wHEC-hPozURu3YCIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=741 spamscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402200105
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

On 2/20/2024 6:16 AM, Jacek Lawrynowicz wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> 
> There is no point in requesting 1 tile on VPU40xx as the FW will
> probably need more tiles to run workloads, so it will have to
> reconfigure PLL anyway. Don't enable any tiles and allow the FW to
> perform initial tile configuration.
> 
> This improves NPU boot stability as the tiles are always enabled only
> by the FW from the same initial state.
> 
> Fixes: 79cdc56c4a54 ("accel/ivpu: Add initial support for VPU 4")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
