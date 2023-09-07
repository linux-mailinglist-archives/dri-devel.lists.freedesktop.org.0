Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB14797D27
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 22:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE6B10E0BF;
	Thu,  7 Sep 2023 20:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F76210E09E;
 Thu,  7 Sep 2023 20:09:12 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 387K91cJ000850; Thu, 7 Sep 2023 20:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hhzDBf5AmE8f9BSMR58GPOslaMokHslIIA8MOOikM2E=;
 b=QfRjbjllevUlcHCAlBSqFxe909tnyTcWN1YRMvgW3WMMw3pHDHBJcrI1MPIlv39R7csM
 rC7isgXgY1ltUDHCe0AINduQq5O1bdoQQxWEvMTmTHg4hZJIhpbhU/BQeTe+YRpDdcW4
 /yjVatv99Ou191PJKPTvMrAzxEX+IIZ1ZqPtKHuVPlPFC43hNwgY4L8ERfwcQOghXQ4t
 RuOpA0QYNZ3vkwto0SXEyZRZGmZlQllC7fLNUNOYSrPIKM7lgzbWL54pRxNFeN1OTGax
 yOcnrwHX+hfoWjboPGSfdzkUFoGwyrDtZK7fiBkM/yKj88st+8o9OOBttgQcwBbD6A/v aQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sym36850s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Sep 2023 20:09:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 387K8xB3024652
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 7 Sep 2023 20:08:59 GMT
Received: from [10.38.241.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 7 Sep
 2023 13:08:58 -0700
Message-ID: <1a21bcdd-16e0-af33-83b5-a905c4616dc5@quicinc.com>
Date: Thu, 7 Sep 2023 16:08:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC 01/33] drm/doc/rfc: Add RFC document for proposed Plane
 Color Pipeline
Content-Language: en-US
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
 <20230829160422.1251087-2-uma.shankar@intel.com>
From: Christopher Braga <quic_cbraga@quicinc.com>
In-Reply-To: <20230829160422.1251087-2-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cFYKTwxBSoCgPRdqZhTiXkHbAjSFvhxd
X-Proofpoint-GUID: cFYKTwxBSoCgPRdqZhTiXkHbAjSFvhxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_12,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1011 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309070177
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
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/29/2023 12:03 PM, Uma Shankar wrote:
> Add the documentation for the new proposed Plane Color Pipeline.
> 
> Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   .../gpu/rfc/plane_color_pipeline.rst          | 394 ++++++++++++++++++
>   1 file changed, 394 insertions(+)
>   create mode 100644 Documentation/gpu/rfc/plane_color_pipeline.rst
> 
> diff --git a/Documentation/gpu/rfc/plane_color_pipeline.rst b/Documentation/gpu/rfc/plane_color_pipeline.rst
> new file mode 100644
> index 000000000000..60ce515b6ea7
> --- /dev/null
> +++ b/Documentation/gpu/rfc/plane_color_pipeline.rst
> @@ -0,0 +1,394 @@
> +=======================================
> + Plane Color Pipeline: A UAPI proposal
> +=======================================
> +
> +To build the proposal on, lets take the premise of a color pipeline as shown
> +below.
> +
Hi Uma,
Thanks for posting this. A few comments, with some echoing the 
sentiments of other commenters on the patch set.

