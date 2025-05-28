Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD6AC695A
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 14:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B5A10E17D;
	Wed, 28 May 2025 12:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ekJwQ6Ox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F1910E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 12:32:52 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CD5DCF;
 Wed, 28 May 2025 14:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1748435542;
 bh=fEaipTSqAG5Q/Nf622n4EmU/RZPJUZ7c58BLiK7w5oo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ekJwQ6OxKTAKx5bF41MxJuqArh+ZaonP+1pD2Cwph8Qb/a/pU2k+fzA/qTf18+65P
 HtHTjUMgHo6e9bbi3ycZtpizouu0wPRB4vwLfm/M5JYVUpMQYfd6q5dt3tve72GE+p
 tb7ZU/40Rd412NbSWTMJ38bcKFVHCQCnHa2wiaSk=
Message-ID: <d19fe815-09cf-45f9-9f36-ff823216d17e@ideasonboard.com>
Date: Wed, 28 May 2025 15:32:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/3] drm/bridge: cadence: cdns-mhdp8546*: Change
 drm_connector from pointer to structure
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, jani.nikula@intel.com,
 andy.yan@rock-chips.com, mordan@ispras.ru, linux@treblig.org,
 viro@zeniv.linux.org.uk, yamonkar@cadence.com, sjakhade@cadence.com,
 quentin.schulz@free-electrons.com, jsarha@ti.com,
 linux-kernel@vger.kernel.org, devarsht@ti.com, dianders@chromium.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
 alexander.stein@ew.tq-group.com
References: <20250521073237.366463-1-j-choudhary@ti.com>
 <20250521073237.366463-3-j-choudhary@ti.com>
 <19dd2795-c693-4c1a-989c-8b3bc2b3cdfd@ideasonboard.com>
 <493afc6c-59a0-4f6b-9a9e-568dd2eff873@ti.com>
 <2a15263b-2d36-4c46-be0f-4145069d134f@ti.com>
 <027ad6e9-5070-43f2-a082-fd498cc6d31d@ideasonboard.com>
 <870d036a-0fa0-43e0-8b72-428096173526@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <870d036a-0fa0-43e0-8b72-428096173526@ti.com>
Content-Type: text/plain; charset=UTF-8
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

