Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1997DFAA7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 20:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCEF10E986;
	Thu,  2 Nov 2023 19:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E361C10E985;
 Thu,  2 Nov 2023 19:06:26 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1f03db0a410so746027fac.1; 
 Thu, 02 Nov 2023 12:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698951986; x=1699556786; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/xUgcpbnnTlXsVcZhoWq2pWvJ/EENYDU0v0UaFuVGU=;
 b=f47IxcN14Wl0Z+snp2BnTpMHgM7NqvbeNkkpmGO74IgtGiEEcduBbzx4iQezLMgQ4v
 0QakHaM35dAlB8v5+qzO1UkQauongOq8nhiHy/VxlMI9S7asXEBySqPR32OyAzB8/xas
 es1WC2pNg6jo4cKJPCcquhw9Xh0G7j4wWbsBapLlUnHOtKL9dYzkeVDjEvi7S7KdghuH
 MdA94ueyiGuLPvUWX88mFACeHeyCxtdAqrGUdX3AD6girljVsjwRiTRJWW2sxtlymFoV
 7npn6TsL2LqU315CLzrq/0uV8mYLQEkFqtKupATn420ilcEaE67ZiBTpATZgAI/x/EqZ
 WNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698951986; x=1699556786;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/xUgcpbnnTlXsVcZhoWq2pWvJ/EENYDU0v0UaFuVGU=;
 b=X/KD3Tj16zaVXGDy5QY6ewq4H2hb5NpoG1YxeKzv2XmBj3yvxKVNHB8ph5OUcvs06l
 mekW1AYtyiQPmhLOvNWbe2tj735gRsD6jmqWiz2qUeZgp86lvyVNKVjQoulGsbb4qDM5
 DqZ8VQmaKflF7MyuJetoLd8tNKSFGWERGPDhy6l0FTjGa0iqg7ATD/uDKV9bwPchb0Qq
 aROKPjPPxkQjh3By+q4tWyCrv3KcF1SxQUYYCWqx6MivrWhpWHqLLky+J7pImSNqSmTa
 mNUIAOy7G56y1a+kCv3CBbNVolGvrTCWu5LXidfcqk4Wka1yjK5UUXOhPhzQpCAWqyJh
 s3RQ==
X-Gm-Message-State: AOJu0Yxur9Dqlp/7eynK+hyg4JPEIAZQ7qfkJZDyY8Et56Im8BsJCmwP
 RNipldKAgOcS+1uzF+56zswBJ1meJNj8kw8Psiw=
X-Google-Smtp-Source: AGHT+IE+V1VAlstb0TbKqgf3RZO31vQQTFTfQzdY2gUqTavTHX6nIqS+s+vxsEbElZ2mYPIfzTXXRqe/HPy+X4sL70o=
X-Received: by 2002:a05:6871:c48e:b0:1e9:dae7:f58a with SMTP id
 ci14-20020a056871c48e00b001e9dae7f58amr17197041oac.22.1698951985938; Thu, 02
 Nov 2023 12:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231101210037.130494-1-hamza.mahfooz@amd.com>
 <CADnq5_Nv0MnG+pPvRQO37OP8iYwz8oGvFLs2g-+U=URHWcqJGw@mail.gmail.com>
 <1eed6bfa-3e98-45d1-9908-2c5a0f3173c3@amd.com>
In-Reply-To: <1eed6bfa-3e98-45d1-9908-2c5a0f3173c3@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Nov 2023 15:06:14 -0400
Message-ID: <CADnq5_OUjbrVOmSr7vuK8h8rmg+q14ra1jiE+B0TRfZos-jn5w@mail.gmail.com>
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

On Thu, Nov 2, 2023 at 3:00=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.com=
> wrote:
>
> On 11/1/23 17:36, Alex Deucher wrote:
> > On Wed, Nov 1, 2023 at 5:01=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd=
.com> wrote:
> >>
> >> Without this fix the 5120x1440@240 timing of these monitors
> >> leads to screen flickering.
> >>
> >> Cc: stable@vger.kernel.org # 6.1+
> >> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1442
> >> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> >> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> >> ---
> >>   drivers/gpu/drm/drm_edid.c | 47 +++++++++++++++++++++++++++++++++++-=
--
> >>   1 file changed, 44 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> >> index bca2af4fe1fc..3fdb8907f66b 100644
> >> --- a/drivers/gpu/drm/drm_edid.c
> >> +++ b/drivers/gpu/drm/drm_edid.c
> >> @@ -89,6 +89,8 @@ static int oui(u8 first, u8 second, u8 third)
> >>   #define EDID_QUIRK_NON_DESKTOP                 (1 << 12)
> >>   /* Cap the DSC target bitrate to 15bpp */
> >>   #define EDID_QUIRK_CAP_DSC_15BPP               (1 << 13)
> >> +/* Fix up a particular 5120x1440@240Hz timing */
> >> +#define EDID_QUIRK_FIXUP_5120_1440_240         (1 << 14)
> >
> > What is wrong with the original timing that needs to be fixed?
>
> Apparently, all of timing values for the 5120x1440@240 mode of these
> monitors aren't set correctly (they are all lower than they should be)
> in their EDIDs. For what it's worth, the windows driver has had a quirk
> similar the one proposed in this patch for ~2 years.

