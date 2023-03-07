Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B26AE5D4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 17:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6999010E13A;
	Tue,  7 Mar 2023 16:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E5A10E13A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 16:04:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327FwPZX032368; Tue, 7 Mar 2023 16:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MndgLlDfvq7xGhJY7rAHmrKVYNjpcE8PYvN0WTzUxn4=;
 b=gtbIQ9Kq4feFeS3WN5wLD3Uu9Bjzq1G9L+Dmm+Nw8OhOlzCrTRFra94TxVSNZptNaA4X
 UEHzTRMVWfUfWNX0EpIT31ojfMHzh9gPvnblZJ/GPV8vgg9or25aIOoXlF4MQSh3Etw7
 ZwSZ3jKqa+0JiEnhUDcgWCbF2QcgTT6jkelhQ7E1ewtQKrJdqXg8rsoM3jb2oBSlXU2G
 R08oNqqJIi3S3xRDkQDvkbpLdZ2gMIIgxUi787iWEjSnWs5TRBt36BaF0H8eh3z5ejiw
 zy5Hh4LWkokCtplzN71XlsG1VP3N66Tv2ynxzqZZFGScJkpID9RilQumVLyXEBWbL1gD fg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p68cqr169-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 16:03:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 327G3ocv007318
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Mar 2023 16:03:50 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 7 Mar 2023
 08:03:49 -0800
Message-ID: <babfe305-04cd-7213-8e1e-8fbcb2da10ae@quicinc.com>
Date: Tue, 7 Mar 2023 09:03:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel: Link to compute accelerator subsystem intro
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>, DRI Development List
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
References: <20230307043525.25660-1-bagasdotme@gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230307043525.25660-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 32oURlT5IH4tkNgWpBZIiHdsdButyQB7
X-Proofpoint-GUID: 32oURlT5IH4tkNgWpBZIiHdsdButyQB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_11,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=314 impostorscore=0
 spamscore=0 clxscore=1011 phishscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070144
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
Cc: Dylan Le <self@dylanle.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/6/2023 9:35 PM, Bagas Sanjaya wrote:
> Commit 2c204f3d53218d ("accel: add dedicated minor for accelerator
> devices") adds link to accelerator nodes section of DRM internals doc
> (Documentation/gpu/drm-internals.rst), but the target doesn't exist.
> Instead, there is only an introduction doc for computer accelerator
> subsytem.
> 
> Link to that doc until there is documentation of accelerator internals.
> 
> Fixes: 2c204f3d53218d ("accel: add dedicated minor for accelerator devices")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
