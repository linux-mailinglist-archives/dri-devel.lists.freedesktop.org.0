Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E68A9A4739
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 21:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB2010E981;
	Fri, 18 Oct 2024 19:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RovpV3QQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B69B10E981
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 19:41:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IExEW2006854;
 Fri, 18 Oct 2024 19:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rKJiqFun/k8Ka7jbC/YfTlCs0RA8jmsEnP0viN4Wx0s=; b=RovpV3QQvcBcsxoo
 UxRWHGW6nKbUyawkYZotb5flQG8eKHyDXJPdaAV4eZiw6egkQw5qIj+qNUwub3On
 S3nliyHKSZ3TRtoGfFbxRqD8bB4crSvCOZvf2iUuW4VW3AIrgFNnffVRNGBlTFud
 IQQoqtH1UaBjoY10cUnVs/2Xw5hANYIfKhA2MRpz2/u+V/v01eqZunwihvzSrx0u
 sH7LrHoSaDqbQh/KBvFpEDI+QI0NzIUbEco8LwkZjfnt0iOqlx4WZUKf31XWGQVV
 sSwdK60JdLqKniqVmR0RLmjA0ZGO8bqX4RB1sNKmGEPpn7qvDhYXRJT2C5OQc4ga
 bNTP0A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b5hsvbcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 19:41:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IJfOdn007992
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 19:41:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 12:41:22 -0700
Message-ID: <aa5078d8-ac2f-1124-03f8-0d37d4c15005@quicinc.com>
Date: Fri, 18 Oct 2024 13:41:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH net-next 3/3] accel/qaic: Pass string literal as format
 argument of alloc_workqueue()
Content-Language: en-US
To: Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>
CC: Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Jiawen Wu
 <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "Carl Vanderlip" <quic_carlv@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, <UNGLinuxDriver@microchip.com>,
 <netdev@vger.kernel.org>, <llvm@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20241011-string-thing-v1-0-acc506568033@kernel.org>
 <20241011-string-thing-v1-3-acc506568033@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241011-string-thing-v1-3-acc506568033@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WjxzQ8x_dk83izjS8xoIbU8AG9AJDY9c
X-Proofpoint-ORIG-GUID: WjxzQ8x_dk83izjS8xoIbU8AG9AJDY9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180125
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

On 10/11/2024 3:57 AM, Simon Horman wrote:
> Recently I noticed that both gcc-14 and clang-18 report that passing
> a non-string literal as the format argument of alloc_workqueue()
> is potentially insecure.
> 
> E.g. clang-18 says:
> 
> .../qaic_drv.c:61:23: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
>     61 |         wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
>        |                              ^~~
> .../qaic_drv.c:61:23: note: treat the string as an argument to avoid this
>     61 |         wq = alloc_workqueue(fmt, WQ_UNBOUND, 0);
>        |                              ^
>        |                              "%s",
> 
> It is always the case where the contents of fmt is safe to pass as the
> format argument. That is, in my understanding, it never contains any
> format escape sequences.
> 
> But, it seems better to be safe than sorry. And, as a bonus, compiler
> output becomes less verbose by addressing this issue as suggested by
> clang-18.
> 
> Also, change the name of the parameter of qaicm_wq_init from
> fmt to name to better reflect it's purpose.
> 
> Compile tested only.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

Applied to drm-misc-next
