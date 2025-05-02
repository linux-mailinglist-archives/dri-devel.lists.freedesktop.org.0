Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1D8AA6C39
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 10:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB15D10E361;
	Fri,  2 May 2025 08:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GjBPt3EF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BD810E361
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 08:07:26 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64394353;
 Fri,  2 May 2025 10:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1746173231;
 bh=7bnGndJhxjIKSmPxWdEiSSiY/EIdp5jjPS9wr2yP5p8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GjBPt3EF01vx8CkzVgM8w1gIJcGeEnm1fL3hIojLdFYhRr0ho0s3S16Pg1kafuOrg
 MVPwNNT62AAsJzvR1rnGoygEyaaYcob8iH8e0GILBwRxVjcF5CRw1wG1UvgxCwdwEp
 n9sKI1s02a/Rwlh8OKP9e5S8JUaPD0B5mJHiLPnI=
Message-ID: <ce831f65-67d0-4f4c-9f08-3014b1d00dc0@ideasonboard.com>
Date: Fri, 2 May 2025 11:07:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/tidss: Update infrastructure to support K3 DSS
 cut-down versions
To: Devarsh Thakkar <devarsht@ti.com>
Cc: praneeth@ti.com, vigneshr@ti.com, aradhya.bhatia@linux.dev,
 s-jain1@ti.com, r-donadkar@ti.com, j-choudhary@ti.com, h-shenoy@ti.com,
 jyri.sarha@iki.fi, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 simona@ffwll.ch, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20250429143656.3252877-1-devarsht@ti.com>
 <20250429143656.3252877-3-devarsht@ti.com>
 <f729c0d6-45a0-4610-b22b-92c03f534bf7@ideasonboard.com>
 <1f8c43cd-8c26-4e42-b144-b91f5ffc2e2e@ti.com>
 <88993439-bfdc-418c-95c6-d6d8bdb5b87f@ideasonboard.com>
 <466254e9-145f-4839-9451-a5f282ff02e9@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <466254e9-145f-4839-9451-a5f282ff02e9@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 02/05/2025 10:06, Devarsh Thakkar wrote:
