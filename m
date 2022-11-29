Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C64163C771
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 19:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4922A10E172;
	Tue, 29 Nov 2022 18:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAFF88668;
 Tue, 29 Nov 2022 18:54:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ATIePIZ002479; Tue, 29 Nov 2022 18:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=s4GOV84U0sylHrzhQngpQK7RrY2sWDNBS5OaobzTXR4=;
 b=OxMcdqSijhmaVxHVzPNkaxNDYrlscfu0sHzFPIodZyvBbA+Q1cLGnk0Y/mV8632AKBCP
 jJVcl9+Mwvx+Q+OiFBCuS7tny1nOocJKlRimshjigMuAkP0MhqNxzaSXSctm8i7wFtXI
 weLZCk7zVKoMyBDRKwfSkimXVd1yN7HibEw5m6XdHj+xXJ3F5uTXKHvAoyMB2ADjub6Y
 bbn0O/0VVj1Wfr4z1RsvCuGXLUueOFItwE0kXj2Nij7wXBNxZugqLR3aOOagsDCEWyXT
 sgCgTcugvio5v6jFQBoxNwJ+IIIOnoqfpB5T8dhprDSRWYouXpPo1t3Ya4ULAvVZpEpE QQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m55m938rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 18:53:47 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2ATIrkbF008527
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Nov 2022 18:53:46 GMT
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 29 Nov
 2022 10:53:45 -0800
Message-ID: <6b8134c7-7ce2-5632-312c-af35395699d9@quicinc.com>
Date: Tue, 29 Nov 2022 10:53:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [Freedreno] [RFC PATCH 1/3] drm: Introduce color fill properties
 for drm plane
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
 <U3Koc0-B-7C7sbIpcRWokBHPOQdrQl7azJxAUWFJ4nmsk5nPf9NnUgBr9HOFUZ9YLJOKREN878fXv_BeIc15Kh_jVAFCFbYr8XfS3s0Os_M=@emersion.fr>
 <CA+hFU4wrDtSpU5owaNVP=8F3bQCnFCaJ7RmGOS0y4cooKQ5+CQ@mail.gmail.com>
 <20221109111857.36486d8d@eldfell>
 <0eb6155d-7b70-fc4b-97dd-7c5caea330ac@quicinc.com>
 <20221124105052.3cd10f50@eldfell>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20221124105052.3cd10f50@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8JZWF9yclzhjqyXG3dijV7FzGmhvA0FI
