Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0A5688105
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 16:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23F610E1B1;
	Thu,  2 Feb 2023 15:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6125810E1B1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 15:04:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 312EaBSK014414; Thu, 2 Feb 2023 15:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rYonHSszfotX/xXnaljZfads+aK7yXlIKa9rGmYabrE=;
 b=KC4DbrALpIRjjTriEqVJBIMBKeKb55b05O+A1ITgpyCXQ+d99CYCsBvCEHLK8eAFL1lr
 c/wGzuSkezz+3TYHZZIKOkkN//W7AVx+pTUxD94sr/gJNCh0CFnAjx6Gzw8qwkrExqGG
 ZB1Hr7ecOGGYEZ6GtA4qh6TAcTyQNAOTsAmtpJFwsgw+czaUvtrDM5zeuRueQ+J6lGvP
 N4uDn8evDwDZUq1A9GnCy2UIJv1kW6SGaSaVQAiFxbc27X00J8Htz8LHmz2VQaKuvUfE
 9bq4z5opzTIKVdmRLXxjWV4jYkqN+dNYGQTUmeJtRZ1BHQd4obQlpLbPShnVU4QRVPF/ sg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nfm9cuaan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 15:04:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 312F48X6006484
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Feb 2023 15:04:09 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 2 Feb 2023
 07:04:08 -0800
Message-ID: <64efca60-2625-9b85-8d39-fb637b6d8b99@quicinc.com>
Date: Thu, 2 Feb 2023 08:04:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/4] accel/ivpu: Fix FW API data alignment issues
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
 <20230202092114.2637452-2-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230202092114.2637452-2-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZCjI8wuaod0q-8ebUyFnNIt0TngTmIml
X-Proofpoint-GUID: ZCjI8wuaod0q-8ebUyFnNIt0TngTmIml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302020136
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/2023 2:21 AM, Stanislaw Gruszka wrote:
> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> 
> FW API structures have been updated to fix misaligned
> structure members.
> 
> Also changed JSM message header format to account for
> future improvements.
> 
> Added explicit check for minimum supported JSM API version.
> 
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>


>   /*
>    * Job format.
> @@ -119,7 +119,7 @@ struct vpu_job_queue_entry {
>   	u64 root_page_table_update_counter; /**< Page tables update events counter */
>   	u64 preemption_buffer_address; /**< Address of the preemption buffer to use for this job */
>   	u64 preemption_buffer_size; /**< Size of the preemption buffer to use for this job */
> -	u8 reserved[VPU_JOB_RESERVED_BYTES];
> +	u8 reserved_0[VPU_JOB_RESERVED_BYTES];

This seems spurious, just adding "_0" to the name.  Seems like the 
majority of the changes are like this (although you have a _1 at the 
very end).  Are you anticipating adding additional reserved fields in 
the near future?

