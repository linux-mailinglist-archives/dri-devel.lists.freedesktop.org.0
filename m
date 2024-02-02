Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062B9847770
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 19:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D8F10F0B4;
	Fri,  2 Feb 2024 18:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WaKP8rmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B00010E6C2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 18:29:07 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412G9IxY005695; Fri, 2 Feb 2024 18:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:to:cc:from:subject:content-type
 :content-transfer-encoding; s=qcppdkim1; bh=Vwx3FXKnaV6LfFKKlHGK
 kLV3dJDbyYgdtU7pDdalGxs=; b=WaKP8rmhpwNFTXFSksVrLKzZzRsRO6w2LaRi
 yBX4K+hF61bnRcUsvSifG6Py4Ate4XO75SFOpH39rMiZl3+EhWOtUy+J3zFI3nSh
 EQDiB7GKPreNgGSeVsqGv/3h+IZf0m61t0X44qnCoOEvYrCSC4II4FK+JwLDa/s7
 KhX59wEu7PANt9t31+mYHim1IXUzIUB82M2R4sdlpQGL31JJYeYTjIFVuh5L0HzJ
 uEbx8F3Z6GQXmOGUlz35yQSOs2FAW0Oa2QuYmQpPQMWA7/ilxD/TFurGnkfn+fQD
 JazPDIa0qtvecNK/hwNmoz54Mh9atcU3SS6/bP59FnPq26NLRg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w1019rtmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Feb 2024 18:29:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 412IT5QS003201
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Feb 2024 18:29:05 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 10:29:04 -0800
Message-ID: <b0c0de30-9ef7-5753-928e-f189038b7fb9@quicinc.com>
Date: Fri, 2 Feb 2024 11:29:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>
CC: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "Bjorn
 Andersson" <quic_bjorande@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: TI SN65DSI86 bridge chip DT binding maintainer
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: GTB_OsBpB_qG_CwlHjk_3ApGJ_IRbj9H
X-Proofpoint-GUID: GTB_OsBpB_qG_CwlHjk_3ApGJ_IRbj9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-02_12,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=316 clxscore=1011 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402020134
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

Hi Doug,

The DT binding for the TI SN65DSI86 [1] lists Sandeep Panda 
<spanda@codeaurora.org> as the maintainer within the file.  This is no 
longer valid because the @codeaurora domain bounces, and Sandeep appears 
to have left the company.  As such the binding appears to be orphaned, 
although the file itself is misleading because it needs to be updated.

I'd like to find a new maintainer and from what I've seen on list, you 
seem to be interested and active in this particular bridge chip.  I also 
see that you are listed as a reviewer of the C code and binding within 
MAINTAINERS.

Would you be willing to volunteer to maintain the binding going forward?

[1]: Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml

-Jeff
