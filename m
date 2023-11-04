Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B617D7E11C8
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 00:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E620810E0F1;
	Sat,  4 Nov 2023 23:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403AA10E0F1;
 Sat,  4 Nov 2023 23:02:29 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A4N1L9U003639; Sat, 4 Nov 2023 23:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hr7PrimpbxN5fGh5cleqwGpUXOeGwdqWLI2UbjtPIOU=;
 b=CizXCauPPNiPO6Vxxxnq+8XWXfT+2TVLWtyc8hBrcYq82kQWDNvPXAyiSX/P6NG0qCA0
 miKNgeAMey1gmye5TaiRIt8ZQSB2pFPXb0xNSvlY01vXrASdK5Bfqh3nyNqUBydEA7AG
 zeEvneHAHdmH/R2czC1V0TrPhem28P5qm58vlJ2RuNjDYfsCmrZnWgli+xw6wu0CrLtp
 BeTxYhUql7l+gquQQog5uXwy0NuLhrSPzaQiE4Wd89Mokiigp7pHH8c2RTTy9ffUmiGI
 TZK+PlRCE40jdUT5RqE5fmz2hRzplLCN86caaOCWxcw/gVsWYZ3vgOPFUePYrcbZe2Fe AA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u5eg8h7gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 04 Nov 2023 23:02:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A4N1xRl003138
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 4 Nov 2023 23:01:59 GMT
Received: from [10.110.97.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Sat, 4 Nov
 2023 16:01:56 -0700
Message-ID: <7aa2519b-4eac-4378-8d9c-9180428ef0b2@quicinc.com>
Date: Sat, 4 Nov 2023 19:01:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: Alex Goins <agoins@nvidia.com>, Sebastian Wick <sebastian.wick@redhat.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell> <20231026173003.GA319477@toolbox>
 <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
Content-Language: en-US
From: Christopher Braga <quic_cbraga@quicinc.com>
In-Reply-To: <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ArYCAbSOceHZEevD4rf7enVKVWiSsHjw
X-Proofpoint-ORIG-GUID: ArYCAbSOceHZEevD4rf7enVKVWiSsHjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-04_19,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311040198
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
Cc: Aleix Pol <aleixpol@kde.org>, Sasha McIntosh <sashamcintosh@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Shashank
 Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Hector Martin <marcan@marcan.st>, Liviu
 Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, Naseer
 Ahmed <quic_naseer@quicinc.com>, Uma Shankar <uma.shankar@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just want to loop back to before we branched off deeper into the 
programming performance talk

On 10/26/2023 3:25 PM, Alex Goins wrote:
> On Thu, 26 Oct 2023, Sebastian Wick wrote:
> 
>> On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote:
>>> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
>>> Alex Goins <agoins@nvidia.com> wrote:
>>>
>>>> Thank you Harry and all other contributors for your work on this. Responses
>>>> inline -
>>>>
>>>> On Mon, 23 Oct 2023, Pekka Paalanen wrote:
>>>>
>>>>> On Fri, 20 Oct 2023 11:23:28 -0400
>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>>
>>>>>> On 2023-10-20 10:57, Pekka Paalanen wrote:
>>>>>>> On Fri, 20 Oct 2023 16:22:56 +0200
>>>>>>> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>>>>>>
>>>>>>>> Thanks for continuing to work on this!
>>>>>>>>
>>>>>>>> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:
>>>>>>>>> v2:
>>>>>>>>>   - Update colorop visualizations to match reality (Sebastian, Alex Hung)
>>>>>>>>>   - Updated wording (Pekka)
>>>>>>>>>   - Change BYPASS wording to make it non-mandatory (Sebastian)
>>>>>>>>>   - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
>>>>>>>>>     section (Pekka)
>>>>>>>>>   - Use PQ EOTF instead of its inverse in Pipeline Programming example (Melissa)
>>>>>>>>>   - Add "Driver Implementer's Guide" section (Pekka)
>>>>>>>>>   - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)
>>>>>>>
>>>>>>> ...
>>>>>>>
>>>>>>>>> +An example of a drm_colorop object might look like one of these::
>>>>>>>>> +
>>>>>>>>> +    /* 1D enumerated curve */
>>>>>>>>> +    Color operation 42
>>>>>>>>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D enumerated curve
>>>>>>>>> +    ├─ "BYPASS": bool {true, false}
>>>>>>>>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ inverse EOTF, …}
>>>>>>>>> +    └─ "NEXT": immutable color operation ID = 43
>>>>
>>>> I know these are just examples, but I would also like to suggest the possibility
>>>> of an "identity" CURVE_1D_TYPE. BYPASS = true might get different results
>>>> compared to setting an identity in some cases depending on the hardware. See
>>>> below for more on this, RE: implicit format conversions.
>>>>
>>>> Although NVIDIA hardware doesn't use a ROM for enumerated curves, it came up in
>>>> offline discussions that it would nonetheless be helpful to expose enumerated
>>>> curves in order to hide the vendor-specific complexities of programming
>>>> segmented LUTs from clients. In that case, we would simply refer to the
>>>> enumerated curve when calculating/choosing segmented LUT entries.
>>>
>>> That's a good idea.
>>>
>>>> Another thing that came up in offline discussions is that we could use multiple
>>>> color operations to program a single operation in hardware. As I understand it,
>>>> AMD has a ROM-defined LUT, followed by a custom 4K entry LUT, followed by an
>>>> "HDR Multiplier". On NVIDIA we don't have these as separate hardware stages, but
>>>> we could combine them into a singular LUT in software, such that you can combine
>>>> e.g. segmented PQ EOTF with night light. One caveat is that you will lose
>>>> precision from the custom LUT where it overlaps with the linear section of the
>>>> enumerated curve, but that is unavoidable and shouldn't be an issue in most
>>>> use-cases.
>>>
>>> Indeed.
>>>
>>>> Actually, the current examples in the proposal don't include a multiplier color
>>>> op, which might be useful. For AMD as above, but also for NVIDIA as the
>>>> following issue arises:
>>>>
>>>> As discussed further below, the NVIDIA "degamma" LUT performs an implicit fixed

