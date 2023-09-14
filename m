Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458777A0EE3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 22:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5F710E0D7;
	Thu, 14 Sep 2023 20:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B45610E0D7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 20:22:59 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38EKEMgW026050; Thu, 14 Sep 2023 20:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=csdRelKfaDXqcZhgkZqpANLqD87tkq2pL9dztAw3FcY=;
 b=RE6ZEuM1hWblVrFzEPZj3BkBkT5iEcuslUxpHncaLELlXK+rL+5jQNTm+oK7XsqXwvag
 YqX+x+vKIhfH+ASp+eapYoBQuIinjuISP7Mx/j/Z5OBknnT5wn1t4IbuvKtS1J181qkO
 gLiWrJV1b65TdfXofURMsM375ZCT0vz5WgL8cZ1w6OQH4sxD/pRjeAXGQIftyTf03G3S
 scxnJIXxelYmIYjbx8OlmrC1pWA+KBpKqi1xSLGeh8lbGJNu5p8iY8fRFnS8D3OCTHnw
 NaaaKbaiMb/Qrg7g1pWlo09l+OnoEqJiKog03WDcOLDCncJd63NTztSo+bnOSMzGiMBN hg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t3re32t3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Sep 2023 20:22:51 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38EKMoiA011937
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Sep 2023 20:22:50 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 14 Sep
 2023 13:22:50 -0700
Message-ID: <00e791f2-ee77-018d-275f-29793d6eb136@quicinc.com>
Date: Thu, 14 Sep 2023 13:22:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/8] drm/panel: nv3052c: Allow specifying registers
 per panel
Content-Language: en-US
To: John Watts <contact@jookia.org>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-6-contact@jookia.org>
 <d46ee183-a010-e585-c47c-fa3229eafb33@quicinc.com> <ZQKHcDZ-mxNaSe0j@titan>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <ZQKHcDZ-mxNaSe0j@titan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KPDkt9EDQx8A0Kx3USw1mPiColUdJjZc
X-Proofpoint-ORIG-GUID: KPDkt9EDQx8A0Kx3USw1mPiColUdJjZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_12,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=691
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309140177
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



On 9/13/2023 9:09 PM, John Watts wrote:
> On Wed, Sep 13, 2023 at 02:34:38PM -0700, Jessica Zhang wrote:
>> Hi John,
>>
>> Having a separate panel_regs_len field seems a bit unnecessary to me.
>>
>> Looks like it's only being called in the panel prepare() and I don't seen
>> any reason why we shouldn't just call the ARRAY_SIZE() macro there.
> 
> Can you call ARRAY_SIZE on an an array pointer?

Ah, I'd missed the array pointer declaration. This field is fine then.

Thanks,

Jessica Zhang

> 
>>
>> Thanks,
>>
>> Jessica Zhang
> 
> John.
