Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A13D6DCEA1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 02:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5844E10E464;
	Tue, 11 Apr 2023 00:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C808010E464;
 Tue, 11 Apr 2023 00:57:51 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33ANcmph021727; Tue, 11 Apr 2023 00:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=917vhgxI64kasNjOCrPGlxiiye/OY6KVJ/xGA/cpVBc=;
 b=CqpeLR/jpMyN3JWAF550jUHGAtgSBNXx2yv10AbIR6XNJiJ4FE7BwBABzVS6RsgA2OKO
 fqzZeco+2EchnPJsqDfY8F3m0QKs16v/j1yQtfiMsFpe1pFQe8SmsWkiZw3wT3orA8nI
 VcxP5j2qTubLL1waoGFkIURHo0aMh1eK6MHDTbI1qrz44mG0Mgu/nwP7QegrYQaw8QDg
 ETEfmzrulwLEA9vixmNVCzbW+DcYNISsRpuKD1moXxJIClsrbTv/uhvIP+WH8qPfHl3y
 2+fEQPOr58ci7bCuZQPVRdiHaTifVFg2hUz2lJw0vyeUgoTxejV+aDeKT4Cl8to7jS5V Aw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pvmb3h1qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 00:57:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33B0vjF1002003
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 00:57:45 GMT
Received: from [10.110.115.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 10 Apr
 2023 17:57:45 -0700
Message-ID: <66ea8874-424f-e4d8-ff0b-26ffb5333f2d@quicinc.com>
Date: Mon, 10 Apr 2023 17:57:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 4/4] drm/msm/dpu: use CTL_SC7280_MASK for sm8450's ctl_0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
 <20230408002750.2722304-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230408002750.2722304-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jZCzAMOpHQPVrq6WtBmS0nfgfzqUlm_K
X-Proofpoint-ORIG-GUID: jZCzAMOpHQPVrq6WtBmS0nfgfzqUlm_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_18,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=747 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304110006
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



On 4/7/2023 5:27 PM, Dmitry Baryshkov wrote:
> On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
> so switch it to CTL_SC7280_MASK too.
> 
> Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
> for SM8450") had all (relevant at that time) bit spelled individually.
> Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
> despite being a mismerge, correctly changed all other CTL entries to use
> CTL_SC7280_MASK, except CTL_0.
> 
> While the current BLOCK_SOC_MASK style is not ideal (and while we are
> working on a better scheme), let's follow its usage as a least minimal
> surprise. For example, sc8280xp, a close associate of sm8450, also uses
> CTL_SC7280_MASK.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Although I dont totally agree with this, but because sc8280xp also uses 
the same, I am fine.


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

But either we need to work on a better scheme or expand the macros but 
not duplicate these for the next chipset which gets added.
