Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DA270E120
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA2810E05B;
	Tue, 23 May 2023 15:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14F710E05B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 15:56:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34NFT3JM026262; Tue, 23 May 2023 15:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=R05m8COYzrgCWL+/yCx5qzMmm3WKfUMyhZcRluJdZ0s=;
 b=In037dwq79LL7DsKeQHBhFAxEzu+Zu3P4nJorM1yxZNKuvZBNZpsqVwQ6K+tFuHbXNL3
 rJKth3MtvChzfj9NVaBGcwtdqDgusaycmWN84YUi4cLZBgq/YQcLsriMItUA2iqgqkV9
 IaWQwC5w1U6Hqx4pNUMTLzZ6u2LTEZGY3C2MWAdpBw3+yxZcaczdagxd22qIZi4SNmhQ
 S9H0GrDnyDhksXY3jnCwjxpOuZd2AMvT0Oo2r4Ibm4Owyie1RRT/glk56P2zIaIao2Sp
 +AoplqjKV37Oe03JZNC7BrEUutSM7YT0+Sd85wRwdDpiuqq9xKEyW9sHSa8yMCUeZjbc ag== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qs05s82aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 15:56:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34NFuHeu031157
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 15:56:18 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 23 May
 2023 08:56:16 -0700
Message-ID: <cd8192e3-7d7d-5976-d795-05d4459cffea@quicinc.com>
Date: Tue, 23 May 2023 09:56:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] accel/qaic: initialize ret variable to 0
Content-Language: en-US
To: <trix@redhat.com>, <ogabbay@kernel.org>, <nathan@kernel.org>,
 <ndesaulniers@google.com>, <jacek.lawrynowicz@linux.intel.com>,
 <quic_carlv@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <quic_pkanojiy@quicinc.com>
References: <20230517165605.16770-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230517165605.16770-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vRPIXW_3rH41R8uWhGdmgdytuArGKGfS
X-Proofpoint-ORIG-GUID: vRPIXW_3rH41R8uWhGdmgdytuArGKGfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_10,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305230126
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
Cc: linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/17/2023 10:56 AM, Jeffrey Hugo wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis reports
> drivers/accel/qaic/qaic_data.c:610:2: warning: Undefined or garbage
>    value returned to caller [core.uninitialized.UndefReturn]
>          return ret;
>          ^~~~~~~~~~
> 
>  From a code analysis of the function, the ret variable is only set some
> of the time but is always returned.  This suggests ret can return
> uninitialized garbage. However BO allocation will ensure ret is always
> set in reality.
> 
> Initialize ret to 0 to silence the warning.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Tom Rix <trix@redhat.com>
> [jhugo: Reword commit text]
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Pushed to drm-misc-fixes
