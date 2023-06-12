Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFDE72CBEB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 18:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448CA10E09D;
	Mon, 12 Jun 2023 16:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4E410E09D;
 Mon, 12 Jun 2023 16:57:35 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35CFNWrT011234; Mon, 12 Jun 2023 16:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=K03AqMEA2iiPZtRfuOoDUx4SB+7ocncHRYhmLdyB6xo=;
 b=SYGe2rFCY+2D8IACkc+TeEkQAO13GpYchYMyP3QINm5vtDjMLLlX09P6IhjVj38fHHL7
 u8/SltOSegcea7+rxjO6jBm9R0a0XugHQXNz0R6lo6UACTpzCr07NenwFh7JWJYJ3Aev
 Pk2UiGE1AS3xppIejFl1huh8E34e8bul9ISRaWwwEjem/5rQLGIHlbuU1gOW1IuA8/8P
 BfAquMihitWA4UXLEtOQrvmEZDfarBTTxV3vLPrnDkisACJu2NOi0Gd+3HhdOtZnmJr7
 V2j9YODiLF2uq98dbj8DfTlVn4RlvUC7lebjSVkxfjx2sv94c3m1JB3TdcbsSLM6cvBP RA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r4ehtv2nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 16:57:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35CGv3Yh029048
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 16:57:03 GMT
Received: from [10.111.173.224] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 12 Jun
 2023 09:57:01 -0700
Message-ID: <f9428dd3-09fb-74b7-7ba0-4710e8b43229@quicinc.com>
Date: Mon, 12 Jun 2023 12:56:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <4341dac6-ada1-2a75-1c22-086d96408a85@quicinc.com>
 <84d5dad7-5e8e-ce92-d08e-4609970f6604@quicinc.com>
 <jerhZxCOWoQ2gv55pCK0JNVXMT_OY_j9KLewfG5me25cpqVzfOibpr4b9gZpjWPLQOaKWO2zD2KUI5mWge4mA74DmV1qmLB_LxsSRlKtvbk=@emersion.fr>
 <6f9598e5-09b4-738f-4d00-dfdaba1c91d0@quicinc.com>
 <20230612122135.40505458@eldfell>
From: Christopher Braga <quic_cbraga@quicinc.com>
In-Reply-To: <20230612122135.40505458@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: EfZd2NSNijNpOZ2idOePZTNYscaV8ycm
X-Proofpoint-ORIG-GUID: EfZd2NSNijNpOZ2idOePZTNYscaV8ycm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_06,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306120146
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
Cc: Aleix Pol <aleixpol@kde.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/12/2023 5:21 AM, Pekka Paalanen wrote:
> On Fri, 9 Jun 2023 19:11:25 -0400
> Christopher Braga <quic_cbraga@quicinc.com> wrote:
> 
>> On 6/9/2023 12:30 PM, Simon Ser wrote:
>>> Hi Christopher,
>>>
>>> On Friday, June 9th, 2023 at 17:52, Christopher Braga <quic_cbraga@quicinc.com> wrote:
>>>    
>>>>> The new COLOROP objects also expose a number of KMS properties. Each has a
>>>>> type, a reference to the next COLOROP object in the linked list, and other
>>>>> type-specific properties. Here is an example for a 1D LUT operation:
>>>>>
>>>>>        Color operation 42
>>>>>        ├─ "type": enum {Bypass, 1D curve} = 1D curve
>>>>>        ├─ "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HLG, …} = LUT
>>>> The options sRGB / PQ / BT.709 / HLG would select hard-coded 1D
>>>> curves? Will different hardware be allowed to expose a subset of these
>>>> enum values?
>>>
>>> Yes. Only hardcoded LUTs supported by the HW are exposed as enum entries.
>>>    
>>>>>        ├─ "lut_size": immutable range = 4096
>>>>>        ├─ "lut_data": blob
>>>>>        └─ "next": immutable color operation ID = 43
>>>>>   
>>>> Some hardware has per channel 1D LUT values, while others use the same
>>>> LUT for all channels.  We will definitely need to expose this in the
>>>> UAPI in some form.
>>>
>>> Hm, I was assuming per-channel 1D LUTs here, just like the existing GAMMA_LUT/
>>> DEGAMMA_LUT properties work. If some hardware can't support that, it'll need
>>> to get exposed as another color operation block.
>>>    
>>>>> To configure this hardware block, user-space can fill a KMS blob with
>>>>> 4096 u32
>>>>> entries, then set "lut_data" to the blob ID. Other color operation types
>>>>> might
>>>>> have different properties.
>>>>>   
>>>> The bit-depth of the LUT is an important piece of information we should
>>>> include by default. Are we assuming that the DRM driver will always
>>>> reduce the input values to the resolution supported by the pipeline?
>>>> This could result in differences between the hardware behavior
>>>> and the shader behavior.
>>>>
>>>> Additionally, some pipelines are floating point while others are fixed.
>>>> How would user space know if it needs to pack 32 bit integer values vs
>>>> 32 bit float values?
>>>
>>> Again, I'm deferring to the existing GAMMA_LUT/DEGAMMA_LUT. These use a common
>>> definition of LUT blob (u16 elements) and it's up to the driver to convert.
>>>
>>> Using a very precise format for the uAPI has the nice property of making the
>>> uAPI much simpler to use. User-space sends high precision data and it's up to
>>> drivers to map that to whatever the hardware accepts.
>>>   
>> Conversion from a larger uint type to a smaller type sounds low effort,
>> however if a block works in a floating point space things are going to
>> get messy really quickly. If the block operates in FP16 space and the
>> interface is 16 bits we are good, but going from 32 bits to FP16 (such
>> as in the matrix case or 3DLUT) is less than ideal.
> 
> Hi Christopher,
> 
> are you thinking of precision loss, or the overhead of conversion?
> 
> Conversion from N-bit fixed point to N-bit floating-point is generally
> lossy, too, and the other direction as well.
> 
> What exactly would be messy?
> 
Overheard of conversion is the primary concern here. Having to extract 
and / or calculate the significand + exponent components in the kernel 
is burdensome and imo a task better suited for user space. This also has 
to be done every blob set, meaning that if user space is re-using 
pre-calculated blobs we would be repeating the same conversion 
operations in kernel space unnecessarily.

