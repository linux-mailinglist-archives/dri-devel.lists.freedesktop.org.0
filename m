Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A35C31159
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 13:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C18910E159;
	Tue,  4 Nov 2025 12:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAiBqdZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E7D10E159;
 Tue,  4 Nov 2025 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762260871; x=1793796871;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ll3s/+QgtoDNUlrdjP8P9ZN6bZaHILSwzXxAiB8OkfU=;
 b=SAiBqdZjezdfOag8a16emlon9BVxJEBmgl2UKmEouT1tknNPzNk52wBg
 4xPe8Ga2uBbVrXmPUSY/iy5FA6L7VEibF3E0Y3ITlsjS7BoSvuLTOjZ9G
 h1db+a+RI+k80B+rQdA8iCmU5iztEdhyHxFemHk/xbSgOwa4Kx66Wxc6u
 maslbbm85+I34PLFIqzDCIKrY9cxvCMcRCx+VM16fE7p0/P0KXyaEsDeH
 p1+BjzCxduEQOFjVshz7ejmB6RmoD0cG8xHcNyDm5pmyNwyK6UWQBzamj
 /a88Fk58A1+SyapWbJmlV7Jhh04Abv42/3aPKK+msu8cpEfFYG5X919PL A==;
X-CSE-ConnectionGUID: 77lTJLNhSgGF7dBYZ2Zauw==
X-CSE-MsgGUID: FFTcSzDOSV+r5D5/NHXc6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="89816728"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="89816728"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:54:31 -0800
X-CSE-ConnectionGUID: k2UFZrQ1QhumsZYPojUCug==
X-CSE-MsgGUID: J8iK+9YeTPKDOlNA6AtPpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191456874"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:54:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, tiago.martins.araujo@gmail.com
Subject: Re: [PATCH 3/3] drm/displayid: add quirk to ignore DisplayID
 checksum errors
In-Reply-To: <CADnq5_MA9sUeKC6XEJGqvzSwXzwXL8bqUfs4U41aTJY2qF=Upw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1761681968.git.jani.nikula@intel.com>
 <c04d81ae648c5f21b3f5b7953f924718051f2798.1761681968.git.jani.nikula@intel.com>
 <CADnq5_MA9sUeKC6XEJGqvzSwXzwXL8bqUfs4U41aTJY2qF=Upw@mail.gmail.com>
Date: Tue, 04 Nov 2025 14:54:26 +0200
Message-ID: <a09e4326246347adef0768cc9bc26256502242b7@intel.com>
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

On Thu, 30 Oct 2025, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Tue, Oct 28, 2025 at 5:26=E2=80=AFPM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>>
>> Add a mechanism for DisplayID specific quirks, and add the first quirk
>> to ignore DisplayID section checksum errors.
>>
>> It would be quite inconvenient to pass existing EDID quirks from
>> drm_edid.c for DisplayID parsing. Not all places doing DisplayID
>> iteration have the quirks readily available, and would have to pass it
>> in all places. Simply add a separate array of DisplayID specific EDID
>> quirks. We do end up checking it every time we iterate DisplayID blocks,
>> but hopefully the number of quirks remains small.
>>
>> There are a few laptop models with DisplayID checksum failures, leading
>> to higher refresh rates only present in the DisplayID blocks being
>> ignored. Add a quirk for the panel in the machines.
>>
>> Reported-by: Tiago Martins Ara=C3=BAjo <tiago.martins.araujo@gmail.com>
>> Closes: https://lore.kernel.org/r/CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLB=
DxfOVtfGGqiKQ@mail.gmail.com
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14703
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Series is:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.


