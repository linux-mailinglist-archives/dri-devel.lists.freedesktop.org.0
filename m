Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D37689A4E4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 21:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C6610E77B;
	Fri,  5 Apr 2024 19:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ukh08ayD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C321C10E77B;
 Fri,  5 Apr 2024 19:27:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435JMNZV032522; Fri, 5 Apr 2024 19:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=gpVa01wMnCOH+oPLt4SrcSclKrEaxSbwjAyukD7OqYU=; b=Uk
 h08ayDyXG/SbtsVrp3dGCfjFL5PH9IPhMERENRzqrHqeiJ6PieLtQLqxW5QXR/Qe
 7qI9CtzoQHgO71D1FRdGAbYapiTjNzV8TorBl0ANcl6UYKg3KFnuxNKVJ2lZiCqA
 12aFroKLMTqbTXbIqY3Hp1U7uqV+ieXjJ1Y+CJ/BXxFoj/4sqvG6RZiJQXWiO3vX
 Dfd07ERo6vR8L8/VhHBBISMVjYz9KE8ZuWTLgC30aY1AvMAorTY1HZjEOWvLzgp5
 LrEwYXVas9cgt1IM4TK+3x83KPUUSqeiAPgcmiiJTUEmQWZGzCwx+Vck6AOdmWjl
 aNJ/RSdM92AuUI38ytmQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xa1xaaqyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 19:27:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435JRSNo028890
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Apr 2024 19:27:28 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 5 Apr 2024 12:27:27 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <abel.vesa@linaro.org>, <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
 <quic_sbillaka@quicinc.com>, <marijn.suijten@somainline.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] drm/msm/dp: assign correct DP controller ID to
 x1e80100 interface table
Date: Fri, 5 Apr 2024 12:27:11 -0700
Message-ID: <171234515616.24464.8575480727140216508.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <1711741586-9037-1-git-send-email-quic_khsieh@quicinc.com>
References: <1711741586-9037-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _ltcihew4web1Ih4sfy0Y3rUER1l7AXr
X-Proofpoint-ORIG-GUID: _ltcihew4web1Ih4sfy0Y3rUER1l7AXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_21,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 mlxlogscore=955
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050137
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


On Fri, 29 Mar 2024 12:46:26 -0700, Kuogee Hsieh wrote:
> At current x1e80100 interface table, interface #3 is wrongly
> connected to DP controller #0 and interface #4 wrongly connected
> to DP controller #2. Fix this problem by connect Interface #3 to
> DP controller #0 and interface #4 connect to DP controller #1.
> Also add interface #6, #7 and #8 connections to DP controller to
> complete x1e80100 interface table.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: assign correct DP controller ID to x1e80100 interface table
      https://gitlab.freedesktop.org/drm/msm/-/commit/ee15c8bf5d77

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
