Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A559A9A4801
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D4A10E97F;
	Fri, 18 Oct 2024 20:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="POyUYBiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA45B10E97F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 20:31:35 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IDc3UC016598;
 Fri, 18 Oct 2024 20:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NG/xyfizzcfYfSTeCTDclLa2qHCQ3KBPpWpPOo590Qs=; b=POyUYBiDyAiXwi85
 CSE47AbG7pyPFDfUlWEWwkpO1vxw3EADUXqwH0Xp276g5tezAivmBWTLgcNZk5h3
 d3xbxa9DmuNlyOJ3LLffrR7LS96924mNHmNMFmt1oDpSiMlv7rUHSNVM2L/hW76c
 dUU4AUmhIb+7xwrbdjkW0tLuGgxGJXO8uM/4kFBAOJUnMzkeK7dRPsRXJVZAyGq6
 OyXOAcBhMLnG9sEGHLWccixU/DvsEfMBalFjT5/7uJzRUJha/HBGqZX+M0mqwoLO
 Ro0mD0eEM2AfGtjdymh6VeDsyvmlBwTo3dlD9HwwE5dVYccLkci0E8stPcC4fL1K
 eMFSeA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bh3pamks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 20:31:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IKVTHw012229
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 20:31:29 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 13:31:28 -0700
Message-ID: <9b3e351d-a0f2-5b8f-59ae-e1029ca0b18d@quicinc.com>
Date: Fri, 18 Oct 2024 14:31:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V4 02/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, George Yang <George.Yang@amd.com>
References: <20241011231244.3182625-1-lizhi.hou@amd.com>
 <20241011231244.3182625-3-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241011231244.3182625-3-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: D39JgtSzJhBfF7tH71tnLJcDpMWoM-OL
X-Proofpoint-ORIG-GUID: D39JgtSzJhBfF7tH71tnLJcDpMWoM-OL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=746
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180131
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

On 10/11/2024 5:12 PM, Lizhi Hou wrote:
> AMD AI Engine forms the core of AMD NPU and can be used for accelerating
> machine learning applications.
> 
> Add the driver to support AI Engine integrated to AMD CPU.
> Only very basic functionalities are added.
>    - module and PCI device initialization
>    - firmware load
>    - power up
>    - low level hardware initialization
> 
> Co-developed-by: Narendra Gutta<VenkataNarendraKumar.Gutta@amd.com>
> Signed-off-by: Narendra Gutta<VenkataNarendraKumar.Gutta@amd.com>
> Co-developed-by: George Yang<George.Yang@amd.com>
> Signed-off-by: George Yang<George.Yang@amd.com>
> Co-developed-by: Min Ma<min.ma@amd.com>
> Signed-off-by: Min Ma<min.ma@amd.com>
> Signed-off-by: Lizhi Hou<lizhi.hou@amd.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