> + +-------------------------------------------+
> + |                RAM                        |
> + |  +------+    +---------+    +---------+   |
> + |  | FB 1 |    |  FB 2   |    | FB N    |   |
> + |  +------+    +---------+    +---------+   |
> + +-------------------------------------------+
> +       |  Plane Color Hardware Block |
> + +--------------------------------------------+
> + | +---v-----+   +---v-------+   +---v------+ |
> + | | Plane A |   | Plane B   |   | Plane N  | |
> + | | Pre-CSC |   | Pre-CSC   |   | Pre-CSC  | |
> + | +---+-----+   +---+-------+   +---+------+ |
> + |     |             |               |        |
> + | +---v-----+   +---v-------+   +---v------+ |
> + | |Plane A  |   | Plane B   |   | Plane N  | |
> + | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
> + | +---+-----+   +----+------+   +----+-----+ |
> + |     |              |               |       |
> + | +---v-----+   +----v------+   +----v-----+ |
> + | | Plane A |   | Plane B   |   | Plane N  | |
> + | |Post-CSC |   | Post-CSC  |   | Post-CSC | |
> + | +---+-----+   +----+------+   +----+-----+ |
> + |     |              |               |       |
> + +--------------------------------------------+
> ++------v--------------v---------------v-------|
> +||                                           ||
> +||           Pipe Blender                    ||
> ++--------------------+------------------------+
> +|                    |                        |
> +|        +-----------v----------+             |
> +|        |  Pipe Pre-CSC        |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |            Pipe Color  |
> +|        +-----------v----------+ Hardware    |
> +|        |  Pipe CSC/CTM        |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |                        |
> +|        +-----------v----------+             |
> +|        |  Pipe Post-CSC       |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |                        |
> ++---------------------------------------------+
> +                     |
> +                     v
> +                Pipe Output
> +
> +Each plane consists of the following color blocks
> + * Pre-CSC : This block can used to linearize the input frame buffer data.
> +             The linear data then can be further acted on by the following
> +             color hardware blocks in the display hardware pipeline
> +
> + * CSC/CTM: Used to program color transformation matrix, this block is used
> +            to perform color space conversions like BT2020 to BT709 or BT601
> +            etc. This block acts on the linearized data coming from the
> +            Pre-CSC HW block.
> +
> + * Post-CSC: This HW block can be used to non-linearize frame buffer data to
> +             match the sink. Another use case of it could be to perform Tone
> +             mapping for HDR use-cases.
> +
> +Data from multiple planes will then be fed to pipe/crtc where it will get blended.
> +There is a similar set of HW blocks available at pipe/crtc level which acts on
> +this blended data.
> +
> +Below is a sample usecase fo video playback with sub-titles and playback
> +controls
> +
> +┌────────────┐    ┌─────────────┐     ┌─────────────┐    ┌─────────────┐
> +│FB1         │    │PRE-CSC      │     │ CTM Matrix  │    │ POST-CSC    │
> +│            ├───►│Linearize    ├────►│ BT709 to    ├───►│ SDR to HDR  │
> +│BT709 SDR   │    │             │     │ BT2020      │    │ Tone Mapping├─────┐
> +└────────────┘    └─────────────┘     └─────────────┘    └─────────────┘     │
> +(subtitles)                                                                  │
> +                                                                             │
> +┌────────────┐    ┌─────────────┐     ┌─────────────┐    ┌─────────────┐     │
> +│FB2         │    │PRE-CSC      │     │ CTM Matrix  │    │ POST-CSC    │     │
> +│            ├───►│Linearize    ├────►│ BT601 to    ├───►│ SDR to HDR  ├───┐ │
> +│BT601 SDR   │    │             │     │ BT2020      │    │ Tone Mapping│   │ │
> +└────────────┘    └─────────────┘     └─────────────┘    └─────────────┘   │ │
> +(Playback controls UI)                                                     │ │
> +                                                                           │ │
> +┌────────────┐    ┌─────────────┐     ┌─────────────┐    ┌─────────────┐   │ │
> +│FB2         │    │PRE-CSC      │     │ CTM Matrix  │    │ POST-CSC    │   │ │
> +│            ├───►│Linearize    ├────►│ BT601 to    ├───►│ SDR to HDR  ├─┐ │ │
> +│BT2020 HDR  │    │             │     │ pass-through│    │ pass-through│ │ │ │
> +└────────────┘    └─────────────┘     └─────────────┘    └─────────────┘ │ │ │
BT601 to pass-through seems odd here. Shouldn't this be BT2020 pass-through?
> +(video frame)                                                            │ │ │
> +                                                                         │ │ │
> +┌────────────────────────────────────────────────────────────────────────┴─┴─┘
> +│
> +│ ┌─────────────┐      ┌─────────────┐      ┌───────────────┐
> +│ │ CRTC        │      │ CRTC        │      │ CRTC          │
> +└─┤ PRE-CSC     ├─────►│ CSC/CTM     ├─────►│ POST-CSC      ├─────► TO Port
> +  │             │      │             │      │               │
> +  └─────────────┘      └─────────────┘      └───────────────┘
> +
> +This RFC is intended to propose an uAPI for the pre-blending color pipeline
> +(however, can be also extended to post blending pipeline).
> +
> +Below are the design considerations while designing the uAPI.
> +
> +1. Individual HW blocks can be muxed. (e.g. out of two HW blocks only one can be used)
> +2. Position of the HW block can be programmable
> +3. LUTs can be one dimentional or three dimentional
> +4. Number of LUT entries can vary across platforms
> +5. Precision of LUT entries can vary across platforms
> +6. Distribution of LUT entries may vary. e.g Mutli-segmented, Logarithmic,
> +   Piece-Wise Linear(PWL) etc
> +7. There can be parameterized/non-parameterized fixed function HW blocks.
> +   e.g. Just a hardware bit, to convert from one color space to another.
> +
> +Plane Color Pipeline: Design Proposal
> +=====================================
> +Each Color Hardware block will be represented by the structure drm_color_op.
> +
> +struct drm_color_op {
> +	enum color_op_block name;
> +	enum color_op_type type; > +	u32 blob_id;
> +	u32 private_flags;
> +};
> +
> +The members of which will constitute:
> +1. name: A standardised enum for the color hardware block
> +2. type: The type of mathematical operation done by the hardware block.
> +         e.g. 1D Curve, 3D Curve, Matrix etc.
Using both 'type' and 'name' to identify the block sounds like an over 
complication to me. From a UAPI perspective we mainly care about the 
functionality the block provides, and type should be able to cover this 
on its own. If name is needed to declare a divergence from the standard 
definition for the type, why wouldn't a new type just be declared?

