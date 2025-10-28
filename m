Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612E2C13F6E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 10:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C30A10E1D8;
	Tue, 28 Oct 2025 09:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="asN+qANb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB06010E067;
 Tue, 28 Oct 2025 09:57:54 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59S31w8U353480; Tue, 28 Oct 2025 09:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8I3o1pIujZUjMX2XAjT2u/HA+H8MX1k3r61MkoE1lWQ=; b=asN+qANbZLadMXxQ
 HegT9DkuNWw7vHbi4aIKX1i0yQb+NwyMHm02F0lFtfz2arZPUlwgv5YSd+JDc+/7
 Z9274ue3Cla24W8DLIjgxpg73ptkVm2a3h5asuf3atdlHvufALyjZfSUdySrNAio
 vZOLJa7Z4XaTVsAB+Na9LFOekJks/G5q9kczp+D4HDo8vjIZJPWYKC3bSbwZas7w
 ZgXegXuciZzZwhLrYwEyq7fQskjQChlG2KZkgJ/GclFlsLY+QD6sAQsPK18uT2md
 rS2Lj20ZACcjFsIiRAzc1xH6TMKcZjrC7KDjTU4B1M7evb/4CoVx2GWCCWj2Otsh
 /S44DQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2njrs5jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Oct 2025 09:57:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59S9viZv030350
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Oct 2025 09:57:44 GMT
Received: from [10.206.96.75] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 28 Oct
 2025 02:57:35 -0700
Message-ID: <ef4effd5-bc43-4134-a4e5-a1e47b620549@quicinc.com>
Date: Tue, 28 Oct 2025 15:27:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for
 sa8775p
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
CC: <robin.clark@oss.qualcomm.com>, <lumag@kernel.org>,
 <abhinav.kumar@linux.dev>, <jessica.zhang@oss.qualcomm.com>,
 <sean@poorly.run>, <marijn.suijten@somainline.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <quic_mahap@quicinc.com>,
 <andersson@kernel.org>, <konradybcio@kernel.org>, <mani@kernel.org>,
 <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
 <vkoul@kernel.org>, <kishon@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <quic_vproddut@quicinc.com>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
 <xofvrsdi2s37qefp2fr6av67c5nokvlw3jm6w3nznphm3x223f@yyatwo5cur6u>
 <20251015144349.GA3302193-robh@kernel.org>
From: Ritesh Kumar <quic_riteshk@quicinc.com>
In-Reply-To: <20251015144349.GA3302193-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=dqvWylg4 c=1 sm=1 tr=0 ts=69009398 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i-1-ecsRnRnOvt_f1vAA:9 a=QEXdDO2ut3YA:10
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: 4CfEHxI0d71YWWwFAUQARagTdDCwDYdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4NCBTYWx0ZWRfX/wGoND2ICMMD
 opcy1bZOgAksLQ8qu35B+9JOIQgSqgahxBfX8+2z1dOnXOE2/EFliZ3UWF+7zwu+YX/WxSrspg2
 pEyNMlZ14VjFM2GFm994qqCLdcZ+6a9kmplaJjNJXSO2/FFG8PXSdf+dC86nfsf6F7tbcfpsblw
 ZB3CDazV/+xVfnJNeh5Sdqkm9k28ggaKoyVCwMHgI3QU7f18kYoBQCbfQ/HePT9nQID+F3RAFN4
 b/Lti2GxRdDUClxGtoJHv2Ns5OZ97PNyLWQfTzGkw0/AJpMRK9H34T/HMwZNbq//OOxVCmYYGlG
 0R58Dw4jgv6oWxCAoLkKx+IIlVH9FGbepmYGKeo3YwBf47W3x7U2PN9eml5D2KhtbEKo5jTQ4xn
 D08Lo0YCu3qEJ/nS9a6J36J92XKCsg==
X-Proofpoint-ORIG-GUID: 4CfEHxI0d71YWWwFAUQARagTdDCwDYdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280084
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


On 10/15/2025 8:13 PM, Rob Herring wrote:
> On Mon, Oct 13, 2025 at 03:37:47PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> > > Add edp reference clock for sa8775p edp phy.
> > 
> > eDP, PHY.
> > 
> > I'd probably ask to squash both DT binding patches together, but this
> > might cause cross-subsystem merge issues. I'll leave this to DT
> > maintainers discretion, whether to require a non-warning-adding patch or
> > two patches with warnings in the middle of the series.
>
> One patch.

Sure, will update a single patch for DT bindings.

> Rob
>
