Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C390DAE43F9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 15:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D60B10E1E4;
	Mon, 23 Jun 2025 13:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kode54.net header.i=@kode54.net header.b="DuuONj0B";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="hrCRETXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A74E10E1E4;
 Mon, 23 Jun 2025 13:38:03 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id A5DF01140149;
 Mon, 23 Jun 2025 09:38:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Mon, 23 Jun 2025 09:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1750685882;
 x=1750772282; bh=XpttN5YtY4FHtv18lG5NubUylo/SyAsV2hjhDiGab2A=; b=
 DuuONj0B3Br30/klyNNSGbPBsDvQ7XQHysdLv9+gq6nTgVNXdv9ARO8724JYd1dH
 H0RjRb8mnSHFCgJiMJaO82jwbccEJYROPn/TnGmTTJtXSRF85SaBxOlU+C/hIHSG
 NetJWLCDYJtxYAj2w/5rlx0DCa0bbMhxk5GFTfPjwMdZwAe1SS7Y2hmV+xy3+Mzj
 iDTj7D/YlFnIlhW8H1ipvDIn8YfTE36W66sD7SW4KFAucpDC2Kj2XrRAkxXCEecF
 nEUOSF+bUaE+0DWv43Ra+fv6YV7QSgnenYe5QSDfcTgiBOI45w07i7B5ZAQti7ZB
 Dkj2c88zogmp+pLhiJXJPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750685882; x=
 1750772282; bh=XpttN5YtY4FHtv18lG5NubUylo/SyAsV2hjhDiGab2A=; b=h
 rCRETXJMnpYy0Wli41JZPZhAIvM6NRnoDyUGYAflG2k4AHvr/Nle8OAq0BI/80vv
 VGLzBysn0HSskYcRu83Ge8nR99d9iEscxzE8v2kvKStbWZQeN+4TIv/fTIh2Cse3
 dHSFkaUBU45tQWEp6xAefANHqeu5ZDR1M3BYB5jG8QpT7BJ3+Obw1TqEmfpWIKsH
 Jm50crdWxr8S7d+bluMzW7cnRMsxodcfXs90iOSCfvk0vwm46rpEfXarYYt5iujz
 DJJMyCoMO82Ku0VZrl+3JUmuRU0CTcD+MJkUAhLeXiV5qKwqGEFLEbLXdnc0EVNs
 bPkCjveNz93kZU6WVyduA==
X-ME-Sender: <xms:ulhZaIPtod_0aO7d8rmItbTbhcS0P_XGIwjSiRVfKXf2g8VJLoqu4Q>
 <xme:ulhZaO_uD4r7LpfKKcO0QULpdA63K41RAYTeVx5p9ocl8AXSrm-wNeBdFDVMk7qCG
 ArmOr2en8R6wMiPYd0>
X-ME-Received: <xmr:ulhZaPTNJ5e17glp9buA8sfIxCyEKP36x-P8neUEXUNxiitwMSm9icYDBz7It76r_nAG0B8cMB0kDWcA4J3sz0vtz4yJSLU4oA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdevhhhrihhs
 thhophhhvghrucfunhhofihhihhllhdfuceotghhrhhisheskhhouggvheegrdhnvghtqe
 enucggtffrrghtthgvrhhnpeeileetudejffegjeegfffhhffhkeefjefgtddujeehheev
 leevjeejffekieekveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegthhhrihhssehkohguvgehgedrnhgvthdpnhgspghrtghpthhtohepuddu
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkohguvgehgeesghhmrghilhdrtg
 homhdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhp
 rdhorhhgpdhrtghpthhtoheprghlvgigrghnuggvrhdruggvuhgthhgvrhesrghmugdrtg
 homhdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdp
 rhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvg
 hlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghp
 thhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlh
 hivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishht
 shdrfhhrvggvuggvshhkthhophdrohhrgh
