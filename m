Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F82962391B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 02:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AE310E646;
	Thu, 10 Nov 2022 01:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D443910E646;
 Thu, 10 Nov 2022 01:44:47 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AA0WjW0015498; Thu, 10 Nov 2022 01:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OdLE+TuxhRZtAUF+DVlWvnXLX0aWwsGqekatk5qNFpo=;
 b=eGALCP4T6iqtlx4uRSOhFZMBRLzM4rDWasd5w3dN6EY4fAQTWWjJlrXHMJz+6r8h6EDb
 FaeKYC6zmVY/Hq8dNlNGdm3jUngPxxy+YMgUlvr7jE/Cny1ktDZxzM72UaV2oPsPA7Xe
 nJddz4V4Vu07mpZyuZx+kih7F5PRVZ8F5CvkboLYKJV2KMaest4fMfdAefYSc2zMwEHO
 8PUdvCdRCQZjTNPXio0UZrq/2gbh7vHK2Fq/L4RbZCeaNNIJvB0bBUN1fgs6aebIpolV
 shCusRM68CtyKaRhr7Lk11M0T/SBJfb9p6Id839Fw94cX3P8tahgFrHcs3vDJzGKjUBr VA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kqugbbx9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 01:44:40 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AA1ich7008279
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 01:44:38 GMT
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 9 Nov 2022
 17:44:38 -0800
Message-ID: <1f291321-1319-f6d8-b2cb-85ddbe970766@quicinc.com>
Date: Wed, 9 Nov 2022 17:44:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
 <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
 <Y2uwjKCN4KGzm3aN@phenom.ffwll.local>
 <ee755c43-434a-a990-0efa-ed5c6baa237e@linaro.org>
 <Y2uyOcVbadRwr9/O@phenom.ffwll.local>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <Y2uyOcVbadRwr9/O@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: g36m7ROXu3t7PPwc0PyEZ9tfpCOqEndQ
X-Proofpoint-ORIG-GUID: g36m7ROXu3t7PPwc0PyEZ9tfpCOqEndQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211100010
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
Cc: quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/9/2022 5:59 AM, Daniel Vetter wrote:
> On Wed, Nov 09, 2022 at 04:53:45PM +0300, Dmitry Baryshkov wrote:
>> On 09/11/2022 16:52, Daniel Vetter wrote:
>>> On Tue, Nov 08, 2022 at 06:25:29PM +0000, Simon Ser wrote:
>>>> On Saturday, October 29th, 2022 at 13:23, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>>> On 29/10/2022 01:59, Jessica Zhang wrote:
>>>>>
>>>>>> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
>>>>>> drm_plane. In addition, add support for setting and getting the values
>>>>>> of these properties.
>>>>>>
>>>>>> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
>>>>>> represents the format of the color fill. Userspace can set enable solid
>>>>>> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
>>>>>> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
>>>>>> framebuffer to NULL.
>>>>>
>>>>> I suppose that COLOR_FILL should override framebuffer rather than
>>>>> requiring that FB is set to NULL. In other words, if color_filL_format
>>>>> is non-zero, it would make sense to ignore the FB. Then one can use the
>>>>> color_fill_format property to quickly switch between filled plane and
>>>>> FB-backed one.
>>>>
>>>> That would be inconsistent with the rest of the KMS uAPI. For instance,
>>>> the kernel will error out if CRTC has active=0 but a connector is still
>>>> linked to the CRTC. IOW, the current uAPI errors out if the KMS state
>>>> is inconsistent.
>>>
>>> So if the use-case here really is to solid-fill a plane (and not just
>>> provide a background color for the crtc overall), then I guess we could
>>> also extend addfb to make that happen. We've talked in the past about
>>> propertery-fying framebuffer objects, and that would sort out this uapi
>>> wart. And I agree the color fill vs PLANE_ID issue is a bit ugly at least.
>>>
>>> But if the use-cases are all background color then just doing the crtc
>>> background color would be tons simpler (and likely also easier to support
>>> for more hardware).
>>
>> No. The hardware supports multiple color-filled planes, which do not have to
>> cover the whole CRTC.
> 
> The use case here means the userspace use-case. What the hw can do on any
> given chip kinda doesnt matter, which is why I'm asking. KMD uapi is not
> meant to reflect 100% exactly what a specific chip can do, but instead:
> - provide features userspace actually needs. If you want per-plane fill,
>    you need userspace that makes use of per-plane fill, and if all you have
>    is crtc background, then that's it.

Hey Daniel,

The userspace use case we're trying to support is the Android HWC 
SOLID_FILL hint here [1], which is specifying per-plane fill.

Thanks,

Jessica Zhang

[1] 
https://android.googlesource.com/platform/hardware/interfaces/+/refs/heads/master/graphics/composer/aidl/android/hardware/graphics/composer3/Composition.aidl#52

> - we should create uapi with an eye towards what's actually possible on a
>    reasonable set of drivers and hw. Sometimes that means a slightly more
>    restricted set so that it's possible to implement in more places,
>    especially if that restricted feature set still gets the job done for
>    userspace.
> 
> Cheers, Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
