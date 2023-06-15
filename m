Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7007321DF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 23:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A6010E552;
	Thu, 15 Jun 2023 21:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A680510E050;
 Thu, 15 Jun 2023 21:45:17 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35FLe5Gm003608; Thu, 15 Jun 2023 21:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XlQK32qBclGRzKNC9imKrQEAFU1lTeT5bQOQse+IhKs=;
 b=HuJATdhkHaFhK0SZx+Fz0+S8xi33ihuXwzQbzGQ90ISbwUqZi7pHq1WvO6oWJv3gBsIa
 Rn/jUyK5lWeOATmuXD5veCgaOy6Z8BpNoqrLT1I/IkMqXUWWujn87+zHivUWNhv1d4zx
 Pwaf5by5ZYNCaLCZ2uuMrg7mER+Tf+eFejLO9zbpVF3xCz9rjBSen47atgp33/gQ1XqN
 VgSiwutI79BPXlzPVY9HhJJPstl3lQU9Smld0kpvPhdGVtod6r0IxSzpbpV72Z8/5Q4F
 192EYflMXUqmquv3DzSo4XbKD2I15qi/6FIzVlkjxtUzGBGiJ9lESN/zTo41bp5jLUhG Kg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r83p990s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 21:44:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35FLiaM9019935
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 21:44:36 GMT
Received: from [10.231.6.120] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 15 Jun
 2023 14:44:34 -0700
Message-ID: <baa70725-89ba-2e92-c5ce-7619fbea26d2@quicinc.com>
Date: Thu, 15 Jun 2023 17:44:33 -0400
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
 <f9428dd3-09fb-74b7-7ba0-4710e8b43229@quicinc.com>
 <20230613112312.755ef58f@eldfell>
 <d132c9e0-d3e2-77e5-bcd6-1aef657b935f@quicinc.com>
 <20230614120006.03284f7e@eldfell>
From: Christopher Braga <quic_cbraga@quicinc.com>
In-Reply-To: <20230614120006.03284f7e@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xBbMtVKHCQJQUxBCCcb87BQI4O4APKw_
X-Proofpoint-GUID: xBbMtVKHCQJQUxBCCcb87BQI4O4APKw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150187
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



