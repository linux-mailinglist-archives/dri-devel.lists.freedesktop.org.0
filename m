Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD82888D043
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 22:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA61010F389;
	Tue, 26 Mar 2024 21:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="H9iX9Zw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826F910F388;
 Tue, 26 Mar 2024 21:44:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42QLPvVF024294; Tue, 26 Mar 2024 21:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=OUu6sHhZoGdr2KrfDUbbtyEKtVsYCQLlpvVYMTg82/Q=; b=H9
 iX9Zw39/p7yw1e0SiuLi2SGQOWblLbXHa5cUTiFLatZIr3bypHeX13JT3OH527Yv
 ok8XfYAq6LrrSJMttUASwkNSDylK0LiTZRnH6Te61l8dKws/qEWccfntuYxS7+jk
 NwOHYdw0JHMM2/KdRDkv9Tzfka6490sCTmiHsH5BwJ30d6HFITNsSl48YE7bL7rm
 oIi6L6AlWldRYHekb1kXVHi5vbr5+aAaicv8kfRMhwk6iyUT0iPE3PHCAHPOEe3P
 6rtryTpx2NZru7kldlD4ssI5DYwT3SwIsPv4mUxHkShypJXiQIg06lcmciMgajR/
 4wyuYe0U8NRerBCrEnOg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x41k68rsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 21:43:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QLhlw3027533
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Mar 2024 21:43:47 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 14:43:44 -0700
Message-ID: <49152d98-b2e6-3b03-4542-423ccb46fc47@quicinc.com>
Date: Tue, 26 Mar 2024 14:43:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 02/16] drm/msm/hdmi: drop qfprom.xml.h
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-kbuild@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-2-cca5e8457b9e@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240323-fd-xml-shipped-v4-2-cca5e8457b9e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0cKxWlPmEQ5f13ypzJSys6IyrIfgPu64
X-Proofpoint-GUID: 0cKxWlPmEQ5f13ypzJSys6IyrIfgPu64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=895 priorityscore=1501
 malwarescore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260156
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



On 3/22/2024 3:56 PM, Dmitry Baryshkov wrote:
> The qfprom.xml.h contains definitions for the nvmem code. They are not
> used in the existing code. Also if we were to use them later, we should
> have used nvmem cell API instead of using these defs. Drop the file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/qfprom.xml.h | 61 -----------------------------------
>   1 file changed, 61 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