>
>> ---
>>  drivers/gpu/drm/drm_displayid.c          | 41 +++++++++++++++++++++---
>>  drivers/gpu/drm/drm_displayid_internal.h |  2 ++
>>  2 files changed, 39 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displ=
ayid.c
>> index 20b453d2b854..58d0bb6d2676 100644
>> --- a/drivers/gpu/drm/drm_displayid.c
>> +++ b/drivers/gpu/drm/drm_displayid.c
>> @@ -9,6 +9,34 @@
>>  #include "drm_crtc_internal.h"
>>  #include "drm_displayid_internal.h"
>>
>> +enum {
>> +       QUIRK_IGNORE_CHECKSUM,
>> +};
>> +
>> +struct displayid_quirk {
>> +       const struct drm_edid_ident ident;
>> +       u8 quirks;
>> +};
>> +
>> +static const struct displayid_quirk quirks[] =3D {
>> +       {
>> +               .ident =3D DRM_EDID_IDENT_INIT('C', 'S', 'O', 5142, "MNE=
007ZA1-5"),
>> +               .quirks =3D BIT(QUIRK_IGNORE_CHECKSUM),
>> +       },
>> +};
>> +
>> +static u8 get_quirks(const struct drm_edid *drm_edid)
>> +{
>> +       int i;
>> +
>> +       for (i =3D 0; i < ARRAY_SIZE(quirks); i++) {
>> +               if (drm_edid_match(drm_edid, &quirks[i].ident))
>> +                       return quirks[i].quirks;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>  static const struct displayid_header *
>>  displayid_get_header(const u8 *displayid, int length, int index)
>>  {
>> @@ -23,7 +51,7 @@ displayid_get_header(const u8 *displayid, int length, =
int index)
>>  }
>>
>>  static const struct displayid_header *
>> -validate_displayid(const u8 *displayid, int length, int idx)
>> +validate_displayid(const u8 *displayid, int length, int idx, bool ignor=
e_checksum)
>>  {
>>         int i, dispid_length;
>>         u8 csum =3D 0;
>> @@ -41,8 +69,11 @@ validate_displayid(const u8 *displayid, int length, i=
nt idx)
>>         for (i =3D 0; i < dispid_length; i++)
>>                 csum +=3D displayid[idx + i];
>>         if (csum) {
>> -               DRM_NOTE("DisplayID checksum invalid, remainder is %d\n"=
, csum);
>> -               return ERR_PTR(-EINVAL);
>> +               DRM_NOTE("DisplayID checksum invalid, remainder is %d%s\=
n", csum,
>> +                        ignore_checksum ? " (ignoring)" : "");
>> +
>> +               if (!ignore_checksum)
>> +                       return ERR_PTR(-EINVAL);
>>         }
>>
>>         return base;
>> @@ -52,6 +83,7 @@ static const u8 *find_next_displayid_extension(struct =
displayid_iter *iter)
>>  {
>>         const struct displayid_header *base;
>>         const u8 *displayid;
>> +       bool ignore_checksum =3D iter->quirks & BIT(QUIRK_IGNORE_CHECKSU=
M);
>>
>>         displayid =3D drm_edid_find_extension(iter->drm_edid, DISPLAYID_=
EXT, &iter->ext_index);
>>         if (!displayid)
>> @@ -61,7 +93,7 @@ static const u8 *find_next_displayid_extension(struct =
displayid_iter *iter)
>>         iter->length =3D EDID_LENGTH - 1;
>>         iter->idx =3D 1;
>>
>> -       base =3D validate_displayid(displayid, iter->length, iter->idx);
>> +       base =3D validate_displayid(displayid, iter->length, iter->idx, =
ignore_checksum);
>>         if (IS_ERR(base))
>>                 return NULL;
>>
>> @@ -76,6 +108,7 @@ void displayid_iter_edid_begin(const struct drm_edid =
*drm_edid,
>>         memset(iter, 0, sizeof(*iter));
>>
>>         iter->drm_edid =3D drm_edid;
>> +       iter->quirks =3D get_quirks(drm_edid);
>>  }
>>
>>  static const struct displayid_block *
>> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/=
drm_displayid_internal.h
>> index 957dd0619f5c..5b1b32f73516 100644
>> --- a/drivers/gpu/drm/drm_displayid_internal.h
>> +++ b/drivers/gpu/drm/drm_displayid_internal.h
>> @@ -167,6 +167,8 @@ struct displayid_iter {
>>
>>         u8 version;
>>         u8 primary_use;
>> +
>> +       u8 quirks;
>>  };
>>
>>  void displayid_iter_edid_begin(const struct drm_edid *drm_edid,
>> --
>> 2.47.3
>>

--=20
Jani Nikula, Intel
