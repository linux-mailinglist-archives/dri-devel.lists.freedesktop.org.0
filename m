Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5759D4A0A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 10:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169C910E8BD;
	Thu, 21 Nov 2024 09:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+20egHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAD710E8BD
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 09:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732181603; x=1763717603;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=g6rCyxelui5PQH0qtuZhDsS3ZB+oTsRyFTtYMB9+WzE=;
 b=J+20egHJV9E8bOySZTcIcle2f9urp4saQEbRV2E/7gSZcUbEqX5m87Pg
 WHAB8dVToIM8etOeUql5kLfGDjaSYZ/U1Asu5MEB9SnJ/yEeY1j+phnyO
 k87AiYkNxCbqX5v/XzjY4azRGjB5qr1PjlogoiLFkqBUuWrvyDnHl0E4v
 c+/u5nv7IoPWWKgeS8fFfetoBuMECtFz7LyphXdkUqMkASSB8+0V33XzD
 pBsD1JJ4sNgrn7tg7pirDfHVnCQYNAlqbZDbZQQp/t+b9sADlKi6wITOL
 VQISoOyPVInFjhxDemJCX2E6qUbjwgINRjPyfOYWvyJqAnpQl/z5O/gA6 w==;
X-CSE-ConnectionGUID: odl1xWVhQfigGSyjuSO4rw==
X-CSE-MsgGUID: xQGnyJBtSD6YIxmO35jXDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43668020"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43668020"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 01:33:22 -0800
X-CSE-ConnectionGUID: WVErexUeQDqHnHXMiDN4Xw==
X-CSE-MsgGUID: KYwx0OHXTPibgX2i/RxFYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="113468358"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.95])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 01:33:19 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: Re: [PATCH] drm/vmwgfx: Add Fake EDID
In-Reply-To: <CAO6MGtiP4iCwLh1ZbYWqCwCgqzcgTnX=bZ25ow4ED8hc1JdGKQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241119194038.530779-1-ian.forbes@broadcom.com>
 <40815234-baa2-4990-9f30-0a0632871a0c@suse.de> <878qte2oj3.fsf@intel.com>
 <CAO6MGtiP4iCwLh1ZbYWqCwCgqzcgTnX=bZ25ow4ED8hc1JdGKQ@mail.gmail.com>
Date: Thu, 21 Nov 2024 11:33:16 +0200
Message-ID: <87ldxd0w4j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 20 Nov 2024, Ian Forbes <ian.forbes@broadcom.com> wrote:
> On Wed, Nov 20, 2024 at 4:22=E2=80=AFAM Jani Nikula <jani.nikula@linux.in=
tel.com>
> wrote:
>>
>> Please avoid all struct edid based interfaces, in this case
>> drm_connector_update_edid_property(). They will be removed in the
>> future, and adding more is counter-productive. Everything should be
>> struct drm_edid based going forward.
>>
>> Of course, actually grafting the EDID needs struct edid. And that's kind
>> of annoying too. Do we really want to spread the EDID details all over
>> the place? This one combines drm_edid.h structs and magic numbers in a
>> jumble. I'm kind of hoping we'd get rid of driver usage of struct edid,
>> though that's a long road. But we've made a lot of progress towards it,
>> there aren't that many places left that directly look at the guts of
>> EDID, and most of it is centralized in drm_edid.c.
>>
>
> drm_edid isn't exported so we can't use it. I know you've read the EDID
> spec so complaining about the magic numbers is silly.
> I didn't choose to make the whole spec based on bizarrely packed 10 and 12
> bit numbers, they are unavoidable.

I'm complaining about adding those details in drivers. That is, if we
really have to have EDID generation.

It's hard to get all the EDID details right. Drivers would invariably
get them wrong, in different ways. The main reason struct drm_edid is
opaque is to prevent drivers from attempting to parse it
themselves. (Yes, drm_edid.c gets stuff wrong too, but at least it's the
same for everyone and can be fixed in one place.)

>>
>> > Maybe it resolves problems with
>> > compositors, but it is a step backwards for the overall ecosystem. If
>> > the connector changes, your driver should increment the epoch counter.
>> > [1] That will send a hotplug event to userspace. The EDID alone does n=
ot
>> > say anything about connector status.
>>
>> Yeah, unplugging and replugging the same display with the same EDID
>> isn't a problem for other drivers, and they don't have to do this kind
>> of stuff to trick userspace. Maybe vmwgfx should handle (or simulate)
>> hotplugs better?
>>
>> And preferrably let the EDID functions handle epoch counter updates
>> instead of doing it yourself, if at all possible.
>>
>> BR,
>> Jani.
>>
>
> You're both missing the fact that virtual devices never disconnect active
> displays. We don't have to do a disconnect/connect cycle like a physical
> monitor and we wouldn't want to because it would be poor user experience.
> The issue is not sending the hotplug event, it's that userspace will igno=
re
> hotplug events on connectors that were previously connected because they
> assume a disconnect/connect cycle must occur for changes to occur. The
> whole point of hotplug_mode_update was as a hint to userspace that the
> display can be "re-plugged" without a disconnect first and to always resc=
an
> the connector for changes on hotplug.
>
> Currently compositors are taking an arbitrary set of connector properties
> that they've organically collected over the years and doing a diff to
> trigger a refresh in the modes/display layout. EDID is the only property
> that they universally agree should trigger a display layout change. The
> fact that Autofit works on any compsitors using vmwgfx, qxl, or virtio is
> completely by accident.
>
> EDID is also a standardized connector property so it's not really fair to
> say that all devices should export this property and then when we fix our
> deficiency to block it. Now that it's standardized it is part of the uapi
> and if userspace does weird things with it it's not really our concern. T=
he
> fact that it's standardized is also likely the reason it is being used in
> such a fashion.

If you want standardized, you should probably consider using
drm_edid_read_custom() to fetch the generated EDID the same way all the
other EDIDs get fetched, with support for firmware/debugfs EDID, and
validity checks. And you get to use drm_edid based interfaces. And you
get connector->display_info filled with the parsed data, so it aligns
with everyone else.

Arguably it's also backwards to first generate modes, update them using
drm_mode_probed_add() and drm_add_modes_noedid(), then generate an EDID
based on them and update the property with that. Userspace should not
even look at the modes from the EDID directly, only the modes provided
via KMS API, and nobody would even know if they differ. So if we go the
EDID generation route, IMO this should go all the way. Generate EDID
based on modes, and then use drm_edid_connector_add_modes() to add the
modes.

BR,
Jani.


--=20
Jani Nikula, Intel
