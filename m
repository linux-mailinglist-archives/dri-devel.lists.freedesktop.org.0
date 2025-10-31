Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAB8C2486B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4279110EB48;
	Fri, 31 Oct 2025 10:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGYQHis/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1DF10EB52
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761907213; x=1793443213;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4bxNHRQsBRMciAEzzGKIK+EDpKWJqabZiAyQ29AdBas=;
 b=cGYQHis/uG6+Ex8ExIq0AvbV9JRExj/5NK5HxtBNpjcx30la9whE6X6y
 AZ4Wdvr/8hkvxswZpnurackKZ7QEPMH0hiitgTrhedoYKdF3yYt6YddJE
 /qUXca4KX0knAhZ6Azg5rIM9HLVWQEHFlkmx3zrVJ5p+HHaaVb4PUGa6M
 luG28kXrVb5ebrCWp4Zi7IQHRuWQAxJW6ZiCA92tf3d0swVS/HpZhU2F7
 lFtnncE2PBm8b/bx/Q63bF4OyH93F4NtJemt6sct/1B2p5hD++Y86rAg2
 rTUOfJhFBOUCagq0JtGjpCzqzD0amo+diIx57tz57knengrhuYDQeCgsS A==;
X-CSE-ConnectionGUID: RI9GDys3T76uckL9MGdD4g==
X-CSE-MsgGUID: IsY/XLqtTSqVE1r818Dorg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75516329"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="75516329"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 03:40:13 -0700
X-CSE-ConnectionGUID: MKyg1S5vQwKvwTQGoo6DnA==
X-CSE-MsgGUID: VFY/pj9ASYiSCLaXw2pXkQ==
X-ExtLoop1: 1
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.37])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 03:40:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Doug Anderson <dianders@chromium.org>, Ajye Huang
 <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/edid: add 6 bpc quirk to the Sharp LQ116M1JW10
In-Reply-To: <7071a2b8198c09011c84d39b45dc6d1da4b69d12@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251030094434.1390143-1-ajye_huang@compal.corp-partner.google.com>
 <CAD=FV=V6xV0m4pj=7f2dxDP-0A1AaQuYJP5NAnXNz1_bzH7nSw@mail.gmail.com>
 <7071a2b8198c09011c84d39b45dc6d1da4b69d12@intel.com>
Date: Fri, 31 Oct 2025 12:40:07 +0200
Message-ID: <789d88744fbd3a05758971dc8d893fb4599475f3@intel.com>
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

On Fri, 31 Oct 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> On Thu, 30 Oct 2025, Doug Anderson <dianders@chromium.org> wrote:
>> Hi,
>>
>> On Thu, Oct 30, 2025 at 2:44=E2=80=AFAM Ajye Huang
>> <ajye_huang@compal.corp-partner.google.com> wrote:
>>>
>>> The Sharp LQ116M1JW105 reports that it supports 8 bpc modes,
>>> but it will happen display noise in some videos.
>>> So, limit it to 6 bpc modes.
>>>
>>> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
>>> ---
>>>  drivers/gpu/drm/drm_edid.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>> index e2e85345aa9a..a73d37fe7ea1 100644
>>> --- a/drivers/gpu/drm/drm_edid.c
>>> +++ b/drivers/gpu/drm/drm_edid.c
>>> @@ -250,6 +250,9 @@ static const struct edid_quirk {
>>>         EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
>>>         EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)),
>>>
>>> +       /* LQ116M1JW10 displays noise when 8 bpc, but display fine as 6=
 bpc */
>>> +       EDID_QUIRK('S', 'H', 'P', 0x154c, EDID_QUIRK_FORCE_6BPC),
>>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> FWIW,
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

And as soon as I hit send, I notice the quirk is missing BIT(). It's a
bit mask, and the enum signifies the bit number.

BR,
Jani.

>
>>
>> I'll plan to apply this patch next week unless there are any comments.
>> Given that it's just adding a quirk, I'm also happy to apply it
>> soonner (or for someone else to apply it) if people think that's OK.
>> :-)
>>
>> NOTE: in general if someone is involved in the discussion of a
>> previous versoin, it's good to CC them on newer versions. I've added
>> Jani back to the CC list here.
>>
>> -Doug

--=20
Jani Nikula, Intel
