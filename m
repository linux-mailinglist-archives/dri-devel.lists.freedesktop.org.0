Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5352BBC8E61
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C2F10E9D6;
	Thu,  9 Oct 2025 11:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iH5NI9sB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFAE10E9D5;
 Thu,  9 Oct 2025 11:52:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EIew022299;
 Thu, 9 Oct 2025 11:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NKvuQhGcUEq6F1dym/+rBYs2bVe5arKDIgYghOvq8XE=; b=iH5NI9sBcPbQOAJw
 /ncTo4Yg4PBtygak9hgrl5Qr3DPh1d2UVsPNUAIZ/1vvBKJBHuNhB+AV0mJ4+jnd
 wAfUlSzqcCcPjiAiKC4oE8Pa9unbedkB1mkKJ+Ae4A7FLB2gt7Ju1q10B/GALd5k
 MeK2dyLqBUgzZVBVNwnhtlGikEH2/RmsVoHtP4mr3E5U5k0ubiuol/2LQNqB00nj
 IiDS6LLcfH4Ke83PSvvp0CZF7lGShjV5I4ZxTYWa7OZiiKDDy5oGDx1FCV88cBqP
 X+fclCmnbbNTbieA1176zqLjEOQBH6UPHWFHWAGbumS1u8r3is82HFUh/Cd8AxsP
 UUfSsw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sjmd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 11:52:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 599Bq2Rr010848
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Oct 2025 11:52:02 GMT
Received: from [10.206.96.75] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 9 Oct
 2025 04:51:53 -0700
Message-ID: <c4051862-508b-47ed-8bd5-c84d20f7002a@quicinc.com>
Date: Thu, 9 Oct 2025 17:21:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: phy: Add edp reference clock for
 qcom,edp-phy
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <robin.clark@oss.qualcomm.com>,
 <lumag@kernel.org>, <abhinav.kumar@linux.dev>,
 <jessica.zhang@oss.qualcomm.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <quic_mahap@quicinc.com>,
 <andersson@kernel.org>, <konradybcio@kernel.org>, <mani@kernel.org>,
 <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
 <vkoul@kernel.org>, <kishon@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>
CC: <linux-phy@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-scsi@vger.kernel.org>, <quic_vproddut@quicinc.com>
References: <20251009071127.26026-1-quic_riteshk@quicinc.com>
 <20251009071127.26026-2-quic_riteshk@quicinc.com>
 <24dd250e-f2a3-47ea-af21-b0e418ed8028@kernel.org>
From: Ritesh Kumar <quic_riteshk@quicinc.com>
In-Reply-To: <24dd250e-f2a3-47ea-af21-b0e418ed8028@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8W0NO6wX4ddzZqqUKXulVpHfq3jqmCAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4MfVA5eqJenJ
 SFoLlHKeZyCgjwHRrmXhe1UOiAarvRftESHdj26qrzNQCdFoCNRRMd84b28OArEOIxPYVxuuaSY
 NgHGawCK+DI5jgHcy1OyoTXtzAffBr6qzq+EYYJwmRoT+91ZvMd8yUK3MRHPKZO6+EFZfQh6qy4
 6A26OnJshQsRTn3CGKEKPnzyP2s0/XRqK6AKTFbRpgx2RiX8Q2KYmdNxiUn510hOLzAr1O+BZwe
 zWn9azHesL+aT03hyQlhnDY7RsXf7Q8j37VtqJKChno9N8fzM9GwwlgirW4Je6uGpG+CvxQdtYc
 fEzKvLJhxL3nI6VPZXbKutxME9P8dwV09VOWHMd+O1NTQp5GVbKPbEvsGjj3lozBgw4vhSbT12B
 Oul8iRNB1bKCBOAsIjkNWyc1/9U6LQ==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7a1e3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=c7tAmdlyf66g_q6FNG0A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: 8W0NO6wX4ddzZqqUKXulVpHfq3jqmCAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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


On 10/9/2025 2:57 PM, Krzysztof Kozlowski wrote:
> On 09/10/2025 16:11, Ritesh Kumar wrote:
> > Add edp reference clock for qcom,edp-phy which is required
> > to be enabled before eDP PHY initialization.
> > 
>
> No, you need to first look what is happening in community.
>
> https://lore.kernel.org/all/20250909-phy-qcom-edp-add-missing-refclk-v3-1-4ec55a0512ab@linaro.org/

Thanks for the patch. I will pick this and add support for lemans and 
post v2.

>
> Best regards,
> Krzysztof
