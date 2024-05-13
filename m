Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659308C3C46
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A1710E444;
	Mon, 13 May 2024 07:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgWgmbb7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4724810E444
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715586402; x=1747122402;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=npmaJJ97GyahakeasRdzYM3CXWTAzIrVuieGiqQTPL4=;
 b=NgWgmbb71TIa0fl1K7QxwhMWmR05ELuQngHlEBZr5x/h/qLulTcRefgK
 G/36HsVuyxS7N1ePMidz7QkxeW28TxnVLShdMkthdPw0PFl6yRbAUpFXk
 ilwjVj7oWrBnmOYOWPdTVv6FDswJc/o57zaRsx+t/wA2X8g66UR0psUBk
 laxaM21Tb13wO2tF/uCG7YLEhml/tr0aLDoGeQgjxiMgSkbLc1dd7EkKe
 Ceg/2cONolFbAMGtahtzRV3RS3xvRVwpTOYVPNQSQzUsi5vn5L5GBH9g/
 bgH3MMXmKGnmefTz184BlhcjvliISjA0FdBYE6OMTu1rrUgcXgKd7IfG1 A==;
X-CSE-ConnectionGUID: 4Y0L+UM1ST68BKS61UXf3w==
X-CSE-MsgGUID: ylnKBYrxROm/wc7lP3zCuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11384633"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11384633"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:46:41 -0700
X-CSE-ConnectionGUID: mYoH0jSPSQaiqIFkEyhfdg==
X-CSE-MsgGUID: cQ0wroCrS7WZ+Pm+DphpTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="35125252"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:46:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm: use "0" instead of "" for deprecated driver date
In-Reply-To: <Zj5gdo4oqHb4--cG@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240510090951.3398882-1-jani.nikula@intel.com>
 <Zj5ah06WvSb0XP6l@intel.com> <Zj5gdo4oqHb4--cG@intel.com>
Date: Mon, 13 May 2024 10:46:35 +0300
Message-ID: <87a5kugnms.fsf@intel.com>
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

On Fri, 10 May 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, May 10, 2024 at 08:33:59PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote:
>> On Fri, May 10, 2024 at 12:09:51PM +0300, Jani Nikula wrote:
>> > libdrm does not like the empty string for driver date. Use "0" instead,
>> > which has been used by virtio previously.
>> >=20
>> > Reported-by: Steven Price <steven.price@arm.com>
>> > Closes: https://lore.kernel.org/r/9d0cff47-308e-4b11-a9f3-4157dc26b6fa=
@arm.com
>> > Fixes: 7fb8af6798e8 ("drm: deprecate driver date")
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> > ---
>> >  drivers/gpu/drm/drm_ioctl.c | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> > index 89feb7306e47..51f39912866f 100644
>> > --- a/drivers/gpu/drm/drm_ioctl.c
>> > +++ b/drivers/gpu/drm/drm_ioctl.c
>> > @@ -530,9 +530,9 @@ int drm_version(struct drm_device *dev, void *data,
>> >  	err =3D drm_copy_field(version->name, &version->name_len,
>> >  			dev->driver->name);
>> >=20=20
>> > -	/* Driver date is deprecated. Return the empty string. */
>> > +	/* Driver date is deprecated. Userspace expects a non-empty string. =
*/
>> >  	if (!err)
>> > -		err =3D drm_copy_field(version->date, &version->date_len, "");
>> > +		err =3D drm_copy_field(version->date, &version->date_len, "0");
>>=20
>> Does this also fix igt/core_getversion which is on fire now?
>
> At least it fixes Xorg which currently just segfaults.
>
> Pushed to drm-misc-next. Thanks everyone.

Thanks, and sorry.

BR,
Jani.

>
>>=20
>> >  	if (!err)
>> >  		err =3D drm_copy_field(version->desc, &version->desc_len,
>> >  				dev->driver->desc);
>> > --=20
>> > 2.39.2
>>=20
>> --=20
>> Ville Syrj=C3=A4l=C3=A4
>> Intel

--=20
Jani Nikula, Intel
