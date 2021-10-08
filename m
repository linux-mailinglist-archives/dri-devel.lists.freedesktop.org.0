Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F4426606
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 10:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71506E86F;
	Fri,  8 Oct 2021 08:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E98E6E868;
 Fri,  8 Oct 2021 08:36:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="226415502"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="226415502"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 01:36:23 -0700
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="489374482"
Received: from tocallag-mobl2.ger.corp.intel.com (HELO [10.213.250.80])
 ([10.213.250.80])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 01:36:20 -0700
Subject: Re: [PATCH v3] drm/dp: Add Additional DP2 Headers
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@intel.com, Nicholas.Kazlauskas@amd.com, wayne.lin@amd.com
References: <20210927192324.5428-1-Jerry.Zuo@amd.com>
 <b2ce7b34-23f1-75c8-182e-3e7fe9b845e1@amd.com>
 <20210930212113.rsy5lbg3mhejvsdo@outlook.office365.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <06786045-115d-5b42-4ee1-33cd27d1b0c3@linux.intel.com>
Date: Fri, 8 Oct 2021 09:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930212113.rsy5lbg3mhejvsdo@outlook.office365.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


Hi,

Is it my checkout only or this causes a lot of build warnings for everyone?

./include/drm/drm_dp_helper.h:1120: warning: "DP_TEST_264BIT_CUSTOM_PATTERN_7_0" redefined
  1120 | #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0  0x2230
       |
In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:35,
                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                  from ./drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                  from drivers/gpu/drm/amd/amdgpu/amdgpu.h:66,
                  from drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:40:
./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dp_types.h:871: note: this is the location of the previous definition

Etc..

Regards,

Tvrtko


On 30/09/2021 22:21, Rodrigo Siqueira wrote:
> Applied to drm-misc-next.
> 
> Thanks
> 
> On 09/28, Harry Wentland wrote:
>> On 2021-09-27 15:23, Fangzhi Zuo wrote:
>>> Include FEC, DSC, Link Training related headers.
>>>
>>> Change since v2
>>> - Align with the spec for DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT
>>>
>>> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
>>
>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>
>> Harry
>>
>>> ---
>>> This patch is based on top of the other DP2.0 work in
>>> "drm/dp: add LTTPR DP 2.0 DPCD addresses"
>>> ---
>>>   include/drm/drm_dp_helper.h | 20 ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>
>>> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
>>> index 1d5b3dbb6e56..a1df35aa6e68 100644
>>> --- a/include/drm/drm_dp_helper.h
>>> +++ b/include/drm/drm_dp_helper.h
>>> @@ -453,6 +453,7 @@ struct drm_panel;
>>>   # define DP_FEC_UNCORR_BLK_ERROR_COUNT_CAP  (1 << 1)
>>>   # define DP_FEC_CORR_BLK_ERROR_COUNT_CAP    (1 << 2)
>>>   # define DP_FEC_BIT_ERROR_COUNT_CAP	    (1 << 3)
>>> +#define DP_FEC_CAPABILITY_1			0x091   /* 2.0 */
>>>   
>>>   /* DP-HDMI2.1 PCON DSC ENCODER SUPPORT */
>>>   #define DP_PCON_DSC_ENCODER_CAP_SIZE        0xC	/* 0x9E - 0x92 */
>>> @@ -537,6 +538,9 @@ struct drm_panel;
>>>   #define DP_DSC_BRANCH_OVERALL_THROUGHPUT_1  0x0a1
>>>   #define DP_DSC_BRANCH_MAX_LINE_WIDTH        0x0a2
>>>   
>>> +/* DFP Capability Extension */
>>> +#define DP_DFP_CAPABILITY_EXTENSION_SUPPORT	0x0a3	/* 2.0 */
>>> +
>>>   /* Link Configuration */
>>>   #define	DP_LINK_BW_SET		            0x100
>>>   # define DP_LINK_RATE_TABLE		    0x00    /* eDP 1.4 */
>>> @@ -688,6 +692,7 @@ struct drm_panel;
>>>   
>>>   #define DP_DSC_ENABLE                       0x160   /* DP 1.4 */
>>>   # define DP_DECOMPRESSION_EN                (1 << 0)
>>> +#define DP_DSC_CONFIGURATION				0x161	/* DP 2.0 */
>>>   
>>>   #define DP_PSR_EN_CFG				0x170   /* XXX 1.2? */
>>>   # define DP_PSR_ENABLE				BIT(0)
>>> @@ -743,6 +748,7 @@ struct drm_panel;
>>>   # define DP_RECEIVE_PORT_0_STATUS	    (1 << 0)
>>>   # define DP_RECEIVE_PORT_1_STATUS	    (1 << 1)
>>>   # define DP_STREAM_REGENERATION_STATUS      (1 << 2) /* 2.0 */
>>> +# define DP_INTRA_HOP_AUX_REPLY_INDICATION	(1 << 3) /* 2.0 */
>>>   
>>>   #define DP_ADJUST_REQUEST_LANE0_1	    0x206
>>>   #define DP_ADJUST_REQUEST_LANE2_3	    0x207
>>> @@ -865,6 +871,8 @@ struct drm_panel;
>>>   # define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
>>>   # define DP_PHY_TEST_PATTERN_CP2520         0x5
>>>   
>>> +#define DP_PHY_SQUARE_PATTERN				0x249
>>> +
>>>   #define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
>>>   #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
>>>   #define	DP_TEST_80BIT_CUSTOM_PATTERN_15_8   0x251
>>> @@ -1109,6 +1117,18 @@ struct drm_panel;
>>>   #define DP_128B132B_TRAINING_AUX_RD_INTERVAL   0x2216 /* 2.0 */
>>>   # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK 0x7f
>>>   
>>> +#define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0x2230
>>> +#define DP_TEST_264BIT_CUSTOM_PATTERN_263_256	0x2250
>>> +
>>> +/* DSC Extended Capability Branch Total DSC Resources */
>>> +#define DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT		0x2260	/* 2.0 */
>>> +# define DP_DSC_DECODER_COUNT_MASK			(0b111 << 5)
>>> +# define DP_DSC_DECODER_COUNT_SHIFT			5
>>> +#define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0	0x2270	/* 2.0 */
>>> +# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK	(1 << 0)
>>> +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK	(0b111 << 1)
>>> +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT	1
>>> +
>>>   /* Protocol Converter Extension */
>>>   /* HDMI CEC tunneling over AUX DP 1.3 section 5.3.3.3.1 DPCD 1.4+ */
>>>   #define DP_CEC_TUNNELING_CAPABILITY            0x3000
>>>
>>
> 
