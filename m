Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B4087F47D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 01:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671FA11203F;
	Tue, 19 Mar 2024 00:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PBt/wjDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480D910E54C;
 Tue, 19 Mar 2024 00:22:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42INjLbU012019; Tue, 19 Mar 2024 00:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=G/aAA5ozIcT9Ob/zkRgm058SquwWETRy4bCvoK2oWOg=; b=PB
 t/wjDaWqde4g/TwtIUq60PsdB0CLqkPz2chY94HLw9J+ebKtFZm/X7b3lV3VO/pw
 9nffsEQqUvHweTXtyTlgTK68tMODm5srC9Nybek4SsQ1HE78hymPC6IZP0KiuZzV
 8b/Rsd+qDmi87vBFfErjRS9EvG5N+waiEB/M5IF0GO2fEasIOXo3uac5H4/KMuEF
 mW+MpxfsMxXCOTspO8c1THo2E7Yx/9AorlfHI4vXi2CigVPDDXevNpurWljeF+hX
 hGz4k8Gzer9afvY/ThGocsXPSFsK6Qwi7B3FJMN/eJDG0Xh5BtkZ6j5+r30RTj85
 JbztZSTMLvMy4rXLDP/g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wxj331vre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 00:22:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42J0MdOl002186
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 00:22:39 GMT
Received: from [10.110.10.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 17:22:36 -0700
Message-ID: <12c50813-9d38-fdfc-cfba-594f0e5e7b10@quicinc.com>
Date: Mon, 18 Mar 2024 17:22:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Fix typo in static function (ststus =>
 status)
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Bjorn Andersson <quic_bjorande@quicinc.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid>
 <CAE-0n51baqN8cEubSqDegqDwL7O6=iEfN5Ho2OykqjmkjQDcvQ@mail.gmail.com>
 <CAD=FV=U+kD852eCOxeJ97_483FMCXBZn+eaPPyb2VrXiGm6V1g@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=U+kD852eCOxeJ97_483FMCXBZn+eaPPyb2VrXiGm6V1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jQ2qKC0CvI8e60dSEY7wkonogJ9-_5WZ
X-Proofpoint-GUID: jQ2qKC0CvI8e60dSEY7wkonogJ9-_5WZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_12,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190001
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



On 3/18/2024 12:37 PM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Mar 18, 2024 at 12:26 PM Stephen Boyd <swboyd@chromium.org> wrote:
>>
>> Quoting Douglas Anderson (2024-03-15 14:36:32)
>>> This is a no-op change to just fix a typo in the name of a static function.
>>>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>
>>> Changes in v2:
>>> - ("Fix typo in static function (ststus => status)") new for v2.
>>
>> This was sent at
>> https://lore.kernel.org/r/20240306193515.455388-1-quic_abhinavk@quicinc.com
> 
> Whoops! I guess we both noticed it at about the same time. My patch
> should be dropped then. The rest of my series (patches #1 - #3) are
> still relevant. I won't repost them since they can be applied just
> fine even if this patch is dropped.
> 
> -Doug

Thanks for the patch.

I will pick up 
https://lore.kernel.org/r/20240306193515.455388-1-quic_abhinavk@quicinc.com 
for -fixes so you can drop this one.