On 28/05/2025 14:25, Jayesh Choudhary wrote:
> Hi,
> 
> On 27/05/25 17:07, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 27/05/2025 13:39, Jayesh Choudhary wrote:
>>>
>>>
>>> On 27/05/25 14:59, Jayesh Choudhary wrote:
>>>> Hello Tomi,
>>>>
>>>> On 27/05/25 13:28, Tomi Valkeinen wrote:
>>>>> Hi,
>>>>>
>>>>> On 21/05/2025 10:32, Jayesh Choudhary wrote:
>>>>>> After adding DBANC framework, mhdp->connector is not initialised
>>>>>> during
>>>>>> bridge calls. But the asyncronous work scheduled depends on the
>>>>>> connector.
>>>>>> We cannot get to drm_atomic_state in these asyncronous calls
>>>>>> running on
>>>>>> worker threads. So we need to store the data that we need in mhdp
>>>>>> bridge
>>>>>> structure.
>>>>>> Like other bridge drivers, use drm_connector pointer instead of
>>>>>> structure
>>>>>> and make appropriate changes to the conditionals and assignments
>>>>>> related
>>>>>> to mhdp->connector.
>>>>>> Also, in the atomic enable call, move the connector  and connector
>>>>>> state
>>>>>> calls above, so that we do have a connector before we can retry the
>>>>>> asyncronous work in case of any failure.
>>>>>>
>>>>>
>>>>> I don't quite understand this patch. You change the mhdp->connector
>>>>> to a
>>>>> pointer, which is set at bridge_enable and cleared at bridge_disable.
>>>>> Then you change the "mhdp->connector.dev" checks to "mhdp->connector".
>>>>>
>>>>> So, now in e.g. cdns_mhdp_fw_cb(), we check for mhdp->connector, which
>>>>> is set at bridge_enable(). Can we ever have the bridge enabled before
>>>>> the fb has been loaded? What is the check even supposed to do there?
>>>>>
>>>>> Another in cdns_mhdp_hpd_work(), it checks for mhdp->connector. So...
>>>>> HPD code behaves differently based on if the bridge has been
>>>>> enabled or
>>>>> not? What is it supposed to do?
>>>>>
>>>>> Isn't the whole "if (mhdp->connector.dev)" code for the legacy
>>>>> non-DRM_BRIDGE_ATTACH_NO_CONNECTOR case?
>>>>>
>>>>>    Tomi
>>>>
>>>> I misinterpreted your comment in v1[0] regarding finding the connector
>>>> from the current state in cdns_mhdp_modeset_retry_fn() and I missed
>>>> this. I was more focused on finding a connector for that function.
>>>>
>>>> For the current code, in all the conditionals involving mhdp-
>>>> >connector,
>>>> we are entering else statements as connector is not initialised.
>>>> So I will just drop if statements in cdns_mhdp_fw_cb() and
>>>> cdns_mhdp_hpd_work() (like you said, its legacy case) while still
>>>> having
>>>> mhdp->connector as pointer as we need it for
>>>> cdns_mhdp_modeset_retry_fn() and in cdns-mhdp8546-hdcp driver.
>>>>
>>>> That should be okay?
>>>>
>>>> [0]: https://lore.kernel.org/all/e76f94b9-b138-46e7-bb18-
>>>> b33dd98c9abb@ideasonboard.com/
>>>>
>>>> Warm Regards,
>>>> Jayesh
>>>>
>>>>
>>>
>>> Tomi,
>>>
>>> One more thing here. Should this be squashed with the first patch as
>>> this is sort of removing !(DRM_BRIDGE_ATTACH_NO_CONNECTOR) case and
>>> associated changes?
>>
>>
>> All the legacy code should be removed in the previous patch, yes. But
>> it's not quite clear to me what's going on here. At least parts of this
>> patch seem to be... fixing some previous code? You move the
>> drm_atomic_get_new_connector_for_encoder() call to be earlier in the
>> bridge_enable. That doesn't sound like removing the legacy code. But
>> it's not quite clear to me why that's done (or why it wasn't needed
>> earlier. or was it?).
>>
>>   Tomi
>>
> 
> drm_atomic_get_new_connector_for_encoder() call is moved earlier
> in bridge_enable to address the cases when we get error in
> cdns_mhdp_link_up(mhdp) or cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR,
> &resp), and we goto 'out' to schedule modeset_retry_work. We need to
> have drm_connector before that if we want to change the connector
> link state here.
> 
> In legacy usecase we are not hitting this as attach already initialised
> mhdp->connector before bridge_enable() that would be used by
> cdns_mhdp_modeset_retry_fn() as required.
> 
> These errors usually don't hit during bridge_enable calls but in
> one of my boards, I saw cdns_mhdp_link_up() giving error and after
> that the null pointer dereference in cdns_mhdp_modeset_retry_fn()
> while trying to access the mutex there (&conn->dev->mode_config.mutex)

Okay, so moving the drm_atomic_get_new_connector_for_encoder() is a bug
fix, and should be a separate patch? But you can't do that until you
have changed the connector field to a pointer, and you can't do that
until you have removed the legacy code...

In theory that could be sorted out, but changing the connector field to
a pointer, while still keeping the legacy code, would be a bit laborious.

So, maybe keep the first patch, but split out the move of the
drm_atomic_get_new_connector_for_encoder() to a new third patch, so that
this one (2/3) would be only about changing the embedded connector field
to a pointer?

And a hint: If in the patch description you find yourself writing "Also,
...", it usually suggests that you might want to split the patch =).

 Tomi

