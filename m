Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9831453A25D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 12:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D6B10E7D0;
	Wed,  1 Jun 2022 10:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2456310E6E1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654078543; x=1685614543;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=NjKxU4EjWw20eYddG2caUqREV+GpnbXtNndofAbAgNQ=;
 b=IkeIJZMQZpYcaSZOTyWbtS91F8F4giI/uY2aUWe/luvzUyy33e+o29NX
 rYZPzLrruN0pXvtJ7RC3IRfbdZF9k5es6ofOCd5S2F/3i191cAM6mS3iR
 I904hE3KcNgzJglEHPu+GaMCsbUoYwXwXvcTApF8sQNkGp68LNxbg8BJ9
 UqAvsEBXAG6lFUPeoiNIx6th/leQOjB14i13yYDGgBCrB/NHURD+v6okr
 337aKMHlJIcLNYQcGP6PXAkZrVDUJSSSIzlJiX6sWkdsBQ51otQBB9NX/
 pTZOzxwZIcMYffj/zrFjAzJ3UgO8G5Y3yxKL7DTEMCv8bVlebMcixD7UW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="255411279"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="255411279"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 03:15:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="576865453"
Received: from hlipiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.45.79])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 03:15:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "20220531103421.11363-1-william.tseng@intel.com"
 <20220531103421.11363-1-william.tseng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
In-Reply-To: <SJ0PR11MB5894481CA92698368544C7C5F1DF9@SJ0PR11MB5894.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220531103421.11363-1-william.tseng@intel.com>
 <87y1yiq8ce.fsf@intel.com> <87r14aq7ux.fsf@intel.com>
 <SJ0PR11MB5894EA0FF4363714AE3BC029F1DF9@SJ0PR11MB5894.namprd11.prod.outlook.com>
 <87ee08r9jx.fsf@intel.com>
 <SJ0PR11MB5894481CA92698368544C7C5F1DF9@SJ0PR11MB5894.namprd11.prod.outlook.com>
Date: Wed, 01 Jun 2022 13:15:38 +0300
Message-ID: <87a6awr8ol.fsf@intel.com>
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
Cc: Wayne Lin <waynelin@amd.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 01 Jun 2022, "Tseng, William" <william.tseng@intel.com> wrote:
> Thanks, Jani.  This is the bug.=20
>
> https://gitlab.freedesktop.org/drm/intel/-/issues/6153
>
> Sorry about my mistake.

Np. Please also attach the EDID you have to the bug.

Thanks,
Jani.

>
>
> Regards
> William
>
>
> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>=20
> Sent: Wednesday, June 1, 2022 5:57 PM
> To: Tseng, William <william.tseng@intel.com>; dri-devel@lists.freedesktop=
.org
> Cc: Lee, Shawn C <shawn.c.lee@intel.com>; Wayne Lin <waynelin@amd.com>
> Subject: RE: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-86=
1-D
>
> On Wed, 01 Jun 2022, "Tseng, William" <william.tseng@intel.com> wrote:
>> Thanks, Jani.
>> This is the issue ticket.=20
>> https://gitlab.freedesktop.org/drm/intel/-/issues/6087#note_1400843
>
> Copy-paste fail? Does not seem right.
>
> BR,
> Jani.
>
>
> PS. Also, for some reason you added this in your mail:
>
> Reply-To: "20220531103421.11363-1-william.tseng@intel.com"
> 	<20220531103421.11363-1-william.tseng@intel.com>
>
>
>
>
>>
>>
>> Regards
>> William
>>
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: Tuesday, May 31, 2022 7:07 PM
>> To: Tseng, William <william.tseng@intel.com>;=20
>> dri-devel@lists.freedesktop.org
>> Cc: Lee, Shawn C <shawn.c.lee@intel.com>; Wayne Lin=20
>> <waynelin@amd.com>; Tseng, William <william.tseng@intel.com>
>> Subject: Re: [PATCH] drm/edid: ignore the CEA modes not defined in=20
>> CEA-861-D
>>
>> On Tue, 31 May 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>> On Tue, 31 May 2022, William Tseng <william.tseng@intel.com> wrote:
>>>> This is a workaround for HDMI 1.4 sink which has a CEA mode with=20
>>>> higher vic than what is defined in CEA-861-D.
>>>>
>>>> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be=20
>>>> displayed and the video format is indicated by both SVD (with vic 90=20
>>>> and pictuure aspect ratio 64:27) and DTD.  When connecting to such=20
>>>> sink, source can't output the video format in SVD because an error=20
>>>> is returned by drm_hdmi_avi_infoframe_from_display_mode(), which=20
>>>> can't fill the infoframe with pictuure aspect ratio 64:27 and the=20
>>>> vic, which is originally 90 and is changed to 0 by drm_mode_cea_vic().
>>>>
>>>> To work around it, this patch ignores such CEA modes in
>>>> do_cea_modes() so the modes won't be processed in drm_hdmi_avi_infofra=
me_from_display_mode().
>>>> And only the video format in DTD can be dispalyed.
>>
>> I think we should also have a bug filed on this, with the offending EDID=
 attached for posterity.
