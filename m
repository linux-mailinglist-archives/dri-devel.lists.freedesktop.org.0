Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB49BA10B9B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3331510E3C4;
	Tue, 14 Jan 2025 16:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NIRlGCYm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3661E10E3C4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:00:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EA2aXu005882;
 Tue, 14 Jan 2025 16:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GlxbwQMSLSHcp59/RMr1PPnMv1hYFNjw2lB6/yaqYSo=; b=NIRlGCYmyqlQLUhL
 Vkko5oWNSv6QDcR7KPhI/oN1FRtR7XVUwu3lmZSmprf09uzi0+/4tB0I0gc3+PJG
 eyg4SelvwPTl80fh//jUxEoBOM9rNoVWRTx8SsrgY/FdmaktrJ6CcbaYfOqKSjxj
 2DeIdZD/U3BZMCsdh8JJhnwLedd5/BlbJM+uLCRfgTsFJ4AHFcdzgtw2JNcfbrSq
 CQEWJpeildaULg/JmocD/6T30NCD1pX55e6aMuD+WvLjUMGuCqFr7hELEwBq66vF
 Rf/9rIQqjOemEFZA+YepVtMy7OvdfMuyzi/xUbctdIxGXsTplxS5O4W4CIFeVWhH
 yW32kA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445ntx8rmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 16:00:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50EG05HP008524
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 16:00:05 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 08:00:04 -0800
Message-ID: <342c63d4-19f5-5ea2-d4e6-02ef5785a87e@quicinc.com>
Date: Tue, 14 Jan 2025 09:00:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] MAINTAINERS: Update intel_vpu maintainer list
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>
CC: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <oded.gabbay@gmail.com>,
 <maciej.falkowski@linux.intel.com>
References: <20250114084436.1326127-1-jacek.lawrynowicz@linux.intel.com>
 <Z4YnqBXfJAc7Xmsy@linux.intel.com> <Z4YpTYzGGDzNFyCU@Oded-ga-LPT.>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <Z4YpTYzGGDzNFyCU@Oded-ga-LPT.>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8f1BUThL9-_tETRI01Q8hCNsP7bwhFdH
X-Proofpoint-GUID: 8f1BUThL9-_tETRI01Q8hCNsP7bwhFdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 clxscore=1011 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=904 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140125
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

On 1/14/2025 2:07 AM, Oded Gabbay wrote:
> On Tue, Jan 14, 2025 at 10:00:24AM +0100, Stanislaw Gruszka wrote:
>> On Tue, Jan 14, 2025 at 09:44:36AM +0100, Jacek Lawrynowicz wrote:
>>> Slawek moved to another project and Maciej will be replacing him.
>>>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
