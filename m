Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2640C729F37
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21F510E147;
	Fri,  9 Jun 2023 15:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3495310E147;
 Fri,  9 Jun 2023 15:52:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 359BdUJ4001031; Fri, 9 Jun 2023 15:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : cc : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gzN0UvxMnSedOXbttyGAwyhS3eRogR/iy4Eb8Cv+dPM=;
 b=JiJyvQOV42nDLjJktnVbYUtCz8AZtgZo7cyx0mmkxMbE7io6QtMCrQSfyToVhR6aUioC
 tC3QgP3h1gX2OlVV4eOyvxvR/onItBG0OAy/1R0y5+3fxf6zOXKnbjhrsLJgXYcK3dpU
 bWqWIkRP/2EBZPx9OYefwCmXQuFNaDpm3baY6sde8lqw3mgryydZZPME8F7wgDkmK6m0
 dgPAdlqlchsKpBtXQ4wo0CFMmKL+jKSS137WE24NQ2+QHiR9Y/TE6Rj46KFw52tLK4AL
 jmAKYslcG7TUzSpVhowtckQt4mJ5KJmx3AEwIg/EUbf4/tlKhI5aLQf+17LVNc0sFhkR Jg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r43d48g7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 15:52:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 359Fq8xv028326
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Jun 2023 15:52:08 GMT
Received: from [10.111.175.205] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 9 Jun 2023
 08:52:06 -0700
Message-ID: <84d5dad7-5e8e-ce92-d08e-4609970f6604@quicinc.com>
Date: Fri, 9 Jun 2023 11:52:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <4341dac6-ada1-2a75-1c22-086d96408a85@quicinc.com>
From: Christopher Braga <quic_cbraga@quicinc.com>
In-Reply-To: <4341dac6-ada1-2a75-1c22-086d96408a85@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: SYYjoSJ7YmuHMtSU1XrgDusyiLbfbQZ2
X-Proofpoint-GUID: SYYjoSJ7YmuHMtSU1XrgDusyiLbfbQZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_11,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 clxscore=1011 adultscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090133
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
Cc: Aleix Pol <aleixpol@kde.org>, Pekka Paalanen <pekka.paalanen@collabora.com>,
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

> Hi all,
> 
> The goal of this RFC is to expose a generic KMS uAPI to configure the color
> pipeline before blending, ie. after a pixel is tapped from a plane's
> framebuffer and before it's blended with other planes. With this new 
> uAPI we
> aim to reduce the battery life impact of color management and HDR on mobile
> devices, to improve performance and to decrease latency by skipping
> composition on the 3D engine. This proposal is the result of discussions at
> the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
> familiar with the AMD, Intel and NVIDIA hardware have participated in the
> discussion.
> 
> This proposal takes a prescriptive approach instead of a descriptive 
> approach.
> Drivers describe the available hardware blocks in terms of low-level
> mathematical operations, then user-space configures each block. We decided
> against a descriptive approach where user-space would provide a high-level
> description of the colorspace and other parameters: we want to give more
> control and flexibility to user-space, e.g. to be able to replicate 
> exactly the
> color pipeline with shaders and switch between shaders and KMS pipelines
> seamlessly, and to avoid forcing user-space into a particular color 
> management
> policy.
> 
Thanks for posting this Simon! This overview does a great job of
breaking down the proposal. A few questions inline below.

