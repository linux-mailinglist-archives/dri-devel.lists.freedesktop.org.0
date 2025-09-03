Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FD8B4256D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1BF10E8C7;
	Wed,  3 Sep 2025 15:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tJkHJfIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688B010E8C3;
 Wed,  3 Sep 2025 15:29:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B3E860248;
 Wed,  3 Sep 2025 15:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59403C4CEE7;
 Wed,  3 Sep 2025 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756913369;
 bh=ztrictOOXdKIOkZOv0vYw2oH6HTP2dFEhJNp2iYtftY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tJkHJfIlL+zKnBEtSDv4HCm/ViYjPOBC8zlDC7w2Srb3VZIA2c0Z8ev4XTcN+TfnW
 IGYL3t7dn+F4Uj+pUrzRnJDy5QnsYQKS9bLPSppvDTFwjCrTdEt7g/6pdIp5OXOaMt
 bk1d2aniL4RBlyGafV3k5qOQsm+JcXMrhtpS+ZrqvrYgzHy1/OLBX3RXzUF9kieg4/
 v92qiGfbvefKM1DRSFR/Fxm8t6UczfgA75Hyd9/fjHi+XAmUhteNhsLVh/Sk8RcFBI
 FcuxaSxKaKvTZZq3YzxVXgmOo1f/sHCbeJGvRcmbYfjP4JT7xJFdv7DvFSAvMC9DHk
 0iXpPf8wd6TOw==
Message-ID: <f5581961-2e47-4cd4-86e9-47ec37f71c06@kernel.org>
Date: Wed, 3 Sep 2025 10:29:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm: panel-backlight-quirks: Log applied panel
 brightness quirks
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Antheas Kapenekakis <lkml@antheas.dev>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "philm@manjaro.org" <philm@manjaro.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>
References: <20250829145541.512671-1-lkml@antheas.dev>
 <20250829145541.512671-7-lkml@antheas.dev>
 <CAGwozwHaWPwy6_LTvTy4ybdrN27fEXc-GbhYEt4_cM88_VGYPA@mail.gmail.com>
 <588626d9-eb27-4376-8741-a1cc2e2e17cf@kernel.org>
 <BL1PR12MB5144E131D87B8B6584CF297DF701A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <BL1PR12MB5144E131D87B8B6584CF297DF701A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 9/3/25 10:03 AM, Deucher, Alexander wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Mario Limonciello <superm1@kernel.org>
>> Sent: Wednesday, September 3, 2025 12:53 AM
>> To: Antheas Kapenekakis <lkml@antheas.dev>; amd-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org;
>> philm@manjaro.org; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig,
>> Christian <Christian.Koenig@amd.com>; Robert Beckett
>> <bob.beckett@collabora.com>
>> Subject: Re: [PATCH v3 6/6] drm: panel-backlight-quirks: Log applied panel
>> brightness quirks
>>
>> On 8/29/2025 10:01 AM, Antheas Kapenekakis wrote:
>>> On Fri, 29 Aug 2025 at 16:57, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>>
>>>> Currently, when a panel brightness quirk is applied, there is no log
>>>> indicating that a quirk was applied. Unwrap the drm device on its own
>>>> and use drm_info() to log when a quirk is applied.
>>>>
>>>> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Besides the one thing you identified this looks fine to me.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

>>>> ---
>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 +++++++++++++---
>>>>    1 file changed, 13 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> index 263f15f6fdea..2a3e17d83d6e 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> @@ -3617,13 +3617,15 @@ static void update_connector_ext_caps(struct
>> amdgpu_dm_connector *aconnector)
>>>>           struct drm_connector *conn_base;
>>>>           struct amdgpu_device *adev;
>>>>           struct drm_luminance_range_info *luminance_range;
>>>> +       struct drm_device *drm;
>>>>
>>>>           if (aconnector->bl_idx == -1 ||
>>>>               aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
>>>>                   return;
>>>>
>>>>           conn_base = &aconnector->base;
>>>> -       adev = drm_to_adev(conn_base->dev);
>>>> +       drm = conn_base->dev;
>>>> +       adev = drm_to_adev(drm);
>>>>
>>>>           caps = &adev->dm.backlight_caps[aconnector->bl_idx];
>>>>           caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
>>>> @@ -3659,12 +3661,20 @@ static void update_connector_ext_caps(struct
>> amdgpu_dm_connector *aconnector)
>>>>           panel_backlight_quirk =
>>>>                   drm_get_panel_backlight_quirk(aconnector->drm_edid);
>>>>           if (!IS_ERR_OR_NULL(panel_backlight_quirk)) {
>>>> -               if (panel_backlight_quirk->min_brightness)
>>>> +               if (panel_backlight_quirk->min_brightness) {
>>>> +                       drm_info(drm,
>>>> +                                "Applying panel backlight quirk, min_brightness: %d\n",
>>>> +
>>>> + panel_backlight_quirk->min_brightness);
>>>
>>> mmm, needs a -1 here
>>>
>>
>> You may as well re-order it too so that you set caps->min_input_signal and access
>> it in this message.
>>
> 
> With that fixed up, the series is:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> 
> 

I've added a manual fixup for that change in the last patch and pushed 
the series to drm-misc-next.

a3ae3384be770 (HEAD -> drm-misc-next, drm-misc/for-linux-next, 
drm-misc/drm-misc-next) drm: panel-backlight-quirks: Log applied panel 
brightness quirks
bf0365b005d9a drm: panel-backlight-quirks: Add Steam Deck brightness quirk
aef10b1138e99 drm: panel-backlight-quirks: Add brightness mask quirk
f7033fab81d82 drm: panel-backlight-quirks: Add secondary DMI match
6eee1ef9e5985 drm: panel-backlight-quirks: Convert brightness quirk to 
generic structure
9931e4be11f21 drm: panel-backlight-quirks: Make EDID match optional
