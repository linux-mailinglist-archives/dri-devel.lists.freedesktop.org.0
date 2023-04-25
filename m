Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9F96ED98A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 03:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D263410E1F3;
	Tue, 25 Apr 2023 01:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E3C10E1F3;
 Tue, 25 Apr 2023 01:05:32 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33P00YwJ028384; Tue, 25 Apr 2023 01:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/JE2Tu/eXUj5gxjpv0IdfC9ftwGd1WGPHWuNkdxVajY=;
 b=KySaNFNZdaUjKwBbxqfmMrLKWLkKNKIgygq4K1aSouC2lwMZ5RYZLMCnHhRKQwAiOoJr
 aXpDnqd/t+DJvD7S9cT36n2HDozpe0TzxY7husptJlhoiBDwa32FFhphY+nZDzWGbcRx
 7WcG5sRp78dISMOPaPnxxezSOI3Nfp1sNUvY1pSf993krLqTmkPV1G7v7wP7mT+Y8XMw
 ImbjhM/fEiN9LE5nUvi8riKemFlq/d+Sle4qyJnTo2WfPdvl91ZDqmaZoQQrmoLXPhpf
 DLGHQh1Iv0ESBF6fgsVWVI0k9IJAjqrQgFC8zdtT5CFJxHPZ8APtqttNPRa59g4eFuGC yg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5uwj15cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 01:05:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33P15QW2026816
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 01:05:26 GMT
Received: from [10.110.104.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 24 Apr
 2023 18:05:25 -0700
Message-ID: <4228ade9-fab2-7732-4143-3edeb1de2059@quicinc.com>
Date: Mon, 24 Apr 2023 18:05:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 10/11] drm/msm/dpu: tweak lm pairings in msm8998 hw catalog
Content-Language: en-US
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-10-d1bac46db075@freebox.fr>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230419-dpu-tweaks-v1-10-d1bac46db075@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cen5c6kz_CXqYbcHoGqWuE6EWoaM8ddI
X-Proofpoint-GUID: cen5c6kz_CXqYbcHoGqWuE6EWoaM8ddI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_12,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 mlxlogscore=826 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250008
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/19/2023 7:41 AM, Arnaud Vrac wrote:
> Change lm blocks pairs so that lm blocks with the same features are
> paired together:
> 
> LM_0 and LM_1 with PP and DSPP
> LM_2 and LM_5 with PP
> LM_3 and LM_4
> 
> This matches the sdm845 configuration and allows using pp or dspp when 2
> lm blocks are needed in the topology. In the previous config the
> reservation code could never find an lm pair without a matching feature
> set.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