> We've decided against mirroring the existing CRTC properties
> DEGAMMA_LUT/CTM/GAMMA_LUT onto KMS planes. Indeed, the color management
> pipeline can significantly differ between vendors and this approach cannot
> accurately abstract all hardware. In particular, the availability, 
> ordering and
> capabilities of hardware blocks is different on each display engine. So, 
> we've
> decided to go for a highly detailed hardware capability discovery.
> 
> This new uAPI should not be in conflict with existing standard KMS 
> properties,
> since there are none which control the pre-blending color pipeline at the
> moment. It does conflict with any vendor-specific properties like
> NV_INPUT_COLORSPACE or the patches on the mailing list adding AMD-specific
> properties. Drivers will need to either reject atomic commits 
> configuring both
> uAPIs, or alternatively we could add a DRM client cap which hides the 
> vendor
> properties and shows the new generic properties when enabled.
> 
> To use this uAPI, first user-space needs to discover hardware 
> capabilities via
> KMS objects and properties, then user-space can configure the hardware 
> via an
> atomic commit. This works similarly to the existing KMS uAPI, e.g. planes.
> 
> Our proposal introduces a new "color_pipeline" plane property, and a new 
> KMS
> object type, "COLOROP" (short for color operation). The "color_pipeline" 
> plane
> property is an enum, each enum entry represents a color pipeline 
> supported by
> the hardware. The special zero entry indicates that the pipeline is in
> "bypass"/"no-op" mode. For instance, the following plane properties 
> describe a
> primary plane with 2 supported pipelines but currently configured in bypass
> mode:
> 
>      Plane 10
>      ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>      ├─ …
>      └─ "color_pipeline": enum {0, 42, 52} = 0
> 
> The non-zero entries describe color pipelines as a linked list of 
> COLOROP KMS
> objects. The entry value is an object ID pointing to the head of the linked
> list (the first operation in the color pipeline).
> 
> The new COLOROP objects also expose a number of KMS properties. Each has a
> type, a reference to the next COLOROP object in the linked list, and other
> type-specific properties. Here is an example for a 1D LUT operation:
> 
>      Color operation 42
>      ├─ "type": enum {Bypass, 1D curve} = 1D curve
>      ├─ "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HLG, …} = LUT
The options sRGB / PQ / BT.709 / HLG would select hard-coded 1D
curves? Will different hardware be allowed to expose a subset of these 
enum values?

>      ├─ "lut_size": immutable range = 4096
>      ├─ "lut_data": blob
>      └─ "next": immutable color operation ID = 43
> 
Some hardware has per channel 1D LUT values, while others use the same 
LUT for all channels.  We will definitely need to expose this in the 
UAPI in some form.

> To configure this hardware block, user-space can fill a KMS blob with 
> 4096 u32
> entries, then set "lut_data" to the blob ID. Other color operation types 
> might
> have different properties.
> 
The bit-depth of the LUT is an important piece of information we should
include by default. Are we assuming that the DRM driver will always
reduce the input values to the resolution supported by the pipeline? 
This could result in differences between the hardware behavior
and the shader behavior.

Additionally, some pipelines are floating point while others are fixed. 
How would user space know if it needs to pack 32 bit integer values vs
32 bit float values?

> Here is another example with a 3D LUT:
> 
>      Color operation 42
>      ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
>      ├─ "lut_size": immutable range = 33
>      ├─ "lut_data": blob
>      └─ "next": immutable color operation ID = 43
> 
We are going to need to expose the packing order here to avoid any 
programming uncertainty. I don't think we can safely assume all hardware
is equivalent.

> And one last example with a matrix:
> 
>      Color operation 42
>      ├─ "type": enum {Bypass, Matrix} = Matrix
>      ├─ "matrix_data": blob
>      └─ "next": immutable color operation ID = 43
> 
It is unclear to me what the default sizing of this matrix is. Any 
objections to exposing these details with an additional property?

> [Simon note: having "Bypass" in the "type" enum, and making "type" 
> mutable is
> a bit weird. Maybe we can just add an "active"/"bypass" boolean property on
> blocks which can be bypassed instead.]
> 
Bypass boolean is favored by me as well.

> [Jonas note: perhaps a single "data" property for both LUTs and matrices
> would make more sense. And a "size" prop for both 1D and 3D LUTs.]
> 
> If some hardware supports re-ordering operations in the color pipeline, the
> driver can expose multiple pipelines with different operation ordering, and
> user-space can pick the ordering it prefers by selecting the right 
> pipeline.
> The same scheme can be used to expose hardware blocks supporting multiple
> precision levels.
> 
> That's pretty much all there is to it, but as always the devil is in the
> details.
> 
Dithering logic exists in some pipelines. I think we need a plan to 
expose that here as well.

