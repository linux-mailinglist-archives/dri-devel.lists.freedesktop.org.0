Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D94477E580A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3616C10E755;
	Wed,  8 Nov 2023 13:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817D710E756
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:43:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d895584f1so4072309f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 05:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1699450991; x=1700055791; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zLP3PcUeAR8FCXJ+9gy6mP5UA98/zb3+U9bKxoh0iWg=;
 b=Wwcsu1N7Yfv4aAEXNl70WzzTiykP9GsRdRkwgr3xECWorhzxO+uXOyrR5YZdDicHM4
 wbZc55YzHSQYkKFpdeJvnWihVccznBfzLxPr/6GBYlKBY7m5prE+v/0a2QkyMLjPlhWw
 W3GAfJziBQj1Vid9CGZ+Xzz9wp1I+heBA/Pm9kkSBc2gYKUBtyaGgipdM6jMitZZRJy/
 bfxrPIUdLjZ4e40DvtscJHsY3IPiwfR3fvqFLuKGvz6yKsHrWUCcBojF3pGCNnkJE1F1
 VhqOEad0uGk5VK4yGGSWyqCa/tR6iLv7ypajfG9XNr5b+lK7q4cQPFidjf9eHZwEzC8W
 wW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699450991; x=1700055791;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zLP3PcUeAR8FCXJ+9gy6mP5UA98/zb3+U9bKxoh0iWg=;
 b=J4djGeFznU8lML7YA85lG2OnVfV7WESPi+2OeISLeOub1xUFKVJUyi6D6u06Hfi1hJ
 Gwqq+FBETW7LJZGvbDNUZTOvZhVKEaUIqH3EeRSV3nmzEra9vTZeKlJ1yaRo9xE8X4nK
 9oEyeWRj3YyOFJFkDWikv+79ggFoMBiTDZ1Kh+78k2n7Gwv4afkb3c138WAlkVUBeLDZ
 iKA0vcall8xfjSaTwt+sFezXanzUL7GD4LqXdX4VOGjOU+U/emwnBPpDAD+XsBSGikpE
 ZsHPX9gWws+dFJbURSM+TlHNP+Mg1PatGAF2z6aK7FieM475fOgqoAKXljyTxkYU0wUQ
 1SJA==
X-Gm-Message-State: AOJu0Yw5Onisct2whzV02xGO5GF7dHNnM/WnVAi3u469OHflmFMsAOFL
 NP4GQdoLgU6IaK7bZJPoGPkldA==
X-Google-Smtp-Source: AGHT+IEsk0/O+sRxxXAyaB6QqtKnpWEDAwT0m/svoYEzvp7tk6UKx136lyPb4yijk3pieOcqEp2kTA==
X-Received: by 2002:a5d:4d8a:0:b0:32f:adaf:be86 with SMTP id
 b10-20020a5d4d8a000000b0032fadafbe86mr1539854wru.16.1699450990698; 
 Wed, 08 Nov 2023 05:43:10 -0800 (PST)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adffa0d000000b003143867d2ebsm4981008wrr.63.2023.11.08.05.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 05:43:10 -0800 (PST)
Message-ID: <69ff5fd4-3c19-469c-bdcc-8fe54d681904@froggi.es>
Date: Wed, 8 Nov 2023 13:43:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
 pipeline is needed
