Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8EC67380C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 13:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBC710E079;
	Thu, 19 Jan 2023 12:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E054010E079;
 Thu, 19 Jan 2023 12:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674130576; x=1705666576;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=J7hrDBsEm68K3bgk2iI4dXz1bDO1pEW+8WU+BZxubcU=;
 b=XR7ZBd6p7JYajTFVwjhbLQ994jp8xGAqS9EV8hWK2iaU72tmVuxwxbIO
 z85YoVyqTt5e67EUX9dFGbcbRt0hRQ7x8bsrs/VpS4YsQx8yZ48jP+XcP
 AY0Bu/N2fS/v1rVK50sG3ht5Rr72B51sTfp8P4XtrI0Jd7YZJ44bwI9XB
 wyaAMdBokSvUb50sfkFtOOmgRI5m1/mBrIfk0sJ+e+fH3/1pje9p1MbEG
 P/tZxFEqafmyFM8+T7qMELVhaYsI4wCrtXdLUt9mjGBIPtKUYF5/mnLaM
 VTL4YygjTxrfbN+bDeLsw3yeHMSawjaAJNIloVn0mQjEIYP9IoO7wbes0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308826958"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="308826958"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 04:16:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="748900839"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="748900839"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.157])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 04:16:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v7 15/22] drm/edid: move EDID BPC quirk application to
 update_display_info()
In-Reply-To: <Y8gbDbJRFFt969G6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1672826282.git.jani.nikula@intel.com>
 <8997e0fa3b0fd03c920e72d1dff24c0d96ff4dd0.1672826282.git.jani.nikula@intel.com>
 <Y8gbDbJRFFt969G6@intel.com>
Date: Thu, 19 Jan 2023 14:16:11 +0200
Message-ID: <87h6wmafec.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Jan 2023, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Jan 04, 2023 at 12:05:30PM +0200, Jani Nikula wrote:
>> The BPC quirks are closer to home in update_display_info().
>>=20
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, also pushed patches 12-15 because they don't depend on patch 11.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
>>  1 file changed, 13 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 810a5fca398a..5881df5bddb9 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6555,6 +6555,18 @@ static void update_display_info(struct drm_connec=
tor *connector,
>>  	if (info->quirks & EDID_QUIRK_CAP_DSC_15BPP)
>>  		info->max_dsc_bpp =3D 15;
>>=20=20
>> +	if (info->quirks & EDID_QUIRK_FORCE_6BPC)
>> +		info->bpc =3D 6;
>> +
>> +	if (info->quirks & EDID_QUIRK_FORCE_8BPC)
>> +		info->bpc =3D 8;
>> +
>> +	if (info->quirks & EDID_QUIRK_FORCE_10BPC)
>> +		info->bpc =3D 10;
>> +
>> +	if (info->quirks & EDID_QUIRK_FORCE_12BPC)
>> +		info->bpc =3D 12;
>> +
>>  	/* Depends on info->cea_rev set by drm_parse_cea_ext() above */
>>  	drm_edid_to_eld(connector, drm_edid);
>>  }
>> @@ -6654,7 +6666,7 @@ static int add_displayid_detailed_modes(struct drm=
_connector *connector,
>>  static int _drm_edid_connector_update(struct drm_connector *connector,
>>  				      const struct drm_edid *drm_edid)
>>  {
>> -	struct drm_display_info *info =3D &connector->display_info;
>> +	const struct drm_display_info *info =3D &connector->display_info;
>>  	int num_modes =3D 0;
>>=20=20
>>  	/*
>> @@ -6694,18 +6706,6 @@ static int _drm_edid_connector_update(struct drm_=
connector *connector,
>>  	if (info->quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LAR=
GE_75))
>>  		edid_fixup_preferred(connector);
>>=20=20
>> -	if (info->quirks & EDID_QUIRK_FORCE_6BPC)
>> -		info->bpc =3D 6;
>> -
>> -	if (info->quirks & EDID_QUIRK_FORCE_8BPC)
>> -		info->bpc =3D 8;
>> -
>> -	if (info->quirks & EDID_QUIRK_FORCE_10BPC)
>> -		info->bpc =3D 10;
>> -
>> -	if (info->quirks & EDID_QUIRK_FORCE_12BPC)
>> -		info->bpc =3D 12;
>> -
>>  	return num_modes;
>>  }
>>=20=20
>> --=20
>> 2.34.1

--=20
Jani Nikula, Intel Open Source Graphics Center
