Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566276F1F38
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 22:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB4510EDE0;
	Fri, 28 Apr 2023 20:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8597910E15C;
 Fri, 28 Apr 2023 20:21:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SJ17PI010240; Fri, 28 Apr 2023 20:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jLyPbtzvBUyAfoKSLhDpM3wpUyv5i2Vpizt0weLRsa4=;
 b=bXRDvUkIeRKig/SwyTPjKTnYLcprzEzecs1Aw3F9pv7c4tTDYFzxjJmbsPDk74Q//jk7
 yw8P/5aFSdOlgSqE7jXx/r1sc1n8Z/BJwfSvaznTS8S3Jbdc99zI6dL9dacnyLFQmqlN
 lsf6soBFrUwTW4VilhGhHT0F1KvYAYWDYmiv7Kowd1dIilM1ONqayoZW9UpeN1MoFF+C
 9nm5NTIlsDOk8QxrLHfB1zkbhwTsVbRVrSg7qXOkei8CoGLtsMFzJDbwym4tDYgb9qQv
 lObcCIHFfng4NHasq4qzIu8I0OVcRj1j2eIF3h38K9k2HZEdT6VO4ddmuV8xCJyAzh37 iQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q850ctr4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 20:21:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33SKLb6C016478
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 20:21:37 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 28 Apr 2023 13:21:36 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Krishna Manikandan
 <quic_mkrishn@quicinc.com>, Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display/msm: dsi-controller-main:
 Document qcom, master-dsi and qcom, sync-dual-dsi
Date: Fri, 28 Apr 2023 13:21:21 -0700
Message-ID: <168271324255.1535.12569960424133230551.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230427122132.24840-1-lujianhua000@gmail.com>
References: <20230427122132.24840-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: D2rw4HD4qY9sb1xwqJLU7kIY_Mgf15A3
X-Proofpoint-GUID: D2rw4HD4qY9sb1xwqJLU7kIY_Mgf15A3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_06,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 suspectscore=0 mlxlogscore=893 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280167
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 27 Apr 2023 20:21:32 +0800, Jianhua Lu wrote:
> This fixes warning:
>   sm8250-xiaomi-elish-csot.dtb: dsi@ae94000: Unevaluated properties are not allowed ('qcom,master-dsi', 'qcom,sync-dual-dsi' were unexpected)
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: dsi-controller-main: Document qcom,master-dsi and qcom,sync-dual-dsi
      https://gitlab.freedesktop.org/abhinavk/msm/-/commit/ca29699a57ec

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
