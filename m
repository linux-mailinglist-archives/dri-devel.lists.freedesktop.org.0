Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBD84FB823
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B4710F9AF;
	Mon, 11 Apr 2022 09:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4CE10F87E;
 Mon, 11 Apr 2022 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670534; x=1681206534;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=5tMPmI/rMFGjP8QukHH0NBa6RJFmFm5IPu0cR/gJ3U8=;
 b=AFnvwJSjR0paXubPTLpnYbUuymie9ggTBLF1rPw05hUroqxbfxWFRMbz
 9CbGKiJfMhoYfSAzPzvWmQQN1+8HSzqwLyjsoYL3z3uRD9DnGPmB9z30Y
 +foOEuyogeQfn+Hr1qYlWp+/i/ZwCbDZANoZhX/bIy0kFYpWSmbYl7zYg
 s8HUin/IT+axAnEYy1uaVg1JbzIEbFwgZSA10LF17+0lEm0n1yoQVYyi5
 T55PqEY5vmkLYc0kanc3BR3b1tYqW+Hk/vptE76DSniy6pXAioAcNOqrz
 myhl2MTW9bpRsgk8GwlofsJlyyUxynDXlWHCUaRbt/dBS7x43Sz5z0H9k A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="262257331"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="262257331"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="723902340"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 06/12] drm/edid: add typedef for block read function
In-Reply-To: <Yk7Ts/ejETyarJSh@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1649322799.git.jani.nikula@intel.com>
 <94e414efe8d127f3fd0b4fd7948aafbe7be079a9.1649322799.git.jani.nikula@intel.com>
 <Yk7Ts/ejETyarJSh@intel.com>
Date: Mon, 11 Apr 2022 12:48:50 +0300
Message-ID: <87lewchrwd.fsf@intel.com>
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

On Thu, 07 Apr 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Apr 07, 2022 at 12:14:32PM +0300, Jani Nikula wrote:
>> Make the callback a bit easier on the eye.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index ba54701f91f6..926ffe5cd97e 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -2037,10 +2037,11 @@ int drm_add_override_edid_modes(struct drm_conne=
ctor *connector)
>>  }
>>  EXPORT_SYMBOL(drm_add_override_edid_modes);
>>=20=20
>> +typedef int read_block_fn(void *context, u8 *buf, unsigned int block, s=
ize_t len);
>> +
>
> The header still has the eyesore. Maybe we want to put the typedef
> there?

Decided to leave that for the future, possibly with a s/u8*/void*/
change.

Thanks,
Jani.


>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
>>  static struct edid *drm_do_get_edid_base_block(struct drm_connector *co=
nnector,
>> -	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
>> -			      size_t len),
>> -	void *data)
>> +					       read_block_fn read_block,
>> +					       void *context)
>>  {
>>  	int *null_edid_counter =3D connector ? &connector->null_edid_counter :=
 NULL;
>>  	bool *edid_corrupt =3D connector ? &connector->edid_corrupt : NULL;
>> @@ -2053,7 +2054,7 @@ static struct edid *drm_do_get_edid_base_block(str=
uct drm_connector *connector,
>>=20=20
>>  	/* base block fetch */
>>  	for (try =3D 0; try < 4; try++) {
>> -		if (get_edid_block(data, edid, 0, EDID_LENGTH))
>> +		if (read_block(context, edid, 0, EDID_LENGTH))
>>  			goto out;
>>  		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
>>  			break;
>> @@ -2097,9 +2098,8 @@ static struct edid *drm_do_get_edid_base_block(str=
uct drm_connector *connector,
>>   * Return: Pointer to valid EDID or NULL if we couldn't find any.
>>   */
>>  struct edid *drm_do_get_edid(struct drm_connector *connector,
>> -	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
>> -			      size_t len),
>> -	void *data)
>> +			     read_block_fn read_block,
>> +			     void *context)
>>  {
>>  	int j, invalid_blocks =3D 0;
>>  	struct edid *edid, *new, *override;
>> @@ -2108,7 +2108,7 @@ struct edid *drm_do_get_edid(struct drm_connector =
*connector,
>>  	if (override)
>>  		return override;
>>=20=20
>> -	edid =3D drm_do_get_edid_base_block(connector, get_edid_block, data);
>> +	edid =3D drm_do_get_edid_base_block(connector, read_block, context);
>>  	if (!edid)
>>  		return NULL;
>>=20=20
>> @@ -2125,7 +2125,7 @@ struct edid *drm_do_get_edid(struct drm_connector =
*connector,
>>  		int try;
>>=20=20
>>  		for (try =3D 0; try < 4; try++) {
>> -			if (get_edid_block(data, block, j, EDID_LENGTH))
>> +			if (read_block(context, block, j, EDID_LENGTH))
>>  				goto out;
>>  			if (drm_edid_block_valid(block, j, false, NULL))
>>  				break;
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