>>
>> BR,
>> Jani.
>>
>>
>>>>
>>>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>>> Cc: Wayne Lin <waynelin@amd.com>
>>>> Cc: Lee Shawn C <shawn.c.lee@intel.com>
>>>> Signed-off-by: William Tseng <william.tseng@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/drm_edid.c | 39
>>>> +++++++++++++++++++++++++-------------
>>>>  1 file changed, 26 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
>>>> index bc43e1b32092..a93f68878bfd 100644
>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>> @@ -3982,6 +3982,19 @@ drm_display_mode_from_cea_vic(struct
>>>> drm_device *dev,  }  EXPORT_SYMBOL(drm_display_mode_from_cea_vic);
>>>>=20=20
>>>> +static bool is_hdmi2_sink(const struct drm_connector *connector) {
>>>> +	/*
>>>> +	 * FIXME: sil-sii8620 doesn't have a connector around when
>>>> +	 * we need one, so we have to be prepared for a NULL connector.
>>>> +	 */
>>>> +	if (!connector)
>>>> +		return true;
>>>> +
>>>> +	return connector->display_info.hdmi.scdc.supported ||
>>>> +		connector->display_info.color_formats &=20
>>>> +DRM_COLOR_FORMAT_YCBCR420; }
>>>> +
>>>>  static int
>>>>  do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len)=20
>>>> { @@ -3993,6 +4006,19 @@ do_cea_modes(struct drm_connector=20
>>>> *connector, const u8 *db, u8 len)
>>>>=20=20
>>>>  		mode =3D drm_display_mode_from_vic_index(connector, db, len, i);
>>>>  		if (mode) {
>>>> +			u8 vic =3D svd_to_vic(db[i]);
>>>> +
>>>> +			if (!drm_valid_cea_vic(vic))
>>>> +				continue;
>>>
>>> drm_display_mode_from_vic_index() returns NULL in this case.
>>>
>>>> +
>>>> +			/*
>>>> +			 * HDMI 1.4 VIC range: 1 <=3D VIC <=3D 64 (CEA-861-D) but
>>>> +			 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
>>>> +			 * have to make sure we dont break HDMI 1.4 sinks.
>>>> +			 */
>>>> +			if (!is_hdmi2_sink(connector) && vic > 64)
>>>> +				continue;
>>>
>>> I'll need to double check if this is the right thing to do... but I=20
>>> guess the question becomes if this shouldn't be within=20
>>> drm_display_mode_from_vic_index().
>>>
>>> Duplicating the condition from drm_mode_cea_vic() is probably not a=20
>>> good idea.
>>>
>>> The continues in both above branches leak the mode.
>>>
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>>> +
>>>>  			/*
>>>>  			 * YCBCR420 capability block contains a bitmap which
>>>>  			 * gives the index of CEA modes from CEA VDB, which @@ -5846,19
>>>> +5872,6 @@ void drm_set_preferred_mode(struct drm_connector
>>>> *connector,  }  EXPORT_SYMBOL(drm_set_preferred_mode);
>>>>=20=20
>>>> -static bool is_hdmi2_sink(const struct drm_connector *connector) -{
>>>> -	/*
>>>> -	 * FIXME: sil-sii8620 doesn't have a connector around when
>>>> -	 * we need one, so we have to be prepared for a NULL connector.
>>>> -	 */
>>>> -	if (!connector)
>>>> -		return true;
>>>> -
>>>> -	return connector->display_info.hdmi.scdc.supported ||
>>>> -		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
>>>> -}
>>>> -
>>>>  static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
>>>>  			    const struct drm_display_mode *mode)  {
>>
>> --
>> Jani Nikula, Intel Open Source Graphics Center
>
> --
> Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
