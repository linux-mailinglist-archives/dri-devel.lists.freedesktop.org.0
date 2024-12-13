Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E339F11A8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 16:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6AB10F083;
	Fri, 13 Dec 2024 15:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Y7/tV28j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E22A10F083
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:59:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8D2GT032195;
 Fri, 13 Dec 2024 15:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fsb3SECVtDJkMmj/b9jHVzqW8i0WukCSPo8l7jZucF0=; b=Y7/tV28j4FSQGKe3
 R2oHjZOwQyAYx12mape2gUkWrlRQAa+y1K3dorVvm5LLpzhX7CgB+jSwOdaNRx13
 +rmmK6Z029bOyQJSqqOj0zQYNcYZff4mb9TnWdgLq2hfrtmS/qv3t5lQa952yoVK
 IcOUgNPPUtLoVZvb/pqL3T1i20qC8uHAGA8RT9sqLsQ6PGR5/6PQKEjJ5l7CyMP9
 /oEclxHqutHqCUU7jE4ZR7cJHRsYniN3agtENF1R3Bbz2uV0a3UZgYUnLOl7IqPF
 8XxalAP9h41EBVngZCnSeLdQUeeDDGO4nBrAQ6MIIX97cCQNS3/zQqTA+FzCRisN
 DZsTTg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfg3rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 15:59:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDFxsML021101
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 15:59:54 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 07:59:53 -0800
Message-ID: <6be9a2e8-190a-4509-813c-36c917efc7d5@quicinc.com>
Date: Fri, 13 Dec 2024 08:59:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Fix typo for struct
 qaic_manage_trans_passthrough
Content-Language: en-US
To: <quic_yabdulra@quicinc.com>, <quic_carlv@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20241129202845.3579306-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241129202845.3579306-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VUBk68yMT1jR6wOy2lGA8gIo66JLjmxQ
X-Proofpoint-ORIG-GUID: VUBk68yMT1jR6wOy2lGA8gIo66JLjmxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=828 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130113
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

On 11/29/2024 1:28 PM, Jeffrey Hugo wrote:
> The documentation header for struct qaic_manage_trans_passthrough has a
> typo - "t" is missing in "transaction".
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   include/uapi/drm/qaic_accel.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/qaic_accel.h b/include/uapi/drm/qaic_accel.h
> index d3ca876a08e9..c92d0309d583 100644
> --- a/include/uapi/drm/qaic_accel.h
> +++ b/include/uapi/drm/qaic_accel.h
> @@ -64,7 +64,7 @@ struct qaic_manage_trans_hdr {
>   /**
>    * struct qaic_manage_trans_passthrough - Defines a passthrough transaction.
>    * @hdr: In. Header to identify this transaction.
> - * @data: In. Payload of this ransaction. Opaque to the driver. Userspace must
> + * @data: In. Payload of this transaction. Opaque to the driver. Userspace must
>    *	  encode in little endian and align/pad to 64-bit.
>    */
>   struct qaic_manage_trans_passthrough {


Pushed to drm-misc-next

-Jeff