To: "Shankar, Uma" <uma.shankar@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <CY5PR11MB6344A6C878FBAF5E66EFCE1CF4A8A@CY5PR11MB6344.namprd11.prod.outlook.com>
Content-Language: en-US
From: Joshua Ashton <joshua@froggi.es>
In-Reply-To: <CY5PR11MB6344A6C878FBAF5E66EFCE1CF4A8A@CY5PR11MB6344.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Sasha McIntosh <sashamcintosh@google.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Hector Martin <marcan@marcan.st>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/8/23 12:18, Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Harry Wentland <harry.wentland@amd.com>
>> Sent: Friday, October 20, 2023 2:51 AM
>> To: dri-devel@lists.freedesktop.org
>> Cc: wayland-devel@lists.freedesktop.org; Harry Wentland
>> <harry.wentland@amd.com>; Ville Syrjala <ville.syrjala@linux.intel.com>; Pekka
>> Paalanen <pekka.paalanen@collabora.com>; Simon Ser <contact@emersion.fr>;
>> Melissa Wen <mwen@igalia.com>; Jonas Ådahl <jadahl@redhat.com>; Sebastian
>> Wick <sebastian.wick@redhat.com>; Shashank Sharma
>> <shashank.sharma@amd.com>; Alexander Goins <agoins@nvidia.com>; Joshua
>> Ashton <joshua@froggi.es>; Michel Dänzer <mdaenzer@redhat.com>; Aleix Pol
>> <aleixpol@kde.org>; Xaver Hugl <xaver.hugl@gmail.com>; Victoria Brekenfeld
>> <victoria@system76.com>; Sima <daniel@ffwll.ch>; Shankar, Uma
>> <uma.shankar@intel.com>; Naseer Ahmed <quic_naseer@quicinc.com>;
>> Christopher Braga <quic_cbraga@quicinc.com>; Abhinav Kumar
>> <quic_abhinavk@quicinc.com>; Arthur Grillo <arthurgrillo@riseup.net>; Hector
>> Martin <marcan@marcan.st>; Liviu Dudau <Liviu.Dudau@arm.com>; Sasha
>> McIntosh <sashamcintosh@google.com>
>> Subject: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive color
>> pipeline is needed
>>
>> v2:
>>   - Update colorop visualizations to match reality (Sebastian, Alex Hung)
>>   - Updated wording (Pekka)
>>   - Change BYPASS wording to make it non-mandatory (Sebastian)
>>   - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
>>     section (Pekka)
>>   - Use PQ EOTF instead of its inverse in Pipeline Programming example (Melissa)
>>   - Add "Driver Implementer's Guide" section (Pekka)
>>   - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Sima <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>> Cc: Hector Martin <marcan@marcan.st>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Sasha McIntosh <sashamcintosh@google.com>
>> ---
>>   Documentation/gpu/rfc/color_pipeline.rst | 347 +++++++++++++++++++++++
>>   1 file changed, 347 insertions(+)
>>   create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>>
>> diff --git a/Documentation/gpu/rfc/color_pipeline.rst
>> b/Documentation/gpu/rfc/color_pipeline.rst
>> new file mode 100644
>> index 000000000000..af5f2ea29116
>> --- /dev/null
>> +++ b/Documentation/gpu/rfc/color_pipeline.rst
>> @@ -0,0 +1,347 @@
>> +========================
>> +Linux Color Pipeline API
>> +========================
>> +
>> +What problem are we solving?
>> +============================
>> +
>> +We would like to support pre-, and post-blending complex color
>> +transformations in display controller hardware in order to allow for
>> +HW-supported HDR use-cases, as well as to provide support to
>> +color-managed applications, such as video or image editors.
>> +
>> +It is possible to support an HDR output on HW supporting the Colorspace
>> +and HDR Metadata drm_connector properties, but that requires the
>> +compositor or application to render and compose the content into one
>> +final buffer intended for display. Doing so is costly.
>> +
>> +Most modern display HW offers various 1D LUTs, 3D LUTs, matrices, and
>> +other operations to support color transformations. These operations are
>> +often implemented in fixed-function HW and therefore much more power
>> +efficient than performing similar operations via shaders or CPU.
>> +
>> +We would like to make use of this HW functionality to support complex
>> +color transformations with no, or minimal CPU or shader load.
>> +
>> +
>> +How are other OSes solving this problem?
>> +========================================
>> +
>> +The most widely supported use-cases regard HDR content, whether video
>> +or gaming.
>> +
>> +Most OSes will specify the source content format (color gamut, encoding
>> +transfer function, and other metadata, such as max and average light levels) to a
>> driver.
>> +Drivers will then program their fixed-function HW accordingly to map
>> +from a source content buffer's space to a display's space.
>> +
>> +When fixed-function HW is not available the compositor will assemble a
>> +shader to ask the GPU to perform the transformation from the source
>> +content format to the display's format.
>> +
>> +A compositor's mapping function and a driver's mapping function are
>> +usually entirely separate concepts. On OSes where a HW vendor has no
>> +insight into closed-source compositor code such a vendor will tune
>> +their color management code to visually match the compositor's. On
>> +other OSes, where both mapping functions are open to an implementer they will
>> ensure both mappings match.
>> +
>> +This results in mapping algorithm lock-in, meaning that no-one alone
>> +can experiment with or introduce new mapping algorithms and achieve
>> +consistent results regardless of which implementation path is taken.
>> +
>> +Why is Linux different?
>> +=======================
>> +
>> +Unlike other OSes, where there is one compositor for one or more
>> +drivers, on Linux we have a many-to-many relationship. Many compositors;
>> many drivers.
>> +In addition each compositor vendor or community has their own view of
>> +how color management should be done. This is what makes Linux so beautiful.
>> +
>> +This means that a HW vendor can now no longer tune their driver to one
>> +compositor, as tuning it to one could make it look fairly different
>> +from another compositor's color mapping.
>> +
>> +We need a better solution.
>> +
>> +
>> +Descriptive API
>> +===============
>> +
>> +An API that describes the source and destination colorspaces is a
>> +descriptive API. It describes the input and output color spaces but
>> +does not describe how precisely they should be mapped. Such a mapping
>> +includes many minute design decision that can greatly affect the look of the final
>> result.
>> +
>> +It is not feasible to describe such mapping with enough detail to
>> +ensure the same result from each implementation. In fact, these
>> +mappings are a very active research area.
>> +
>> +
>> +Prescriptive API
>> +================
>> +
>> +A prescriptive API describes not the source and destination
>> +colorspaces. It instead prescribes a recipe for how to manipulate pixel
>> +values to arrive at the desired outcome.
>> +
>> +This recipe is generally an ordered list of straight-forward
>> +operations, with clear mathematical definitions, such as 1D LUTs, 3D
>> +LUTs, matrices, or other operations that can be described in a precise manner.
>> +
>> +
>> +The Color Pipeline API
>> +======================
>> +
>> +HW color management pipelines can significantly differ between HW
>> +vendors in terms of availability, ordering, and capabilities of HW
>> +blocks. This makes a common definition of color management blocks and
>> +their ordering nigh impossible. Instead we are defining an API that
>> +allows user space to discover the HW capabilities in a generic manner,
>> +agnostic of specific drivers and hardware.
>> +
>> +
>> +drm_colorop Object & IOCTLs
>> +===========================
>> +
>> +To support the definition of color pipelines we define the DRM core
>> +object type drm_colorop. Individual drm_colorop objects will be chained
>> +via the NEXT property of a drm_colorop to constitute a color pipeline.
>> +Each drm_colorop object is unique, i.e., even if multiple color
>> +pipelines have the same operation they won't share the same drm_colorop
>> +object to describe that operation.
>> +
>> +Note that drivers are not expected to map drm_colorop objects
>> +statically to specific HW blocks. The mapping of drm_colorop objects is
>> +entirely a driver-internal detail and can be as dynamic or static as a
>> +driver needs it to be. See more in the Driver Implementation Guide section
>> below.
>> +
>> +Just like other DRM objects the drm_colorop objects are discovered via
>> +IOCTLs:
>> +
>> +DRM_IOCTL_MODE_GETCOLOROPRESOURCES: This IOCTL is used to retrieve
>> the
>> +number of all drm_colorop objects.
>> +
>> +DRM_IOCTL_MODE_GETCOLOROP: This IOCTL is used to read one drm_colorop.
>> +It includes the ID for the colorop object, as well as the plane_id of
>> +the associated plane. All other values should be registered as
>> +properties.
>> +
>> +Each drm_colorop has three core properties:
>> +
>> +TYPE: The type of transformation, such as
>> +* enumerated curve
>> +* custom (uniform) 1D LUT
>> +* 3x3 matrix
>> +* 3x4 matrix
>> +* 3D LUT
>> +* etc.
>> +
>> +Depending on the type of transformation other properties will describe
>> +more details.
>> +
>> +BYPASS: A boolean property that can be used to easily put a block into
>> +bypass mode. While setting other properties might fail atomic check,
>> +setting the BYPASS property to true should never fail. The BYPASS
>> +property is not mandatory for a colorop, as long as the entire pipeline
>> +can get bypassed by setting the COLOR_PIPELINE on a plane to '0'.
>> +
>> +NEXT: The ID of the next drm_colorop in a color pipeline, or 0 if this
>> +drm_colorop is the last in the chain.
>> +
>> +An example of a drm_colorop object might look like one of these::
>> +
>> +    /* 1D enumerated curve */
>> +    Color operation 42
>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4
>> matrix, 3D LUT, etc.} = 1D enumerated curve
>> +    ├─ "BYPASS": bool {true, false}
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ
>> inverse EOTF, …}
> 
> Having the fixed function enum for some targeted input/output may not be scalable
> for all usecases. There are multiple colorspaces and transfer functions possible,
> so it will not be possible to cover all these by any enum definitions. Also, this will
> depend on the capabilities of respective hardware from various vendors.