On 6/14/2023 5:00 AM, Pekka Paalanen wrote:
> On Tue, 13 Jun 2023 12:29:55 -0400
> Christopher Braga <quic_cbraga@quicinc.com> wrote:
> 
>> On 6/13/2023 4:23 AM, Pekka Paalanen wrote:
>>> On Mon, 12 Jun 2023 12:56:57 -0400
>>> Christopher Braga <quic_cbraga@quicinc.com> wrote:
>>>    
>>>> On 6/12/2023 5:21 AM, Pekka Paalanen wrote:
>>>>> On Fri, 9 Jun 2023 19:11:25 -0400
>>>>> Christopher Braga <quic_cbraga@quicinc.com> wrote:
>>>>>       
>>>>>> On 6/9/2023 12:30 PM, Simon Ser wrote:
>>>>>>> Hi Christopher,
>>>>>>>
>>>>>>> On Friday, June 9th, 2023 at 17:52, Christopher Braga <quic_cbraga@quicinc.com> wrote:
>>>>>>>          
>>>>>>>>> The new COLOROP objects also expose a number of KMS properties. Each has a
>>>>>>>>> type, a reference to the next COLOROP object in the linked list, and other
>>>>>>>>> type-specific properties. Here is an example for a 1D LUT operation:
>>>>>>>>>
>>>>>>>>>          Color operation 42
>>>>>>>>>          ├─ "type": enum {Bypass, 1D curve} = 1D curve
>>>>>>>>>          ├─ "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HLG, …} = LUT
>>>>>>>> The options sRGB / PQ / BT.709 / HLG would select hard-coded 1D
>>>>>>>> curves? Will different hardware be allowed to expose a subset of these
>>>>>>>> enum values?
>>>>>>>
>>>>>>> Yes. Only hardcoded LUTs supported by the HW are exposed as enum entries.
>>>>>>>          
>>>>>>>>>          ├─ "lut_size": immutable range = 4096
>>>>>>>>>          ├─ "lut_data": blob
>>>>>>>>>          └─ "next": immutable color operation ID = 43
>>>>>>>>>         
>>>>>>>> Some hardware has per channel 1D LUT values, while others use the same
>>>>>>>> LUT for all channels.  We will definitely need to expose this in the
>>>>>>>> UAPI in some form.
>>>>>>>
>>>>>>> Hm, I was assuming per-channel 1D LUTs here, just like the existing GAMMA_LUT/
>>>>>>> DEGAMMA_LUT properties work. If some hardware can't support that, it'll need
>>>>>>> to get exposed as another color operation block.
>>>>>>>          
>>>>>>>>> To configure this hardware block, user-space can fill a KMS blob with
>>>>>>>>> 4096 u32
>>>>>>>>> entries, then set "lut_data" to the blob ID. Other color operation types
>>>>>>>>> might
>>>>>>>>> have different properties.
>>>>>>>>>         
>>>>>>>> The bit-depth of the LUT is an important piece of information we should
>>>>>>>> include by default. Are we assuming that the DRM driver will always
>>>>>>>> reduce the input values to the resolution supported by the pipeline?
>>>>>>>> This could result in differences between the hardware behavior
>>>>>>>> and the shader behavior.
>>>>>>>>
>>>>>>>> Additionally, some pipelines are floating point while others are fixed.
>>>>>>>> How would user space know if it needs to pack 32 bit integer values vs
>>>>>>>> 32 bit float values?
>>>>>>>
>>>>>>> Again, I'm deferring to the existing GAMMA_LUT/DEGAMMA_LUT. These use a common
>>>>>>> definition of LUT blob (u16 elements) and it's up to the driver to convert.
>>>>>>>
>>>>>>> Using a very precise format for the uAPI has the nice property of making the
>>>>>>> uAPI much simpler to use. User-space sends high precision data and it's up to
>>>>>>> drivers to map that to whatever the hardware accepts.
>>>>>>>         
>>>>>> Conversion from a larger uint type to a smaller type sounds low effort,
>>>>>> however if a block works in a floating point space things are going to
>>>>>> get messy really quickly. If the block operates in FP16 space and the
>>>>>> interface is 16 bits we are good, but going from 32 bits to FP16 (such
>>>>>> as in the matrix case or 3DLUT) is less than ideal.
>>>>>
>>>>> Hi Christopher,
>>>>>
>>>>> are you thinking of precision loss, or the overhead of conversion?
>>>>>
>>>>> Conversion from N-bit fixed point to N-bit floating-point is generally
>>>>> lossy, too, and the other direction as well.
>>>>>
>>>>> What exactly would be messy?
>>>>>       
>>>> Overheard of conversion is the primary concern here. Having to extract
>>>> and / or calculate the significand + exponent components in the kernel
>>>> is burdensome and imo a task better suited for user space. This also has
>>>> to be done every blob set, meaning that if user space is re-using
>>>> pre-calculated blobs we would be repeating the same conversion
>>>> operations in kernel space unnecessarily.
>>>
>>> What is burdensome in that calculation? I don't think you would need to
>>> use any actual floating-point instructions. Logarithm for finding the
>>> exponent is about finding the highest bit set in an integer and
>>> everything is conveniently expressed in base-2. Finding significand is
>>> just masking the integer based on the exponent.
>>>    
>> Oh it definitely can be done, but I think this is just a difference of
>> opinion at this point. At the end of the day we will do it if we have
>> to, but it is just more optimal if a more agreeable common type is used.
>>
>>> Can you not cache the converted data, keyed by the DRM blob unique
>>> identity vs. the KMS property it is attached to?
>> If the userspace compositor has N common transforms (ex: standard P3 ->
>> sRGB matrix), they would likely have N unique blobs. Obviously from the
>> kernel end we wouldn't want to cache the transform of every blob passed
>> down through the UAPI.
> 
> Hi Christoper,
> 
> as long as the blob exists, why not?

