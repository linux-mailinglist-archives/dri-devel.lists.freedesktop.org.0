Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E4566A542
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 22:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1E810E04F;
	Fri, 13 Jan 2023 21:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6441110E04F;
 Fri, 13 Jan 2023 21:43:45 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DLhefC002904; Fri, 13 Jan 2023 21:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YI2h2xe7Oehb6HTNaQtRm0F6Ktz4kT/bnhsDkzXKmN4=;
 b=U25iHe1CXbKRr4HwD39gRHnTzonT/fzC2+obGoFleVjjSpyyjpWP7tjGtHRKsX9TCpjg
 llC7g9UMzwsxDvDteeJm7ym+R4yHoeNuJ3TFUfqKKoRwc+dZndbjNKp+VgcyfYa1ad7v
 6gEgAv4P59A1aKRvz62YN9u3iPitV4vVNUvOof3J3rOoFlye14ncoen6XCiPC1VFPMmf
 WS7Qrmx7k81ecMNAnot8V8Ox3o6vdyTCb5QPB1VnT2R27ofoXxxshyJVJ25jI8PS2q+H
 ESX92ylZtV9SaC/DMDaQh5d1iJxQlUmUDhjip8paP43fx2YqmXaONyp5y3NhtNGzv9IX Pg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2s0cts9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 21:43:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30DLhdgY008861
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 21:43:39 GMT
Received: from [10.110.70.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 13 Jan
 2023 13:43:38 -0800
Message-ID: <cb3e7dfd-1844-65f9-aafd-32187047b535@quicinc.com>
Date: Fri, 13 Jan 2023 13:43:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 0/3] drm/msm/dpu: several fixes for UBWC setup
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ry5DOIZc-zq--yLUPsEmXd_ox9U71UOl
X-Proofpoint-GUID: ry5DOIZc-zq--yLUPsEmXd_ox9U71UOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=777
 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301130148
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/7/2022 6:28 AM, Dmitry Baryshkov wrote:
> Several small corrections for the UBWC setup and related data.
> 

I am assuming this series will be dropped in favor of the RFC:

https://patchwork.freedesktop.org/series/111751/

Right?

> Dmitry Baryshkov (3):
>    drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
>    drm/msm/dpu: correct the UBWC version on sm6115
>    drm/msm/dpu: add missing ubwc_swizzle setting to catalog
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 6 +++++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
