Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7737DBCEE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 16:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518A910E0E2;
	Mon, 30 Oct 2023 15:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D606E10E0E2;
 Mon, 30 Oct 2023 15:52:30 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9d216597f64so297181666b.3; 
 Mon, 30 Oct 2023 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698681149; x=1699285949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qcBEi1lBI38DN/iPYBUEKFD33e1P8VGGwEZLkT86i0o=;
 b=f4FN5c+2AwhtsHhWCobNu4oVMQMXQLdemGVNbGjtQAhMCowzLZeTPQ8/afF149A/Dc
 Jhu7fRpXKS0MkbMwwPT6kxBXFSjvtNNDAGO9gyC9jvD+seWPvm1ApNPb8+eRbjpxfszy
 YTQlQidt2n96nV0ltlQxHriJjlSOOpxyGDQdNbODBDn/o8bDHI33GTPcl2uvwHZ1L9Dh
 gVQ//MC+uVTIsKV6G+4HTAtnRL8HnWhVqlWRuzBNSVDgEk3t84zsQTUkMmZuaNLSqoJu
 hgOrPLGVM74q7HIm46HRPthWhRoaQFRkeZ5dN9HAO3V4tlUP94oqenatQrPnmiF8gfVE
 VXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698681149; x=1699285949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qcBEi1lBI38DN/iPYBUEKFD33e1P8VGGwEZLkT86i0o=;
 b=bPB/+Zz48KgtCUdJQ0ehKwmNYjBTEnw6TWvoZ3w4pewEWzdbYE3dtZACctpyya7oby
 6wuLqv79KELRNLGy+bJ1nQ4HJG4YFgNRVRNbiw+D8oDZ3V2+GpU0NWcslI2HQe3BgO+z
 Ohlawe3ZQdWUeEVbb/s9QYFkKY+cyB7GsDWLvalRdMIrFDXXrHUyTN1ursMaH8WO0los
 wf6hSOqBH20+HxNB9F/G7WdL011YpdPt3C7ImPNhR8VhViVEURY5TrgXaqhAjD+xyCAE
 DRmx96OqeSD37w0vUCDK4Ib/XpsCRe2dKju/3T6foNVc5iK5mvY3HRRv5olRIYXutI05
 Qhfg==
X-Gm-Message-State: AOJu0YyfT2uDn6ysIAMt4uY+HfDDyIPnOz6Iod1r1u7UNL540XCx9nDi
 LgPRfaFLdTqclHtSKovbykc=
X-Google-Smtp-Source: AGHT+IGlois2Urfp4DO3dHoJNYIFRP6cbF1tyrafdH0gLp9u4cmMpfl/mWbX2MVvH6o1Af4Rzoxv1A==
X-Received: by 2002:a17:906:80da:b0:9d3:ccd1:a922 with SMTP id
 a26-20020a17090680da00b009d3ccd1a922mr2329078ejx.58.1698681149064; 
 Mon, 30 Oct 2023 08:52:29 -0700 (PDT)
Received: from [192.168.178.25] ([134.19.60.47])
 by smtp.gmail.com with ESMTPSA id
 lo10-20020a170906fa0a00b00993a37aebc5sm6100891ejb.50.2023.10.30.08.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 08:52:28 -0700 (PDT)
Message-ID: <403a0750-361e-4218-8c83-a085966349e4@gmail.com>
Date: Mon, 30 Oct 2023 16:52:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
 amdgpu_dm_setup_replay
Content-Language: en-US
To: Yuran Pereira <yuran.pereira@hotmail.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <DB3PR10MB683590457246A6625BAA6102E8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <dc2242cd-6522-4073-b376-edc2a9abc3d9@amd.com>
 <PH8PR12MB727953EE85D593EF25650454F9DCA@PH8PR12MB7279.namprd12.prod.outlook.com>
 <39ab34ec-209d-4176-b271-1a02e2976497@amd.com>
 <DB3PR10MB6835311E66539604DD442CBBE8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <DB3PR10MB6835311E66539604DD442CBBE8A3A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.10.23 um 02:48 schrieb Yuran Pereira:
