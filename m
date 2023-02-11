Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A86E692BC6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 01:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28C410E185;
	Sat, 11 Feb 2023 00:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1AB10E0A6;
 Sat, 11 Feb 2023 00:10:15 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31ANrq1G015907; Sat, 11 Feb 2023 00:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3j1Ma2woUU1zFtOdehOLfqkVJh5dODgOuYzsq5rLn48=;
 b=FTRfRGSHDnojaSZnWaiMu2HGrOjmB070V+WrN6Icie51DbSiZVwuDbBMJq00+i4mxoB5
 wIRlYQRGYlYOiY1y8c8niXYlTW8Qt5jSlQ5ez7YTzeBNlePLtqHQJo776O9VUJPQDJm7
 amUTMfRIawkIdbogsK3PVNPDHl48C6gmJ5VlOvmCqtHpUZl5XHjwNYHxwMyErXC7Ghjp
 eKLknSm9j0dTIxNN3qyZ2T3coL6RHK/Mulsa992OwMgcquzsrcAxPaf87Xx/gg8iuGN9
 RMaEiGjGu8/0zAeah0HIyANnGvVy4OlvmSTpfZlK5twNdSJ6Jho9wOHZhs47V06q7eW2 Kg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nnhcma28j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Feb 2023 00:10:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31B0A8pj006377
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Feb 2023 00:10:08 GMT
Received: from [10.110.17.125] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 10 Feb
 2023 16:10:03 -0800
Message-ID: <91cf7d71-9f51-eb07-758c-981bf9fe6338@quicinc.com>
Date: Fri, 10 Feb 2023 16:10:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/dpu: disable features unsupported by QCM2290
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230210135019.925145-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230210135019.925145-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZqG1rImARWWzP9cBz8c3n2foOSI6HNvV
X-Proofpoint-ORIG-GUID: ZqG1rImARWWzP9cBz8c3n2foOSI6HNvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_17,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 mlxlogscore=654 clxscore=1011 mlxscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100208
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/10/2023 5:50 AM, Dmitry Baryshkov wrote:
> QCM2290 doesn't seem to support reg-dma, UBWC and CSC. Drop
> corresponding features being incorrectly enabled for qcm2290.
> 
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Changes since v1:
> - Reenabled CDP, exclusion rectangles and SmartDMA
> 
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