X-ME-Proxy: <xmx:ulhZaAtVz9i9OKJur1d6qayizOMr0sT97GpsKznJTinc1gdSg-irpQ>
 <xmx:ulhZaAfcFsNXa7HAs3Wt_XZV4BNZR2CbJj51r2EUiSWfAAVZDgfZ0w>
 <xmx:ulhZaE2VxAM-KVfTypKo677QiRHhqQE3PHAA_l9_uDZvWPk5xlh0AQ>
 <xmx:ulhZaE9RcBQ_jnkfsxWr7QMuM_zBz8sn98w2p4-oL_0oXODuQfF50Q>
 <xmx:ulhZaN_22_eJgaMfvFabT3xOpjR0vslFf7BM2Q6-7HNJDzZ8GoRnV7bx>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 09:38:01 -0400 (EDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 06:38:01 -0700
Message-Id: <DATYCMWH1X28.NE3M8KJ3SPV9@kode54.net>
Cc: "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "David Airlie" <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] drm/amdgpu: Enable async flip for cursor planes
From: "Christopher Snowhill" <chris@kode54.net>
To: "Christopher Snowhill" <kode54@gmail.com>, <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250619125507.54384-1-kode54@gmail.com>
 <DARA1U86AS72.QOIEVZWCFPYC@kode54.net>
 <DATUOZZD8316.2INSL3KL5RA80@kode54.net>
 <DATV4CAOHVGV.1UJ803EX21II6@gmail.com>
In-Reply-To: <DATV4CAOHVGV.1UJ803EX21II6@gmail.com>
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

On Mon Jun 23, 2025 at 4:06 AM PDT, Christopher Snowhill wrote:
> On Mon Jun 23, 2025 at 3:46 AM PDT, Christopher Snowhill wrote:
>> On Fri Jun 20, 2025 at 3:10 AM PDT, Christopher Snowhill wrote:
>>> Here's another alternative change, which may be more thorough. It does
>>> seem to fix the issue, at least. The issue does indeed appear to be
>>> no-op plane changes sent to the cursor plane.
>>>
>>> If anyone wants to propose style changes, and suggest a proper commit
>>> message, if this is indeed a welcome fix for the problem, please let me
>>> know.
>>>
>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
>>> index c2726af6698e..b741939698e8 100644
>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>>> @@ -1087,17 +1087,22 @@ int drm_atomic_set_property(struct drm_atomic_s=
tate *state,
>>>  			}
>>>
>>>  			/* ask the driver if this non-primary plane is supported */
>>> -			if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY) {
>>> -				ret =3D -EINVAL;
>>> +			else if (plane->type !=3D DRM_PLANE_TYPE_PRIMARY) {
>>> +				ret =3D drm_atomic_plane_get_property(plane, plane_state,
>>> +								    prop, &old_val);
>>> +
>>> +				if (ret || old_val !=3D prop_value) {
>>> +					ret =3D -EINVAL;
>>>
>>> -				if (plane_funcs && plane_funcs->atomic_async_check)
>>> -					ret =3D plane_funcs->atomic_async_check(plane, state, true);
>>> +					if (plane_funcs && plane_funcs->atomic_async_check)
>>> +						ret =3D plane_funcs->atomic_async_check(plane, state, true);
>>>
>>> -				if (ret) {
>>> -					drm_dbg_atomic(prop->dev,
>>> -						       "[PLANE:%d:%s] does not support async flips\n",
>>> -						       obj->id, plane->name);
>>> -					break;
>>> +					if (ret) {
>>> +						drm_dbg_atomic(prop->dev,
>>> +							       "[PLANE:%d:%s] does not support async flips\n",
>>> +							       obj->id, plane->name);
>>> +						break;
>>> +					}
>>>  				}
>>>  			}
>>>  		}
>>
>> Upon further testing and reflection, I have come to the conclusion that
>> this is indeed best handled by a kernel fix, rather than breaking user
>> space.
>>
>> I attempted to work around this in wlroots, adjusting 0.18, 0.19, and
>> 0.20 git with similar patches. First I attempted to stash all the
>> written properties for the atomic code, storing an initial value of all
>> 0xFE so it was always likely to write the first time, and only setting a
>> property if it changed from the last commit.
>>
>> This resulted in whole commits breaking for one or both framebuffers
>> until I ctrl-alt-fx switched to a tty and back again, and this would
>> work again temporarily.
>>
>> So I went back to the drawing board and only withheld seemingly
>> duplicate plane properties. This "worked", until I attempted to play a
>> game, and then it started glitching spectacularly, and not updating at
>> all if the game was doing direct scanout and vrr.
>>
>> Clearly this is wrong.
>>
>> The wlroots library queues up properties for each commit. On every
>> commit where the cursor is disabled, it queues up both fb_id=3D0 and
>> crtc_id=3D0. Every commit. Is this wrong? Should it only be queueing up
>> the disablement properties once? It also queues up the full plane and
>> hotspot properties when enabled, even if the cursor doesn't change
>> position or appearance.
>
> Probably should have CC'd the drm misc maintainers when I started poking
> drm misc instead of amdgpu. Pity there isn't a list for that...

I am a dumbass, I didn't notice get_maintainer.pl. Added more people,
and the correct list. Not sure if I should remove amd-gfx, since this
affects them, somewhat...

However, the intention of this thread was to seek commentary on the
situation as it is.