> First, we realized that we need a way to indicate where the scaling 
> operation
> is happening. The contents of the framebuffer attached to the plane 
> might be
> scaled up or down depending on the CRTC_W and CRTC_H properties. 
> Depending on
> the colorspace scaling is applied in, the result will be different, so 
> we need
> a way for the kernel to indicate which hardware blocks are pre-scaling, and
> which ones are post-scaling. We introduce a special "scaling" operation 
> type,
> which is part of the pipeline like other operations but serves an 
> informational
> role only (effectively, the operation cannot be configured by 
> user-space, all
> of its properties are immutable). For example:
> 
>      Color operation 43
>      ├─ "type": immutable enum {Scaling} = Scaling
>      └─ "next": immutable color operation ID = 44
> 
> [Simon note: an alternative would be to split the color pipeline into 
> two, by
> having two plane properties ("color_pipeline_pre_scale" and
> "color_pipeline_post_scale") instead of a single one. This would be 
> similar to
> the way we want to split pre-blending and post-blending. This could be less
> expressive for drivers, there may be hardware where there are dependencies
> between the pre- and post-scaling pipeline?]
> 
As others have noted, breaking up the pipeline with immutable blocks 
makes the most sense to me here. This way we don't have to predict ahead 
of time every type of block that maybe affected by pipeline ordering. 
Splitting the pipeline into two properties now means future
logical splits would require introduction of further plane properties.

> Then, Alex from NVIDIA described how their hardware works. NVIDIA hardware
> contains some fixed-function blocks which convert from LMS to ICtCp and 
> cannot
> be disabled/bypassed. NVIDIA hardware has been designed for descriptive 
> APIs
> where user-space provides a high-level description of the colorspace
> conversions it needs to perform, and this is at odds with our KMS uAPI
> proposal. To address this issue, we suggest adding a special block type 
> which
> describes a fixed conversion from one colorspace to another and cannot be
> configured by user-space. Then user-space will need to accomodate its 
> pipeline
> for these special blocks. Such fixed hardware blocks need to be well enough
> documented so that they can be implemented via shaders.
> 
A few questions here. What is the current plan for documenting the 
mathematical model for each exposed block? Will each defined 'type' enum 
value be locked to a definition in the kernel documents? As an example, 
when we say '3D LUT' in this proposal does this mean the block will 
expose a tri-linear interpolated 3D LUT interface? Is '1D Curve' a 
direct in to out LUT mapping?

Overall I am a fan of this proposal though. The prescriptive color 
pipeline UAPI is simple and easy to follow.

Regards,
Christopher

