Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25936E6DA4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 22:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB37510E88F;
	Tue, 18 Apr 2023 20:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5367810E88F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 20:46:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33IKWkL1028338; Tue, 18 Apr 2023 20:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bbr5o2YauD0eZRxyBUJRPAqMIVy90p0HuWJfE651qAQ=;
 b=G/O3Xv+KEndIiY/aX4x8KfGyotOGP9MVp/JavUN8cicPFT2a3Diy7J+TftffGMGFsRK7
 7IpUquy1LNNhD6t6cIeyHAN5cppgs4EapYz6C/Myla2D4/qeRfUDhFbSfuOgs9SUX4zt
 BGfshfnU10mb0RfULLUxhDdsYc+e5EWUQp0I7y/CsUbirEhpB4tswmM6Zsore8zN52sC
 Zimwcc1JgZmj1pjjbQVnHd1q2wBruhCrN5p2pjiF+Ph25/mvC4DBXq/lsy6sW//SO1hO
 42n4q32f9Nub6xg5mdkBPM0o4GcwRtb2cbB6LuJ61ahhWY7Uu/KAxsbtbHkVLTIerN7C UQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q171gm6q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Apr 2023 20:46:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33IKkZiU004556
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Apr 2023 20:46:35 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 18 Apr
 2023 13:46:34 -0700
Message-ID: <fe7da2c1-904e-ee4f-9a6c-443049c214b7@quicinc.com>
Date: Tue, 18 Apr 2023 14:46:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: initialize ret variable to 0
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, <ogabbay@kernel.org>, <nathan@kernel.org>,
 <ndesaulniers@google.com>, <jacek.lawrynowicz@linux.intel.com>,
 <quic_carlv@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
 <quic_pkanojiy@quicinc.com>
References: <20230418192046.3235870-1-trix@redhat.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230418192046.3235870-1-trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sfX04aJJ9qbOGEBW6zkYrRF9Un9_uJcn
X-Proofpoint-ORIG-GUID: sfX04aJJ9qbOGEBW6zkYrRF9Un9_uJcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_15,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304180172
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

On 4/18/2023 1:20 PM, Tom Rix wrote:
> clang static analysis reports
> drivers/accel/qaic/qaic_data.c:610:2: warning: Undefined or garbage
>    value returned to caller [core.uninitialized.UndefReturn]
>          return ret;
>          ^~~~~~~~~~
> 
> The ret variable is only set some of the time but is always returned.
> So initialize ret to 0.

This does not appear to be entirely accurate to me.

Do you know what analysis Clang is doing?  Is it limited to the function 
itself?

remap_pfn_range, which initializes ret, will always run at-least once.

Feels more accurate to say that Clang cannot detect that ret will be 
initialized, and we want to quiet the warning from the false positive.

> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/accel/qaic/qaic_data.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index c0a574cd1b35..b46a16fb3080 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -591,7 +591,7 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
>   	struct qaic_bo *bo = to_qaic_bo(obj);
>   	unsigned long offset = 0;
>   	struct scatterlist *sg;
> -	int ret;
> +	int ret = 0;
>   
>   	if (obj->import_attach)
>   		return -EINVAL;