I agree normalization of the value causing precision loss and rounding 
we can't avoid.

We should also consider the fact that float pipelines have been known to 
use the scrgb definition for floating point values 
(https://registry.khronos.org/EGL/extensions/EXT/EGL_EXT_gl_colorspace_scrgb_linear.txt). 
In cases like this where there may be a expected value range in the 
pipeline, how to normalize a larger input becomes a little confusing. Ex 
- Does U32 MAX become FP16 MAX or value MAX (i.e 127).

>>
>>> Exposing the actual hardware precision is something we've talked about during
>>> the hackfest. It'll probably be useful to some extent, but will require some
>>> discussion to figure out how to design the uAPI. Maybe a simple property is
>>> enough, maybe not (e.g. fully describing the precision of segmented LUTs would
>>> probably be trickier).
>>>
>>> I'd rather keep things simple for the first pass, we can always add more
>>> properties for bit depth etc later on.
>>>    
>> Indicating if a block operates on / with fixed vs float values is
>> significant enough that I think we should account for this in initial
>> design. It will have a affect on both the user space value packing +
>> expected value ranges in the hardware.
> 
> What do you mean by "value packing"? Memory layout of the bits forming
> a value? Or possible exact values of a specific type? >
Both really. If the kernel is provided a U32 value, we need to know if 
this is a U32 value, or a float packed into a U32 container. Likewise as 
mentioned with the scRGB above, float could even adjust the value range 
expectations.

> I don't think fixed vs. float is the most important thing. Even fixed
> point formats can have different numbers of bits for whole numbers,
> which changes the usable value range and not only precision. Userspace
> at the very least needs to know the usable value range for the block's
> inputs, outputs, and parameters.
> 
> When defining the precision for inputs, outputs and parameters, then
> fixed- vs. floating-point becomes meaningful in explaining what "N bits
> of precision" means.
> 
> Then there is the question of variable precision that depends on the
> actual block input and parameter values, how to represent that. Worst
> case precision might be too pessimistic alone.
> 
Agreed. More information probably is needed to full define the interface 
expectations.

>>>>> Here is another example with a 3D LUT:
>>>>>
>>>>>        Color operation 42
>>>>>        ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
>>>>>        ├─ "lut_size": immutable range = 33
>>>>>        ├─ "lut_data": blob
>>>>>        └─ "next": immutable color operation ID = 43
>>>>>   
>>>> We are going to need to expose the packing order here to avoid any
>>>> programming uncertainty. I don't think we can safely assume all hardware
>>>> is equivalent.
>>>
>>> The driver can easily change the layout of the matrix and do any conversion
>>> necessary when programming the hardware. We do need to document what layout is
>>> used in the uAPI for sure.
>>>    
>>>>> And one last example with a matrix:
>>>>>
>>>>>        Color operation 42
>>>>>        ├─ "type": enum {Bypass, Matrix} = Matrix
>>>>>        ├─ "matrix_data": blob
>>>>>        └─ "next": immutable color operation ID = 43
>>>>>   
>>>> It is unclear to me what the default sizing of this matrix is. Any
>>>> objections to exposing these details with an additional property?
>>>
>>> The existing CTM property uses 9 uint64 (S31.32) values. Is there a case where
>>> that wouldn't be enough?
>>
>> Larger cases do exist, but as you mention this can be resolved with a
>> different type then. I don't have any issues with the default 'Matrix'
>> type being 9 entries.
> 
> Please, tell us more. How big, and what are they used for?
> 
> IIRC ICC has 3x3 matrix + offset vector. Do you have even more?
> 
> 
Offset is one. Range adjustment 'vector' is another. But ultimately this 
proposal is flexible enough that this can probably just be another color 
block in the pipeline. No complaints from me here.

>>>    
>>>> Dithering logic exists in some pipelines. I think we need a plan to
>>>> expose that here as well.
>>>
>>> Hm, I'm not too familiar with dithering. Do you think it would make sense to
>>> expose as an additional colorop block? Do you think it would have more
>>> consequences on the design?
> 
> I think it would be an additional block, and no other consequences, be
> it temporal and/or spatial dithering, as long as it does not look at
> neighbouring pixels to determine the output for current pixel.
> 
>>>
>>> I want to re-iterate that we don't need to ship all features from day 1. We
>>> just need to come up with a uAPI design on which new features can be built on.
>>>    
>>
>> Agreed. I don't think this will affect the proposed design so this can
>> be figured out once we have a DRM driver impl that declares this block.
>>
>>>>> [Simon note: an alternative would be to split the color pipeline into
>>>>> two, by
>>>>> having two plane properties ("color_pipeline_pre_scale" and
>>>>> "color_pipeline_post_scale") instead of a single one. This would be
>>>>> similar to
>>>>> the way we want to split pre-blending and post-blending. This could be less
>>>>> expressive for drivers, there may be hardware where there are dependencies
>>>>> between the pre- and post-scaling pipeline?]
>>>>>   
>>>> As others have noted, breaking up the pipeline with immutable blocks
>>>> makes the most sense to me here. This way we don't have to predict ahead
>>>> of time every type of block that maybe affected by pipeline ordering.
>>>> Splitting the pipeline into two properties now means future
>>>> logical splits would require introduction of further plane properties.
>>>
>>> Right, if there are more "breaking points", then we'll need immutable blocks
>>> anyways.
>>>    
>>>>> Then, Alex from NVIDIA described how their hardware works. NVIDIA hardware
>>>>> contains some fixed-function blocks which convert from LMS to ICtCp and
>>>>> cannot
>>>>> be disabled/bypassed. NVIDIA hardware has been designed for descriptive
>>>>> APIs
>>>>> where user-space provides a high-level description of the colorspace
>>>>> conversions it needs to perform, and this is at odds with our KMS uAPI
>>>>> proposal. To address this issue, we suggest adding a special block type
>>>>> which
>>>>> describes a fixed conversion from one colorspace to another and cannot be
>>>>> configured by user-space. Then user-space will need to accomodate its
>>>>> pipeline
>>>>> for these special blocks. Such fixed hardware blocks need to be well enough
>>>>> documented so that they can be implemented via shaders.
>>>>>   
>>>> A few questions here. What is the current plan for documenting the
>>>> mathematical model for each exposed block? Will each defined 'type' enum
>>>> value be locked to a definition in the kernel documents? As an example,
>>>> when we say '3D LUT' in this proposal does this mean the block will
>>>> expose a tri-linear interpolated 3D LUT interface? Is '1D Curve' a
>>>> direct in to out LUT mapping?
>>>
>>> I think we'll want to document these things, yes. We do want to give _some_
>>> slack to drivers, so that they can e.g. implement the "1D LUT" colorop via
>>> hardware segmented LUTs with a different number of elements per LUT segment.
>>> But being mathematically precise (probably with formulae in the docs) is
>>> definitely a goal, and absolutely necessary to implement a shader-based
>>> fallback.
>>
>> I agree some driver slack is necessary, however ideally this will be
>> locked down enough that from the compositor side they see "1D LUT" and
>> know exactly what to expect independent of the hardware. This way
>> regardless of if I am running on a NVIDIA / AMD / QCOM / etc... chip,
>> common color pipeline strategies can be used. Assuming a perfect world
>> where there is a workable overlap between chips of course.
> 
> Yes, of course, at least for a start.
> 
> However, the long term plan includes a shared userspace library with
> driver- and hardware-specific knowledge to use hardware- and
> driver-specific blocks. All blocks still need to be explicitly
> specified in the kernel UAPI documentation, the idea is that it should
> not be a problem for many vendors to have blocks no-one else does. The
> library would offer a much more generic API, and use snowflake blocks
> to their fullest. The library would also spit out OpenGL shaders and
> whatnot for the fallback.
> 
> The future in the long term could be either way: evolving towards
> generic KMS UAPI blocks with no need for a userspace library
> abstraction, or evolving towards hardware-specific KMS UAPI blocks with
> a userspace library to abstract them like Mesa does for GPUs.
> 
Sounds good to me!

Thanks,
Christopher

> 
> Thanks,
> pq
> 
>> Anyways, this isn't something we need to hammer down right this moment.
>>
>> Regards,
>> Christopher
>>>    
>>>> Overall I am a fan of this proposal though. The prescriptive color
>>>> pipeline UAPI is simple and easy to follow.
>>>
>>> Thank you for the comments! Let me know if you disagree with some of the above,
>>> or if my answers are unclear.
> 
