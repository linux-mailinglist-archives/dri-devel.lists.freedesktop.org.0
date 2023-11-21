Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AA67F35FE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 19:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B2C88FB2;
	Tue, 21 Nov 2023 18:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7ED10E2B9;
 Tue, 21 Nov 2023 18:33:35 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ALGcHfj001708; Tue, 21 Nov 2023 18:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=52NiMWbzxDkTY1pJ7ExmU4D33d3aCocf4IH259Rraks=;
 b=piN9+EZ7U+vzw1SqLyVHxd0pJhEQISkPHCmVeKIbj5WfDOKwQ8FoFZJvtFW+jjoyQJAR
 /1s7bDPNckCKvdUe0nU0y6R+jNCELdwLoHhqq3DBzz5TV6yZYewodzMrHjXQpz0mU+wv
 LHBSqmsoiJUTVtHw3ZvOOyL3RcWB6EPgEN+U4rs3Qk+7AzJmgyDbUx/CCyo+ihtEPeyX
 sasW4RWw8Z26U900QKpNyVS3kKvZsO7dE2r9pKBDF819UecfXlpktyjQDSTdN8picmqx
 +/0MhfvUWxeY+WlF+fB2Ky22EIPoZ12M9c/jUsqc4+/4n2SuFZiS2F/NI68tHuNb6hnW cQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugssksqwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 18:33:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALIXRg7029936
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 18:33:27 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 10:33:26 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm: remove exra drm_kms_helper_poll_init() call
Date: Tue, 21 Nov 2023 10:33:17 -0800
Message-ID: <170059152901.8368.6408183714962644374.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107111413.2212942-1-dmitry.baryshkov@linaro.org>
References: <20231107111413.2212942-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: B7rwARA7P5hyZQuhikkYD-HHR9Er29FZ
X-Proofpoint-ORIG-GUID: B7rwARA7P5hyZQuhikkYD-HHR9Er29FZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_10,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 spamscore=0 clxscore=1015 malwarescore=0 mlxlogscore=420
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210145
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
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 07 Nov 2023 13:14:13 +0200, Dmitry Baryshkov wrote:
> It seems during rebases I have left a call to drm_kms_helper_poll_init()
> which is not guarded by the (priv->kms_init) check. This leads to the
> crash for the boards which don't have KMS output. Drop this call, as
> there is a correctly guarded one next to the one being removed.
> 
> 

Applied, thanks!

[1/1] drm/msm: remove exra drm_kms_helper_poll_init() call
      https://gitlab.freedesktop.org/drm/msm/-/commit/3944e343e54b

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
