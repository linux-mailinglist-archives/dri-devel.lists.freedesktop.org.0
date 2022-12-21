Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B15652DF7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC7C10E437;
	Wed, 21 Dec 2022 08:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D91D10E033
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 07:48:18 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 382CAFB;
 Wed, 21 Dec 2022 08:48:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671608893;
 bh=xLGlmJ49yv1Q7TGAuFHXvIL5L5W0I+c0N9yg7y5HAGI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i+SksLExuZQ+nKV8M1hQ/OZC7SoBg82CbU65wxRBttIa6Q2K3r/8CpalPPhPxAypG
 kp/FgliNXjnjy4VvLu0xLvBiIeyd9CFeUe3N68AO3dvyNU+uReijEHViOYvLYYcW4a
 2IoBdxEfIV2lfI3odbI2mQBtTdW7KHJeONvUufZ0=
Message-ID: <ab2ee8d2-a775-0854-6012-dfe7cc13d24a@ideasonboard.com>
Date: Wed, 21 Dec 2022 09:48:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/7] media: renesas: vsp1: Change V3U to be gen4
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-4-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6DRNijZ243JWzUo@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y6DRNijZ243JWzUo@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 21 Dec 2022 08:29:21 +0000
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/12/2022 23:01, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Mon, Dec 19, 2022 at 04:01:35PM +0200, Tomi Valkeinen wrote:
>> V3U is actually gen4, not gen3. The same IP is also used in the
>> (not-yet-supported) V4H.
>>
>> Change VI6_IP_VERSION_MODEL_VSPD_V3U to VI6_IP_VERSION_MODEL_VSPD_GEN4,
>> to represent the model correctly. V3U and V4H can still be
>> differentiated, if needed, with the VI6_IP_VERSION_SOC_xxx.
>>
>> Also mark VI6_IP_VERSION_MODEL_VSPD_GEN4 as gen 4 in vsp1_device_info,
>> and update the code to correcly match for gen 4.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/media/platform/renesas/vsp1/vsp1_drv.c   |  4 ++--
>>   drivers/media/platform/renesas/vsp1/vsp1_hgo.c   |  4 ++--
>>   drivers/media/platform/renesas/vsp1/vsp1_lif.c   |  1 +
>>   drivers/media/platform/renesas/vsp1/vsp1_regs.h  |  2 +-
>>   drivers/media/platform/renesas/vsp1/vsp1_rpf.c   | 12 ++++++------
>>   drivers/media/platform/renesas/vsp1/vsp1_video.c |  4 ++--
>>   drivers/media/platform/renesas/vsp1/vsp1_wpf.c   |  4 ++--
>>   7 files changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> index c260d318d298..5710152d6511 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> @@ -818,9 +818,9 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>>   		.wpf_count = 2,
>>   		.num_bru_inputs = 5,
>>   	}, {
>> -		.version = VI6_IP_VERSION_MODEL_VSPD_V3U,
>> +		.version = VI6_IP_VERSION_MODEL_VSPD_GEN4,
>>   		.model = "VSP2-D",
>> -		.gen = 3,
>> +		.gen = 4,
>>   		.features = VSP1_HAS_BRU | VSP1_HAS_EXT_DL,
>>   		.lif_count = 1,
>>   		.rpf_count = 5,
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
>> index bf3f981f93a1..e6492deb0a64 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
>> @@ -196,10 +196,10 @@ struct vsp1_hgo *vsp1_hgo_create(struct vsp1_device *vsp1)
>>   
>>   	/* Initialize the control handler. */
>>   	v4l2_ctrl_handler_init(&hgo->ctrls.handler,
>> -			       vsp1->info->gen == 3 ? 2 : 1);
>> +			       vsp1->info->gen >= 3 ? 2 : 1);
>>   	hgo->ctrls.max_rgb = v4l2_ctrl_new_custom(&hgo->ctrls.handler,
>>   						  &hgo_max_rgb_control, NULL);
>> -	if (vsp1->info->gen == 3)
>> +	if (vsp1->info->gen >= 3)
>>   		hgo->ctrls.num_bins =
>>   			v4l2_ctrl_new_custom(&hgo->ctrls.handler,
>>   					     &hgo_num_bins_control, NULL);
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
>> index 186a5730e1e3..0ab2e0c70474 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
>> @@ -114,6 +114,7 @@ static void lif_configure_stream(struct vsp1_entity *entity,
>>   		break;
>>   
>>   	case VI6_IP_VERSION_MODEL_VSPD_GEN3:
>> +	case VI6_IP_VERSION_MODEL_VSPD_GEN4:
> 
> While this doesn't cause any functional change, it doesn't fall into the
> renaming explained in the commit message. I'd make a mention of it
> there.

The message says "update the code to correcly match for gen 4". (I see a 
typo there =)). Doesn't that cover this change? It's similar to the if() 
changes, where we now check for >= 3.

  Tomi