> Hi Tomi
> 
> Thanks for quick comments.
> 
> On 30/04/25 23:12, Tomi Valkeinen wrote:
>> On 30/04/2025 19:37, Devarsh Thakkar wrote:
>>> Hi Tomi
>>>
>>> Thanks for the review.
>>>
>>> <snip>
>>>>>     @@ -2025,7 +2101,7 @@ int dispc_plane_check(struct dispc_device
>>>>> *dispc, u32 hw_plane,
>>>>>                   const struct drm_plane_state *state,
>>>>>                   u32 hw_videoport)
>>>>>     {
>>>>> -    bool lite = dispc->feat->vid_lite[hw_plane];
>>>>> +    bool lite = dispc->feat->vid_info[hw_plane].is_lite;
>>>>
>>>> I don't think this is correct. You can't access the vid_info[] with the
>>>> hw-id.
>>>
>>> I don't think hw_id is getting passed to hw_plane here. The
>>> dispc_plane_check is called from tidss_plane_atomic_check which passes
>>> hw_plane as tplane->hw_plane_id and this index starts from actually
>>> instantiated planes i.e. from 0 and are contiguous as these are
>>
>> Well, if tplane->hw_plane_id is not the HW plane id (i.e. it's misnamed
>> now), and tidss_plane.c calls dispc_plane_enable() with tplane-
>>> hw_plane_id as the hw_plane parameter, which is used as a HW plane
>> ID... Then... One of these is wrong, no?
>>
> 
> As mentioned here [1], dispc_plane_enable acts on VID_* registers which
> are only mapped per the instantiated/actual pipes present in the SoC, so
> the indexing always starts from 0 and we need not worry about skipping
> un-instantiated planes.
> 
> So hw_plane_id -> Index of only instantiated planes starting from 0
> hw_id -> Hardware Index taking into account instantiated +
> un-instantiated/skipped planes main used for common0/1 region registers
> dealing with VID planes.
> 
> 
> For e.g. for AM62L which includes VIDL pipe
> hw_plane_id -> 0
> hw_id -> 1
> 
> 
>>> populated from vid_order array (hw_plane_id =
>>> feat->vid_order[tidss->num_planes];) and not the hw_id index.
>>>
>>> So for e.g. for AM62L even though hw_id is 1 for VIDL hw_plane is
>>> getting passed as 0 and that's how it is able to access the first and
>>> only member of vid_info struct and read the properties correctly and
>>> function properly as seen in test logs [1].
>>
>> If for AM62L the tplane->hw_plane_id is 0, the the dispc_plane_enable()
>> call would enable the wrong plane, wouldn't it?
>>
>> But even if it all works, I think this highlights how confusing it is...
>>
>>>
>>>>
>>>>>         u32 fourcc = state->fb->format->format;
>>>>>         bool need_scaling = state->src_w >> 16 != state->crtc_w ||
>>>>>             state->src_h >> 16 != state->crtc_h;
>>>>> @@ -2096,7 +2172,7 @@ void dispc_plane_setup(struct dispc_device
>>>>> *dispc, u32 hw_plane,
>>>>>                    const struct drm_plane_state *state,
>>>>>                    u32 hw_videoport)
>>>>>     {
>>>>> -    bool lite = dispc->feat->vid_lite[hw_plane];
>>>>> +    bool lite = dispc->feat->vid_info[hw_plane].is_lite;
>>>>
>>>> Here too.
>>>
>>> Here also hw_plane is getting passed as 0 and not the hw_id which is 1
>>> for AM62L.
>>>
>>>>
>>>>>         u32 fourcc = state->fb->format->format;
>>>>>         u16 cpp = state->fb->format->cpp[0];
>>>>>         u32 fb_width = state->fb->pitches[0] / cpp;
>>>>> @@ -2210,7 +2286,7 @@ static void dispc_k2g_plane_init(struct
>>>>> dispc_device *dispc)
>>>>>         /* MFLAG_START = MFLAGNORMALSTARTMODE */
>>>>>         REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
>>>>>     -    for (hw_plane = 0; hw_plane < dispc->feat->num_planes;
>>>>> hw_plane++) {
>>>>> +    for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
>>>>>             u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
>>>>>             u32 thr_low, thr_high;
>>>>>             u32 mflag_low, mflag_high;
>>>>> @@ -2226,7 +2302,7 @@ static void dispc_k2g_plane_init(struct
>>>>> dispc_device *dispc)
>>>>>               dev_dbg(dispc->dev,
>>>>>                 "%s: bufsize %u, buf_threshold %u/%u, mflag threshold
>>>>> %u/%u preload %u\n",
>>>>> -            dispc->feat->vid_name[hw_plane],
>>>>> +            dispc->feat->vid_info[hw_plane].name,
>>>>
>>>> Here hw_plane is not actually the hw-id (anymore), but elsewhere in this
>>>> function it is used as a hw-id, which is no longer correct.
>>>
>>> For accessing vid_info hw_plane needs to be used which is the index of
>>> actually instantiated planes and I see it as correctly being passed for
>>> AM62L too. hw_id is only for dispc_k3_vid* functions where we need to
>>> skip the not-instantiated vid regions by adding the offset per the hw_id
>>> index.
>>
>> Hmm, sorry, I don't follow. If we use the same variable, hw_plane, to
>> access the vid_info[], and as a parameter to functions that take
>> hw_plane, e.g., dispc_vid_set_buf_threshold(), isn't one of those uses
>> wrong?
>>
>> Oh, wait... I think I see it now. For some functions using the hw_id as
>> the hw_plane parameter is fine, as they access the VID's registers by
>> just using, e.g. dispc_vid_write(), which gets the address correctly
>> from dispc->base_vid[hw_plane], as that one is indexed from 0 to num_vids.
>>
> 
> Yes exactly.
> 
>> But some functions use registers that have bits based on the hw_id (like
>> dispc_k3_vid_write_irqstatus), and then we use the hw_id for the
>> hw_plane parameter. If that function were to also write a vid register,
>> using the passed hw_plane, it wouldn't work, but I guess we don't do that.
>>
> 
> Yes, hw_id is only for dispc_k3_vid* functions dealing with common
> region registers that play with VID pipes.
> 
>> It feels broken... We can't have 'hw_plane' that's sometimes the HW id
>> (i.e. 1 for AM62L), and sometimes the driver's index (i.e. 0 for AM62L).
>>
> 
> Sorry I don't follow, what exactly is broken here. hw_plane is for
> instantiated planes present in SoC used in context of VID* register
> space while doing reg writess and hw_id is the plane hardware index
> w.r.t larger K3 family i.e used in context for common register space.

We have, as an example, these two functions:

void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool 
enable)

static void dispc_k3_vid_write_irqstatus(struct dispc_device *dispc, u32 
hw_plane, dispc_irq_t vidstat)

When the caller calls these functions on AM62L, what does it provide in 
'hw_plane' when it wants to enable the first plane of write the 
irqstatus for the first plane? For dispc_plane_enable(), the caller uses 
0, for dispc_k3_vid_write_irqstatus(), the caller uses 1...

With a quick look at the code, changing the callers to pass the "old 
style" hw_plane as the parameter to those irq functions, and the 
functions internally get the hw_id, would solve most of the problems. 
There's still dispc_k3_set_irqenable() which manages 'main_disable' and 
needs the hw_id, but maybe that's fine, even if a bit confusing.

  Tomi

