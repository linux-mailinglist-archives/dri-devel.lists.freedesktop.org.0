Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55B89E8E02
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 09:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CC710E67A;
	Mon,  9 Dec 2024 08:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aYVL/QDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837DF10E27D;
 Mon,  9 Dec 2024 01:57:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B90QGVn020262;
 Mon, 9 Dec 2024 01:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CG8II9ztrbXAFXn/IH/2hf7r1GGna+rqHK57zUB/bNU=; b=aYVL/QDI5hRBCESG
 gYYAxB1Jr0qodPz2M2xbt/JMNcoRoBNZs8xC1V3uwoq+Jf5P+cWv2D0SU1UQR0/M
 T2eLohmOtOyA2bFSvoz123IpkZOeURYCf/nIfYwjVwv7eQAyXZDZ5SCRtJr0SBng
 IXT3p1usNWdSsO1rXlSYeeyZJkabKG8rxnEgZIoI8gDFj189N7VQ+kb/PZA8iBMJ
 xdJaUjqCZOymB7MLaSm/ISPhx/oeXiftwxMpDfoDtjq/rH0umXmv1xD7IP9w9UD4
 KYv5rP+18JY4MYCm+Fy6ZR5eaJ4O8abTulwPAzZohbPvopy/cJQRwjQeFg6bXXYH
 h0Jcmg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cc2eb7p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 01:57:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B91vgCk012972
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Dec 2024 01:57:42 GMT
Received: from [10.64.16.135] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 17:57:35 -0800
Message-ID: <5cdd9f7a-2c28-4ac2-a4da-304d25efbca3@quicinc.com>
Date: Mon, 9 Dec 2024 09:57:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/msm/dp: Add maximum width limitation for modes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, <quic_lliu6@quicinc.com>,
 <quic_fangez@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-6-09a4338d93ef@quicinc.com>
 <CAA8EJpprTGRTxO+9BC6GRwxE4A3CuvmySsxS2Nh4Tqj0nDRT_Q@mail.gmail.com>
 <95a78722-8266-4d5d-8d2f-e8efa1aa2e87@quicinc.com>
 <CAA8EJpo-1o9i4JhZgdbvRxvoYQE2v18Lz_8dVg=Za7a_pk5EDA@mail.gmail.com>
 <86b9a8be-8972-4c19-af0c-da6b3667cbf4@quicinc.com>
 <fb6enh3wzusadc6r7clg7n7ik2jsucimoi7dnecnsstcz4r6e6@dtahvlm522jj>
 <3e7660b3-934a-4b11-82a3-48137d63ea5d@quicinc.com>
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
In-Reply-To: <3e7660b3-934a-4b11-82a3-48137d63ea5d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Uka-izgVnq1gjnLi7O1BlO94c-l0rngb
X-Proofpoint-GUID: Uka-izgVnq1gjnLi7O1BlO94c-l0rngb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 mlxlogscore=710 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090014
X-Mailman-Approved-At: Mon, 09 Dec 2024 08:56:02 +0000
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



On 12/7/2024 4:13 AM, Abhinav Kumar wrote:
> 
> 
> On 12/3/2024 5:58 AM, Dmitry Baryshkov wrote:
>> On Tue, Dec 03, 2024 at 03:41:53PM +0800, Xiangxu Yin wrote:
>>>
>>>
>>> On 12/2/2024 5:32 PM, Dmitry Baryshkov wrote:
>>>> On Mon, 2 Dec 2024 at 11:05, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 11/29/2024 9:52 PM, Dmitry Baryshkov wrote:
>>>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>>>>
>>>>>>> Introduce a maximum width constraint for modes during validation. This
>>>>>>> ensures that the modes are filtered based on hardware capabilities,
>>>>>>> specifically addressing the line buffer limitations of individual pipes.
>>>>>>
>>>>>> This doesn't describe, why this is necessary. What does "buffer
>>>>>> limitations of individual pipes" mean?
>>>>>> If the platforms have hw capabilities like being unable to support 8k
>>>>>> or 10k, it should go to platform data
>>>>>>
>>>>> It's SSPP line buffer limitation for this platform and only support to 2160 mode width.
>>>>> Then, shall I add max_width config to struct msm_dp_desc in next patch? for other platform will set defualt value to ‘DP_MAX_WIDTH 7680'
>>>>
>>>> SSPP line buffer limitations are to be handled in the DPU driver. The
>>>> DP driver shouldn't care about those.
>>>>
>>> Ok, Will drop this part in next patch.
>>
>> If you drop it, what will be left from the patch itself?
>>
> 
> Yes agree with Dmitry, max_width is really not a DP related terminology.
> 
> This patch should be dropped.
> 
> So there were two issues, overall in this series causing this patch:
> 
> 1) In https://patchwork.freedesktop.org/patch/625822/, instead of using VIG_SDM845_MASK, we should be using VIG_SDM845_MASK_SDMA. Without that even 2k will not work, will leave a comment there.
> 
> 2) 4k will still fail. I dont think we can even support 4k on QCS615 but the modes should be filtered out because there is no 3dmux.
> 
> I have submitted https://patchwork.freedesktop.org/patch/627694/ to address this.
> 
> Xiangxu, please let me know if that works for you.
> 
> Thanks
> 
> Abhinav
Thanks for your patchsets,
After apply patch 625822 & 627694，mode filter works correctly on QCS615 platform with both 4k and 2k monitor.
work>>>>>>>
>>>>>>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/msm/dp/dp_display.c |  3 +++
>>>>>>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>>>>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 13 +++++++++++++
>>>>>>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>>>>>>>   4 files changed, 18 insertions(+)
>>>>
>>>>
>>>
>>