If possible, let's declare this as two blocks. One that informatively 
declares the conversion is present, and another for the de-gamma. This 
will help with block-reuse between vendors.

>>>> point to FP16 conversion. In that conversion, what fixed point 0xFFFFFFFF maps
>>>> to in floating point varies depending on the source content. If it's SDR
>>>> content, we want the max value in FP16 to be 1.0 (80 nits), subject to a
>>>> potential boost multiplier if we want SDR content to be brighter. If it's HDR PQ
>>>> content, we want the max value in FP16 to be 125.0 (10,000 nits). My assumption
>>>> is that this is also what AMD's "HDR Multiplier" stage is used for, is that
>>>> correct?
>>>
>>> It would be against the UAPI design principles to tag content as HDR or
>>> SDR. What you can do instead is to expose a colorop with a multiplier of
>>> 1.0 or 125.0 to match your hardware behaviour, then tell your hardware
>>> that the input is SDR or HDR to get the expected multiplier. You will
>>> never know what the content actually is, anyway.
> 
> Right, I didn't mean to suggest that we should tag content as HDR or SDR in the
> UAPI, just relating to the end result in the pipe, ultimately it would be
> determined by the multiplier color op.
> 

A multiplier could work but we would should give OEMs the option to 
either make it "informative" and fixed by the hardware, or fully 
configurable. With the Qualcomm pipeline how we absorb FP16 pixel 
buffers, as well as how we convert them to fixed point data actually has 
a dependency on the desired de-gamma and gamma processing. So for an 
example:

If a source pixel buffer is scRGB encoded FP16 content we would expect 
input pixel content to be up to 7.5, with the IGC output reaching 125 as 
in the NVIDIA case. Likewise gamma 2.2 encoded FP16 content would be 0-1 
in and 0-1 out.

So in the Qualcomm case the expectations are fixed depending on the use 
case.

It is sounding to me like we would need to be able to declare three 
things here:
1. Value range expectations *into* the de-gamma block. A multiplier 
wouldn't work here because it would be more of a clipping operation. I 
guess we would have to add an explicit clamping block as well.
2. What the value range expectations  at the *output* of de-gamma 
processing block. Also covered by using another multiplier block.
3. Value range expectations *into* a gamma processing block. This should 
be covered by declaring a multiplier post-csc, but only assuming CSC 
output is normalized in the desired value range. A clamping block would 
be preferable because it describes what happens when it isn't.

