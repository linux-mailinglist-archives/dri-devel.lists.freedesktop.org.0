Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C462189A4F1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 21:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293CC10E74C;
	Fri,  5 Apr 2024 19:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="afatC+Z0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF5710E74C;
 Fri,  5 Apr 2024 19:29:43 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435IVNEi025091; Fri, 5 Apr 2024 19:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=kDu2jRKSBZIpMOnYiWVt7olgV/KcGrl0XbnlFnnMBxU=; b=af
 atC+Z0b9so0hPsO/VanAcEsSYmWjsrAFibbizgUXY90GfLkHM0PEaTIajTuS0sHu
 gnW2jipez7tK7MK1Zf7D5RfuM7vGdXHuvqD0suELUOnJqYEr+oYr88RxYY/kkhWN
 ntU89Y+7vdAIsw/ipB7Zg7GphLoqi7h91mlaqRviUmE4sWS5a92oxH+TCMMxJjf8
 YppgnFvZmLT5THDTCrUBVmJsnKITj6iRcL6XtX7nXrhy7Ki7qb+jH4myDh2vhKGm
 zZ9UXkjKZF8fDmAE5AHELdoWZsIgb+CVfL/uoIcTpO8tKJseWy1T3hq8hfXPy5UD
 XiVbL0EL7NE6NnCFwxLQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xafpks63r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 19:29:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435JTdId030879
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Apr 2024 19:29:39 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 5 Apr 2024 12:29:38 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] drm/msm/dpu: make error messages at
 dpu_core_irq_register_callback() more sensible
Date: Fri, 5 Apr 2024 12:29:29 -0700
Message-ID: <171234532411.1203.16442584142477005862.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>
References: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OPb-yyIDrY99GV8843RgniL46a_tAxy1
X-Proofpoint-ORIG-GUID: OPb-yyIDrY99GV8843RgniL46a_tAxy1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_21,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=748 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050138
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


On Sat, 30 Mar 2024 05:53:22 +0200, Dmitry Baryshkov wrote:
> There is little point in using %ps to print a value known to be NULL. On
> the other hand it makes sense to print the callback symbol in the
> 'invalid IRQ' message. Correct those two error messages to make more
> sense.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: make error messages at dpu_core_irq_register_callback() more sensible
      https://gitlab.freedesktop.org/drm/msm/-/commit/8844f467d6a5

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
