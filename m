Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFFA94D348
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 17:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F44310E951;
	Fri,  9 Aug 2024 15:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="naZ/7Ymg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B8E10E951
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 15:20:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4799VXO5022485
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Aug 2024 15:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lV0PUpp38gBw5UtEZxgxgb+Wx73A4EwYzucyLie4gPc=; b=naZ/7Ymg579Dr4/I
 Z7loKz887NyvCKPdrgRSxyYec2dnmtDQ+d6HLupCqoX5rfsKbjGCEyeJBAnurhgu
 i0176KYmuDqnS7xHM5/otFaJ9q+/CgC+hOmQHmizTtpgTseKIIwcWAq9vrqhV+zY
 3ytz6j0GOrV029hoArD8kmd8GkVW5pkXObWy9pHhMw3ujcOO3bB39F2ECpRgoQlR
 HZlJUQaFShsqeBA2051kuckUjHW9Z87REp4KaK5NVkL2H9IYajuEdcPBLF/YJkCT
 CzjTD72X8gjokRn/mPb5zh8MIBcALOz/38ZHK07AuH8gv0+7WAKtEryyL99+iCOY
 IFe2+g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vtbcvbk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 15:20:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 479FKr1D019315
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Aug 2024 15:20:53 GMT
Received: from [10.110.23.148] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 08:20:53 -0700
Message-ID: <1305a117-2113-4793-8386-434d9f4feb8a@quicinc.com>
Date: Fri, 9 Aug 2024 08:20:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: qaic: Drop Pranjal as reviewer
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>
References: <20240726155310.765164-1-quic_jhugo@quicinc.com>
From: Carl Vanderlip <quic_carlv@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240726155310.765164-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _-9PUuVgeyAhjzLXnbTEYakSX7uP7ONb
X-Proofpoint-ORIG-GUID: _-9PUuVgeyAhjzLXnbTEYakSX7uP7ONb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_12,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=644 clxscore=1011 impostorscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408090111
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

On 7/26/2024 8:53 AM, Jeffrey Hugo wrote:
> Pranjal's email address is bouncing.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
