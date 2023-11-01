Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B24E7DE775
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 22:36:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA82110E7B8;
	Wed,  1 Nov 2023 21:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C05110E7BF;
 Wed,  1 Nov 2023 21:36:36 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5820299b99cso661683eaf.1; 
 Wed, 01 Nov 2023 14:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698874595; x=1699479395; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzeWTgZIZ83OtuqSWokoE3B69bPXrO05k5OrT4HO0NY=;
 b=lgdw8og3g8fSds6tR/NHCuHjwI3gSouMb4uRF1dkvwZCBFa5T6iMVEhb01LKgtFNBO
 uMz17oDmgCPVlVWHFptZDd/pQLKyVA3H0NDEqFT+DIVGGMWhXZSfCHhmnZg/Op72JeND
 c7lQY2vnLjEUZ4ZWKl7nev/xrCATu+M4TMv2MR0W8KFsv0XvTc+bF3FpUix3e09JPi1w
 QHcmoq45UUDnWj3HF/GgSuB1dtMstKuEERZxCUO3/xgU8eE6hYi0klT4lTvWnuRNsbuY
 JoMW/XTxkfTkBnl+PB5fVU2G9bm+60PvCQ6XTdH6/Agii0JA+wgFTHicJ5DhCGkfY0E2
 GW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698874595; x=1699479395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NzeWTgZIZ83OtuqSWokoE3B69bPXrO05k5OrT4HO0NY=;
 b=qZT9TdDJdpMtnbIVkWBE92Qn4z/ln/R8y2rKlQuJSE8gLDyCcNJTFkkS/Ok6kmR24h
 eqRPpBSUjKreaWBviWs8vMgFDqyS351UbDePjaUfkjg7FkMXJxWApb1oyyWyCXSoTq5e
 bjo+QD7nD+lPIkbbvfDuF/CHHT/bEYakpdIzdRMu5dSJE8fqw+LZH+YDxEQvlv4Hh5vc
 1XUfZFAIDSDhE+BjXp5P7EF2Z8SnotoeiACekHtNoI8V+VgM3F94muWs0Bf161LXQLho
 K6kHLXnKt9ru6BFAPBGWEydJjE+Gkrh6uMaETb0EMGnLL3g9I5Qo+1o2TiiiAF/V+kwZ
 7MlQ==
X-Gm-Message-State: AOJu0Yw/jlIMbXF+xkbm1FkA4T3an3niEb7vvbp4hOePtX7y/XFPtva0
 doWxiK8YTODO83AclZKO6SMMawteBraKz+RMDuw=
X-Google-Smtp-Source: AGHT+IGVaW7xWUNgn6WGaMiP138/xSb7/M1aRCKqX5RPCLQjltubi4nNgmznGdjRFlY6UmtBEOIaKOjSpBWCTg7AsRA=
X-Received: by 2002:a05:6871:60d:b0:1e9:88e0:b8ba with SMTP id
 w13-20020a056871060d00b001e988e0b8bamr2121816oan.29.1698874595339; Wed, 01
 Nov 2023 14:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231101210037.130494-1-hamza.mahfooz@amd.com>
In-Reply-To: <20231101210037.130494-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 1 Nov 2023 17:36:24 -0400
Message-ID: <CADnq5_Nv0MnG+pPvRQO37OP8iYwz8oGvFLs2g-+U=URHWcqJGw@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: add a quirk for two 240Hz Samsung monitors
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jerry Zuo <jerry.zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 1, 2023 at 5:01=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.com=
> wrote:
>
> Without this fix the 5120x1440@240 timing of these monitors
> leads to screen flickering.
>
> Cc: stable@vger.kernel.org # 6.1+
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1442
> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 47 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 44 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index bca2af4fe1fc..3fdb8907f66b 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -89,6 +89,8 @@ static int oui(u8 first, u8 second, u8 third)
>  #define EDID_QUIRK_NON_DESKTOP                 (1 << 12)
>  /* Cap the DSC target bitrate to 15bpp */
>  #define EDID_QUIRK_CAP_DSC_15BPP               (1 << 13)
> +/* Fix up a particular 5120x1440@240Hz timing */
> +#define EDID_QUIRK_FIXUP_5120_1440_240         (1 << 14)

What is wrong with the original timing that needs to be fixed?

Alex


