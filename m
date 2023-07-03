Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187C17464FA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 23:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C72F10E238;
	Mon,  3 Jul 2023 21:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A000910E239;
 Mon,  3 Jul 2023 21:40:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 363LYQDk004599; Mon, 3 Jul 2023 21:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=C91s+szJSxR5Fd8NzDtckUjxTAp5ekKyfTTrM86KYDk=;
 b=atTez1b9duCj/VHi1n6cdaCISUYpEBeVJdVAsAyWxJAadS6Gi1rT1RvTl/BwVU6xGp05
 12ZKk3Tk4M+5VZx2GwujaOC2n6rfavoDmPotv2clCBxf7FXfbVQZwiGJTSsULgcbi9Pc
 2m2Voe/Fbb1xLKtVzObR0b9xtge3eFQGmZMvCYZxfv/irVkv98/EivmENikftDFDaGbo
 TDuchEfazkjOi+EcZ+hLsCwyzU1n46pN8AF0g+YVgmLVvQpNjnPpRXaGNkKwaiVANV0p
 +aoRUM9SHSP3Xc81+25waei00Z+w+xcHYrQazNMUUQDojvC+I4czN6hPnfPzUB5Edbd6 nA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rkyrr8u9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jul 2023 21:40:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 363Le5EI022860
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jul 2023 21:40:05 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 14:40:04 -0700
Message-ID: <c278bf93-124c-5512-51af-042a0dcbd67b@quicinc.com>
Date: Mon, 3 Jul 2023 14:40:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/8] drm/msm/dpu: drop performance tuning modes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230620000846.946925-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CEqu9lVEt3drf8hcaRgyKulGoQglGud4
X-Proofpoint-ORIG-GUID: CEqu9lVEt3drf8hcaRgyKulGoQglGud4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_15,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 mlxlogscore=904 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030198
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> DPU performance module contains code to change performance state
> calculations. In addition to normal (sum plane and CRTC requirements),
> it can work in 'minimal' or 'fixed' modes. Both modes are impractical,
> since they can easily end up with the display underruns. Userspace also
> should not depend on these modes availability, since they are tuned
> through debugfs, which might not be available.
> 
> Drop relevant code to simplify performance state calculations.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Sorry but NAK on this change for two reasons:

This mode is not for usermode to depend on but for debugging. I have 
personally used both the perf max and perf min modes for debug.

1) The purpose is that, if you do see an underrun, you can force the 
perf mode as it will select max clk and bw rate

So something like below:

localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode
localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 300000000 > 
fix_core_clk_rate

This will allow us to force the clk to a particular value to see at what 
point it starts underruning

Also you can even do

localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 1 > perf_mode

This will automatically max out the clk and BW

With this, you can figure out if underrun is a performance related 
underrun or a misconfiguration. We used it even recently to debug the 
performance issue with pclk reduction

2) Sometimes, you even want to force an underrun to debug devcoredump OR 
the recovery code. Forcing the min clk mode by doing

localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 19200000 > 
fix_core_clk_rate
localhost /sys/kernel/debug/dri/1/debug/core_perf # echo 2 > perf_mode

Is the easiest way to trigger the recovery handler.

Hence I am not at all convinced of dropping this.
