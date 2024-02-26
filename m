Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2772868312
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794D710E0C2;
	Mon, 26 Feb 2024 21:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dQuiR6Iw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734D610E0C2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 21:29:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41QL0Z77032516; Mon, 26 Feb 2024 21:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=MZ9f9rx25naR6v9FTKXv7ZUWyP2Ub5DoHHljraBXq+8=; b=dQ
 uiR6Iwm1M/80I2n1yK3UbrMnlAD0X7LQNOlx5yhzo6urTdyyKCOL4l/1mwf4LgKX
 J1PYxMHASNCR3jZ0G9lRg9GNnQWx6gZDs1sVlIDq9KY6hCNtXMfgBwwlmyoWj/7w
 sygvs4TbzoBsNBEPcyQUAK0LDIN1c3cj2RqMJjiQ80UE+CVHmtGHEe/W4YNIzDsm
 mnOU6v1rxQnrhjPp7a/h8NS6RPa/Z5fqozpa4gdKUFAYmL0ptTyLYZS0qqRDkMXa
 cZFWksqyqP4sk8kseGJCfC7/Tx02ris+oiq0FlmhGX1UEKBZEapTSoAk2iscnrGd
 E2iIdKZoEt8ilZsonnwA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh232r295-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 21:29:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QLTj4c018054
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 21:29:45 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 13:29:44 -0800
Message-ID: <a13eeb01-7df9-4577-975f-34b3aed8400f@quicinc.com>
Date: Mon, 26 Feb 2024 13:29:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: panel: st7701: Add Hardkernel ODROID-GO Ultra
 panel support
Content-Language: en-US
To: Adam Green <greena88@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240221194528.1855714-1-greena88@gmail.com>
 <20240222164332.3864716-1-greena88@gmail.com>
 <20240222164332.3864716-2-greena88@gmail.com>
 <f9446923-acd3-41cf-92d4-676b946280c4@quicinc.com>
 <79a4b60e-24f3-47fd-b3b3-7d207cec1470@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <79a4b60e-24f3-47fd-b3b3-7d207cec1470@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: icxhoZ3v6B03FuVtuvP-mhxjkuhE5VZX
X-Proofpoint-GUID: icxhoZ3v6B03FuVtuvP-mhxjkuhE5VZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260165
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



On 2/22/2024 9:47 AM, Adam Green wrote:
> On 22/02/2024 17:14, Jessica Zhang wrote:
>> Hi Adam,
>>
>> Just wondering, why the change to 120 here?
>>
>> Thanks,
>>
>> Jessica Zhang
> 
> Hi,
> 
> The 120ms is taken from the datasheet specification for the controller 
> as maximum time it takes for the display to reset,

Got it. Was the shorter sleep time breaking the display and is it 
required for the new panel to work?

Thanks,

Jessica Zhang

> 
> Kind regards,
> 
> Adam