>
>  #define MICROSOFT_IEEE_OUI     0xca125c
>
> @@ -170,6 +172,12 @@ static const struct edid_quirk {
>         EDID_QUIRK('S', 'A', 'M', 596, EDID_QUIRK_PREFER_LARGE_60),
>         EDID_QUIRK('S', 'A', 'M', 638, EDID_QUIRK_PREFER_LARGE_60),
>
> +       /* Samsung C49G95T */
> +       EDID_QUIRK('S', 'A', 'M', 0x7053, EDID_QUIRK_FIXUP_5120_1440_240)=
,
> +
> +       /* Samsung S49AG95 */
> +       EDID_QUIRK('S', 'A', 'M', 0x71ac, EDID_QUIRK_FIXUP_5120_1440_240)=
,
> +
>         /* Sony PVM-2541A does up to 12 bpc, but only reports max 8 bpc *=
/
>         EDID_QUIRK('S', 'N', 'Y', 0x2541, EDID_QUIRK_FORCE_12BPC),
>
> @@ -6586,7 +6594,37 @@ static void update_display_info(struct drm_connect=
or *connector,
>         drm_edid_to_eld(connector, drm_edid);
>  }
>
> -static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_d=
evice *dev,
> +static void drm_mode_displayid_detailed_edid_quirks(struct drm_connector=
 *connector,
> +                                                   struct drm_display_mo=
de *mode)
> +{
> +       unsigned int hsync_width;
> +       unsigned int vsync_width;
> +
> +       if (connector->display_info.quirks & EDID_QUIRK_FIXUP_5120_1440_2=
40) {
> +               if (mode->hdisplay =3D=3D 5120 && mode->vdisplay =3D=3D 1=
440 &&
> +                   mode->clock =3D=3D 1939490) {
> +                       hsync_width =3D mode->hsync_end - mode->hsync_sta=
rt;
> +                       vsync_width =3D mode->vsync_end - mode->vsync_sta=
rt;
> +
> +                       mode->clock =3D 2018490;
> +                       mode->hdisplay =3D 5120;
> +                       mode->hsync_start =3D 5120 + 8;
> +                       mode->hsync_end =3D 5120 + 8 + hsync_width;
> +                       mode->htotal =3D 5200;
> +
> +                       mode->vdisplay =3D 1440;
> +                       mode->vsync_start =3D 1440 + 165;
> +                       mode->vsync_end =3D 1440 + 165 + vsync_width;
> +                       mode->vtotal =3D 1619;
> +
> +                       drm_dbg_kms(connector->dev,
> +                                   "[CONNECTOR:%d:%s] Samsung 240Hz mode=
 quirk applied\n",
> +                                   connector->base.id, connector->name);
> +               }
> +       }
> +}
> +
> +static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_c=
onnector *connector,
>                                                             struct displa=
yid_detailed_timings_1 *timings,
>                                                             bool type_7)
>  {
> @@ -6605,7 +6643,7 @@ static struct drm_display_mode *drm_mode_displayid_=
detailed(struct drm_device *d
>         bool hsync_positive =3D (timings->hsync[1] >> 7) & 0x1;
>         bool vsync_positive =3D (timings->vsync[1] >> 7) & 0x1;
>
> -       mode =3D drm_mode_create(dev);
> +       mode =3D drm_mode_create(connector->dev);
>         if (!mode)
>                 return NULL;
>
> @@ -6628,6 +6666,9 @@ static struct drm_display_mode *drm_mode_displayid_=
detailed(struct drm_device *d
>
>         if (timings->flags & 0x80)
>                 mode->type |=3D DRM_MODE_TYPE_PREFERRED;
> +
> +       drm_mode_displayid_detailed_edid_quirks(connector, mode);
> +
>         drm_mode_set_name(mode);
>
>         return mode;
> @@ -6650,7 +6691,7 @@ static int add_displayid_detailed_1_modes(struct dr=
m_connector *connector,
>         for (i =3D 0; i < num_timings; i++) {
>                 struct displayid_detailed_timings_1 *timings =3D &det->ti=
mings[i];
>
> -               newmode =3D drm_mode_displayid_detailed(connector->dev, t=
imings, type_7);
> +               newmode =3D drm_mode_displayid_detailed(connector, timing=
s, type_7);
>                 if (!newmode)
>                         continue;
>
> --
> 2.42.0
>