> We also noted that it should always be possible for user-space to 
> completely
> disable the color pipeline and switch back to bypass/identity without a
> modeset. Some drivers will need to fail atomic commits for some color
> pipelines, in particular for some specific LUT payloads. For instance, AMD
> doesn't support curves which are too steep, and Intel doesn't support 
> curves
> which decrease. This isn't something which routinely happens, but there 
> might
> be more cases where the hardware needs to reject the pipeline. Thus, when
> user-space has a running KMS color pipeline, then hits a case where the
> pipeline cannot keep running (gets rejected by the driver), user-space 
> needs to
> be able to immediately fall back to shaders without any glitch. This 
> doesn't
> seem to be an issue for AMD, Intel and NVIDIA.
> 
> This uAPI is extensible: we can add more color operations, and we can 
> add more
> properties for each color operation type. For instance, we might want to 
> add
> support for Intel piece-wise linear (PWL) 1D curves, or might want to 
> advertise
> the effective precision of the LUTs. The uAPI is deliberately somewhat 
> minimal
> to keep the scope of the proposal manageable.
> 
> Later on, we plan to re-use the same machinery for post-blending color
> pipelines. There are some more details about post-blending which have been
> separately debated at the hackfest, but we believe it's a viable plan. This
> solution would supersede the existing DEGAMMA_LUT/CTM/GAMMA_LUT 
> properties, so
> we'd like to introduce a client cap to hide the old properties and show 
> the new
> post-blending color pipeline properties.
> 
> We envision a future user-space library to translate a high-level 
> descriptive
> color pipeline into low-level prescriptive KMS color pipeline 
> ("libliftoff but
> for color pipelines"). The library could also offer a translation into 
> shaders.
> This should help share more infrastructure between compositors and ease KMS
> offloading. This should also help dealing with the NVIDIA case.
> 
> To wrap things up, let's take a real-world example: how would gamescope [2]
> configure the AMD DCN 3.0 hardware for its color pipeline? The gamescope 
> color
> pipeline is described in [3]. The AMD DCN 3.0 hardware is described in [4].
> 
> AMD would expose the following objects and properties:
> 
>      Plane 10
>      ├─ "type": immutable enum {Overlay, Primary, Cursor} = Primary
>      └─ "color_pipeline": enum {0, 42} = 0
>      Color operation 42 (input CSC)
>      ├─ "type": enum {Bypass, Matrix} = Matrix
>      ├─ "matrix_data": blob
>      └─ "next": immutable color operation ID = 43
>      Color operation 43
>      ├─ "type": enum {Scaling} = Scaling
>      └─ "next": immutable color operation ID = 44
>      Color operation 44 (DeGamma)
>      ├─ "type": enum {Bypass, 1D curve} = 1D curve
>      ├─ "1d_curve_type": enum {sRGB, PQ, …} = sRGB
>      └─ "next": immutable color operation ID = 45
>      Color operation 45 (gamut remap)
>      ├─ "type": enum {Bypass, Matrix} = Matrix
>      ├─ "matrix_data": blob
>      └─ "next": immutable color operation ID = 46
>      Color operation 46 (shaper LUT RAM)
>      ├─ "type": enum {Bypass, 1D curve} = 1D curve
>      ├─ "1d_curve_type": enum {LUT} = LUT
>      ├─ "lut_size": immutable range = 4096
>      ├─ "lut_data": blob
>      └─ "next": immutable color operation ID = 47
>      Color operation 47 (3D LUT RAM)
>      ├─ "type": enum {Bypass, 3D LUT} = 3D LUT
>      ├─ "lut_size": immutable range = 17
>      ├─ "lut_data": blob
>      └─ "next": immutable color operation ID = 48
>      Color operation 48 (blend gamma)
>      ├─ "type": enum {Bypass, 1D curve} = 1D curve
>      ├─ "1d_curve_type": enum {LUT, sRGB, PQ, …} = LUT
>      ├─ "lut_size": immutable range = 4096
>      ├─ "lut_data": blob
>      └─ "next": immutable color operation ID = 0
> 
> To configure the pipeline for an HDR10 PQ plane (path at the top) and a HDR
> display, gamescope would perform an atomic commit with the following 
> property
> values:
> 
>      Plane 10
>      └─ "color_pipeline" = 42
>      Color operation 42 (input CSC)
>      └─ "matrix_data" = PQ → scRGB (TF)
>      Color operation 44 (DeGamma)
>      └─ "type" = Bypass
>      Color operation 45 (gamut remap)
>      └─ "matrix_data" = scRGB (TF) → PQ
>      Color operation 46 (shaper LUT RAM)
>      └─ "lut_data" = PQ → Display native
>      Color operation 47 (3D LUT RAM)
>      └─ "lut_data" = Gamut mapping + tone mapping + night mode
>      Color operation 48 (blend gamma)
>      └─ "1d_curve_type" = PQ
> 
> I hope comparing these properties to the diagrams linked above can help
> understand how the uAPI would be used and give an idea of its viability.
> 
> Please feel free to provide feedback! It would be especially useful to have
> someone familiar with Arm SoCs look at this, to confirm that this proposal
> would work there.
> 
> Unless there is a show-stopper, we plan to follow up this RFC with
> implementations for AMD, Intel, NVIDIA, gamescope, and IGT.
> 
> Many thanks to everybody who contributed to the hackfest, on-site or 
> remotely!
> Let's work together to make this happen!
> 
> Simon, on behalf of the hackfest participants
> 
> [1]: https://wiki.gnome.org/Hackfests/ShellDisplayNext2023
> [2]: https://github.com/ValveSoftware/gamescope
> [3]: 
> https://github.com/ValveSoftware/gamescope/blob/5af321724c8b8a29cef5ae9e31293fd5d560c4ec/src/docs/Steam%20Deck%20Display%20Pipeline.png
> [4]: https://kernel.org/doc/html/latest/_images/dcn3_cm_drm_current.svg