I'm currently not seeing any benefit that name provides.

> +3. blob id: Id  pointing to a blob containing information about the hardware
> +         block advertising the respective capabilities to the userspace.
> +         It can be an optional field depending on the members "name" and "type".
> +4. private_flags: This can be used to provide vendor specific hints
> +         to user space
> +
If OEMs are declaring essentially hints in this property, how is user 
space going to handle this when they don't know how to interpret or 
handle them? To give any compositor a chance to use the color block 
these hints would have to result in no modification of the behavior 
agreed upon by the 'type', at which point I don't see what purpose they 
serve. The blob UAPI being fixed for a given color block type would also 
pose an issue here.

On the other hand, if these flags are only used for vendor specific 
hardware blocks it sounds like we are clubbing a proprietary block + 
definition into the color pipeline. I don't think this co-exists well 
with the intent of the original proposal.

> +
> +   For example to represent LUTs, we introduce the drm_color_lut_range
> +   structure. It can represent LUTs with varied number of entries and
> +   distributions (Multi segmented, Logarithmic etc).
> +
> +   struct drm_color_lut_range {
> +		/* DRM_MODE_LUT_* */
> +		__u32 flags;
> +		/* number of points on the curve */
> +		__u16 count;
> +		/* input/output bits per component */
> +		__u8 input_bpc, output_bpc;
> +		/* input start/end values */
> +		__s32 start, end;
> +		/* output min/max values */
> +		__s32 min, max;
> +   };
> +
> +Note: More details on exact usage and implementation of this structure can be
> +      found in the RFC. This structure is taken as is from the series.
> +      https://patchwork.freedesktop.org/series/90825/
> +      However, we can add more members to it to encompass all use-cases.
> +      For example. we can add a precision field to advertise the
> +      bitdepth of the LUTs. Similarly, we can reserve some bits in the flag
> +      field for vendor specific use cases.
> +
> +      At the same time, we don't need to pass any additional information for the
> +      CSC block as userspace and driver already agrees struct drm_color_ctm as
> +      a uAPI to pass on data.
> +
> +These color operations will form the building blocks of a color pipeline which
> +best represents the underlying Hardware. Color operations can be re-arranged,
> +substracted or added to create distinct color pipelines to accurately describe
> +the Hardware blocks present in the display engine.
> +
> +In this proposal, a color pipeline is represented as an array of
> +struct drm_color_op.
> +
> +struct drm_color_op color_pipeline_1[]
> +
> +For example to represent the pre-blending color pipeline as described above
> +
> +We can create a color pipeline like this.
> +
> +struct drm_color_op color_pipeline_1[] = {
> +	{
> +		.name = DRM_CB_PRE_CSC,
> +		.type = CURVE_1D,
> +		.blob_id = 0; /* actual value to be populated during plane
> +						 initialization*/
> +	},
> +	{
> +		.name = DRM_CB_CSC,
> +		.type = MATRIX,
> +		.blob_id = 0;
> +	},
> +	{
> +		.name = DRM_CB_POST_CSC,
> +		.type = CURVE_1D,
> +		.blob_id = 0;
> +	},
> +};

I'm noticing that in the shared IGT patch set these names are being used 
to determine position instead of, well, the actual position in the color 
pipeline. We definitely need to be careful to avoid coupling 
functionality with usage, and I think having a name field is going to 
cause developers to make that mistake / shortcut.

