Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3510AAA51C1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 18:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C24910E7F4;
	Wed, 30 Apr 2025 16:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="YO8E7UOW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E4310E7F4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 16:37:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53UGbPFO3433713
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Apr 2025 11:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1746031045;
 bh=b3dp5KW7OreVaxGvi8WjnNnrvEUPu4U0ZEyTIjYYRug=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=YO8E7UOWV/1k49uebg0Dz8gWLfFkhIrgGdvBeQFYhxNuxkMQIjoJOcJnnLBi8Ce1M
 AsEdzDYxO27bgI4VExootBdBHvPP4aKwS1OL4V5n9adS7Fzceg3/aTU0BBtu1AcRp7
 NAbuziNBWconD3zY9N3zWJcX75jTKharo3hLOAuY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53UGbPE9009237
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Apr 2025 11:37:25 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Apr 2025 11:37:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Apr 2025 11:37:24 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.227.193])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53UGbInj068775;
 Wed, 30 Apr 2025 11:37:19 -0500
Message-ID: <1f8c43cd-8c26-4e42-b144-b91f5ffc2e2e@ti.com>
Date: Wed, 30 Apr 2025 22:07:18 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v5 2/3] drm/tidss: Update infrastructure to support K3 DSS
 cut-down versions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
 <h-shenoy@ti.com>, <jyri.sarha@iki.fi>, <airlied@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>
References: <20250429143656.3252877-1-devarsht@ti.com>
 <20250429143656.3252877-3-devarsht@ti.com>
 <f729c0d6-45a0-4610-b22b-92c03f534bf7@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <f729c0d6-45a0-4610-b22b-92c03f534bf7@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Tomi

Thanks for the review.

<snip>
>>   @@ -2025,7 +2101,7 @@ int dispc_plane_check(struct dispc_device
>> *dispc, u32 hw_plane,
>>                 const struct drm_plane_state *state,
>>                 u32 hw_videoport)
>>   {
>> -    bool lite = dispc->feat->vid_lite[hw_plane];
>> +    bool lite = dispc->feat->vid_info[hw_plane].is_lite;
> 
> I don't think this is correct. You can't access the vid_info[] with the
> hw-id.

I don't think hw_id is getting passed to hw_plane here. The
dispc_plane_check is called from tidss_plane_atomic_check which passes
hw_plane as tplane->hw_plane_id and this index starts from actually
instantiated planes i.e. from 0 and are contiguous as these are
populated from vid_order array (hw_plane_id =
feat->vid_order[tidss->num_planes];) and not the hw_id index.

So for e.g. for AM62L even though hw_id is 1 for VIDL hw_plane is
getting passed as 0 and that's how it is able to access the first and
only member of vid_info struct and read the properties correctly and
function properly as seen in test logs [1].

> 
>>       u32 fourcc = state->fb->format->format;
>>       bool need_scaling = state->src_w >> 16 != state->crtc_w ||
>>           state->src_h >> 16 != state->crtc_h;
>> @@ -2096,7 +2172,7 @@ void dispc_plane_setup(struct dispc_device
>> *dispc, u32 hw_plane,
>>                  const struct drm_plane_state *state,
>>                  u32 hw_videoport)
>>   {
>> -    bool lite = dispc->feat->vid_lite[hw_plane];
>> +    bool lite = dispc->feat->vid_info[hw_plane].is_lite;
> 
> Here too.

Here also hw_plane is getting passed as 0 and not the hw_id which is 1
for AM62L.

> 
>>       u32 fourcc = state->fb->format->format;
>>       u16 cpp = state->fb->format->cpp[0];
>>       u32 fb_width = state->fb->pitches[0] / cpp;
>> @@ -2210,7 +2286,7 @@ static void dispc_k2g_plane_init(struct
>> dispc_device *dispc)
>>       /* MFLAG_START = MFLAGNORMALSTARTMODE */
>>       REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
>>   -    for (hw_plane = 0; hw_plane < dispc->feat->num_planes;
>> hw_plane++) {
>> +    for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
>>           u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
>>           u32 thr_low, thr_high;
>>           u32 mflag_low, mflag_high;
>> @@ -2226,7 +2302,7 @@ static void dispc_k2g_plane_init(struct
>> dispc_device *dispc)
>>             dev_dbg(dispc->dev,
>>               "%s: bufsize %u, buf_threshold %u/%u, mflag threshold
>> %u/%u preload %u\n",
>> -            dispc->feat->vid_name[hw_plane],
>> +            dispc->feat->vid_info[hw_plane].name,
> 
> Here hw_plane is not actually the hw-id (anymore), but elsewhere in this
> function it is used as a hw-id, which is no longer correct.

For accessing vid_info hw_plane needs to be used which is the index of
actually instantiated planes and I see it as correctly being passed for
AM62L too. hw_id is only for dispc_k3_vid* functions where we need to
skip the not-instantiated vid regions by adding the offset per the hw_id
index.

> 
>>               size,
>>               thr_high, thr_low,
>>               mflag_high, mflag_low,
>> @@ -2265,7 +2341,7 @@ static void dispc_k3_plane_init(struct
>> dispc_device *dispc)
>>       /* MFLAG_START = MFLAGNORMALSTARTMODE */
>>       REG_FLD_MOD(dispc, DISPC_GLOBAL_MFLAG_ATTRIBUTE, 0, 6, 6);
>>   -    for (hw_plane = 0; hw_plane < dispc->feat->num_planes;
>> hw_plane++) {
>> +    for (hw_plane = 0; hw_plane < dispc->feat->num_vids; hw_plane++) {
>>           u32 size = dispc_vid_get_fifo_size(dispc, hw_plane);
>>           u32 thr_low, thr_high;
>>           u32 mflag_low, mflag_high;
>> @@ -2281,7 +2357,7 @@ static void dispc_k3_plane_init(struct
>> dispc_device *dispc)
>>             dev_dbg(dispc->dev,
>>               "%s: bufsize %u, buf_threshold %u/%u, mflag threshold
>> %u/%u preload %u\n",
>> -            dispc->feat->vid_name[hw_plane],
>> +            dispc->feat->vid_info[hw_plane].name,
> 
> And here.
> 
> All these issues make me wonder whether we have the right model. It's
> just too easy to get the usage wrong.
> 
> I'm not sure which way to go here.
> 
> Fix the current issues? It's a bit cumbersome to go from hw-id to the
> index (needs a search), just to get some hw properties.
> 
> Or go back to the earlier one, with a vid array containing unused slots?
> That makes the for loops a bit harder.
> 
> I need to think about it...
> 

Hmm, I don't think so, it seems to look fine to me and work fine too. I
have tested thoroughly for AM62L (which has uninstantiated vid region)
along with AM62x and AM62A with all planes displayed simultaneously. If
you want I can put on some test logs, create some dummy holes for VID
regions in AM62 and AM62A to put this on to some further negative tests.

Also if naming convention is confusing (hw_id vs hw_plane) then maybe we
can use something else like vid_idx ??

[1]: https://gist.github.com/devarsht/82505ca69f0bd5d9788bfc240d2e83d4

Regards
Devarsh