X-Proofpoint-GUID: 8JZWF9yclzhjqyXG3dijV7FzGmhvA0FI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_11,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211290107
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, daniel.vetter@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/24/2022 12:50 AM, Pekka Paalanen wrote:
> On Wed, 23 Nov 2022 15:27:04 -0800
> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> 
>> On 11/9/2022 1:18 AM, Pekka Paalanen wrote:
>>> On Tue, 8 Nov 2022 23:01:47 +0100
>>> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>>    
>>>> On Tue, Nov 8, 2022 at 7:51 PM Simon Ser <contact@emersion.fr> wrote:
>>>>>
>>>>> cc'ing Pekka and wayland-devel for userspace devs feedback on the new uAPI.
>>>
>>> Hi all,
>>>
>>> thanks! Comments below.
>>
>> Thanks for the feedback!
>>
>>>    
>>>>>
>>>>> On Saturday, October 29th, 2022 at 14:08, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>>>>>      
>>>>>> On 29/10/2022 01:59, Jessica Zhang wrote:
>>>>>>> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
>>>>>>> drm_plane. In addition, add support for setting and getting the values
>>>>>>> of these properties.
>>>>>>>
>>>>>>> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
>>>>>>> represents the format of the color fill. Userspace can set enable solid
>>>>>>> fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
>>>>>>> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
>>>>>>> framebuffer to NULL.
>>>>>>>
>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>
>>>>>> Planes report supported formats using the drm_mode_getplane(). You'd
>>>>>> also need to tell userspace, which formats are supported for color fill.
>>>>>> I don't think one supports e.g. YV12.
>>>>>>
>>>>>> A bit of generic comment for the discussion (this is an RFC anyway).
>>>>>> Using color_fill/color_fill_format properties sounds simple, but this
>>>>>> might be not generic enough. Limiting color_fill to 32 bits would
>>>>>> prevent anybody from using floating point formats (e.g.
>>>>>> DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with
>>>>>> e.g. using 64-bit for the color_fill value, but then this doesn't sound
>>>>>> extensible too much.
>>>>>>
>>>>>> So, a question for other hardware maintainers. Do we have hardware that
>>>>>> supports such 'color filled' planes? Do we want to support format
>>>>>> modifiers for filling color/data? Because what I have in mind is closer
>>>>>> to the blob structure, which can then be used for filling the plane:
>>>>>>
>>>>>> struct color_fill_blob {
>>>>>>        u32 pixel_format;
>>>>>>        u64 modifiers4];
>>>>>>        u32 pixel_data_size; // fixme: is this necessary?
>>>>>>        u8 pixel_data[];
>>>>>> };
>>>>>>
>>>>>> And then... This sounds a lot like a custom framebuffer.
>>>>>>
>>>>>> So, maybe what should we do instead is to add new DRM_MODE_FB_COLOR_FILL
>>>>>> flag to the framebuffers, which would e.g. mean that the FB gets stamped
>>>>>> all over the plane. This would also save us from changing if (!fb)
>>>>>> checks all over the drm core.
>>>>>>
>>>>>> Another approach might be using a format modifier instead of the FB flag.
>>>>>>
>>>>>> What do you think?
>>>>>
>>>>> First off, we only need to represent the value of a single pixel here. So I'm
>>>>> not quite following why we need format modifiers. Format modifiers describe how
>>>>> pixels are laid out in memory. Since there's a single pixel described, this
>>>>> is non-sensical to me, the format modifier is always LINEAR.
>>>
>>> Agreed.
>>>    
>>>>>
>>>>> Then, I can understand why putting the pixel_format in there is tempting to
>>>>> guarantee future extensibility, but it also adds complexity. For instance, how
>>>>> does user-space figure out which formats can be used for COLOR_FILL? Can
>>>>> user-space use any format supported by the plane? What does it mean for
>>>>> multi-planar formats? Do we really want the kernel to have conversion logic for
>>>>> all existing formats? Do we need to also add a new read-only blob prop to
>>>>> indicate supported COLOR_FILL formats?
>>
>> FWIW the formats supported by solid_fill wouldn't necessarily be all the
>> formats supported by the plane (ex. for msm/dpu, solid_fill only
>> supports all RGB color variants, though planes can normally support YUV
>> formats too).
>>
>> That being said, I'm ok with having the solid_fill take in only
>> RGBA32323232 format based on the comments below.
>>
>>>
>>> Right. This does not seem to require pixel formats at all.
>>>
>>> The point of pixel formats is to be able to feed large amounts of data
>>> as-is into hardware and avoid the CPU ever touching it. You do that
>>> with DRM FBs pointing to suitably allocated hardware buffers. But here
>>> we have exactly one pixel, which I imagine will always be read by the
>>> CPU so the driver will convert it into a hardware-specific format and
>>> program it; probably the driver will not create an internal DRM FB for
>>> it. >
>>> The above might also be a reason to not model this as a special-case
>>> DRM FB in UAPI. Or, at least you need a whole new ioctl to create such
>>> DRM FB to avoid the need to allocate e.g. a dumb buffer or a
>>> GPU-specific buffer. >
>>> What one does need is what Sebastian brought up: does it support alpha
>>> or not?
>> Hmm, the drm_plane struct already supports an alpha property so it seems
>> a bit redundant to also have a separate alpha value in the solid fill color.
> 
> Hi Jessica,
> 
> that's a good point! - Assuming that if hardware supports fill with
> alpha, it supports plane-alpha with real FBs as well.
> 
>> That being said, we could have it so that setting the alpha for the
>> solid_fill property will also change the value of the plane's alpha
>> property too.
> 
> No! Definitely not. That would be confusing.
> 
> One must not have properties that change the value of other
> non-immutable properties. It would become a real mess to handle in
> userspace and for backward compatibility. Just like the kernel must not
> spontaneously change the value of a non-immutable property. (Some
> mistakes exist already, and I think they cause userspace to need
> exceptional code for them.)

Ah, got it -- will have the value be RGB323232 instead.

