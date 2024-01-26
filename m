Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A8A83E151
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D8210FD17;
	Fri, 26 Jan 2024 18:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6305F10FD17
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:27:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QINnC2032510; Fri, 26 Jan 2024 18:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=LpJ5BhExt1irTyvKHzVjNiKL8AWxNSZPRLO/3ViGPgU=; b=Nx
 ae4iJ+An9MRKXxKtiQKT3pnaV4jlWBSnZfzxEtrkEdDC0ezzitvnjHUVLClKG6BD
 vol/h1jY4sIbl5+8ysQIApmjDh4MNUt2Ov8HvvgxtjNi2IC8YIyPS63F9JoGGXH0
 eZql6U2CcKiNxFr7R/vPJB16Lv4H5twatRvJeZYtx4b77f59ijAysFPRbAPctntJ
 4HVOsntS9/SeSutrzdJkzNCgMhDe3Rggc/exmXvIlI/FHpFeLV2XRrGOR3yYcs/X
 9LpvexssLe2bivy3QDSYJz04HvTHYHfPTFtL1l8fxljI0Hvel8XiiDK22Qy1Gke2
 R2yMtEoFp0zeod6VAAXw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvhxyr0ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 18:27:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QIRDxT019372
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 18:27:13 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 10:27:12 -0800
Message-ID: <9658a58d-71de-84d2-52c9-f1766d931d85@quicinc.com>
Date: Fri, 26 Jan 2024 11:27:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 7/7] accel/ivpu: Add job status for jobs aborted by the
 driver
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
 <20240126122804.2169129-8-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240126122804.2169129-8-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YZ2i4CSBKQKj5Jk-J0oDlHE-jrlIIYJu
X-Proofpoint-ORIG-GUID: YZ2i4CSBKQKj5Jk-J0oDlHE-jrlIIYJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1011
 mlxlogscore=734 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260135
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
Cc: oded.gabbay@gmail.com,
 Grzegorz Trzebiatowski <grzegorz.trzebiatowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/2024 5:28 AM, Jacek Lawrynowicz wrote:
> From: Grzegorz Trzebiatowski <grzegorz.trzebiatowski@intel.com>
> 
> Add DRM_IVPU_JOB_STATUS_ABORTED to indicate that the job was aborted
> by the driver due to e.g. TDR or user context MMU faults.
> 
> This will help UMD and tests distinguish if job was aborted by the FW
> or the driver.
> 
> Signed-off-by: Grzegorz Trzebiatowski <grzegorz.trzebiatowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
