Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B20761409E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 23:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B610910E1EF;
	Mon, 31 Oct 2022 22:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CF710E1E3;
 Mon, 31 Oct 2022 22:25:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29VM8CVE014359; Mon, 31 Oct 2022 22:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IR7FzdmzIqnEo5WsvgBdjRd448w0ofvspNgjh/SFt2Y=;
 b=eZgffo42r4QdBVZS8ibIWpG/aBtODkbxK1xK7uZsg6FrkagZvaEMRiZ9fxH7zX7/yrSc
 gmM5zJU7b+SmZSnTKsD2a2e10ZYEJucGF3Fk8WmZ2Ym9cPqUx2l+nskySD4Rj3BgihSE
 R+kftObEIsl6/wmo4YCuRgQj5dErDIIJkYenRnw7ozKs3PGiqcgGyYIrNXJyCrRm5s6W
 SlHYC1tS7UJTSBPTZ3Cl1LdNA8Q4j5A0SPdpl85Gj09pxMBQx3CESQSoYLeqKWuY9+jM
 +h3+Ff0eDUWh5jydTybX7jDFHZkBqXdoQl0vFxzHUj50lwjARWisBvgPbAmdC169ATBe HQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kjmq4r93x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 22:24:50 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29VMOnw5030819
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Oct 2022 22:24:49 GMT
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 31 Oct
 2022 15:24:49 -0700
Message-ID: <b890681d-9c40-32c6-061a-668dce01d89d@quicinc.com>
Date: Mon, 31 Oct 2022 15:24:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8KJk-5FOWRDePgF5_eMp7ujbO5GY2AJ_
X-Proofpoint-ORIG-GUID: 8KJk-5FOWRDePgF5_eMp7ujbO5GY2AJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_21,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=803 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310138
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/29/2022 5:08 AM, Dmitry Baryshkov wrote:
> On 29/10/2022 01:59, Jessica Zhang wrote:
>> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
>> drm_plane. In addition, add support for setting and getting the values
>> of these properties.
>>
>> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
>> represents the format of the color fill. Userspace can set enable solid
>> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
>> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
>> framebuffer to NULL.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com> >
> Planes report supported formats using the drm_mode_getplane(). You'd 
> also need to tell userspace, which formats are supported for color fill. 
> I don't think one supports e.g. YV12.

Hey Dmitry,

Good point. Forgot to add this in the patch [3/3] commit message, but 
FWIW MSM DPU devices only support the RGB format variants [1].

[1] 
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c#L697

> 
> A bit of generic comment for the discussion (this is an RFC anyway). 
> Using color_fill/color_fill_format properties sounds simple, but this 
> might be not generic enough. Limiting color_fill to 32 bits would 
> prevent anybody from using floating point formats (e.g. 
> DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with 
> e.g. using 64-bit for the color_fill value, but then this doesn't sound 
> extensible too much.

Hm... I can definitely change color_fill to use u64 instead. As for 
making it more extensible, do you have any suggestions?

> 
> So, a question for other hardware maintainers. Do we have hardware that 
> supports such 'color filled' planes? Do we want to support format 
> modifiers for filling color/data? Because what I have in mind is closer 
> to the blob structure, which can then be used for filling the plane:
> 
> struct color_fill_blob {
>      u32 pixel_format;
>      u64 modifiers4];
>      u32 pixel_data_size; // fixme: is this necessary?
>      u8 pixel_data[];
> };

Just a question about this blob struct -- what is the purpose of pixel_data?

At least for devices using the DPU driver, the only data needed to 
enable solid fill is color_fill and color_fill_format. I'd also be 
interested in knowing if there are other drivers support a similar 
feature and what is needed for them.

> 
> And then... This sounds a lot like a custom framebuffer.
> 
> So, maybe what should we do instead is to add new DRM_MODE_FB_COLOR_FILL 
> flag to the framebuffers, which would e.g. mean that the FB gets stamped 
> all over the plane. This would also save us from changing if (!fb) 
> checks all over the drm core.

JFYI we did originally consider using a custom 1x1 FB to for color fill 
[1], but decided to go with a plane property instead. IIRC the 
conclusion was that having color fill as a plane property is a cleaner 
solution.

As for creating a new blob struct to hold all color fill info, I'm open 
to implementing that over having 2 separate properties.

[1] https://oftc.irclog.whitequark.org/dri-devel/2022-09-23#31409842

> 
> Another approach might be using a format modifier instead of the FB flag.
I like the idea of having a format modifier denoting if the driver 
supports color_fill for that specific format. This would allow userspace 
to know which formats are supported by solid fill planes.

Thanks,

Jessica Zhang

> 
> What do you think?
> 
> -- 
> With best wishes
> Dmitry
> 