> +
> +Then, for individual color operation, we add blobs to advertise the capability
> +of the particular Hardware block. In case of the example pipeline, we add
> +blobs of type drm_color_lut_range for the "pre-csc" and "post-csc".
> +For the "csc" block we pass no blob id to user space as it is known to both
> +user space and driver that drm_color_ctm structure is to be used for such
> +operation.
> +
> +To represent, this in a diagram.
> +
> +   struct drm_color_op color_pipeline_1[]
> +      +---------------------------+
> +      |                           |           drm_color_op
> +      |  +---------------------+--+-----------+---------------------+
> +      |  |                     |  |           |                     |
> +      |  |                     |  |           | +-----------------+ |
> +      |  |                     |  |           | |     name        | |
> +      |  |                     |  |           | +-----------------+ |
> +      |  |                     |  |           | |     type        | |
> +      |  |    color_op_1       |  |           | +-----------------+ |
> +      |  |                     |  |           | |     blob id     | +--------+
> +      |  |                     |  |           | +-----------------+ |        |
> +      |  |                     |  |           | |     private     | |        |
> +      |  |                     |  |           | |      flags      | |        |
> +      |  |                     |  |           | +-----------------+ |        |
> +      |  |                     |  |           |                     |        |
> +      |  +---------------------+--+-----------+---------------------+        |
> +      |                           |                                          |
> +      |                           |                                          |
> +      |  +---------------------+  |                                          |
> +      |  |                     |  |           drm_color_lut_range            |
> +      |  |    color_op_2       |  |           +-------------------------+    |
> +      |  |                     |  |           |                         |    |
> +      |  |                     |  |           | +---------------------+ |    |
> +      |  +---------------------+  |           | | segment 1 {         | |<---+
> +      |                           |           | |  ...                | |
> +      |  +---------------------+  |           | |  .input_bpc = 16,   | |
> +      |  |                     |  |           | |  .output_bpc = 16,  | |
> +      |  |    color_op_3       |  |           | |  ...                | |
> +      |  |                     |  |           | | }                   | |
> +      |  |                     |  |           | +---------------------+ |
> +      |  +---------------------+  |           |                         |
> +      |             .             |           | +---------------------+ |
> +      |             .             |           | | segment 2 {         | |
> +      |             .             |           | | ...                 | |
> +      +---------------------------+           | | }                   | |
> +                                              | |                     | |
> +                                              | |                     | |
> +                                              | |                     | |
> +                                              | +---------------------+ |
> +                                              |            .            |
> +                                              |            .            |
> +                                              |            .            |
> +                                              +-------------------------+
> +
> +
> +
> +This color pipeline is then packaged within a blob for the user space to
> +retrieve it. Details can be found in the next section
While I get the intent of the blob nesting, as others have mentioned 
this does feel like a recreation of what we already have with DRM 
objects. DRM objects would also have the advantage of allowing for 
easier OEM extension. Instead of private flags, an OEM could introduce 
behavior modifiers or additional features on a color block object via 
additional properties (these properties would obviously have to default 
to a disabled state to ensure default behavior is what is defined by the 
base color block type).