Generally because this is an unbounded amount of blobs. I'm not 100% 
sure what the typical behavior is upstream, but in our driver we have 
scenarios where we can have per-frame blob updates (unique per-frame blobs).

Speaking of per-frame blob updates, there is one concern I neglected to 
bring up. Internally we have seen scenarios where frequent blob 
allocation can lead to memory allocation delays of two frames or higher. 
This typically was seen when the system is under high memory usage and 
the blob allocation is > 1 page. The patch 
https://patchwork.freedesktop.org/patch/525857/ was uploaded a few 
months back to help mitigate these delays, but it didn't gain traction 
at the time.

This color pipeline UAPI is ultimately going to have the same problem. 
Frequent 3DLUT color block updates will result in large allocations, and 
if there is high system memory usage this could see blob allocation 
delays. So two things here:
- Let's reconsider https://patchwork.freedesktop.org/patch/525857/ so 
frequent blob allocation doesn't get unnecessarily delayed
- Do we have any alternative methods at our disposal for sending down 
the color configuration data? Generally blobs work fine for low update 
or blob cycling use cases, but frequent blob data updates results in a 
total per frame IOCTL sequence of:
   (IOCTL_BLOB_DESTROY * #_of_blob_updates) +		
     (IOCTL_BLOB_CREATE * #_of_blob_updates) + IOCTL_DRM_ATOMIC

Thanks,
Christopher

> 
>>> You can assume that userspace will not be re-creating DRM blobs without
>>> a reason to believe the contents have changed. If the same blob is set
>>> on the same property repeatedly, I would definitely not expect a driver
>>> to convert the data again.
>> If the blob ID is unchanged there is no issue since caching the last
>> result is already common. As you say, blobs are immutable so no update
>> is needed. I'd question why the compositor keeps trying to send down the
>> same blob ID though.
> 
> To avoid hard-to-debug situations with userspace vs. kernel view of KMS
> state getting out of sync by a bug, for example. I did originally write
> such KMS state caching in Weston to avoid emitting unchanged state, but
> that was deemed unnecessary as the kernel side needs to do the same
> comparisons "anyway".
> 
>>> If a driver does that, it seems like it
>>> should be easy to avoid, though I'm no kernel dev. Even if the
>>> conversion was just a memcpy, I would still posit it needs to be
>>> avoided when the data has obviously not changed. Blobs are immutable.
>>>   > Userspace having to use hardware-specific number formats would probably
>>> not be well received.
>>>    
>> To be clear, I am not asking user space to use custom value packing made
>> purely for the hardware's benefit (this sounds like a problem just
>> waiting to happen). Just support in the color pipeline UAPI for common
>> numerical data types such as 16-bit floats. That said...
> 
> I wonder if there actually is a significant difference between
> converting float<->float and int<->float if everything else is equally
> fine.
> 
> It's possible that requirements on range and precision do
> call for both types in UAPI, then we obviously need both.
> 
>>>> I agree normalization of the value causing precision loss and rounding
>>>> we can't avoid.
>>>>
>>>> We should also consider the fact that float pipelines have been known to
>>>> use the scrgb definition for floating point values
>>>> (https://registry.khronos.org/EGL/extensions/EXT/EGL_EXT_gl_colorspace_scrgb_linear.txt).
>>>
>>> scRGB is as good a definition of color encoding as "floating-point" is
>>> for numbers. What I mean is that it carries very little usable meaning,
>>> and without further information it is practically boundless
>>> - infinite - in both color gamut and dynamic range. Just like any
>>> floating-point quantity.
>>>
>>> However, what we want from KMS color pipeline is zero implied or
>>> defined meaning. That means scRGB carries too much meaning, because the
>>> primaries are fixed and (1.0, 1.0, 1.0) should match sRGB/SDR white.
>>>   > Btw. if one brings in nit units, you assume a specific viewing
>>> environment which is rarely true in reality. I'll leave that rabbit
>>> hole for another time. I just want to mention that nit (cd/m²) is a
>>> unit that is relative to the chosen viewing environment when your goal
>>> is a specific perception of brightness.
>>>    
>>>> In cases like this where there may be a expected value range in the
>>>> pipeline, how to normalize a larger input becomes a little confusing. Ex
>>>> - Does U32 MAX become FP16 MAX or value MAX (i.e 127).
>>>
>>> UAPI simply needs to specify the number encoding used in the UAPI, how
>>> bit patterns map to real numbers. Real numbers are then what the color
>>> pipeline operates on.
>>>    
>> If we plan to have the color pipeline UAPI expose these details then I
>> am satisfied.
> 
> Very good. I do not see how else it could even work.
> 
> 
> Thanks,
> pq
> 
> 
>>> However, intermediate value representation used between two KMS colorop
>>> blocks is never observable to userspace. All userspace needs to know is
>>> the usable value range and precision behaviour. I think that is best
>>> defined for the input and output of each block rather than what flows
>>> in between, because an optional (e.g. LUT) block when bypassed does not
>>> impose its limitations.
>>>    
>> Sure. Everything in between can be inferred from the pipeline.
>>
>>> What does 1.0 actually mean, that is left for userspace to use however
>>> it wishes. There are only pipeline boundary conditions to that: the
>>> input to a pipeline comes from a DRM FB, so it has a number encoding
>>> specified mostly by pixel format, and an arbitrary colorimetric
>>> encoding that only userspace knows. The output of the pipeline has to
>>> be standardised so that drivers can number-encode the pipeline output
>>> correctly to wire format on e.g. HDMI. Userspace alone is responsible
>>> for making sure the colorimetry matches what the sink expects.
>>>
>>> Individual KMS color pipeline colorop blocks need to define their own
>>> acceptable input and output ranges. E.g. a look-up table may assume
>>> that it's input is in [0.0, 1.0] and anything outside is clamped to
>>> that range. That poses restrictions on how userspace can use the block.
>>>    
>>>>>>      
>>>>>>> Exposing the actual hardware precision is something we've talked about during
>>>>>>> the hackfest. It'll probably be useful to some extent, but will require some
>>>>>>> discussion to figure out how to design the uAPI. Maybe a simple property is
>>>>>>> enough, maybe not (e.g. fully describing the precision of segmented LUTs would
>>>>>>> probably be trickier).
>>>>>>>
>>>>>>> I'd rather keep things simple for the first pass, we can always add more
>>>>>>> properties for bit depth etc later on.
>>>>>>>          
>>>>>> Indicating if a block operates on / with fixed vs float values is
>>>>>> significant enough that I think we should account for this in initial
>>>>>> design. It will have a affect on both the user space value packing +
>>>>>> expected value ranges in the hardware.
>>>>>
>>>>> What do you mean by "value packing"? Memory layout of the bits forming
>>>>> a value? Or possible exact values of a specific type? >
>>>> Both really. If the kernel is provided a U32 value, we need to know if
>>>> this is a U32 value, or a float packed into a U32 container. Likewise as
>>>> mentioned with the scRGB above, float could even adjust the value range
>>>> expectations.
>>>
>>> Right. The UAPI will simply define that.
>>>    
>> Great!
>>
>> Thanks,
>> Christopher
>>
>>>>> I don't think fixed vs. float is the most important thing. Even fixed
>>>>> point formats can have different numbers of bits for whole numbers,
>>>>> which changes the usable value range and not only precision. Userspace
>>>>> at the very least needs to know the usable value range for the block's
>>>>> inputs, outputs, and parameters.
>>>>>
>>>>> When defining the precision for inputs, outputs and parameters, then
>>>>> fixed- vs. floating-point becomes meaningful in explaining what "N bits
>>>>> of precision" means.
>>>>>
>>>>> Then there is the question of variable precision that depends on the
>>>>> actual block input and parameter values, how to represent that. Worst
>>>>> case precision might be too pessimistic alone.
>>>>>       
>>>> Agreed. More information probably is needed to full define the interface
>>>> expectations.
>>>>   
>>>>>>>>> Here is another example with a 3D LUT:
>>>>>>>>>
>>>>>>>>>          Color operation 42
>>>>>>>>>          ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
>>>>>>>>>          ├─ "lut_size": immutable range = 33
>>>>>>>>>          ├─ "lut_data": blob
>>>>>>>>>          └─ "next": immutable color operation ID = 43
>>>>>>>>>         
>>>>>>>> We are going to need to expose the packing order here to avoid any
>>>>>>>> programming uncertainty. I don't think we can safely assume all hardware
>>>>>>>> is equivalent.
>>>>>>>
>>>>>>> The driver can easily change the layout of the matrix and do any conversion
>>>>>>> necessary when programming the hardware. We do need to document what layout is
>>>>>>> used in the uAPI for sure.
>>>>>>>          
>>>>>>>>> And one last example with a matrix:
>>>>>>>>>
>>>>>>>>>          Color operation 42
>>>>>>>>>          ├─ "type": enum {Bypass, Matrix} = Matrix
>>>>>>>>>          ├─ "matrix_data": blob
>>>>>>>>>          └─ "next": immutable color operation ID = 43
>>>>>>>>>         
>>>>>>>> It is unclear to me what the default sizing of this matrix is. Any
>>>>>>>> objections to exposing these details with an additional property?
>>>>>>>
>>>>>>> The existing CTM property uses 9 uint64 (S31.32) values. Is there a case where
>>>>>>> that wouldn't be enough?
>>>>>>
>>>>>> Larger cases do exist, but as you mention this can be resolved with a
>>>>>> different type then. I don't have any issues with the default 'Matrix'
>>>>>> type being 9 entries.
>>>>>
>>>>> Please, tell us more. How big, and what are they used for?
>>>>>
>>>>> IIRC ICC has 3x3 matrix + offset vector. Do you have even more?
>>>>>
>>>>>       
>>>> Offset is one. Range adjustment 'vector' is another. But ultimately this
>>>> proposal is flexible enough that this can probably just be another color
>>>> block in the pipeline. No complaints from me here.
>>>
>>> What is a range adjustment vector? A vector of a multiplier per color
>>> channel? Does it include offset?
>>>
>>> Yes, sounds like just another block.
>>>    
>>>>>>>          
>>>>>>>> Dithering logic exists in some pipelines. I think we need a plan to
>>>>>>>> expose that here as well.
>>>>>>>
>>>>>>> Hm, I'm not too familiar with dithering. Do you think it would make sense to
>>>>>>> expose as an additional colorop block? Do you think it would have more
>>>>>>> consequences on the design?
>>>>>
>>>>> I think it would be an additional block, and no other consequences, be
>>>>> it temporal and/or spatial dithering, as long as it does not look at
>>>>> neighbouring pixels to determine the output for current pixel.
>>>>>       
>>>>>>>
>>>>>>> I want to re-iterate that we don't need to ship all features from day 1. We
>>>>>>> just need to come up with a uAPI design on which new features can be built on.
>>>>>>>          
>>>>>>
>>>>>> Agreed. I don't think this will affect the proposed design so this can
>>>>>> be figured out once we have a DRM driver impl that declares this block.
>>>>>>      
>>>>>>>>> [Simon note: an alternative would be to split the color pipeline into
>>>>>>>>> two, by
>>>>>>>>> having two plane properties ("color_pipeline_pre_scale" and
>>>>>>>>> "color_pipeline_post_scale") instead of a single one. This would be
>>>>>>>>> similar to
>>>>>>>>> the way we want to split pre-blending and post-blending. This could be less
>>>>>>>>> expressive for drivers, there may be hardware where there are dependencies
>>>>>>>>> between the pre- and post-scaling pipeline?]
>>>>>>>>>         
>>>>>>>> As others have noted, breaking up the pipeline with immutable blocks
>>>>>>>> makes the most sense to me here. This way we don't have to predict ahead
>>>>>>>> of time every type of block that maybe affected by pipeline ordering.
>>>>>>>> Splitting the pipeline into two properties now means future
>>>>>>>> logical splits would require introduction of further plane properties.
>>>>>>>
>>>>>>> Right, if there are more "breaking points", then we'll need immutable blocks
>>>>>>> anyways.
>>>>>>>          
>>>>>>>>> Then, Alex from NVIDIA described how their hardware works. NVIDIA hardware
>>>>>>>>> contains some fixed-function blocks which convert from LMS to ICtCp and
>>>>>>>>> cannot
>>>>>>>>> be disabled/bypassed. NVIDIA hardware has been designed for descriptive
>>>>>>>>> APIs
>>>>>>>>> where user-space provides a high-level description of the colorspace
>>>>>>>>> conversions it needs to perform, and this is at odds with our KMS uAPI
>>>>>>>>> proposal. To address this issue, we suggest adding a special block type
>>>>>>>>> which
>>>>>>>>> describes a fixed conversion from one colorspace to another and cannot be
>>>>>>>>> configured by user-space. Then user-space will need to accomodate its
>>>>>>>>> pipeline
>>>>>>>>> for these special blocks. Such fixed hardware blocks need to be well enough
>>>>>>>>> documented so that they can be implemented via shaders.
>>>>>>>>>         
>>>>>>>> A few questions here. What is the current plan for documenting the
>>>>>>>> mathematical model for each exposed block? Will each defined 'type' enum
>>>>>>>> value be locked to a definition in the kernel documents? As an example,
>>>>>>>> when we say '3D LUT' in this proposal does this mean the block will
>>>>>>>> expose a tri-linear interpolated 3D LUT interface? Is '1D Curve' a
>>>>>>>> direct in to out LUT mapping?
>>>>>>>
>>>>>>> I think we'll want to document these things, yes. We do want to give _some_
>>>>>>> slack to drivers, so that they can e.g. implement the "1D LUT" colorop via
>>>>>>> hardware segmented LUTs with a different number of elements per LUT segment.
>>>>>>> But being mathematically precise (probably with formulae in the docs) is
>>>>>>> definitely a goal, and absolutely necessary to implement a shader-based
>>>>>>> fallback.
>>>>>>
>>>>>> I agree some driver slack is necessary, however ideally this will be
>>>>>> locked down enough that from the compositor side they see "1D LUT" and
>>>>>> know exactly what to expect independent of the hardware. This way
>>>>>> regardless of if I am running on a NVIDIA / AMD / QCOM / etc... chip,
>>>>>> common color pipeline strategies can be used. Assuming a perfect world
>>>>>> where there is a workable overlap between chips of course.
>>>>>
>>>>> Yes, of course, at least for a start.
>>>>>
>>>>> However, the long term plan includes a shared userspace library with
>>>>> driver- and hardware-specific knowledge to use hardware- and
>>>>> driver-specific blocks. All blocks still need to be explicitly
>>>>> specified in the kernel UAPI documentation, the idea is that it should
>>>>> not be a problem for many vendors to have blocks no-one else does. The
>>>>> library would offer a much more generic API, and use snowflake blocks
>>>>> to their fullest. The library would also spit out OpenGL shaders and
>>>>> whatnot for the fallback.
>>>>>
>>>>> The future in the long term could be either way: evolving towards
>>>>> generic KMS UAPI blocks with no need for a userspace library
>>>>> abstraction, or evolving towards hardware-specific KMS UAPI blocks with
>>>>> a userspace library to abstract them like Mesa does for GPUs.
>>>>>       
>>>> Sounds good to me!
>>>
>>> Awesome!
>>>
>>>
>>> Thanks,
>>> pq
> 