The reason this exists is such that certain HW vendors such as AMD have 
transfer functions implemented in HW. It is important to take advantage 
of these for both precision and power reasons.

Additionally, not every vendor implements bucketed/segemented LUTs the 
same way, so it's not feasible to expose that in a way that's 
particularly useful or not vendor-specific.

Thus we decided to have a regular 1D LUT modulated onto a known curve. 
This is the only real cross-vendor solution here that allows HW curve 
implementations to be taken advantage of and also works with 
bucketing/segemented LUTs.
(Including vendors we are not aware of yet).

This also means that vendors that only support HW curves at some stages 
without an actual LUT are also serviced.

You are right that there *might* be some usecase not covered by this 
right now, and that it would need kernel churn to implement new curves, 
but unfortunately that's the compromise that we (so-far) have decided on 
in order to ensure everyone can have good, precise, power-efficient support.

It is always possible for us to extend the uAPI at a later date for 
other curves, or other properties that might expose a generic segmented 
LUT interface (such as what you have proposed for a while) for vendors 
that can support it.
(With the whole color pipeline thing, we can essentially do 'versioning' 
with that, if we wanted a new 1D LUT type.)

Thanks!
- Joshie 🐸✨

> 
>> +    └─ "NEXT": immutable color operation ID = 43	
>> +
>> +    /* custom 4k entry 1D LUT */
>> +    Color operation 52
>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4
>> matrix, 3D LUT, etc.} = 1D LUT
>> +    ├─ "BYPASS": bool {true, false}
>> +    ├─ "LUT_1D_SIZE": immutable range = 4096
> 
> For the size and capability of individual LUT block, it would be good to add this
> as a blob as defined in the blob approach we were planning earlier. So just taking
> that part of the series to have this capability detection generic. Refer below:
> https://patchwork.freedesktop.org/patch/554855/?series=123023&rev=1
> 
> Basically, use this structure for lut capability and arrangement:
> struct drm_color_lut_range {
> 	/* DRM_MODE_LUT_* */
> 	__u32 flags;
> 	/* number of points on the curve */
> 	__u16 count;
> 	/* input/output bits per component */
> 	__u8 input_bpc, output_bpc;
> 	/* input start/end values */
> 	__s32 start, end;
> 	/* output min/max values */
> 	__s32 min, max;
> };
> 
> If the intention is to have just 1 segment with 4096, it can be easily described there.
> Additionally, this can also cater to any kind of lut arrangement, PWL, segmented or logarithmic.
> 
>> +    ├─ "LUT_1D": blob
>> +    └─ "NEXT": immutable color operation ID = 0
>> +
>> +    /* 17^3 3D LUT */
>> +    Color operation 72
>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4
>> matrix, 3D LUT, etc.} = 3D LUT
>> +    ├─ "BYPASS": bool {true, false}
>> +    ├─ "LUT_3D_SIZE": immutable range = 17
>> +    ├─ "LUT_3D": blob
>> +    └─ "NEXT": immutable color operation ID = 73
>> +
>> +
>> +COLOR_PIPELINE Plane Property
>> +=============================
>> +
>> +Color Pipelines are created by a driver and advertised via a new
>> +COLOR_PIPELINE enum property on each plane. Values of the property
>> +always include '0', which is the default and means all color processing
>> +is disabled. Additional values will be the object IDs of the first
>> +drm_colorop in a pipeline. A driver can create and advertise none, one,
>> +or more possible color pipelines. A DRM client will select a color
>> +pipeline by setting the COLOR PIPELINE to the respective value.
>> +
>> +In the case where drivers have custom support for pre-blending color
>> +processing those drivers shall reject atomic commits that are trying to
>> +use both the custom color properties, as well as the COLOR_PIPELINE
>> +property.
>> +
>> +An example of a COLOR_PIPELINE property on a plane might look like this::
>> +
>> +    Plane 10
>> +    ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>> +    ├─ …
>> +    └─ "color_pipeline": enum {0, 42, 52} = 0
>> +
>> +
>> +Color Pipeline Discovery
>> +========================
>> +
>> +A DRM client wanting color management on a drm_plane will:
>> +
>> +1. Read all drm_colorop objects
>> +2. Get the COLOR_PIPELINE property of the plane 3. iterate all
>> +COLOR_PIPELINE enum values 4. for each enum value walk the color
>> +pipeline (via the NEXT pointers)
>> +   and see if the available color operations are suitable for the
>> +   desired color management operations
>> +
>> +An example of chained properties to define an AMD pre-blending color
>> +pipeline might look like this::
>> +
>> +    Plane 10
>> +    ├─ "TYPE" (immutable) = Primary
>> +    └─ "COLOR_PIPELINE": enum {0, 44} = 0
>> +
>> +    Color operation 44
>> +    ├─ "TYPE" (immutable) = 1D enumerated curve
>> +    ├─ "BYPASS": bool
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
>> +    └─ "NEXT" (immutable) = 45
>> +
>> +    Color operation 45
>> +    ├─ "TYPE" (immutable) = 3x4 Matrix
>> +    ├─ "BYPASS": bool
>> +    ├─ "MATRIX_3_4": blob
>> +    └─ "NEXT" (immutable) = 46
>> +
>> +    Color operation 46
>> +    ├─ "TYPE" (immutable) = 1D enumerated curve
>> +    ├─ "BYPASS": bool
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB Inverse EOTF, PQ Inverse EOTF} = sRGB
>> EOTF
>> +    └─ "NEXT" (immutable) = 47
>> +
>> +    Color operation 47
>> +    ├─ "TYPE" (immutable) = 1D LUT
>> +    ├─ "LUT_1D_SIZE": immutable range = 4096
>> +    ├─ "LUT_1D_DATA": blob
>> +    └─ "NEXT" (immutable) = 48
>> +
>> +    Color operation 48
>> +    ├─ "TYPE" (immutable) = 3D LUT
>> +    ├─ "LUT_3D_SIZE" (immutable) = 17
>> +    ├─ "LUT_3D_DATA": blob
>> +    └─ "NEXT" (immutable) = 49
>> +
>> +    Color operation 49
>> +    ├─ "TYPE" (immutable) = 1D enumerated curve
>> +    ├─ "BYPASS": bool
>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, PQ EOTF} = sRGB EOTF
>> +    └─ "NEXT" (immutable) = 0
>> +
>> +
>> +Color Pipeline Programming
>> +==========================
>> +
>> +Once a DRM client has found a suitable pipeline it will:
>> +
>> +1. Set the COLOR_PIPELINE enum value to the one pointing at the first
>> +   drm_colorop object of the desired pipeline 2. Set the properties for
>> +all drm_colorop objects in the pipeline to the
>> +   desired values, setting BYPASS to true for unused drm_colorop blocks,
>> +   and false for enabled drm_colorop blocks 3. Perform
>> +atomic_check/commit as desired
>> +
>> +To configure the pipeline for an HDR10 PQ plane and blending in linear
>> +space, a compositor might perform an atomic commit with the following
>> +property values::
>> +
>> +    Plane 10
>> +    └─ "COLOR_PIPELINE" = 42
>> +
>> +    Color operation 42 (input CSC)
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 44 (DeGamma)
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 45 (gamut remap)
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 46 (shaper LUT RAM)
>> +    └─ "BYPASS" = true
>> +
>> +    Color operation 47 (3D LUT RAM)
>> +    └─ "LUT_3D_DATA" = Gamut mapping + tone mapping + night mode
>> +
>> +    Color operation 48 (blend gamma)
>> +    └─ "CURVE_1D_TYPE" = PQ EOTF
>> +
>> +
>> +Driver Implementer's Guide
>> +==========================
>> +
>> +What does this all mean for driver implementations? As noted above the
>> +colorops can map to HW directly but don't need to do so. Here are some
>> +suggestions on how to think about creating your color pipelines:
>> +
>> +- Try to expose pipelines that use already defined colorops, even if
>> +  your hardware pipeline is split differently. This allows existing
>> +  userspace to immediately take advantage of the hardware.
>> +
>> +- Additionally, try to expose your actual hardware blocks as colorops.
>> +  Define new colorop types where you believe it can offer significant
>> +  benefits if userspace learns to program them.
>> +
>> +- Avoid defining new colorops for compound operations with very narrow
>> +  scope. If you have a hardware block for a special operation that
>> +  cannot be split further, you can expose that as a new colorop type.
>> +  However, try to not define colorops for "use cases", especially if
>> +  they require you to combine multiple hardware blocks.
>> +
>> +- Design new colorops as prescriptive, not descriptive; by the
>> +  mathematical formula, not by the assumed input and output.
>> +
>> +A defined colorop type must be deterministic. Its operation can depend
>> +only on its properties and input and nothing else, allowed error
>> +tolerance notwithstanding.
>> +
>> +
>> +Driver Forward/Backward Compatibility
>> +=====================================
>> +
>> +As this is uAPI drivers can't regress color pipelines that have been
>> +introduced for a given HW generation. New HW generations are free to
>> +abandon color pipelines advertised for previous generations.
>> +Nevertheless, it can be beneficial to carry support for existing color
>> +pipelines forward as those will likely already have support in DRM
>> +clients.
>> +
>> +Introducing new colorops to a pipeline is fine, as long as they can be
>> +disabled or are purely informational. DRM clients implementing support
>> +for the pipeline can always skip unknown properties as long as they can
>> +be confident that doing so will not cause unexpected results.
>> +
>> +If a new colorop doesn't fall into one of the above categories
>> +(bypassable or informational) the modified pipeline would be unusable
>> +for user space. In this case a new pipeline should be defined.
> 
> Thanks again for this nice documentation and capturing all the details clearly.
> 
> Regards,
> Uma Shankar
> 
>> +
>> +References
>> +==========
>> +
>> +1.
>> +https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5n
>> +AccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1
>> QWn488=
>> +@emersion.fr/
>> \ No newline at end of file
>> --
>> 2.42.0
> 


