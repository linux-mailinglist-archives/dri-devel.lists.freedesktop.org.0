Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B145B75BC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 17:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E321D10E647;
	Tue, 13 Sep 2022 15:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1A110E4A5;
 Tue, 13 Sep 2022 15:54:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DDvEt1018625;
 Tue, 13 Sep 2022 15:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3mz+DIWbAv2lJtq7oCMQc/sw/N2SOx9zzz4TQU/xQ78=;
 b=lqBW2RWSEOFTktKoaXL0hoUfOi1CwnLF1WBtDSgaNh+5QmK4WiOzRdgedCTZ5ZsMrlgc
 egUC7LUwL4dcf3iJyeCLIRTKiqAv3DXovscT0AKhzts0q/a0aRqP69fGa1nGplKaykwB
 xdoLJ+4Tf1Xuu6L2QKwEAc+M+EjLTdmKp/2p7V2Jh4N06wYFbTTPKlavXYRof9fWDQoO
 laOc96g+5JDPts3y6oDAcuGpiMmfvj/12YF7U26nrUmaJJx/gIQFHKx80LNk21gkW/rY
 Rv9NJIawOMFEfLKO9gz92DCSGfmy/pweRN0HtIisSScZPZGZnS7u65jwWTipsN7i40jb hA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jjh9tjwqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 15:54:18 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28DFsHVt004993
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 15:54:17 GMT
Received: from [10.71.111.188] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 13 Sep
 2022 08:54:17 -0700
Message-ID: <24b05be6-1aac-a136-3746-a349b2fefa6c@quicinc.com>
Date: Tue, 13 Sep 2022 08:54:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Freedreno] [PATCH 0/2] Add support for HDR color formats
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20220901203422.217-1-quic_jesszhan@quicinc.com>
 <f3083bc5-fd56-b017-5cdf-c72e730a987e@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <f3083bc5-fd56-b017-5cdf-c72e730a987e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: korJaAmV5dj8ILBtiwhV1_qwfxEceDt2
X-Proofpoint-GUID: korJaAmV5dj8ILBtiwhV1_qwfxEceDt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209130072
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 9/12/2022 11:33 AM, Dmitry Baryshkov wrote:
> On 01/09/2022 23:34, Jessica Zhang wrote:
>> Add support for HDR color formats.
>>
>> XR30 linear/compressed format has been validated with null_platform_test
>> on SC7180, and P010 linear has been validated with plane_test (also on
>> SC7180).
> 
> Are they supported on sdm845? On msm8998?

Yes for both. AFAIK XR30 and P010 are supported on all DPU boards.

Thanks,

Jessica Zhang

> 
>>
>> Jessica Zhang (2):
>>    drm/msm/dpu: Add support for XR30 format
>>    drm/msm/dpu: Add support for P010 format
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 24 ++++++++++++++++++-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  2 ++
>>   3 files changed, 28 insertions(+), 1 deletion(-)
>>
>> -- 
>> 2.35.1
>>
> 
> -- 
> With best wishes
> Dmitry
> 
