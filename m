Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 375527DEEB3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 10:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6358710E82D;
	Thu,  2 Nov 2023 09:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA0010E830;
 Thu,  2 Nov 2023 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698916591; x=1730452591;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OCRR/l5SncfbNOGTx53r+eb+uVJU0CxzR6TuOOtqBCU=;
 b=QS3xkmJ3frBpZSJba1kIeADgCbMT6wycCAHV4FHaeKeotYKloxxwEtiG
 9UwR3w1CpFge2ECHtwVXvhdcPIR8S/0hBkN4zsIjDF8fHRm941cat8anz
 ZfqCxYXL6WamuduSvHqIwScBT4qhSz8ANIcq4ThjMJW20Oer3X5yVw510
 wqmxH74Pqxc6Y2LJx5hh0RgCTLDENeu7Wn9cU5bNnde3JsahaZKbfp0VG
 ZQHa+ZuxvCBjnqxad2IdA3DK/c/7xI+BPYXNk/w1c/BGLIYUwnGuuk14N
 HGOA+HGb39yPxoVNaR26p+H919/RIl03Yeefmll/T/02yTytiihKBleSB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="455149090"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="455149090"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="934721720"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="934721720"
Received: from nofferma-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.121])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 02:16:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH] drm/edid: add a quirk for two 240Hz Samsung monitors
In-Reply-To: <CADnq5_Nv0MnG+pPvRQO37OP8iYwz8oGvFLs2g-+U=URHWcqJGw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231101210037.130494-1-hamza.mahfooz@amd.com>
 <CADnq5_Nv0MnG+pPvRQO37OP8iYwz8oGvFLs2g-+U=URHWcqJGw@mail.gmail.com>
Date: Thu, 02 Nov 2023 11:16:22 +0200
Message-ID: <87edh84is9.fsf@intel.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jerry Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 01 Nov 2023, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Wed, Nov 1, 2023 at 5:01=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.c=
om> wrote:
>>
>> Without this fix the 5120x1440@240 timing of these monitors
>> leads to screen flickering.
>>
>> Cc: stable@vger.kernel.org # 6.1+
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1442
>> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 47 +++++++++++++++++++++++++++++++++++---
>>  1 file changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index bca2af4fe1fc..3fdb8907f66b 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -89,6 +89,8 @@ static int oui(u8 first, u8 second, u8 third)
>>  #define EDID_QUIRK_NON_DESKTOP                 (1 << 12)
>>  /* Cap the DSC target bitrate to 15bpp */
>>  #define EDID_QUIRK_CAP_DSC_15BPP               (1 << 13)
>> +/* Fix up a particular 5120x1440@240Hz timing */
>> +#define EDID_QUIRK_FIXUP_5120_1440_240         (1 << 14)
>
> What is wrong with the original timing that needs to be fixed?

Indeed. I'd be wary of applying this quirk as-is, because it'll impact
all drivers and all connectors.

The bug report does not have a single EDID from the affected displays
attached.

The quirk sets mode members that apparently do not need to be modified.

Cc: Ville


BR,
Jani.


>
> Alex
>
>
>>
>>  #define MICROSOFT_IEEE_OUI     0xca125c
>>
>> @@ -170,6 +172,12 @@ static const struct edid_quirk {
>>         EDID_QUIRK('S', 'A', 'M', 596, EDID_QUIRK_PREFER_LARGE_60),
>>         EDID_QUIRK('S', 'A', 'M', 638, EDID_QUIRK_PREFER_LARGE_60),
>>
>> +       /* Samsung C49G95T */
>> +       EDID_QUIRK('S', 'A', 'M', 0x7053, EDID_QUIRK_FIXUP_5120_1440_240=
),
>> +
>> +       /* Samsung S49AG95 */
>> +       EDID_QUIRK('S', 'A', 'M', 0x71ac, EDID_QUIRK_FIXUP_5120_1440_240=
),
>> +
>>         /* Sony PVM-2541A does up to 12 bpc, but only reports max 8 bpc =
*/
>>         EDID_QUIRK('S', 'N', 'Y', 0x2541, EDID_QUIRK_FORCE_12BPC),
>>
>> @@ -6586,7 +6594,37 @@ static void update_display_info(struct drm_connec=
tor *connector,
>>         drm_edid_to_eld(connector, drm_edid);
>>  }
>>
>> -static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_=
device *dev,
>> +static void drm_mode_displayid_detailed_edid_quirks(struct drm_connecto=
r *connector,
>> +                                                   struct drm_display_m=
ode *mode)
>> +{
>> +       unsigned int hsync_width;
>> +       unsigned int vsync_width;
>> +
>> +       if (connector->display_info.quirks & EDID_QUIRK_FIXUP_5120_1440_=
240) {
>> +               if (mode->hdisplay =3D=3D 5120 && mode->vdisplay =3D=3D =
1440 &&
>> +                   mode->clock =3D=3D 1939490) {
>> +                       hsync_width =3D mode->hsync_end - mode->hsync_st=
art;
>> +                       vsync_width =3D mode->vsync_end - mode->vsync_st=
art;
>> +
>> +                       mode->clock =3D 2018490;
>> +                       mode->hdisplay =3D 5120;
>> +                       mode->hsync_start =3D 5120 + 8;
>> +                       mode->hsync_end =3D 5120 + 8 + hsync_width;
>> +                       mode->htotal =3D 5200;
>> +
>> +                       mode->vdisplay =3D 1440;
>> +                       mode->vsync_start =3D 1440 + 165;
>> +                       mode->vsync_end =3D 1440 + 165 + vsync_width;
>> +                       mode->vtotal =3D 1619;
>> +
>> +                       drm_dbg_kms(connector->dev,
>> +                                   "[CONNECTOR:%d:%s] Samsung 240Hz mod=
e quirk applied\n",
>> +                                   connector->base.id, connector->name);
>> +               }
>> +       }
>> +}
>> +
>> +static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_=
connector *connector,
>>                                                             struct displ=
ayid_detailed_timings_1 *timings,
>>                                                             bool type_7)
>>  {
>> @@ -6605,7 +6643,7 @@ static struct drm_display_mode *drm_mode_displayid=
_detailed(struct drm_device *d
>>         bool hsync_positive =3D (timings->hsync[1] >> 7) & 0x1;
>>         bool vsync_positive =3D (timings->vsync[1] >> 7) & 0x1;
>>
>> -       mode =3D drm_mode_create(dev);
>> +       mode =3D drm_mode_create(connector->dev);
>>         if (!mode)
>>                 return NULL;
>>
>> @@ -6628,6 +6666,9 @@ static struct drm_display_mode *drm_mode_displayid=
_detailed(struct drm_device *d
>>
>>         if (timings->flags & 0x80)
>>                 mode->type |=3D DRM_MODE_TYPE_PREFERRED;
>> +
>> +       drm_mode_displayid_detailed_edid_quirks(connector, mode);
>> +
>>         drm_mode_set_name(mode);
>>
>>         return mode;
>> @@ -6650,7 +6691,7 @@ static int add_displayid_detailed_1_modes(struct d=
rm_connector *connector,
>>         for (i =3D 0; i < num_timings; i++) {
>>                 struct displayid_detailed_timings_1 *timings =3D &det->t=
imings[i];
>>
>> -               newmode =3D drm_mode_displayid_detailed(connector->dev, =
timings, type_7);
>> +               newmode =3D drm_mode_displayid_detailed(connector, timin=
gs, type_7);
>>                 if (!newmode)
>>                         continue;
>>
>> --
>> 2.42.0
>>

--=20
Jani Nikula, Intel
