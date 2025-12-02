Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D5BC9C977
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 19:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D722710E676;
	Tue,  2 Dec 2025 18:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="qw7tZ+Kw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08AC10E6A2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 18:19:05 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLTYf1Tlrz9t0J;
 Tue,  2 Dec 2025 19:19:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1764699542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g53S91+c/Gch116GtLv/TmzFVDQ7Kv2v/HyXanlFEPY=;
 b=qw7tZ+Kwn+gflfZouHmuBOkJrG43Z43qidi+BoA5JA8eJPRQ78owJaXgZ/D1s71hhJwTSH
 17QjST0vTcu0kWp+OXa795jzCh8kVpDDiHbd6jSOvt25QgTQs6yBQzd0YIep3og3uf2PP2
 rip9k+XDsV34D3icWGCOXuU4blc9PhOPDqJkOr8pWJfy8giUjDMa7qIWuI68/uF20+lAwG
 YBQhuQ0L4R0CXwiFf1l35vIUrmINDUvrF3JTXJgWOt+mw25LbB3HWDalJr/t7CejHuIywH
 o6SGnm4DwZzYr7pOKsLBAn46xRLJaJcV5qtuQGyQK3iA3xLuKA9loSftQdIpWA==
Message-ID: <31ce0f27-b716-4b3a-b6b6-35bcee0a33f3@mailbox.org>
Date: Tue, 2 Dec 2025 19:18:58 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and
 !DRM_MODE_FLAG_P.SYNC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251107230419.471866-1-marek.vasut+renesas@mailbox.org>
 <20251107232329.GI5558@pendragon.ideasonboard.com>
 <f92e90f1-2bc3-49c2-a6e4-40dcf63cb0e1@mailbox.org>
 <20251201060931.GC21943@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251201060931.GC21943@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 38cc291c0b03b13ee4e
X-MBO-RS-META: u11sdtkxgishbai7ytegta1bfsx3p33o
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

On 12/1/25 7:09 AM, Laurent Pinchart wrote:

Hello Laurent,

> On Tue, Nov 25, 2025 at 09:13:02PM +0100, Marek Vasut wrote:
>> On 11/8/25 12:23 AM, Laurent Pinchart wrote:
>>> On Sat, Nov 08, 2025 at 12:04:10AM +0100, Marek Vasut wrote:
>>>> Since commit 94fe479fae96 ("drm/rcar-du: dsi: Clean up handling of DRM mode flags")
>>>> the driver does not set TXVMVPRMSET0R_VSPOL_LOW and TXVMVPRMSET0R_HSPOL_LOW
>>>> for modes which set neither DRM_MODE_FLAG_[PN].SYNC.
>>>
>>> Could you please explain what broke ?
> 
> Sorry, I wasn't clear. I meant could you summarize the explanation in
> the commit message ?
> 
>> Consider mode->flags, V-ones for simplicity:
>>
>> Before 94fe479fae96 :
>>
>> DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
>> DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>> Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>>
>> After 94fe479fae96 :
>>
>> DRM_MODE_FLAG_PVSYNC => vprmset0r |= 0
>> DRM_MODE_FLAG_NVSYNC => vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW
>> Neither DRM_MODE_FLAG_[PN]VSYNC => vprmset0r |= 0 <---------- This broke
>>
>> The "Neither" case behavior is different. I did not realize that:
>>
>> DRM_MODE_FLAG_N[HV]SYNC is not equivalent !DRM_MODE_FLAG_P[HV]SYNC
>>
>> They really are not equivalent .
>>
>> [...]
>>
>>>>    	/* Configuration for Video Parameters, input is always RGB888 */
>>>>    	vprmset0r = TXVMVPRMSET0R_BPP_24;
>>>> -	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>>>> +	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
>>>> +	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
>>>>    		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
>>>
>>> I don't think this restores the previous behaviour. You would need to
>>> write
>>>
>>> 	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
>>> 		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
>>
>> This patch covers both the N[HV]SYNC and !P[HV]SYNC , so that should
>> restore the behavior to "Before" and explicitly be clear that N[HV]SYNC
>> and !P[HV]SYNC are not the same thing.
> 
> Before commit 94fe479fae96 we had
> 
> 	vprmset0r = (mode->flags & DRM_MODE_FLAG_PVSYNC ?
> 		     TXVMVPRMSET0R_VSPOL_HIG : TXVMVPRMSET0R_VSPOL_LOW)
> 		  | (mode->flags & DRM_MODE_FLAG_PHSYNC ?
> 		     TXVMVPRMSET0R_HSPOL_HIG : TXVMVPRMSET0R_HSPOL_LOW)
> 		  | TXVMVPRMSET0R_CSPC_RGB | TXVMVPRMSET0R_BPP_24;
> 
> Considering the vertical sync for simplicity, this gives us
> 
> NVSYNC \ PVSYNC		0		1
>   0			VSPOL_LOW	VSPOL_HIG
>   1			VSPOL_LOW	VSPOL_HIG
> 
> With this patch, the code becomes
> 
> 	/* Configuration for Video Parameters, input is always RGB888 */
> 	vprmset0r = TXVMVPRMSET0R_BPP_24;
> 	if ((mode->flags & DRM_MODE_FLAG_NVSYNC) ||
> 	    !(mode->flags & DRM_MODE_FLAG_PVSYNC))
> 		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
> 	if ((mode->flags & DRM_MODE_FLAG_NHSYNC) ||
> 	    !(mode->flags & DRM_MODE_FLAG_PHSYNC))
> 		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
> 
> which gives us
> 
> NVSYNC \ PVSYNC		0		1
>   0			VSPOL_LOW	VSPOL_HIG
>   1			VSPOL_LOW	VSPOL_LOW
> 
> This is a different behaviour. Granted, we should never have both NVSYNC
> and PVSYNC set together (unless I'm missing something), so the
> difference in behaviour shouldn't matter. I'm fine with that if you
> explain it in the commit message, however I think that writing
> 
>   	if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
>   		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
>   	if (!(mode->flags & DRM_MODE_FLAG_PHSYNC))
>   		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
> 
> would both restore the previous behaviour in all cases, and be simpler.
I sent a V2 which addresses both, the commit message update and this 
comment.
