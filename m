Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10E3AD2CB0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 06:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B344D10E464;
	Tue, 10 Jun 2025 04:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="l2KBKAnv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0A310E258;
 Tue, 10 Jun 2025 04:31:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559JC6be001845;
 Tue, 10 Jun 2025 04:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lqmyqLGoM4yVGYgu3suWMjzC8jsl8Gz3oqSCpWTSeZE=; b=l2KBKAnvaBsTSYh0
 B2jjFMMRhuoGekmWnolHNrKNCznbkOAM+540pQuUUsZnI0zezLtOi8Pnd3W5bUF3
 bUiy5qurRBI2qmCZPZcvjara+zFvhh5zpNZMH6V4TGxGgeqTBZ7mMVwCrUWV9tPI
 2Zn2HGcewmQxMEmKUikBX+3zjcZfK2xR0CP9cczZycpj6hCsq9AkRZfwS37VKzBs
 Oud1s0NgwD0WKkCo982Ins410vG15Bi0CW3rSrPtaBiP9nelJ6nNbh4AKxc4K7E5
 19zU19P6QcP2+p6IsciNtB1qbE3jebpYkvynoAH+xw7BCaEj8wBWU56KbeLuS7Rz
 V+HxDg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxrd8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 04:31:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55A4Vkbk009694
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jun 2025 04:31:46 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Jun 2025
 21:31:42 -0700
Message-ID: <828ebe51-1a02-41e8-b844-2f1ed8410482@quicinc.com>
Date: Tue, 10 Jun 2025 12:31:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/38] drm/msm/dp: Add MST support for MSM chipsets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <h4zfn52i6jpfbclylgfutdgow7wm2hyl4urtegwcqiw5dkhwef@cfw3fjus4tq5>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <h4zfn52i6jpfbclylgfutdgow7wm2hyl4urtegwcqiw5dkhwef@cfw3fjus4tq5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nT7yaN87y36aPblrX-fehQ-EKFM824ZY
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6847b533 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=J3fMdyCQAi76MZjnpc4A:9 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: nT7yaN87y36aPblrX-fehQ-EKFM824ZY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAzMiBTYWx0ZWRfX3wQQjc0lZ2g2
 x9JHezulxXOQJJnIJlKk5fmFYKV5gvkPhhS3N9av8NI8gX5r7nYeiD0R1bLEXBctapAM3/fIwMt
 MYCh1T7PDXdtk+21XuU4pKMUlolWxfZeP839H1pLtWCG7zSJKeFE9wSJQyoCA8i6ha74e6VbOdR
 bOQm3fM/EBQJAVB3tBJjBnU2NSvDXgRsR7zkQMMyPWG+Fe3Vi9JuOczBdWnibI7XIlFZw2u/9Dy
 RECyw2exuA7rn1WhZUulg0Qho4xXDy+QD2H/TrZ7utTvR3fuo1rPBFPhb+rFHETpKRYt7T58BvE
 2SvNvWAKHuYcVxDr9/rRUhEsNNDO1i4dQdWI6J/weXEse/nBVKOK83CIeJjpe2fn2w99D0I0DUn
 Tn1GsRMKue1RVv3G0aVzBZEo30wAHrQwo6xHQNjl0evNpXIeuI5dsvbcmWWagGohEFPr9jtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_01,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100032
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



On 2025/6/10 0:07, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
>> Add support for Multi-stream transport for MSM chipsets that allow
>> a single instance of DP controller to send multiple streams.
>>
>> This series has been validated on sa8775p ride platform using multiple
>> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
>>
>> With 4x4K monitors, due to lack of layer mixers that combination will not
>> work but this can be supported as well after some rework on the DPU side.
>>
>> In addition, SST was re-validated with all these changes to ensure there
>> were no regressions.
>>
>> This patch series was made on top of:
>>
>> [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)
>>
>> Bindings for the pixel clock for additional stream is available at :
>>
>> [2] : https://patchwork.freedesktop.org/series/142016/
>>
>> Overall, the patch series has been organized in the following way:
>>
>> 1) First set are a couple of fixes made while debugging MST but applicable
>> to SST as well so go ahead of everything else
>> 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
>> of the work as current DP driver design had to be adjusted to make this happen.
>> 3) Finally, new files to handle MST related operations
>>
>> Validation was done on the latest linux-next on top of above changes and
>> both FB console and weston compositors were validated with these changes.
> 
> I went about a halfway through the series. During that I noticed ignored
> feedback, missing reviewer tags, invalid or strange authorship / SoB
> tags, overgrown functions, one line wrappers, etc.
> 
> Please rebase on top of [3], review the patch series on your own,
> removing / reworking all the bits that can catch my eye, implement the
> feedback, ask questions where you don't understand it, etc. After that
> please post v3. I'll most likely skip the rest of the patches for now.
> 
> [3] https://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com
> 
Hi, Dmitry, thanks for your reviewing very much. Actually i have 
reviewed all the comments on Patch v1. Sorry for not cleaning up 
everything as expected. I will address and discuss all the remaining 
items in the comments for Patch v2, and will follow up with Patch v3 
accordingly.