> 
> 
>>>
>>> Userspace would also be interested in the supported precision of the
>>> values, but the hardware pixel component order is irrelevant because the
>>> driver will always convert the one pixel with CPU anyway.
>>>
>>> YUV vs. RGB is a another question. The KMS color pipeline is defined in
>>> terms of RGBA as far as I know, and alpha-blending YUV values makes no
>>> sense. So will there ever be any need to set an YUV fill? I have a hard
>>> time imagining it.
>>>
>>> If you do set an YUV fill, the KMS color pipeline most likely needs to
>>> convert it to RGBA for blending, and then you need the plane properties
>>> COLOR_ENCODING and COLOR_RANGE.
>>>
>>> But why bother when userspace can convert that one pixel to RGBA itself
>>> anyway?
>>
>> Noted, I think this is reasonable.
>>
>>>    
>>>>> We've recently-ish standardized a new Wayland protocol [1] which has the same
>>>>> purpose as this new kernel uAPI. The conclusion there was that using 32-bit
>>>>> values for each channel (R, G, B, A) would be enough for almost all use-cases.
>>>>> The driver can convert these high-precision values to what the hardware expects.
>>>>> The only concern was about sending values outside of the [0.0, 1.0] range,
>>>>> which may have HDR use-cases.
>>>
>>> This is what I would suggest, yes. This representation has enough
>>> precision to be future-proof, and the driver will be converting the
>>> value anyway.
>>>
>>> The question about values outside of the unit range is a good one, too.
>>> With Wayland, we can simply add another request to set a value in
>>> floating-point if that turns up necessary.
>>>
>>> Whether that will ever be necessary is connected to how the DRM KMS
>>> abstract color pipeline is modelled, and that you must define from the
>>> beginning:
>>>
>>> If DRM KMS gets color processing related plane properties like CTM,
>>> GAMMA or DEGAMMA (they already exist for CRTC, and these have been
>>> proposed for planes quite some time ago), does the fill color go
>>> through all these operations, or will the fill color skip all these
>>> operations and go straight to plane blending?
>>
>> The fill color would still go through color processing operations,
>> though FWIW the MSM driver doesn't support GAMMA/DEGAMMA.
> 
> That's ok. The important bit is to define what must happen *if* such
> plane properties are exposed by a driver. If they are not exposed, no
> problem.
> 
> Btw. I could easily expect disagreement between different hardware
> here, so I think this part will need many eyes to review.

Got it -- I'm not aware of any other HW outside of MSM devices that 
supports a similar color fill feature, but if there are any that have 
something similar I'm open to learning about how they've implemented 
this feature and adjusting accordingly.

> 
> If hardware is hard-wired to feed the fill color straight to blending,
> then if fill color UAPI is defined to go through per-plane color
> processing, the driver needs to apply that color processing on the CPU
> before programming the hardware.
> 
> If hardware allows processing the fill color through per-plane color
> processing, but fill color UAPI is defined to feed straight to blending,
> then the driver can simply ignore the per-plane color properties and
> program pass-through to the hardware.
> 
> For userspace, I think the choice makes little difference. Userspace
> can compensate for the choice the same way a driver would, except
> userspace can perhaps use more precise calculation methods. OTOH, if
> fill color is intended to match the color on a real FB on another
> plane, not going through the exact same computations might cause error.
> Whether that error is significant depends on the use case and is
> impossible to say here and now.
> 
> The important bit is to make that choice and document it.

Acked.

Thanks,

Jessica Zhang

> 
> ...
> 
>>>>> - Define a struct with a version and RGBA values:
>>>>>     struct color_fill_blob { u32 version; u32 rgba[4]; };
>>>>>     If we need to add more formats later, or new metadata:
>>>>>     struct color_fill_blob2 { u32 version; /* new fields */ };
>>>>>     where version must be set to 2.
>>>
>>> This could work.
>>
>> Leaning towards this option.
> 
> Yes, it seems the best to me too. Just rgb[3] rather than rgba[4],
> given the discussion about the plane alpha property. Or even u32 r;
> u32 g; u32 b; to avoid having to think about the index in code.
> 
> 
> Thanks,
> pq
> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>>    
>>>>> - Define a struct with a "pixel_format" prop, but force user-space to use a
>>>>>     fixed format for now. Later, if we need another format, add a new prop to
>>>>>     advertise supported formats.
>>>>> - More complicated solutions, e.g. advertise the list of supported formats from
>>>>>     the start.
>>>
>>> Feels more complicated than necessary.
>>>
>>> Anyway, the idea of creating a blob and then setting that into some KMS
>>> plane property sounds a very good mechanism.
>>>    
>>>>>
>>>>> [1]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/104
>>>>>      
>>>>
>>>> Agreeing with most of what you said here. However, what's the idea
>>>> behind a format anyway? The 4 values provided here are fed directly
>>>> into the color pipeline which seems to define the color channels it's
>>>> working on as RGBA (or doesn't define anything at all). The only
>>>> reason I can think of is that hardware might support only ingesting
>>>> values either in a format with high bit depth color channels and no
>>>> alpha or a format with low bit depth color but with alpha, so choosing
>>>> between the formats provides a real trade-off. Is that actually
>>>> something hardware might be restricted to or do they all just support
>>>> ingesting the color data with enough precision on every channel? >
>>> Right.
>>>
>>>
>>> Thanks,
>>> pq
> 
