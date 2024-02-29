Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB57286D630
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 22:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1195710E0CC;
	Thu, 29 Feb 2024 21:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PZR67QWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AE710E0CC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 21:30:32 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41T60xOw011993; Thu, 29 Feb 2024 21:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=2XAL70ahopTl3Ft92hpHa/oa4WdjMZaAss/IdzUZWzA=; b=PZ
 R67QWIUSP2bcOFnJ0JhXAWP6tpzjGwyWi33htZHjEWIReK6NcbiQ3t7j7kSm/EUA
 +s5csKXAgar4t3UJeT8O135LLTOzRXf8aQWqx5P4WmwyekYmz2LMyPu/z67tplDZ
 nnMLN5jb/9oixLY2KzIOlocOde+u54vcizaq1p+rSere50ha9SFZm2Ao5nhMSBCr
 n7AX0yArZdAAq6orjd5mhE1zFp6wRePYKRNunV9vzXgGNwAtaWVgTnSmnKF3ulR8
 rtDuCc3t02fmJ1wHgrlhM08uYwsICLYWS+VY2Ekw6QF2hc6xBcoAIZlCDb4boTyx
 3l9BI8TMpbfDPnQqtExw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wjm9mjk7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Feb 2024 21:30:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41TLUOJC025968
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Feb 2024 21:30:24 GMT
Received: from [10.71.111.207] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 29 Feb
 2024 13:30:23 -0800
Message-ID: <aea154d3-e272-48e1-9e91-890c9ae3fa0f@quicinc.com>
Date: Thu, 29 Feb 2024 13:30:22 -0800
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
 <a13eeb01-7df9-4577-975f-34b3aed8400f@quicinc.com>
 <8bbb2957-9452-424a-8e9f-4ddbd4f24722@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <8bbb2957-9452-424a-8e9f-4ddbd4f24722@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3uUMOATMM-pFSjbRxSaYOWXO5EAknyy8
X-Proofpoint-ORIG-GUID: 3uUMOATMM-pFSjbRxSaYOWXO5EAknyy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_06,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402290167
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



On 2/29/2024 9:23 AM, Adam Green wrote:
> On 26/02/2024 21:29, Jessica Zhang wrote:
>  > Got it. Was the shorter sleep time breaking the display and is it
>  > required for the new panel to work?
>  >
>  > Thanks,
>  >
>  > Jessica Zhang
> 
> Hi Jessica,
> 
> I will be submitting a v3 shortly, the change to the sleep time was not 
> necessary for the new panel
> to work.

Hi Adam,

Got it. If the panel isn't affected by the 20ms sleep time, I'd prefer 
to keep it since 100ms is a pretty big increase.

> 
> I have been able to re-use the gip sequence from the kd50t048a panel 
> used in the Hardkernel Odroid
> Go Super as I have been led to believe it is the same elida panel, 
> unfortunately the same modes
> used by that device do not work for the Odroid Go Ultra and so its still 
> necessary to have the
> patchset,
Got it. FWIW, I do see the Odroid Go Ultra being described as having the 
kd50t048a panel [1] [2]. Looking forward to seeing the v3 changes.

Thanks,

Jessica Zhang

[1] https://gitlab.com/amlogic-foss/mainline-linux-issues-tracker/-/issues/7

[2] 441e129cbf81 ("dt-bindings: display: panel: sitronix,st7701: Add 
Elida KD50T048A Panel")

> 
> Best regards,
> 
> Adam