> +
> +Exposing a color pipeline to user space
> +=======================================
> +
> +To advertise the available color pipelines, an immutable ENUM property
> +"GET_COLOR_PIPELINE" is introduced.
> +This enum property has blob id's as values. With each blob id representing
> +a distinct color pipeline based on underlying HW capabilities and their
> +respective combinations.
> +
> +The following output of drm_info [1], shows how color pipelines are visible
> +to userspace.
> +
> +├───Plane 0
> +    │   ├───Object ID: 31
> +    │   ├───CRTCs: {0}
> +    │   ├───Legacy info
> +        ...
> +    │       ├───"GET_COLOR_PIPELINE" (immutable): enum {no color pipeline,
> +						color pipeline 1, color pipeline 2}= no color pipeline
> +
> +To understand the capabilities of individual pipelines, first the userspace
> +need to retrieve the pipeline blob with the blob ids retrieved by reading the
> +enum property.
> +
> +Once the color pipeline is retrieved, user can then parse through
> +individual drm_color_op blocks to understand the capabilities of each
> +hardware block.
> +
> +Check IGT series to see how user space can parse through color pipelines.
> +Refer the IGT series here: https://patchwork.freedesktop.org/series/123018/
> +
> +Setting up a color pipeline
> +===========================
> +
> +Once the user space decides on a color pipeline, it can set the pipeline and
> +the corresponding data for the hardware blocks within the pipeline with
> +the BLOB property "SET_COLOR_PIPELINE".
> +
> +To achieve this two structures are introduced
> +
> +1.	struct drm_color_op_data: It represents data to be passed onto individual
> +							  color hardware blocks. It contains three members
> +                      a) name: to identify the color operation block
> +                      b) blob_id: pointing to the blob with data for the
> +                                  corresponding hardware block
> +
> +	struct drm_color_op_data {
> +		enum color_op_block name;
> +		u32 blob_id;
> +	};
> +
> +2.	struct drm_color_pipeline: This structure represents the aggregate
> +                                   pipeline to be set. it contains the following  members
> +					  a) num: pipeline number to be selected
> +					  b) size: size of the data to be passed onto the driver
> +					  c) data: array of struct drm_color_op_data with data for
> +                                                   the hardware block/s that userspace wants to
> +                                                   set values for.
> +
> +	struct drm_color_pipeline {
> +		int num;
> +		int size;
> +		struct drm_color_op_data *data;
> +	};
> +
> +	User can either:
> +	1. send data for all the color operations in a pipeline as shown in [2].
> +	   The color operation data need not be in order that the pipeline advertises
> +	   however, it should not contain data for any
> +	   color operation that is not present in the pipeline.
> +
> +	   Note: This check for pipeline is not yet implemented but if the
> +	   wider proposal is accepted we have few solutions in mind.
> +
> +	2. send data for a subset of color operations as shown in [3].For the
> +	   color operation that userspace does not send data will retain their
> +	   older state.
> +
> +	3. reset/disable the pipeline by setting the "SET_COLOR_PIPELINE" blob
> +	   property to NULL as shown in both [2] and [3]
> +
> +	4. change the color pipeline as demonstrated in [3].
> +	   On the new pipeline, the user is expected to setup all the color hardware block
> +	   Once the user requests a pipeline change, the driver will provide it a clean slate
> +           which means that all the data previously set by the user will be discarded even if
> +           there are common hardware blocks between the two(previous and current) pipelines.
> +
> +IGT implementation can be found here [4]
> +
> +Representing Fixed function hardware
> +====================================
> +
> +To provide support for fixed function hardware, the driver could expose vendor
> +specific struct drm_color_op with parameters that both the userspace and
> +driver agrees on. To demonstrate, let's consider a hyphothetical fixed
> +function hardware block that converts BT601 to BT2020.
> +The driver can choose to advertise the block as such.
> +
> +struct drm_color_op color_pipeline_X[] = {
> +	{
> +		.name = DRM_CB_PRIVATE,
> +		.type = FIXED_FUNCTION,
> +		.blob_id = 45;
> +	},
> +}
> +
> +Where the blob represents some vendor specific enums, strings or any other
> +appropriate data types which both the user-space and drivers are aligned on.
> +
> +blob:45 {
> +	VENDORXXX_BT602_TO_BT2020,
> +};

As far as I see it, one of the primary advantages of moving to this new 
color pipeline is the standardization of the color block definition. 
User space looks at the 'type', and if it supports it then it can look 
at other expected information such as 'lut_size', 'bit_depth', etc to 
determine the programming considerations.

The second we start having color blocks fully defined by private_flags 
and vendor specific blobs we end up with the same scenario we have today 
with vendor specific properties on our DRM CRTC and DRM PLANE objects. 
While we aren't going to make all the different OEM hardware match, we 
still want to encourage common approaches to block declaration so user 
space can easily identify functionality it supports across a wide range 
of hardware.


> +
> +For enabling or passing parameters to such blocks, the user can send data
> +to the driver wrapped within a blob like any other color operation block.
> +
> +	struct drm_color_op_data {
> +		.name = DRM_CB_PRIVATE;
> +		.blob_id = 46;
> +	} ;
> +
> +where blob with id 46 contains data to enable the fixed function hardware(s).
> +

All that said, thanks again for working on this. I'm definitely curious 
to see how this will all come together.

- Christopher

> +References
> +==========
> +
> +[1] https://gitlab.freedesktop.org/emersion/drm_info
> +[2] https://patchwork.freedesktop.org/patch/554827/?series=123018&rev=1
> +[3] https://patchwork.freedesktop.org/patch/554826/?series=123018&rev=1
> +[4] https://patchwork.freedesktop.org/series/123018/