All this is do-able, but it seems like it would require the definition 
of multiple color pipelines to expose the different limitations for 
color block configuration combinations. Additionally, would it be easy 
for user space to find the right pipeline?

>>>
>>> Of course, if we want to have a arbitrary multiplier colorop that is
>>> somewhat standard, as in, exposed by many drivers to ease userspace
>>> development, you can certainly use any combination of your hardware
>>> features you need to realize the UAPI prescribed mathematical operation.
>>>
>>> Since we are talking about floating-point in hardware, a multiplier
>>> does not significantly affect precision.
>>>
>>> In order to mathematically define all colorops, I believe it is
>>> necessary to define all colorops in terms of floating-point values (as
>>> in math), even if they operate on fixed-point or integer. By this I
>>> mean that if the input is 8 bpc unsigned integer pixel format for
>>> instance, 0 raw pixel channel value is mapped to 0.0 and 255 is mapped
>>> to 1.0, and the color pipeline starts with [0.0, 1.0], not [0, 255]
>>> domain. We have to agree on this mapping for all channels on all pixel
>>> formats. However, there is a "but" further below.
> 
> I think this makes sense insofar as how we interact with the UAPI, and that's
> basically how fixed point works for us anyway. However, relating to your "but",
> it doesn't avoid the issue with hardware expectations about pixel formats since
> it doesn't change the underlying pixel format.
> 
>>>
>>> I also propose that quantization range is NOT considered in the raw
>>> value mapping, so that we can handle quantization range in colorops
>>> explicitly, allowing us to e.g. handle sub-blacks and super-whites when
>>> necessary. (These are currently impossible to represent in the legacy
>>> color properties, because everything is converted to full range and
>>> clipped before any color operations.)
>>>
>>>>  From the given enumerated curves, it's not clear how they would map to the
>>>> above. Should sRGB EOTF have a max FP16 value of 1.0, and the PQ EOTF a max FP16
>>>> value of 125.0? That may work, but it tends towards the "descriptive" notion of
>>>> assuming the source content, which may not be accurate in all cases. This is
>>>> also an issue for the custom 1D LUT, as the blob will need to be converted to
>>>> FP16 in order to populate our "degamma" LUT. What should the resulting max FP16
>>>> value be, given that we no longer have any hint as to the source content?
>>>
>>> In my opinion, all finite non-negative transfer functions should
>>> operate with [0.0, 1.0] domain and [0.0, 1.0] range, and that includes
>>> all sRGB, power 2.2, and PQ curves.
> 
> Right, I think so too, otherwise you are making assumptions about the source
> content. For example, it's possible to do HDR with a basic gamma curve, so you
> can't really assume that gamma should always go up to 1.0, but PQ up to 125.0.
> If you did that, it would necessitate adding an "HDR Gamma" curve, which is
> converging back on a "descriptive" UAPI. By leaving the final range up to the
> subsequent multiplier, the client gets to choose independently from the TF,
> which seems more in line with the goals of this proposal.
>  >>>
>>> If we look at BT.2100, there is no such encoding even mentioned where
>>> 125.0 would correspond to 10k cd/m². That 125.0 convention already has
>>> a built-in assumption what the color spaces are and what the conversion
>>> is aiming to do. IOW, I would say that choice is opinionated from the
>>> start. The multiplier in BT.2100 is always 10000.
> 
> Be that as it may, the convention of FP16 125.0 corresponding to 10k nits is
> baked in our hardware, so it's unavoidable at least for NVIDIA pipelines.
>  >>>
>>> Given that elements like various kinds of look-up tables inherently
>>> assume that the domain is [0.0, 1.0] (because the it is a table that
>>> has a beginning and an end, and the usual convention is that the
>>> beginning is zero and the end is one), I think it is best to stick to
>>> the [0.0, 1.0] range where possible. If we go out of that range, then
>>> we have to define how a LUT would apply in a sensible way.
> 
> In my last reply I mentioned a static (but actually programmable) LUT that is
> typically used to convert FP16 linear pixels to fixed point PQ before handing
> them to the scaler and tone mapping operator. You're actually right that it
> indexes in the fixed point [0.0, 1.0] range for the reasons you describe, but
> because the input pixels are expected to be FP16 in the [0.0, 125.0] range, it
> applies a non-programmable 1/125.0 normalization factor first.
> 
> In this case, you could think of the LUT as indexing on [0.0, 125.0], but as you
> point out there would need to be some way to describe that. Maybe we actually
> need a fractional multiplier / divider color op. NVIDIA pipes that include this
> LUT would need to include a mandatory 1/125.0 factor immediately prior to the
> LUT, then LUT can continue assuming a range of [0.0, 1.0].
> 
> Assuming you are using the hardware in a conventional way, specifying a
> multiplier of 1.0 after the "degamma" LUT would then map to the 80-nit PQ range
> after the static (but actually programmable) PQ LUT, whereas specifying a
> multiplier of 125.0 would map to the 10,000-nit PQ range, which is what we want.
> I guess it's kind of messy, but the effect would be that color ops other than
> multipliers/dividers would still be in the [0.0, 1.0] domain, and any multiplier
> that exceeds that range would have to be normalized by a divider before any
> other color op.
> 

