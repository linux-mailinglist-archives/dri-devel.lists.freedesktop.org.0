Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE64E6EE9BB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 23:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B6C10E2FF;
	Tue, 25 Apr 2023 21:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A614F10E065;
 Tue, 25 Apr 2023 21:33:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PKvpR5003304; Tue, 25 Apr 2023 21:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zHK1x//xP+qbxPUbcHSETMQOpg8gUYXu9pUjXaoyD/s=;
 b=Xs/pyUq5PM0FX1/xBZEOiJTB44N5onsqX6zevInv9dtHN4BXDc1mFNg3pLHMC1o47CUe
 syQh5zcf9+deXtwJFz446ihMJfet4p4lmomIjWx93Lv359sVRA0KUdlsI7nTMJrLU0MQ
 HVHsL7PpvZg8yW2dVHgMZx+xhdkan5Tguy5vUEI8KIjuNGQ2wcySeRjhIL6JUK3GWAsg
 xvnovFhGPAEnoIJLtffOW33a77vyvGVUVNty8rZUsEEV/cku9g2idQt1ZyX6xtesVA0T
 HzShWrPZ0nkhvgKQ9/30jkQUUA1KvM6nT5Qd/aO+xZZNhFQ00EHcTYH1rM95B987EPQu Bg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6bdr9wtq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 21:33:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33PLXd5P009185
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 21:33:39 GMT
Received: from [10.110.124.105] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 25 Apr
 2023 14:33:39 -0700
Message-ID: <a66c3670-52b8-58f7-1bda-dada794d25bb@quicinc.com>
Date: Tue, 25 Apr 2023 14:33:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 01/11] drm/msm/dpu: tweak msm8998 hw catalog values
Content-Language: en-US
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-1-d1bac46db075@freebox.fr>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230419-dpu-tweaks-v1-1-d1bac46db075@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: seGpOX5vH10CcMthZzmLwmFcZPzavyw5
X-Proofpoint-ORIG-GUID: seGpOX5vH10CcMthZzmLwmFcZPzavyw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_08,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=717 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304250192
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
> Match the values found in the downstream msm-4.4 kernel sde driver.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
