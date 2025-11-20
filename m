Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C7C72833
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 08:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B47510E6EA;
	Thu, 20 Nov 2025 07:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iet7WMen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1F010E6EA;
 Thu, 20 Nov 2025 07:09:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AK4ppPg3844053; Thu, 20 Nov 2025 07:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jJoy5MQod7N9mees7dxVFCvLmRHyyJmynYXyKNAX098=; b=iet7WMenMr0/a/CS
 1ZgmVYupk9R7lukddDfwggPrcago1oI2b+SZ5UTmD4gTj6kvnymxXQlJTouhIlHb
 K1B2DpSesP8fimP2F+u05/ayEaT7CuXzH1OGZLNKc6IIAc3CplznIZljwenRayee
 8C6NKiPaCiHUCBMbTaVDewQZcPvHQIWwy/kiJxfYnMGdEgAv0IrA54/X8xp6jqfZ
 AKQVJpTwspNQmVFg4lU3oelKhOqy8QQKssS637gQeEFlfZx7ivUtYDF9WIxJ1VGI
 /WHJ3vsVY4rPafqqO1Ul8HUntvD9BArcPl9mZYbqI5uen05jNyifp4D9ib5E/LnL
 S0UmNw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahdpr320m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Nov 2025 07:09:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AK792TZ015417
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Nov 2025 07:09:02 GMT
Received: from [10.204.78.57] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 23:08:55 -0800
Message-ID: <655305dd-50a4-48c8-8ba5-a93ed46b36ed@quicinc.com>
Date: Thu, 20 Nov 2025 12:38:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Enable mdss1 Display Port for Qualcomm lemans-ride
 platform
To: Bjorn Andersson <andersson@kernel.org>
CC: <dmitry.baryshkov@oss.qualcomm.com>, <marijn.suijten@somainline.org>,
 <swboyd@chromium.org>, <mripard@kernel.org>, <abel.vesa@linaro.org>,
 <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <robin.clark@oss.qualcomm.com>,
 <jessica.zhang@oss.qualcomm.com>, <abhinav.kumar@linux.dev>,
 <sean@poorly.run>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <alex.vinarskis@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
 <quic_riteshk@quicnic.com>, <quic_amitsi@quicnic.com>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <b26devgysl3s2tc5gncmpwsq57eyjtcdqzidt3c4bauw24kosb@chmgunmg6iv3>
Content-Language: en-US
From: Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>
In-Reply-To: <b26devgysl3s2tc5gncmpwsq57eyjtcdqzidt3c4bauw24kosb@chmgunmg6iv3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Uq5u9uwB c=1 sm=1 tr=0 ts=691ebe8f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vDrjvunVpv-7mF6DcdYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA0MCBTYWx0ZWRfXxHuxHuRAPPQw
 tyrEx/of8zSqDF9HRWV83PnuWDhfAsG+8yS92e6OOgWrhsw2ZcdOxVgRy8gxvMeQlp7gbFrjN5K
 Mnq5MwTrRYeJWwE3DrrQasKpFKIhVrnoOmNMdKcIy1MlJAbZ5dV3WmV3eUb8eYIhIwpOMDTdwCu
 rbj7iVFzfOdGV1TCdZRcv3OelGKsdP/DpdAi8F5Ms75smLvZtMOuWnsTKKccpI/SNR48P/tK30j
 jD7n75jB+pr80wROG5G0xYuoL8kg1DaZRbqTug2VfbCk/9T1EgpZzYv/oAwLPYfZ6d1mqk2ujPr
 jLmNmf0y9e63YGCH72ZjDOQkBYuEK+mrTrCDtxg0kStlSiUGXeF6WHkHpY/yej0cjOjjvsbfdo6
 harBap8qePNBkpE7J9g5ANXccgal5Q==
X-Proofpoint-ORIG-GUID: GsDKYUxhTje2htrS_yvf4HrGHAVJrwWT
X-Proofpoint-GUID: GsDKYUxhTje2htrS_yvf4HrGHAVJrwWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200040
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



On 10/18/2025 4:21 AM, Bjorn Andersson wrote:
> On Fri, Sep 26, 2025 at 02:29:52PM +0530, Mani Chandana Ballary Kuntumalla wrote:
>> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
>> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
>> lemans-ride platform.
>>
>> ---
>> The Devicetree patches are dependent on following patch:
>> https://lore.kernel.org/all/20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com/
> 
> Include that patch in your series instead of relying on the community to
> resolve your dependencies, please.
> 

Sure, we will include in the next version.
