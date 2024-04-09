Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD22B89D5BC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 11:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64674112C18;
	Tue,  9 Apr 2024 09:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HAdSkJCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3ABD112C18;
 Tue,  9 Apr 2024 09:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712655695; x=1744191695;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4sF6Mj9+thOjHUc3sQyi/amq2kiXPYaui22ZYxkOjJ8=;
 b=HAdSkJCxHjX7vMo46eg8nhO7noHTH6GRRXvrbLc40byaD1jtZ3WRYynq
 Xmluy+Fxh0jF0N13wldOMxb3JBfSLZtAs71vqvfoVNSutDGWArxq8tWAV
 Rw+ew7f4b6/sBxPx/XgeIw6t8WvZ9QfBjzqNYJn3UohHMp+XgDdS+XoCx
 WFFdaenwnKjAF1uNqAB3ovpdFnwqL0oV7/w182j3y8ccmWtKqmynYoEkp
 aWbBWeQjtqZcE0vSwqKjc6fjNSMxp7469WS9DHtI2+Max8uyrAgWJXdZn
 mbWD310rt76LsH7y9e+MjFlqPcjUwTixv/TW5EM72sRZh5bCy+QXP1Key Q==;
X-CSE-ConnectionGUID: ZfOVlC0oTo+9OZluBShhuQ==
X-CSE-MsgGUID: esxLTxyOSjSPhkSO3+GO8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19393236"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="19393236"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 02:41:35 -0700
X-CSE-ConnectionGUID: 78dsL2SVQB2FKpx296CNfQ==
X-CSE-MsgGUID: ZUjfFQhMQduMt8lRSIXEVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20084431"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 02:41:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/edid: add drm_edid_print_product_id()
In-Reply-To: <ZhQx4gWk_4whJqrD@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1711015462.git.jani.nikula@intel.com>
 <dcefe0474d74f818e250677982b32c767b466110.1711015462.git.jani.nikula@intel.com>
 <ZhQx4gWk_4whJqrD@intel.com>
Date: Tue, 09 Apr 2024 12:41:31 +0300
Message-ID: <87v84q98l0.fsf@intel.com>
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

On Mon, 08 Apr 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Mar 21, 2024 at 12:05:10PM +0200, Jani Nikula wrote:
>> Add a function to print a decoded EDID vendor and product id to a drm
>> printer, optinally with the raw data.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 35 +++++++++++++++++++++++++++++++++++
>>  include/drm/drm_edid.h     |  3 +++
>>  2 files changed, 38 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 626a0e24e66a..198986f0eb8b 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -29,6 +29,7 @@
>>   */
>>=20=20
>>  #include <linux/bitfield.h>
>> +#include <linux/byteorder/generic.h>
>>  #include <linux/cec.h>
>>  #include <linux/hdmi.h>
>>  #include <linux/i2c.h>
>> @@ -2771,6 +2772,40 @@ void drm_edid_get_product_id(const struct drm_edi=
d *drm_edid,
>>  }
>>  EXPORT_SYMBOL(drm_edid_get_product_id);
>>=20=20
>> +/**
>> + * drm_edid_print_product_id - Print decoded product id to printer
>> + * @p: drm printer
>> + * @id: EDID product id
>> + * @raw: If true, also print the raw hex
>> + */
>> +void drm_edid_print_product_id(struct drm_printer *p,
>> +			       const struct drm_edid_product_id *id, bool raw)
>> +{
>> +	u16 mfg_id =3D id->manufacturer_name[0] << 8 | id->manufacturer_name[1=
];
>> +	char *date;
>> +	char vend[4];
>> +
>> +	drm_edid_decode_mfg_id(mfg_id, vend);
>> +
>> +	if (id->week_of_manufacture =3D=3D 0xff)
>
> Didn't realize this had a loaded meaning. Maybe we should also
> skip the week printout if week=3D=3D0? Otherwise people might think
> week=3D=3D0 means the first week.

Agreed.

>
>> +		date =3D kasprintf(GFP_KERNEL, "model year: %d",
>> +				 id->year_of_manufacture + 1990);
>> +	else
>> +		date =3D kasprintf(GFP_KERNEL, "week: %d, year of manufacture: %d",
>
> The "week: %d" part feels a bit left out here. Maybe this should be
> formatted as "week/year of manufacture: %d/%d"?=20

Agreed.

> Not sure I like the kasprintf(). Maybe use an on-stack buffer?

Refactored using struct seq_buf and a helper function; v2 out shortly.

BR,
Jani.

>
>> +				 id->week_of_manufacture,
>> +				 id->year_of_manufacture + 1990);
>> +
>> +	drm_printf(p, "manufacturer name: %s, product code: %u, serial number:=
 %u, %s\n",
>> +		   vend, le16_to_cpu(id->product_code),
>> +		   le32_to_cpu(id->serial_number), date ?: "");
>> +
>> +	if (raw)
>> +		drm_printf(p, "raw product id: %*ph\n", (int)sizeof(*id), id);
>> +
>> +	kfree(date);
>> +}
>> +EXPORT_SYMBOL(drm_edid_print_product_id);
>> +
>>  /**
>>   * drm_edid_get_panel_id - Get a panel's ID from EDID
>>   * @drm_edid: EDID that contains panel ID.
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 7911a2f8a672..c763ba1a0bbd 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -30,6 +30,7 @@ struct drm_connector;
>>  struct drm_device;
>>  struct drm_display_mode;
>>  struct drm_edid;
>> +struct drm_printer;
>>  struct hdmi_avi_infoframe;
>>  struct hdmi_vendor_infoframe;
>>  struct i2c_adapter;
>> @@ -481,6 +482,8 @@ int drm_edid_connector_add_modes(struct drm_connecto=
r *connector);
>>  bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>>  void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>>  			     struct drm_edid_product_id *id);
>> +void drm_edid_print_product_id(struct drm_printer *p,
>> +			       const struct drm_edid_product_id *id, bool raw);
>>=20=20
>>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>>  				  int ext_id, int *ext_index);
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel
