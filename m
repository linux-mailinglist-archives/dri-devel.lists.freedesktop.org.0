Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697BA9D77A8
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 20:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050E988DA9;
	Sun, 24 Nov 2024 19:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HJEKVx+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42EDF10E2B9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 19:07:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AO9Q1TI013221;
 Sun, 24 Nov 2024 19:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Bkre2WeoGiPhovYus2RkV3ZM5DAJZ4Ku2XTeN1DLg+M=; b=HJEKVx+0D67xsjSp
 9RpCLAS+OHmQ6u5PiLD+Q+wdS2ppmbMTCT/EuX40FlM1mHRrdiu58m0yhZ5xDiLV
 xetOZXBFDeEOmyio4hb58W7215cxWBqlzdLQYTBa/Dn/XEvMT3lpx9HU85NFswyj
 KT33I+wvYXNmVp8VTiXfUJGX9eNhUEmAv9pCJJ2mE86YFqWG7e6xqB6eKVaNKDv2
 tMYQuTf6c4Yq1dhZOChU/595R5JHejU/MnaNcUvmPoltuqzw7lRwIU8YC4etA5ju
 iRSigIucMWQrcwGZI/Ea8B2t1yUfRFbCCIQpbQS7bg4Id82ieHJNMP4pBkJ8v4Fn
 3OJuRw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4337e6tmvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 Nov 2024 19:07:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AOJ7MKS000470
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 Nov 2024 19:07:22 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 24 Nov
 2024 11:07:21 -0800
Message-ID: <51afee37-2c90-d31a-978c-5681dccd5ccb@quicinc.com>
Date: Sun, 24 Nov 2024 12:07:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH AUTOSEL 6.12 033/107] accel/qaic: Add AIC080 support
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
CC: Troy Hanson <quic_thanson@quicinc.com>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>,
 <ogabbay@kernel.org>, <corbet@lwn.net>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
 <20241124133301.3341829-33-sashal@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241124133301.3341829-33-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: P6p515Ej5zV_wAaxb-O7SdWDXz9JZpjc
X-Proofpoint-ORIG-GUID: P6p515Ej5zV_wAaxb-O7SdWDXz9JZpjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1031
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411240168
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

On 11/24/2024 6:28 AM, Sasha Levin wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> [ Upstream commit b8128f7815ff135f0333c1b46dcdf1543c41b860 ]
> 
> Add basic support for the new AIC080 product. The PCIe Device ID is
> 0xa080. AIC080 is a lower cost, lower performance SKU variant of AIC100.
>  From the qaic perspective, it is the same as AIC100.
> 
> Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20241004195209.3910996-1-quic_jhugo@quicinc.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sasha, it feels like autosel was a bit aggressive here.  This is an 
enablement patch for new hardware, and not a bug fix.  Therefore, it 
does not appear to be stable material to me.

Am I missing something?

-Jeff
