Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739997A0EEC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 22:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4124510E2B2;
	Thu, 14 Sep 2023 20:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABB010E2B2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 20:27:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38EKFtA6000787; Thu, 14 Sep 2023 20:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=spiH3gFH19/jm7I7++wwwkP9fPV76kgclzFFFCYsQDE=;
 b=jsPwM167QYqmHfbMdY1iB3rysmBZ66EGCRyCo75Fs/Akm1oLnc6PaAb1/1rqsUyGkuoN
 x5PnmZFfmBU9HfOR7cwNC2pU86OtO4Ov0Magd50J+lioJhr4OMj/bx3tNVMTzXcMStO/
 0izSyPWjH0EHVp/6qOdVw6SDuTX2/iwkHXIl3U3w2M2Cq2R8wRXoAgpMi5XvQvsEgcGj
 FxUGOESFlAyUsvcRiP+wpfO+mUo3TmjVaArufMoUGs67bVDG10mNo1Vgdlb+8ucCGmL8
 OhccPgK7PTLkR9t/lvePeMgHuC9Qjjm9n79tPhfN8bA4y7zVzkdYo8MOOKorkZMf0kDP AQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t3v4gabh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Sep 2023 20:27:02 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38EKR1qQ000788
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Sep 2023 20:27:01 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 14 Sep
 2023 13:27:00 -0700
Message-ID: <2d49a4a2-01f0-1625-0cbf-d414499e47ca@quicinc.com>
Date: Thu, 14 Sep 2023 13:27:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/8] drm/panel: nv3052c: Document known register names
Content-Language: en-US
To: John Watts <contact@jookia.org>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-2-contact@jookia.org>
 <977a8de9-26ec-1789-4c72-fd36f34480c3@quicinc.com> <ZQKIED7jCc1FuPP1@titan>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <ZQKIED7jCc1FuPP1@titan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oN9uX6SQC4NWwccyzUfTryGXaPcoKS8n
X-Proofpoint-GUID: oN9uX6SQC4NWwccyzUfTryGXaPcoKS8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_12,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=973
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140178
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/13/2023 9:12 PM, John Watts wrote:
> On Wed, Sep 13, 2023 at 02:43:43PM -0700, Jessica Zhang wrote:
>> Hi John,
>>
>> Just curious, what do you mean by these registers being mostly unknown?
>>
>> I do see them specified in the online specs -- some even seem to map to
>> existing MIPI_DCS_* enums (ex. 0x01 to MIPI_DCS_SOFT_RESET, and 0x04 to
>> MIPI_DCS_GET_DISPLAY_ID).
>>
>> Thanks,
>>
>> Jessica Zhang
> 
> Hi Jessica,
> 
> Unfortunately these registers are not MIPI ones, but on a separate page of
> registers. So page 2 register 1 isn't MIPI_DCS_SOFT_RESET, that is page 0
> register 1.

Got it -- thanks for the explanation.

In that case,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
> John.