> Conditional-Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
>>   	default:
>>   		hbth = 0;
>>   		obth = 3000;
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
>> index 8928f4c6bb55..8c9333f76858 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
>> @@ -766,7 +766,7 @@
>>   #define VI6_IP_VERSION_MODEL_VSPD_V3	(0x18 << 8)
>>   #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
>>   #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
>> -#define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
>> +#define VI6_IP_VERSION_MODEL_VSPD_GEN4	(0x1c << 8)
>>   /* RZ/G2L SoCs have no version register, So use 0x80 as the model version */
>>   #define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x80 << 8)
>>   
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
>> index 75083cb234fe..045aa54f7998 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
>> @@ -133,18 +133,18 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>>   	 * a fixed alpha value set through the V4L2_CID_ALPHA_COMPONENT control
>>   	 * otherwise.
>>   	 *
>> -	 * The Gen3 RPF has extended alpha capability and can both multiply the
>> +	 * The Gen3+ RPF has extended alpha capability and can both multiply the
>>   	 * alpha channel by a fixed global alpha value, and multiply the pixel
>>   	 * components to convert the input to premultiplied alpha.
>>   	 *
>>   	 * As alpha premultiplication is available in the BRx for both Gen2 and
>> -	 * Gen3 we handle it there and use the Gen3 alpha multiplier for global
>> +	 * Gen3+ we handle it there and use the Gen3 alpha multiplier for global
>>   	 * alpha multiplication only. This however prevents conversion to
>>   	 * premultiplied alpha if no BRx is present in the pipeline. If that use
>>   	 * case turns out to be useful we will revisit the implementation (for
>>   	 * Gen3 only).
>>   	 *
>> -	 * We enable alpha multiplication on Gen3 using the fixed alpha value
>> +	 * We enable alpha multiplication on Gen3+ using the fixed alpha value
>>   	 * set through the V4L2_CID_ALPHA_COMPONENT control when the input
>>   	 * contains an alpha channel. On Gen2 the global alpha is ignored in
>>   	 * that case.
>> @@ -155,7 +155,7 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>>   		       (fmtinfo->alpha ? VI6_RPF_ALPH_SEL_ASEL_PACKED
>>   				       : VI6_RPF_ALPH_SEL_ASEL_FIXED));
>>   
>> -	if (entity->vsp1->info->gen == 3) {
>> +	if (entity->vsp1->info->gen >= 3) {
>>   		u32 mult;
>>   
>>   		if (fmtinfo->alpha) {
>> @@ -301,10 +301,10 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
>>   	}
>>   
>>   	/*
>> -	 * On Gen3 hardware the SPUVS bit has no effect on 3-planar
>> +	 * On Gen3+ hardware the SPUVS bit has no effect on 3-planar
>>   	 * formats. Swap the U and V planes manually in that case.
>>   	 */
>> -	if (vsp1->info->gen == 3 && format->num_planes == 3 &&
>> +	if (vsp1->info->gen >= 3 && format->num_planes == 3 &&
>>   	    fmtinfo->swap_uv)
>>   		swap(mem.addr[1], mem.addr[2]);
>>   
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
>> index 9d24647c8f32..544012fd1fe9 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
>> @@ -267,10 +267,10 @@ static int vsp1_video_pipeline_setup_partitions(struct vsp1_pipeline *pipe)
>>   	div_size = format->width;
>>   
>>   	/*
>> -	 * Only Gen3 hardware requires image partitioning, Gen2 will operate
>> +	 * Only Gen3+ hardware requires image partitioning, Gen2 will operate
>>   	 * with a single partition that covers the whole output.
>>   	 */
>> -	if (vsp1->info->gen == 3) {
>> +	if (vsp1->info->gen >= 3) {
>>   		list_for_each_entry(entity, &pipe->entities, list_pipe) {
>>   			unsigned int entity_max;
>>   
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
>> index 94e91d7bb56c..d0074ca00920 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
>> @@ -512,10 +512,10 @@ static void wpf_configure_partition(struct vsp1_entity *entity,
>>   	}
>>   
>>   	/*
>> -	 * On Gen3 hardware the SPUVS bit has no effect on 3-planar
>> +	 * On Gen3+ hardware the SPUVS bit has no effect on 3-planar
>>   	 * formats. Swap the U and V planes manually in that case.
>>   	 */
>> -	if (vsp1->info->gen == 3 && format->num_planes == 3 &&
>> +	if (vsp1->info->gen >= 3 && format->num_planes == 3 &&
>>   	    fmtinfo->swap_uv)
>>   		swap(mem.addr[1], mem.addr[2]);
>>   
> 

