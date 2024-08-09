Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB60994D371
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 17:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2344610E0E3;
	Fri,  9 Aug 2024 15:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ep6/PmNJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C967710E0E3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 15:26:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 479AZl1P005930;
 Fri, 9 Aug 2024 15:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WEE1u6wKV3bHN18KOlGlYnK+mukJ0upSUse2duvGIzE=; b=Ep6/PmNJc57UbSMZ
 9k2o+lB9P+IHivJ4Gqq/+GO8q6oPpX0/Sl5pq+jfqAlZmcxw+piyrFpHGLId9uVc
 zRBqr+Q2OaVJxvZampvgstsF+J17VRRJ5VwvsHC9aXpB+xQiKn4dskJj+d2mSNIg
 domqqSkO+Jt1zZIrCzOpJVKhiDavZugaO/KJurU49deMwa88ru9FBpYQjlRJc1Mo
 nolPKn8yyzEtszXaThrADiqnEuTEHsV4wGs1zyouRVDmTeQTY19TgFtQLdmgPix9
 kn0eHFPtxpFuLSoFhEHsUQG/2Rnp5hrQGEe2F7PpJwr0o9KJyCgTK9h3WD9pF3zL
 w02wOw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40whg38q6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2024 15:26:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 479FQERr018731
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Aug 2024 15:26:14 GMT
Received: from [10.110.23.148] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 08:26:14 -0700
Message-ID: <e0d52479-5341-4807-93e5-2e7e1a3f4774@quicinc.com>
Date: Fri, 9 Aug 2024 08:26:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel: drm_accel: remove incorrect comments
To: bajing <bajing@cmss.chinamobile.com>, <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240731064253.24523-1-bajing@cmss.chinamobile.com>
Content-Language: en-US
From: Carl Vanderlip <quic_carlv@quicinc.com>
In-Reply-To: <20240731064253.24523-1-bajing@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: eOhudyCWcoYQxgM7IG_A0UuefW5QWYrf
X-Proofpoint-GUID: eOhudyCWcoYQxgM7IG_A0UuefW5QWYrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_12,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=912 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090112
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

On 7/30/2024 11:42 PM, bajing wrote:
 > accel_minor_replace is of type void, so remove the explanation of the 
return value in the comments.
 >
 > Signed-off-by: bajing <bajing@cmss.chinamobile.com>

Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
