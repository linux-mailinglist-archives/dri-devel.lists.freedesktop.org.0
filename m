Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F77F35E8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 19:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B1810E2AB;
	Tue, 21 Nov 2023 18:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A8210E56D;
 Tue, 21 Nov 2023 18:29:31 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ALGv1Tp013725; Tue, 21 Nov 2023 18:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vG3SezDCYdIrXFGfXmFE+x/MXOvguDKneXltb/Dvw+g=;
 b=RRpmmxdFIfyV8sEAJLOrFChD0W4qpxdp0YQuaDTMrpROjnu6DWwRFWx0BJyOEENoorDs
 45orMk4v8ae88bK34aGrDpcTV6UyvoBjXC8MQTI/EJ1dzroMG2o5TNG7NU8+CC0OEeI5
 8gAoLlZ0FnP76FIe97fvsu2a1PCilwakZKSGjVgns3pyuQjtPshKnwYKziahtXfpQLxm
 7vq9U183wbKN4AMxs6G6lVUyuZcUxCeTQAhvYZna8xUu0/QsJjwwWDYYZdd6SmN4lsXB
 oBJUzKufaNtRIhxWBRSuK2zHKsUTw0pXz3ZsnPeH5QIaannocI7cI/xxJNNlU5FB8mZe wA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugu549g21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 18:29:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALITPEY021725
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 18:29:25 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 10:29:25 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2] drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm
 cphy
Date: Tue, 21 Nov 2023 10:29:03 -0800
Message-ID: <170059072153.29644.6387537767336695325.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231110000216.29979-1-jonathan@marek.ca>
References: <20231110000216.29979-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PvQBdut0lXxlf4nWVQaud8WOdkgd3nJl
X-Proofpoint-ORIG-GUID: PvQBdut0lXxlf4nWVQaud8WOdkgd3nJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_10,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=379 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210144
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
Cc: Vinod Koul <vkoul@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 09 Nov 2023 19:02:14 -0500, Jonathan Marek wrote:
> Use the same value as the downstream driver. This change is needed for CPHY
> mode to work correctly.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm cphy
      https://gitlab.freedesktop.org/drm/msm/-/commit/b3e0f94d1570

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
