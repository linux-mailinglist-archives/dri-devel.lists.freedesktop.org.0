Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DBB950889
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 17:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B73410E37A;
	Tue, 13 Aug 2024 15:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jcEp1YLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301B110E37A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723561709; x=1755097709;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=rVhoQ7qmL6BKLbfAj32bEuO0Zc66XjnO1+ntV+JVjIQ=;
 b=jcEp1YLnfwpqxyggzCOLcLnHZdS/irT2I3aJ97a5SXdncevacgMlqho1
 L9/bGz3J9chNPkf+gIQy5xTyVgEdVgmASvxE8mt0TQrFosHATChJRbhFs
 08MX1Tid/euV91x7bcdxl4YV7pHrSiMPvhz9rSn1jXGQDmcvdsAB72cHd
 zWyBD9ZCo8CHlDKKAHtWYkhAWyvTxIPuOZsDrzbJQBJl1mS+HsxD2IGcj
 YRySDQQfpUr4N0kcCHoa7tSkQxM1vKzROyB48YyBbbAWQYTOZPFJ/E5jc
 Im1lD8E8It14TM+JEcL8RxRt5t3wIlGEtOhCB08np8zaJRfwgoA3QJC9t g==;
X-CSE-ConnectionGUID: qtW929RWQn+6A0+3k70TFQ==
X-CSE-MsgGUID: BU0uswWXS3i63UQoJIsDpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32408872"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="32408872"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 08:08:29 -0700
X-CSE-ConnectionGUID: gTvROcfZRt+eS1esG49r6A==
X-CSE-MsgGUID: U+RUufeER/+ICmjygHulHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58389868"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 08:08:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sefa Eyeoglu <contact@scrumplex.net>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: add non-desktop quirk to Pimax VR Headsets
In-Reply-To: <119ff8daeb8eadda3dae9e3f3cc590533b3bdd29.camel@scrumplex.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240720110437.251252-2-contact@scrumplex.net>
 <87zfq7fe50.fsf@intel.com>
 <119ff8daeb8eadda3dae9e3f3cc590533b3bdd29.camel@scrumplex.net>
Date: Tue, 13 Aug 2024 18:08:24 +0300
Message-ID: <87frr8zcif.fsf@intel.com>
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

On Thu, 25 Jul 2024, Sefa Eyeoglu <contact@scrumplex.net> wrote:
> Hi Jani,
>
> I have asked someone with the actual hardware to attach their EDID blob
> to the issue.

There's only one so far, but that one does require the quirk.

Acked-by: Jani Nikula <jani.nikula@intel.com>



>
> Kind regards,
> Sefa
>
> On Wed, 2024-07-24 at 10:22 +0300, Jani Nikula wrote:
>> On Sat, 20 Jul 2024, Sefa Eyeoglu <contact@scrumplex.net> wrote:
>> > See https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/40
>>=20
>> Please attach the relevant EDID blobs to the bug.
>>=20
>> BR,
>> Jani.
>>=20
>> >=20
>> > Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
>> > ---
>> > =C2=A0drivers/gpu/drm/drm_edid.c | 5 +++++
>> > =C2=A01 file changed, 5 insertions(+)
>> >=20
>> > diff --git a/drivers/gpu/drm/drm_edid.c
>> > b/drivers/gpu/drm/drm_edid.c
>> > index f68a41eeb1fa..41879d67599d 100644
>> > --- a/drivers/gpu/drm/drm_edid.c
>> > +++ b/drivers/gpu/drm/drm_edid.c
>> > @@ -237,6 +237,11 @@ static const struct edid_quirk {
>> > =C2=A0	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
>> > =C2=A0	EDID_QUIRK('A', 'U', 'S', 0xc102, EDID_QUIRK_NON_DESKTOP),
>> > =C2=A0
>> > +	/* Pimax VR Headsets */
>> > +	EDID_QUIRK('P', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
>> > +	EDID_QUIRK('P', 'V', 'R', 0x101a, EDID_QUIRK_NON_DESKTOP),
>> > +	EDID_QUIRK('P', 'V', 'R', 0x101b, EDID_QUIRK_NON_DESKTOP),
>> > +
>> > =C2=A0	/* Sony PlayStation VR Headset */
>> > =C2=A0	EDID_QUIRK('S', 'N', 'Y', 0x0704, EDID_QUIRK_NON_DESKTOP),
>>=20
>

--=20
Jani Nikula, Intel