> Hello,
> On Fri, Oct 27, 2023 at 11:57:45AM -0400, Hamza Mahfooz wrote:
>> On 10/27/23 11:55, Lakha, Bhawanpreet wrote:
>>> [AMD Official Use Only - General]
>>>
>>>
>>>
>>> There was a consensus to use memset instead of {0}. I remember making
>>> changes related to that previously.
>> Hm, seems like it's used rather consistently in the DM and in DC
>> though.
>>
> Have you decided which one should be used?
>
> Should I submit a v2 patch using {0} instead of memset?

The problem is that {0} doesn't initialize padding fields in structures.

So what can happen are problems like leaking bytes to userspace or 
getting unstable hash keys etc...

So I think memset() is usually preferred and that not only counts for Linux.

Regards,
Christian.

>
>
> Yuran Pereira
>>> Bhawan
>>>
>>> ------------------------------------------------------------------------
>>> *From:* Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
>>> *Sent:* October 27, 2023 11:53 AM
>>> *To:* Yuran Pereira <yuran.pereira@hotmail.com>; airlied@gmail.com
>>> <airlied@gmail.com>
>>> *Cc:* Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Lakha, Bhawanpreet
>>> <Bhawanpreet.Lakha@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira,
>>> Rodrigo <Rodrigo.Siqueira@amd.com>; linux-kernel@vger.kernel.org
>>> <linux-kernel@vger.kernel.org>; amd-gfx@lists.freedesktop.org
>>> <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org
>>> <dri-devel@lists.freedesktop.org>; Deucher, Alexander
>>> <Alexander.Deucher@amd.com>; Koenig, Christian
>>> <Christian.Koenig@amd.com>;
>>> linux-kernel-mentees@lists.linuxfoundation.org
>>> <linux-kernel-mentees@lists.linuxfoundation.org>
>>> *Subject:* Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
>>> amdgpu_dm_setup_replay
>>> On 10/26/23 17:25, Yuran Pereira wrote:
>>>> Since `pr_config` is not initialized after its declaration, the
>>>> following operations with `replay_enable_option` may be performed
>>>> when `replay_enable_option` is holding junk values which could
>>>> possibly lead to undefined behaviour
>>>>
>>>> ```
>>>>        ...
>>>>        pr_config.replay_enable_option |= pr_enable_option_static_screen;
>>>>        ...
>>>>
>>>>        if (!pr_config.replay_timing_sync_supported)
>>>>            pr_config.replay_enable_option &= ~pr_enable_option_general_ui;
>>>>        ...
>>>> ```
>>>>
>>>> This patch initializes `pr_config` after its declaration to ensure that
>>>> it doesn't contain junk data, and prevent any undefined behaviour
>>>>
>>>> Addresses-Coverity-ID: 1544428 ("Uninitialized scalar variable")
>>>> Fixes: dede1fea4460 ("drm/amd/display: Add Freesync Panel DM code")
>>>> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
>>>> ---
>>>>     drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 3 +++
>>>>     1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
>>>> index 32d3086c4cb7..40526507f50b 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
>>>> @@ -23,6 +23,7 @@
>>>>      *
>>>>      */
>>>> +#include <linux/string.h>
>>>>     #include "amdgpu_dm_replay.h"
>>>>     #include "dc.h"
>>>>     #include "dm_helpers.h"
>>>> @@ -74,6 +75,8 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struct amdgpu_dm_connector *ac
>>>>          struct replay_config pr_config;
>>> I would prefer setting pr_config = {0};
>>>
>>>>          union replay_debug_flags *debug_flags = NULL;
>>>> +     memset(&pr_config, 0, sizeof(pr_config));
>>>> +
>>>>          // For eDP, if Replay is supported, return true to skip checks
>>>>          if (link->replay_settings.config.replay_supported)
>>>>                  return true;
>>> -- 
>>> Hamza
>>>
>> -- 
>> Hamza
>>