It would be good to at least include the original mode timings from
the EDID and the new ones added by the quirk in the commit message and
a description of why they are problematic and why the new ones work.

Alex


>
> >
> > Alex
> >
> >
> >>
> >>   #define MICROSOFT_IEEE_OUI     0xca125c
> >>
> >> @@ -170,6 +172,12 @@ static const struct edid_quirk {
> >>          EDID_QUIRK('S', 'A', 'M', 596, EDID_QUIRK_PREFER_LARGE_60),
> >>          EDID_QUIRK('S', 'A', 'M', 638, EDID_QUIRK_PREFER_LARGE_60),
> >>
> >> +       /* Samsung C49G95T */
> >> +       EDID_QUIRK('S', 'A', 'M', 0x7053, EDID_QUIRK_FIXUP_5120_1440_2=
40),
> >> +
> >> +       /* Samsung S49AG95 */
> >> +       EDID_QUIRK('S', 'A', 'M', 0x71ac, EDID_QUIRK_FIXUP_5120_1440_2=
40),
> >> +
> >>          /* Sony PVM-2541A does up to 12 bpc, but only reports max 8 b=
pc */
> >>          EDID_QUIRK('S', 'N', 'Y', 0x2541, EDID_QUIRK_FORCE_12BPC),
> >>
> >> @@ -6586,7 +6594,37 @@ static void update_display_info(struct drm_conn=
ector *connector,
> >>          drm_edid_to_eld(connector, drm_edid);
> >>   }
> >>
> >> -static struct drm_display_mode *drm_mode_displayid_detailed(struct dr=
m_device *dev,
> >> +static void drm_mode_displayid_detailed_edid_quirks(struct drm_connec=
tor *connector,
> >> +                                                   struct drm_display=
_mode *mode)
> >> +{
> >> +       unsigned int hsync_width;
> >> +       unsigned int vsync_width;
> >> +
> >> +       if (connector->display_info.quirks & EDID_QUIRK_FIXUP_5120_144=
0_240) {
> >> +               if (mode->hdisplay =3D=3D 5120 && mode->vdisplay =3D=
=3D 1440 &&
> >> +                   mode->clock =3D=3D 1939490) {
> >> +                       hsync_width =3D mode->hsync_end - mode->hsync_=
start;
> >> +                       vsync_width =3D mode->vsync_end - mode->vsync_=
start;
> >> +
> >> +                       mode->clock =3D 2018490;
> >> +                       mode->hdisplay =3D 5120;
> >> +                       mode->hsync_start =3D 5120 + 8;
> >> +                       mode->hsync_end =3D 5120 + 8 + hsync_width;
> >> +                       mode->htotal =3D 5200;
> >> +
> >> +                       mode->vdisplay =3D 1440;
> >> +                       mode->vsync_start =3D 1440 + 165;
> >> +                       mode->vsync_end =3D 1440 + 165 + vsync_width;
> >> +                       mode->vtotal =3D 1619;
> >> +
> >> +                       drm_dbg_kms(connector->dev,
> >> +                                   "[CONNECTOR:%d:%s] Samsung 240Hz m=
ode quirk applied\n",
> >> +                                   connector->base.id, connector->nam=
e);
> >> +               }
> >> +       }
> >> +}
> >> +
> >> +static struct drm_display_mode *drm_mode_displayid_detailed(struct dr=
m_connector *connector,
> >>                                                              struct di=
splayid_detailed_timings_1 *timings,
> >>                                                              bool type=
_7)
> >>   {
> >> @@ -6605,7 +6643,7 @@ static struct drm_display_mode *drm_mode_display=
id_detailed(struct drm_device *d
> >>          bool hsync_positive =3D (timings->hsync[1] >> 7) & 0x1;
> >>          bool vsync_positive =3D (timings->vsync[1] >> 7) & 0x1;
> >>
> >> -       mode =3D drm_mode_create(dev);
> >> +       mode =3D drm_mode_create(connector->dev);
> >>          if (!mode)
> >>                  return NULL;
> >>
> >> @@ -6628,6 +6666,9 @@ static struct drm_display_mode *drm_mode_display=
id_detailed(struct drm_device *d
> >>
> >>          if (timings->flags & 0x80)
> >>                  mode->type |=3D DRM_MODE_TYPE_PREFERRED;
> >> +
> >> +       drm_mode_displayid_detailed_edid_quirks(connector, mode);
> >> +
> >>          drm_mode_set_name(mode);
> >>
> >>          return mode;
> >> @@ -6650,7 +6691,7 @@ static int add_displayid_detailed_1_modes(struct=
 drm_connector *connector,
> >>          for (i =3D 0; i < num_timings; i++) {
> >>                  struct displayid_detailed_timings_1 *timings =3D &det=
->timings[i];
> >>
> >> -               newmode =3D drm_mode_displayid_detailed(connector->dev=
, timings, type_7);
> >> +               newmode =3D drm_mode_displayid_detailed(connector, tim=
ings, type_7);
> >>                  if (!newmode)
> >>                          continue;
> >>
> >> --
> >> 2.42.0
> >>
> --
> Hamza
>
