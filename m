Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DEE712526
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 12:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F65710E0BE;
	Fri, 26 May 2023 10:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AC510E7EC;
 Fri, 26 May 2023 10:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685098752; x=1716634752;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=aWsN0K5+kjlmO1jTUXZUflfxLbLsDqkGNe0CnrZD5C8=;
 b=fsGAy1oSRVL2WPEg80O6YtWEtDUd12Fif/Wt6WZC6+Zx+K4E6/K4aYTM
 Eu6pARFfcD8I0+mHXsLTuYgrfUaieE+cvD0akdyRFDRRCHEdu3SQUd6i2
 cqSkdq7VpC3UkPistZ458m9OIiPITD+CoScKx4jQ8TCCCWOMvEYawcm+K
 azpxDJhPmolmGNHJ3iK6rsXB+jC9vZXVYNhrqJAVfJzL4oBjCy7ufpNxh
 /3jVIiCX7YFY+sOozSO348Y5vl2aM+S2BVNILmuq6vVmaeD7mfgx9xOn+
 bX9BjXg+1nsyxLt58fun0jtOtVYfPZLFlosQYDY/yF0jza7JmqFpO2rEJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="419932648"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="419932648"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 03:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="770306407"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="770306407"
Received: from akervine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.55.216])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 03:59:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2 6/7] drm/i915: No 10bit gamma on desktop
 gen3 parts
In-Reply-To: <DM4PR11MB636079BEDB4092FAC1E8D776F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
 <20230413164916.4221-7-ville.syrjala@linux.intel.com>
 <DM4PR11MB636079BEDB4092FAC1E8D776F4469@DM4PR11MB6360.namprd11.prod.outlook.com>
Date: Fri, 26 May 2023 13:59:07 +0300
Message-ID: <87pm6nicjo.fsf@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 May 2023, "Shankar, Uma" <uma.shankar@intel.com> wrote:
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of V=
ille Syrjala
>> Sent: Thursday, April 13, 2023 10:19 PM
>> To: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Subject: [Intel-gfx] [PATCH v2 6/7] drm/i915: No 10bit gamma on desktop =
gen3 parts
>>=20
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>=20
>> Apparently desktop gen3 parts don't support the 10bit gamma mode at all.=
 Stop
>> claiming otherwise.
>>=20
>> As is the case with pipe A on gen3 mobile parts, the PIPECONF gamma mode=
 bit can
>> be set but it has no effect on the output.
>>=20
>> PNV seems to be the only slight exception, but generally the desktop PNV=
 variant
>> looks more like a mobile part so this is not entirely surprising.
>
> Couldn't check the relevant spec to re-confirm, trusting your judgment he=
re.
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>

This needs a rebase on display/intel_display_device.[ch] stuff.

BR,
Jani.


>
>> Fixes: 67630bacae23 ("drm/i915: Add 10bit gamma mode for gen2/3")
>> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_pci.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915=
_pci.c index
>> cddb6e197972..305c05c3f93b 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -250,13 +250,13 @@ static const struct intel_device_info i865g_info =
=3D {
>>  	.dma_mask_size =3D 32, \
>>  	I9XX_PIPE_OFFSETS, \
>>  	I9XX_CURSOR_OFFSETS, \
>> -	I9XX_COLORS, \
>>  	GEN_DEFAULT_PAGE_SIZES, \
>>  	GEN_DEFAULT_REGIONS
>>=20
>>  static const struct intel_device_info i915g_info =3D {
>>  	GEN3_FEATURES,
>>  	PLATFORM(INTEL_I915G),
>> +	I845_COLORS,
>>  	.has_coherent_ggtt =3D false,
>>  	.display.cursor_needs_physical =3D 1,
>>  	.display.has_overlay =3D 1,
>> @@ -268,6 +268,7 @@ static const struct intel_device_info i915g_info =3D=
 {  static
>> const struct intel_device_info i915gm_info =3D {
>>  	GEN3_FEATURES,
>>  	PLATFORM(INTEL_I915GM),
>> +	I9XX_COLORS,
>>  	.is_mobile =3D 1,
>>  	.display.cursor_needs_physical =3D 1,
>>  	.display.has_overlay =3D 1,
>> @@ -281,6 +282,7 @@ static const struct intel_device_info i915gm_info =
=3D {  static
>> const struct intel_device_info i945g_info =3D {
>>  	GEN3_FEATURES,
>>  	PLATFORM(INTEL_I945G),
>> +	I845_COLORS,
>>  	.display.has_hotplug =3D 1,
>>  	.display.cursor_needs_physical =3D 1,
>>  	.display.has_overlay =3D 1,
>> @@ -292,6 +294,7 @@ static const struct intel_device_info i945g_info =3D=
 {  static
>> const struct intel_device_info i945gm_info =3D {
>>  	GEN3_FEATURES,
>>  	PLATFORM(INTEL_I945GM),
>> +	I9XX_COLORS,
>>  	.is_mobile =3D 1,
>>  	.display.has_hotplug =3D 1,
>>  	.display.cursor_needs_physical =3D 1,
>> @@ -306,6 +309,7 @@ static const struct intel_device_info i945gm_info =
=3D {  static
>> const struct intel_device_info g33_info =3D {
>>  	GEN3_FEATURES,
>>  	PLATFORM(INTEL_G33),
>> +	I845_COLORS,
>>  	.display.has_hotplug =3D 1,
>>  	.display.has_overlay =3D 1,
>>  	.dma_mask_size =3D 36,
>> @@ -314,6 +318,7 @@ static const struct intel_device_info g33_info =3D {=
  static
>> const struct intel_device_info pnv_g_info =3D {
>>  	GEN3_FEATURES,
>>  	PLATFORM(INTEL_PINEVIEW),
>> +	I9XX_COLORS,
>>  	.display.has_hotplug =3D 1,
>>  	.display.has_overlay =3D 1,
>>  	.dma_mask_size =3D 36,
>> @@ -322,6 +327,7 @@ static const struct intel_device_info pnv_g_info =3D=
 {  static
>> const struct intel_device_info pnv_m_info =3D {
>>  	GEN3_FEATURES,
>>  	PLATFORM(INTEL_PINEVIEW),
>> +	I9XX_COLORS,
>>  	.is_mobile =3D 1,
>>  	.display.has_hotplug =3D 1,
>>  	.display.has_overlay =3D 1,
>> --
>> 2.39.2
>

--=20
Jani Nikula, Intel Open Source Graphics Center
