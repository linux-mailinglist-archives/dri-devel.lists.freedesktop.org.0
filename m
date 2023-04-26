Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6DC6EFD94
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 00:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843D010EA52;
	Wed, 26 Apr 2023 22:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5639B10E33A;
 Wed, 26 Apr 2023 22:42:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QMYQer020606; Wed, 26 Apr 2023 22:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tNfDFxls9ikINAA5C1H2Bn+9LRC06Jht21sjcAW/aUY=;
 b=ekD12udSAP333nQvo7ZZVMRSY03ei7sBuDcTACFtmehHGpqzNwCtdTQR+5EXinRO8jl1
 t0jfKoF48KO0LiIE/Hnh9fzFZ9xHK3wDtV8lTLOrDZDwgR1maVreXC4RO9KoC+eTx8Po
 MD+AozLC46zI4kftIPmNk4N6uR0LiKQKISCwm1S7+rT/fBKGPcCmzJo3PUfYE4lBk/qk
 YFfCytAnTkYt8fequT5RpCmHB76q9GpsKfUmXbLoJqz3U7tURXaR+SFmjYd2c4kzP9AL
 jOp4eRoYwLXzTBC4vfiw4rGUn+hJ/KsaX8qbJAAKcQZCizlDTfp5xiRXcXjcmdT2b33e Ow== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6x62j3yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 22:42:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33QMghdP006684
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 22:42:43 GMT
Received: from [10.110.124.105] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 26 Apr
 2023 15:42:41 -0700
Message-ID: <7cec3d06-9d96-0e58-7920-3e86a26f190d@quicinc.com>
Date: Wed, 26 Apr 2023 15:42:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 02/22] drm/msm/dpu: Remove TE2 block and feature from
 DPU >= 5.0.0 hardware
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
 <20230411-dpu-intf-te-v4-2-27ce1a5ab5c6@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230411-dpu-intf-te-v4-2-27ce1a5ab5c6@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oawVTKPH4cVQ8N0B1AkO6phXsscDZbgI
X-Proofpoint-ORIG-GUID: oawVTKPH4cVQ8N0B1AkO6phXsscDZbgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 clxscore=1015 mlxlogscore=917
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260196
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
Cc: Jami
 Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/26/2023 3:37 PM, Marijn Suijten wrote:
> No hardware beyond kona (sm8250, DPU 6.0.0) defines the TE2 PINGPONG
> sub-block offset downstream, and according to insiders no DPU >= 5.0.0
> hardware has support for it either.  Especially since neither downstream
> nor upstream utilize these registers in any way, remove the erroneous
> specification from SM8150, SC8180X, SM8250, SC7180, SM8350, SC8280XP and
> SM8450 to prevent confusion.
> 
> Note that downstream enables the PPSPLIT (split-FIFO) topology (single
> LM for 2 PP and 2 INTF) based on the presence of a TE2 block.
> 
> Fixes: 386fced3f76f ("drm/msm/dpu: add SM8150 to hw catalog")
> Fixes: 7bdc0c4b8126 ("msm:disp:dpu1: add support for display for SC7180 target")
> Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
