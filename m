Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BDAE6141
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFAF10E55C;
	Tue, 24 Jun 2025 09:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="LM1KqDf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04AB10E56F;
 Tue, 24 Jun 2025 09:47:52 +0000 (UTC)
Received: from [192.168.42.116] (pd9e59880.dip0.t-ipconnect.de
 [217.229.152.128]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 514E92FC01F5;
 Tue, 24 Jun 2025 11:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1750758469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=on//GmR4nzs5aJ9qGxop0qW8vJ8usF/fHdQ8L17zNjw=;
 b=LM1KqDf3fR0y1TyHEUX8QqwDi3SSHYjWIP0lxmQyKJoyocpL4YTl/mmqBIrwD0NoptgjQF
 ElxvAoTphlq+YqFptwRKeq2YRmuJRBepdG/Ygkxc7EvSFlaJyHvbXYSfJ6Sst96JYF9nxr
 xZxsOMhXEN5szeUbp2BA3XsmnSRZuWo=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <f551abbd-b901-4779-9bd9-c87981690460@tuxedocomputers.com>
Date: Tue, 24 Jun 2025 11:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amd/display: Add quirk to force backlight type on
 some TUXEDO devices
To: Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Hung, Alex" <Alex.Hung@amd.com>, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
References: <20250409163029.130651-1-wse@tuxedocomputers.com>
 <20250409163029.130651-2-wse@tuxedocomputers.com>
 <08ceaa42-a12c-4bd4-bb75-b71126a60688@tuxedocomputers.com>
 <dnu7mbrw7fs4qvwi2alvgrqvonsrucrq7hgxgkqyyqn5djzkkj@c7grkpftjbw4>
 <8c048899-e307-4229-8165-fa70d001176e@amd.com>
 <293be5bc-11ad-49b8-a549-864ce4016f14@tuxedocomputers.com>
 <2de286af-fcfe-414c-b951-384e1acae89f@amd.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <2de286af-fcfe-414c-b951-384e1acae89f@amd.com>
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


Am 24.06.25 um 07:45 schrieb Mario Limonciello:
> On 6/24/2025 12:42 AM, Werner Sembach wrote:
>> Hi Mario,
>>
>> Am 23.06.25 um 21:42 schrieb Limonciello, Mario:
>>> On 6/23/25 2:13 PM, Rodrigo Siqueira wrote:
>>>> On 06/23, Werner Sembach wrote:
>>>>> gentle bump
>>>>>
>>>>> Am 09.04.25 um 18:27 schrieb Werner Sembach:
>>>>>> The display backlight on TUXEDO Polaris AMD Gen2 and Gen3 with panels
>>>>>> BOE 2420 and BOE 2423 must be forced to pwn controlled to be able to
>>>>>> control the brightness.
>>>>>>
>>>>>> This could already be archived via a module parameter, but this patch adds
>>>>>> a quirk to apply this by default on the mentioned device + panel
>>>>>> combinations.
>>>>>>
>>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>>>> Cc: stable@vger.kernel.org
>>>>>> ---
>>>>>>     .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 ++++++++++++ ++++++-
>>>>>>     1 file changed, 31 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/ 
>>>>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> index 39df45f652b32..2bad6274ad8ff 100644
>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>>> @@ -1625,11 +1625,13 @@ static bool dm_should_disable_stutter(struct 
>>>>>> pci_dev *pdev)
>>>>>>     struct amdgpu_dm_quirks {
>>>>>>         bool aux_hpd_discon;
>>>>>>         bool support_edp0_on_dp1;
>>>>>> +    bool boe_2420_2423_bl_force_pwm;
>>>>>>     };
>>>>>>     static struct amdgpu_dm_quirks quirk_entries = {
>>>>>>         .aux_hpd_discon = false,
>>>>>> -    .support_edp0_on_dp1 = false
>>>>>> +    .support_edp0_on_dp1 = false,
>>>>>> +    .boe_2420_2423_bl_force_pwm = false
>>>>>>     };
>>>>>>     static int edp0_on_dp1_callback(const struct dmi_system_id *id)
>>>>>> @@ -1644,6 +1646,12 @@ static int aux_hpd_discon_callback(const struct 
>>>>>> dmi_system_id *id)
>>>>>>         return 0;
>>>>>>     }
>>>>>> +static int boe_2420_2423_bl_force_pwm_callback(const struct 
>>>>>> dmi_system_id *id)
>>>>>> +{
>>>>>> +    quirk_entries.boe_2420_2423_bl_force_pwm = true;
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>>     static const struct dmi_system_id dmi_quirk_table[] = {
>>>>>>         {
>>>>>>             .callback = aux_hpd_discon_callback,
>>>>>> @@ -1722,6 +1730,20 @@ static const struct dmi_system_id 
>>>>>> dmi_quirk_table[] = {
>>>>>>                 DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteBook 665 16 inch G11 
>>>>>> Notebook PC"),
>>>>>>             },
>>>>>>         },
>>>>>> +    {
>>>>>> +        // TUXEDO Polaris AMD Gen2
>>>>>> +        .callback = boe_2420_2423_bl_force_pwm_callback,
>>>>>> +        .matches = {
>>>>>> +            DMI_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>>>>>> +        },
>>>>>> +    },
>>>>>> +    {
>>>>>> +        // TUXEDO Polaris AMD Gen3
>>>>>> +        .callback = boe_2420_2423_bl_force_pwm_callback,
>>>>>> +        .matches = {
>>>>>> +            DMI_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>>>>>> +        },
>>>>>> +    },
>>>>>>         {}
>>>>>>         /* TODO: refactor this from a fixed table to a dynamic option */
>>>>>>     };
>>>>>> @@ -3586,6 +3608,7 @@ static void update_connector_ext_caps(struct 
>>>>>> amdgpu_dm_connector *aconnector)
>>>>>>         struct amdgpu_device *adev;
>>>>>>         struct drm_luminance_range_info *luminance_range;
>>>>>>         int min_input_signal_override;
>>>>>> +    u32 panel;
>>>>>>         if (aconnector->bl_idx == -1 ||
>>>>>>             aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
>>>>>> @@ -3610,6 +3633,13 @@ static void update_connector_ext_caps(struct 
>>>>>> amdgpu_dm_connector *aconnector)
>>>>>>             caps->aux_support = false;
>>>>>>         else if (amdgpu_backlight == 1)
>>>>>>             caps->aux_support = true;
>>>>>> +    else if (amdgpu_backlight == -1 &&
>>>>>> +         quirk_entries.boe_2420_2423_bl_force_pwm) {
>>>>>> +        panel = drm_edid_get_panel_id(aconnector->drm_edid);
>>>>>> +        if (panel == drm_edid_encode_panel_id('B', 'O', 'E', 0x0974) ||
>>>>>> +            panel == drm_edid_encode_panel_id('B', 'O', 'E', 0x0977))
>>>>>> +            caps->aux_support = false;
>>>>>> +    }
>>>> It lgtm,
>>>>
>>>> Additionally, I believe this is safe to merge since it only affects a
>>>> specific device. Perhaps display folks would like to include this as
>>>> part of this week's promotion? Anyway, Cc other devs from the display.
>>>>
>>>> Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>
>>> That's a bit odd that aux based B/L control wouldn't work. Are these
>>> both OLED panels?  What debugging have you done thus far with them?
>>> What kernel base?
>>>
>>> Could you repro on 6.16-rc3?
>>
>> Sadly our archive is missing this panel + device combination. This patch is 
>> based on our install script that sets this fix via boot parameters since the 
>> release of these devices.
>>
>> So the quirk is field proven, but I can't actively test it anymore.
>>
>> Best regards,
>>
>> Werner
>>
>
> Do you recall what kernel version you were doing it with?  I'm just wondering 
> if AUX brightness control had a bug with such a kernel.
We shipped the device in 2021 with Ubuntu focal, so the kernel probably was 5.8 
or 5.11 (in theory it also could have been 5.4 or whatever the Ubuntu OEM kernel 
was at that time).
>
> Do you have this panel on some other hardware perhaps? 
Probably not. I will ask however.
> Or could you send a call out to get some testing done?

An idea I also had in the past to plug this and similar holes in your archive, 
but no "process" for this in place yet.

Best regards,

Werner

>
>>>
>>>>>>         if (caps->aux_support)
>>>>>> aconnector->dc_link->backlight_control_type = BACKLIGHT_CONTROL_AMD_AUX;
>