Hmm. A multiplier would resolve issues when input linear FP16 data that 
has different ideas on what 1.0 means in regards to nits values (think 
of Apple's EDR as an example). For a client to go from their definition 
to hardware definition of 1.0 = x nits, we would need to expose what the 
pipeline sees as 1.0 though. So in this case the multiplier would be 
programmable, but the divisor is informational? It seems like the later 
would have an influence on how the former is programmed.

>>>
>>> Many TFs are intended to be defined only on [0.0, 1.0] -> [0.0, 1.0].
>>> Some curves, like power 2.2, have a mathematical form that naturally
>>> extends outside of that range. Power 2.2 generalizes to >1.0 input
>>> values as is, but not for negative input values. If needed for negative
>>> input values, it is common to use y = -TF(-x) for x < 0 mirroring.
>>>
>>> scRGB is the prime example that intentionally uses negative channel
>>> values. We can also have negative channel values with limited
>>> quantization range, sometimes even intentionally (xvYCC chroma, or
>>> PLUGE test sub-blacks). Out-of-unit-range values can also appear as a
>>> side-effect of signal processing, and they should not get clipped
>>> prematurely. This is a challenge for colorops that fundamentally cannot
>>> handle out-of-unit-range values.
>>>
>>> There are various workarounds. scRGB colorimetry can be converted into
>>> BT.2020 primaries for example, to avoid saturation induced negative
>>> values. Limited quantization range signal could be processed as-is,
>>> meaning that the limited range is mapped to [16.0/255, 235.0/255]
>>> instead of [0.0, 1.0] or so. But then, we have a complication with
>>> transfer functions.
>>>
>>>> I think a multiplier color op solves all of these issues. Named curves and
>>>> custom 1D LUTs would by default assume a max FP16 value of 1.0, which would then
>>>> be adjusted by the multiplier.
>>>
>>> Pretty much.
>>>
>>>> For 80 nit SDR content, set it to 1, for 400
>>>> nit SDR content, set it to 5, for HDR PQ content, set it to 125, etc.
>>>
>>> That I think is a another story.
>>>
>>>>>>>>> +
>>>>>>>>> +    /* custom 4k entry 1D LUT */
>>>>>>>>> +    Color operation 52
>>>>>>>>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D LUT
>>>>>>>>> +    ├─ "BYPASS": bool {true, false}
>>>>>>>>> +    ├─ "LUT_1D_SIZE": immutable range = 4096
>>>>>>>>> +    ├─ "LUT_1D": blob
>>>>>>>>> +    └─ "NEXT": immutable color operation ID = 0
>>>>>>>
>>>>>>> ...
>>>>>>>
>>>>>>>>> +Driver Forward/Backward Compatibility
>>>>>>>>> +=====================================
>>>>>>>>> +
>>>>>>>>> +As this is uAPI drivers can't regress color pipelines that have been
>>>>>>>>> +introduced for a given HW generation. New HW generations are free to
>>>>>>>>> +abandon color pipelines advertised for previous generations.
>>>>>>>>> +Nevertheless, it can be beneficial to carry support for existing color
>>>>>>>>> +pipelines forward as those will likely already have support in DRM
>>>>>>>>> +clients.
>>>>>>>>> +
>>>>>>>>> +Introducing new colorops to a pipeline is fine, as long as they can be
>>>>>>>>> +disabled or are purely informational. DRM clients implementing support
>>>>>>>>> +for the pipeline can always skip unknown properties as long as they can
>>>>>>>>> +be confident that doing so will not cause unexpected results.
>>>>>>>>> +
>>>>>>>>> +If a new colorop doesn't fall into one of the above categories
>>>>>>>>> +(bypassable or informational) the modified pipeline would be unusable
>>>>>>>>> +for user space. In this case a new pipeline should be defined.
>>>>>>>>
>>>>>>>> How can user space detect an informational element? Should we just add a
>>>>>>>> BYPASS property to informational elements, make it read only and set to
>>>>>>>> true maybe? Or something more descriptive?
>>>>>>>
>>>>>>> Read-only BYPASS set to true would be fine by me, I guess.
>>>>>>>
>>>>>>
>>>>>> Don't you mean set to false? An informational element will always do
>>>>>> something, so it can't be bypassed.
>>>>>
>>>>> Yeah, this is why we need a definition. I understand "informational" to
>>>>> not change pixel values in any way. Previously I had some weird idea
>>>>> that scaling doesn't alter color, but of course it may.
>>>>
>>>> On recent hardware, the NVIDIA pre-blending pipeline includes LUTs that do
>>>> implicit fixed-point to FP16 conversions, and vice versa.
>>>
>>> Above, I claimed that the UAPI should be defined in nominal
>>> floating-point values, but I wonder, would that work? Would we need to
>>> have explicit colorops for converting from raw pixel data values into
>>> nominal floating-point in the UAPI?
> 
> Yeah, I think something like that is needed, or another solution as discussed
> below. Even if we define the UAPI in terms of floating point, the actual
> underlying pixel format needs to match the expectations of each stage as it
> flows through the pipe.
> 

Strongly agree on this. Pixel format and block relationships definitely 
exist.

>>>
>>>> For example, the "degamma" LUT towards the beginning of the pipeline implicitly
>>>> converts from fixed point to FP16, and some of the following operations expect
>>>> to operate in FP16. As such, if you have a fixed point input and don't bypass
>>>> those following operations, you *must not* bypass the LUT, even if you are
>>>> otherwise just programming it with the identity. Conversely, if you have a
>>>> floating point input, you *must* bypass the LUT.
>>>
>>> Interesting. Since the color pipeline is not(?) meant to replace pixel
>>> format definitions which already make the difference between fixed and
>>> floating point, wouldn't this little detail need to be taken care of by
>>> the driver under the hood?
> 
> We could take care of it under the hood in the case where the pixel format is
> fixed point but the "degamma" LUT is bypassed, simply by programming it with the
> identity to allow for the conversion to take place. But when the pixel format is
> FP16 and the "degamma" LUT is *not* bypassed, we would need to either ignore the
> LUT (bad) or fail the atomic commit. That's why we need some way to communicate
> the restriction to the client, otherwise they are left guessing why the atomic
> commit failed.
> 
>>>
>>> What if I want to use degamma colorop with a floating-point
>>> framebuffer? Simply not possible on this hardware?
> 
> Right, it's not possible. The "degamma" LUT always does an implicit conversion
> from fixed point to FP16, so if the pixel format is already FP16 it isn't
> usable. However, the aforementioned static (actually programmable) LUT that
> follows the "degamma" LUT expects FP16 pixels, so you could still use that to do
> some kind of transformation. That's actually a good example of a novel use that
> justifies compositors being able to program it.
> 
>>>
>>>> Could informational elements and allowing the exclusion of the BYPASS property
>>>> be used to convey this information to the client?  For example, we could expose
>>>> one pipeline with the LUT exposed with read-only BYPASS set to false, and
>>>> sandwich it with informational "Fixed Point" and "FP16" elements to accommodate
>>>> fixed point input. Then, expose another pipeline with the LUT missing, and an
>>>> informational "FP16" element in its place to accommodate floating point input.
>>>>
>>>> That's just an example; we also have other operations in the pipeline that do
>>>> similar implicit conversions. In these cases we don't want the operations to be
>>>> bypassed individually, so instead we would expose them as mandatory in some
>>>> pipelines and missing in others, with informational elements to help inform the
>>>> client of which to choose. Is that acceptable under the current proposal?
>>>>
>>>> Note that in this case, the information just has to do with what format the
>>>> pixels should be in, it doesn't correspond to any specific operation. So, I'm
>>>> not sure that BYPASS has any meaning for informational elements in this context.
>>>
>>> Very good questions. Do we have to expose those conversions in the UAPI
>>> to make things work for this hardware? Meaning that we cannot assume all
>>> colorops work in nominal floating-point from userspace perspective
>>> (perhaps with varying degrees of precision).
>>
>> I had this in my original proposal I think (maybe I only thought about
>> it, not sure).
>>
>> We really should figure this one out. Can we get away with normalized
>> [0,1] fp as a user space abstraction or not?
> 
> I think the conversion needs to be exposed at least just the one time at the
> beginning alongside the "degamma" LUT, since the choice is influenced an outside
> factor (the input pixel format). There are subsequent intermediate conversions
> as well, but that's only an issue if we allow the relevant color ops to be
> bypassed individually. If we expose a multitude of pipes where the relevant ops
> are either missing or mandatory in unison, we can avoid mismatched pixel formats
> while maintaining the illusion of a pipe that operates entirely in floating
> point.
> 
> Or, pipes could just have explicit associated input pixel format(s). The above
> technique of exposing multiple pipes instead of bypassing color ops individually
> would still work, and clients would just have to choose a pipe that matches the
> input pixel format. That way, the actual color ops themselves could still be
> defined in terms of normalized [0.0, 1.0] floating point (multipliers/dividers
> excepted), and clients can continue thinking in terms of that after making the
> initial selection.
> 
>>
>>>
>>>>>>> I think we also need a definition of "informational".
>>>>>>>
>>>>>>> Counter-example 1: a colorop that represents a non-configurable
>>>>>>
>>>>>> Not sure what's "counter" for these examples?
>>>>>>
>>>>>>> YUV<->RGB conversion. Maybe it determines its operation from FB pixel
>>>>>>> format. It cannot be set to bypass, it cannot be configured, and it
>>>>>>> will alter color values.
>>>>
>>>> Would it be reasonable to expose this is a 3x4 matrix with a read-only blob and
>>>> no BYPASS property? I already brought up a similar idea at the XDC HDR Workshop
>>>> based on the principle that read-only blobs could be used to express some static
>>>> pipeline elements without the need to define a new type, but got mixed opinions.
>>>> I think this demonstrates the principle further, as clients could detect this
>>>> programmatically instead of having to special-case the informational element.
>>>
>>
>> I'm all for exposing fixed color ops but I suspect that most of those
>> follow some standard and in those cases instead of exposing the matrix
>> values one should prefer to expose a named matrix (e.g. BT.601, BT.709,
>> BT.2020).
>>
>> As a general rule: always expose the highest level description. Going
>> from a name to exact values is trivial, going from values to a name is
>> much harder.
> 
> Good point. It would need to be a conversion between any two defined color
> spaces e.g. BT.709-to-BT.2020, hence why it's much harder to go backwards.
> 

A small advantage of providing name + values (or just blob ID) is that 
if the compositor needs to make a GPU shader that matches the hardware 
they could refer to the matrix values from the driver instead of having 
their own copy of what the standard says the conversion should be.

>>> If the blob depends on the pixel format (i.e. the driver automatically
>>> chooses a different blob per pixel format), then I think we would need
>>> to expose all the blobs and how they correspond to pixel formats.
>>> Otherwise ok, I guess.
>>>
>>> However, do we want or need to make a color pipeline or colorop
>>> conditional on pixel formats? For example, if you use a YUV 4:2:0 type
>>> of pixel format, then you must use this pipeline and not any other. Or
>>> floating-point type of pixel format. I did not anticipate this before,
>>> I assumed that all color pipelines and colorops are independent of the
>>> framebuffer pixel format. A specific colorop might have a property that
>>> needs to agree with the framebuffer pixel format, but I didn't expect
>>> further limitations.
>>
>> We could simply fail commits when the pipeline and pixel format don't
>> work together. We'll probably need some kind of ingress no-op node
>> anyway and maybe could list pixel formats there if required to make it
>> easier to find a working configuration.
> 
> Yeah, we could, but having to figure that out through trial and error would be
> unfortunate. Per above, it might be easiest to just tag pipelines with a pixel
> format instead of trying to include the pixel format conversion as a color op.
> 

I definitely think this is going to be needed. That said, this also 
means that compositors that don't know how to configure this pipeline 
might not be able to use the format.

If we take the FP16 example again, there may be able to be some sort of 
default programming to allow the hardware to absorb the content, but 
avoiding clipping of the content couldn't be guaranteed. We would end up 
having a functional pipeline, but the output result could end up being 
less than ideal. It really will depend on how the input content is packed.

>>> "Without the need to define a new type" is something I think we need to
>>> consider case by case. I have a hard time giving a general opinion.
>>>
>>>>>>>
>>>>>>> Counter-example 2: image size scaling colorop. It might not be
>>>>>>> configurable, it is controlled by the plane CRTC_* and SRC_*
>>>>>>> properties. You still need to understand what it does, so you can
>>>>>>> arrange the scaling to work correctly. (Do not want to scale an image
>>>>>>> with PQ-encoded values as Josh demonstrated in XDC.)
>>>>>>>
>>>>>>
>>>>>> IMO the position of the scaling operation is the thing that's important
>>>>>> here as the color pipeline won't define scaling properties.
>>>>
>>>> I agree that blending should ideally be done in linear space, and I remember
>>>> that from Josh's presentation at XDC, but I don't recall the same being said for
>>>> scaling. In fact, the NVIDIA pre-blending scaler exists in a stage of the
>>>> pipeline that is meant to be in PQ space (more on this below), and that was
>>>> found to achieve better results at HDR/SDR boundaries. Of course, this only
>>>> bolsters the argument that it would be helpful to have an informational "scaler"
>>>> element to understand at which stage scaling takes place.
>>>
>>> Both blending and scaling are fundamentally the same operation: you
>>> have two or more source colors (pixels), and you want to compute a
>>> weighted average of them following what happens in nature, that is,
>>> physics, as that is what humans are used to.
>>>
>>> Both blending and scaling will suffer from the same problems if the
>>> operation is performed on not light-linear values. The result of the
>>> weighted average does not correspond to physics.
>>>
>>> The problem may be hard to observe with natural imagery, but Josh's
>>> example shows it very clearly. Maybe that effect is sometimes useful
>>> for some imagery in some use cases, but it is still an accidental
>>> side-effect. You might get even better results if you don't rely on
>>> accidental side-effects but design a separate operation for the exact
>>> goal you have.
>>>
>>> Mind, by scaling we mean changing image size. Not scaling color values.
>>>
> 
> Fair enough, but it might not always be a choice given the hardware.
> 

Agreeing with Alex here. I get there is some debate over the best way to 
do this, but I think it is best to leave it up to the driver to declare 
how that is done.

>>>>>>> Counter-example 3: image sampling colorop. Averages FB originated color
>>>>>>> values to produce a color sample. Again do not want to do this with
>>>>>>> PQ-encoded values.
>>>>>>>
>>>>>>
>>>>>> Wouldn't this only happen during a scaling op?
>>>>>
>>>>> There is certainly some overlap between examples 2 and 3. IIRC SRC_X/Y
>>>>> coordinates can be fractional, which makes nearest vs. bilinear
>>>>> sampling have a difference even if there is no scaling.
>>>>>
>>>>> There is also the question of chroma siting with sub-sampled YUV. I
>>>>> don't know how that actually works, or how it theoretically should work.
>>>>
>>>> We have some operations in our pipeline that are intended to be static, i.e. a
>>>> static matrix that converts from RGB to LMS, and later another that converts
>>>> from LMS to ICtCp. There are even LUTs that are intended to be static,
>>>> converting from linear to PQ and vice versa. All of this is because the
>>>> pre-blending scaler and tone mapping operator are intended to operate in ICtCp
>>>> PQ space. Although the stated LUTs and matrices are intended to be static, they
>>>> are actually programmable. In offline discussions, it was indicated that it
>>>> would be helpful to actually expose the programmability, as opposed to exposing
>>>> them as non-bypassable blocks, as some compositors may have novel uses for them.
>>>
>>> Correct. Doing tone-mapping in ICtCp etc. are already policy that
>>> userspace might or might not agree with.
>>>
>>> Exposing static colorops will help usages that adhere to current
>>> prevalent standards around very specific use cases. There may be
>>> millions of devices needing exactly that processing in their usage, but
>>> it is also quite limiting in what one can do with the hardware.
>>>
>>>> Despite being programmable, the LUTs are updated in a manner that is less
>>>> efficient as compared to e.g. the non-static "degamma" LUT. Would it be helpful
>>>> if there was some way to tag operations according to their performance,
>>>> for example so that clients can prefer a high performance one when they
>>>> intend to do an animated transition? I recall from the XDC HDR workshop
>>>> that this is also an issue with AMD's 3DLUT, where updates can be too
>>>> slow to animate.
>>>
>>> I can certainly see such information being useful, but then we need to
>>> somehow quantize the performance.
> 
> Right, which wouldn't even necessarily be universal, could depend on the given
> host, GPU, etc. It could just be a relative performance indication, to give an
> order of preference. That wouldn't tell you if it can or can't be animated, but
> when choosing between two LUTs to animate you could prefer the higher
> performance one.
> 
>>>
>>> What I was left puzzled about after the XDC workshop is that is it
>>> possible to pre-load configurations in the background (slow), and then
>>> quickly switch between them? Hardware-wise I mean.
> 
> This works fine for our "fast" LUTs, you just point them to a surface in video
> memory and they flip to it. You could keep multiple surfaces around and flip
> between them without having to reprogram them in software. We can easily do that
> with enumerated curves, populating them when the driver initializes instead of
> waiting for the client to request them. You can even point multiple hardware
> LUTs to the same video memory surface, if they need the same curve.
> 
>>
>> We could define that pipelines with a lower ID are to be preferred over
>> higher IDs.
> 
> Sure, but this isn't just an issue with a pipeline as a whole, but the
> individual elements within it and how to use them in a given context.
> 
>>
>> The issue is that if programming a pipeline becomes too slow to be
>> useful it probably should just not be made available to user space.
> 
> It's not that programming the pipeline is overall too slow. The LUTs we have
> that are relatively slow to program are meant to be set infrequently, or even
> just once, to allow the scaler and tone mapping operator to operate in fixed
> point PQ space. You might still want the tone mapper, so you would choose a
> pipeline that includes them, but when it comes to e.g. animating a night light,
> you would want to choose a different LUT for that purpose.
> 
>>
>> The prepare-commit idea for blob properties would help to make the
>> pipelines usable again, but until then it's probably a good idea to just
>> not expose those pipelines.
> 
> The prepare-commit idea actually wouldn't work for these LUTs, because they are
> programmed using methods instead of pointing them to a surface. I'm actually not
> sure how slow it actually is, would need to benchmark it. I think not exposing
> them at all would be overkill, since it would mean you can't use the preblending
> scaler or tonemapper, and animation isn't necessary for that.
> 
> The AMD 3DLUT is another example of a LUT that is slow to update, and it would
> obviously be a major loss if that wasn't exposed. There just needs to be some
> way for clients to know if they are going to kill performance by trying to
> change it every frame.
> 
> Thanks,
> Alex
> 

To clarify, what are we defining as slow to update here? Something we 
aren't able to update within a frame (let's say at a low frame rate such 
as 30 fps for discussion's sake)? A block that requires a programming 
sequence of disable + program + enable to update? Defining performance 
seems like it can get murky if we start to consider frame concurrent 
updates among multiple color blocks as well.

Thanks,
Christopher

>>
>>>
>>>
>>> Thanks,
>>> pq
>>
>>
