Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AEB94D4E1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 18:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF7610E98F;
	Fri,  9 Aug 2024 16:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="m2XDgHeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC1310E98F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 16:43:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 479CXjEO019134;
 Fri, 9 Aug 2024 16:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3iNENNCKgMSSnVAFJiUwiDvA7ONrEFhOxsIBgb4ZxBg=; b=m2XDgHeXC1qTIEK7
 THRRLlKLkDZYLb/zu2QlbFRXdYd6nFf1/o85fPYaYbv+UN5ORu40lFfYgtUESUlM
 hsIz03+8TTvuUEywQotqV/x8Ot6Y7oTtVO3zoi2ZTBpsasMIb1WevmjxKZ/BrDwl
 htELuNUVJkgKNe3Gi20HwfIP1OPO/r1B1owmItCDdQbUNLtKpoqq2Wc3wVjmKkLs
 xvILsgayEDCCkT20JAfO3CVdNWRLbUeEn3UfmPu/ZXTPwABr0A4JIXAPWIsSfqeI
 8iv+ymciMQs9AjRg90kTw3TFLARz7KgJAG7fl9nju+s0s6W6ycaSBR3woBSe4YcK
 Cy/08A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vvgm42ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2024 16:43:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 479Gh0YW030876
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Aug 2024 16:43:00 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 09:42:59 -0700
Message-ID: <3f79b66c-89fa-ce78-e34b-294df1d9d1a0@quicinc.com>
Date: Fri, 9 Aug 2024 10:42:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 09/10] accel/amdxdna: Add query functions
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-10-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240805173959.3181199-10-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4LNx1Cls1-JtkleyglxhUlloDI1e8E2n
X-Proofpoint-GUID: 4LNx1Cls1-JtkleyglxhUlloDI1e8E2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_13,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=964 bulkscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090120
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

On 8/5/2024 11:39 AM, Lizhi Hou wrote:
> +/**
> + * struct amdxdna_drm_query_hwctx - The data for single context.
> + * @context_id: The ID for this context.
> + * @start_col: The starting column for the partition assigned to this context.
> + * @num_col: The number of columns in the partition assigned to this context.
> + * @pid: The Process ID of the process that created this context.
> + * @command_submissions: The number of commands submitted to this context.
> + * @command_completions: The number of commands completed by this context.
> + * @migrations: The number of times this context has been moved to a different partition.
> + * @preemptions: The number of times this context has been preempted by another context in the
> + *               same partition.
> + * @pad: MBZ.

Did you make the documentation?  This looks like it'll generate errors 
from missing fields, and not having the same order as the struct.

> + */
> +struct amdxdna_drm_query_hwctx {
> +	__u32 context_id;
> +	__u32 start_col;
> +	__u32 num_col;
> +	__u32 pad;
> +	__s64 pid;
> +	__u64 command_submissions;
> +	__u64 command_completions;
> +	__u64 migrations;
> +	__u64 preemptions;
> +	__u64 errors;
> +};
