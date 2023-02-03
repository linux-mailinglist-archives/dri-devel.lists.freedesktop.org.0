Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69434689945
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 13:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF5710E789;
	Fri,  3 Feb 2023 12:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6098510E221
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675429162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lxSnNfBQQqxewVu7fj3XT1+S2qxygqhj+awM7a17he0=;
 b=dlTQw7cu8Zb7WDudm5H3eUQWBL53VR8aneMQhVqS8Wi03FlHpleSo4ahzuY/xRvv1I6bg8
 KOgokGuDuutfDJJw5WrqsMvKp8GOPJ/jr/3J6lUn5YbQhimfb81dbPxp0MY7CIRUZ37KsR
 gZjWKYfy1jUlA81vpDsq2eytYe0rryE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-WCI125wSMJGBCxyAQZGk6A-1; Fri, 03 Feb 2023 07:59:20 -0500
X-MC-Unique: WCI125wSMJGBCxyAQZGk6A-1
Received: by mail-lf1-f69.google.com with SMTP id
 f17-20020ac25091000000b004b565e69540so2110320lfm.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 04:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lxSnNfBQQqxewVu7fj3XT1+S2qxygqhj+awM7a17he0=;
 b=lHlTYZ5WG0Zu/FEajKdeGfHWYUZjgVxXyFOmnRE2qASfMJQnoEHKJeBiu3iMs0hrZp
 Nie/u6tQuA/4GG5lNzD2C17Lr3p7Zm/lKRp7L7568BRZ6Y4YGFynD1PukjkxhH8sPYVK
 QO0NEWYDzLRPI+ZaFjvAeTxr8al6MxLFEqBAx43ZVgKstgyhNmKjnbDsqZsNPPD8wa5V
 v4nakSg2QTUR72qo53LG/ykzmzvEz3igP7w15mJfABipNfMa8tjVWtsioOydn1QrqQ/+
 I4iPXMfyukYPaDv7YcQ5DUoqqJ3d1WGshildLybFqm8Eh2DmImLk2JiBLXOVtasnJHv5
 1ffQ==
X-Gm-Message-State: AO0yUKXFfXZQ3Nt+u4FLfWRD3nGGyuGiCjMlWgy48Tq/K7P8jJNvxcLF
 0DbC4M9A12uTl0vwVvoOy9p2+sZsLhSDtP6M9oegKRwHTqzBHXfCPGkG2I1i17EOHGsNKD8Nsty
 LrB7eBJRNf8rx3dNhntzKYEzF11Mv7JYPkadzWFhDld8a
X-Received: by 2002:a2e:8e97:0:b0:28e:df3a:a1b with SMTP id
 z23-20020a2e8e97000000b0028edf3a0a1bmr1547346ljk.114.1675429159362; 
 Fri, 03 Feb 2023 04:59:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/+h03gwO9ewZk/UoCzyXfi/b/3o17NroZr61T40tmRKO0Kl7xqJCxQpGvzTdQ+eE81yHbYUiD27TBmFW65fPI=
X-Received: by 2002:a2e:8e97:0:b0:28e:df3a:a1b with SMTP id
 z23-20020a2e8e97000000b0028edf3a0a1bmr1547343ljk.114.1675429159179; Fri, 03
 Feb 2023 04:59:19 -0800 (PST)
MIME-Version: 1.0
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <Y9zkef5FjtZ7guVS@intel.com>
In-Reply-To: <Y9zkef5FjtZ7guVS@intel.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 3 Feb 2023 13:59:07 +0100
Message-ID: <CA+hFU4ymiOg06MQeKLcn5MSrR=BZnOLODdZCFvGUdWqt_ha61A@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 3, 2023 at 11:40 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Feb 03, 2023 at 02:07:44AM +0000, Joshua Ashton wrote:
> > Userspace has no way of controlling or knowing the pixel encoding
> > currently, so there is no way for it to ever get the right values here.
>
> That applies to a lot of the other values as well (they are
> explicitly RGB or YCC). The idea was that this property sets the
> infoframe/MSA/SDP value exactly, and other properties should be
> added to for use userspace to control the pixel encoding/colorspace
> conversion(if desired, or userspace just makes sure to
> directly feed in correct kind of data).

I'm all for getting userspace control over pixel encoding but even
then the kernel always knows which pixel encoding is selected and
which InfoFrame has to be sent. Is there a reason why userspace would
want to control the variant explicitly to the wrong value?

>
> >
> > When we do add pixel_encoding control from userspace,we can pick the
> > right value for the colorimetry packet based on the
> > pixel_encoding + the colorspace.
> >
> > Let's deprecate these values, and have one BT.2020 colorspace entry
> > that userspace can use.
> >
> > Note: _CYCC was effectively 'removed' by this change, but that was not
> > possible to be taken advantage of anyway, as there is currently no
> > pixel_encoding control so it would not be possible to output
> > linear YCbCr.
> >
> > Signed-off-by: Joshua Ashton <joshua@froggi.es>
> >
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > Cc: Vitaly.Prosyak@amd.com
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Cc: Joshua Ashton <joshua@froggi.es>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: amd-gfx@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_helper.c |  9 ++++-----
> >  drivers/gpu/drm/drm_connector.c           | 12 ++++++------
> >  drivers/gpu/drm/i915/display/intel_dp.c   | 20 +++++++++-----------
> >  include/drm/drm_connector.h               | 19 ++++++++++---------
> >  4 files changed, 29 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/dr=
m/display/drm_hdmi_helper.c
> > index 0264abe55278..c85860600395 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > @@ -99,8 +99,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
> >  #define HDMI_COLORIMETRY_OPYCC_601           (C(3) | EC(3) | ACE(0))
> >  #define HDMI_COLORIMETRY_OPRGB                       (C(3) | EC(4) | A=
CE(0))
> >  #define HDMI_COLORIMETRY_BT2020_CYCC         (C(3) | EC(5) | ACE(0))
> > -#define HDMI_COLORIMETRY_BT2020_RGB          (C(3) | EC(6) | ACE(0))
> > -#define HDMI_COLORIMETRY_BT2020_YCC          (C(3) | EC(6) | ACE(0))
> > +#define HDMI_COLORIMETRY_BT2020                      (C(3) | EC(6) | A=
CE(0))
> >  #define HDMI_COLORIMETRY_DCI_P3_RGB_D65              (C(3) | EC(7) | A=
CE(0))
> >  #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER  (C(3) | EC(7) | ACE(1))
> >
> > @@ -113,9 +112,9 @@ static const u32 hdmi_colorimetry_val[] =3D {
> >       [DRM_MODE_COLORIMETRY_SYCC_601] =3D HDMI_COLORIMETRY_SYCC_601,
> >       [DRM_MODE_COLORIMETRY_OPYCC_601] =3D HDMI_COLORIMETRY_OPYCC_601,
> >       [DRM_MODE_COLORIMETRY_OPRGB] =3D HDMI_COLORIMETRY_OPRGB,
> > -     [DRM_MODE_COLORIMETRY_BT2020_CYCC] =3D HDMI_COLORIMETRY_BT2020_CY=
CC,
> > -     [DRM_MODE_COLORIMETRY_BT2020_RGB] =3D HDMI_COLORIMETRY_BT2020_RGB=
,
> > -     [DRM_MODE_COLORIMETRY_BT2020_YCC] =3D HDMI_COLORIMETRY_BT2020_YCC=
,
> > +     [DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1] =3D HDMI_COLORIMETRY_B=
T2020,
> > +     [DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2] =3D HDMI_COLORIMETRY_B=
T2020,
> > +     [DRM_MODE_COLORIMETRY_BT2020] =3D HDMI_COLORIMETRY_BT2020,
> >  };
> >
> >  #undef C
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> > index 61c29ce74b03..58699ab15a6a 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -1029,11 +1029,11 @@ static const struct drm_prop_enum_list hdmi_col=
orspaces[] =3D {
> >       /* Colorimetry based on IEC 61966-2-5 */
> >       { DRM_MODE_COLORIMETRY_OPRGB, "opRGB" },
> >       /* Colorimetry based on ITU-R BT.2020 */
> > -     { DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> > +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1"=
 },
> >       /* Colorimetry based on ITU-R BT.2020 */
> > -     { DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> > +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2"=
 },
> >       /* Colorimetry based on ITU-R BT.2020 */
> > -     { DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> > +     { DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
> >       /* Added as part of Additional Colorimetry Extension in 861.G */
> >       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> >       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER, "DCI-P3_RGB_Theater" }=
,
> > @@ -1054,7 +1054,7 @@ static const struct drm_prop_enum_list dp_colorsp=
aces[] =3D {
> >       /* Colorimetry based on SMPTE RP 431-2 */
> >       { DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65, "DCI-P3_RGB_D65" },
> >       /* Colorimetry based on ITU-R BT.2020 */
> > -     { DRM_MODE_COLORIMETRY_BT2020_RGB, "BT2020_RGB" },
> > +     { DRM_MODE_COLORIMETRY_BT2020, "BT2020" },
> >       { DRM_MODE_COLORIMETRY_BT601_YCC, "BT601_YCC" },
> >       { DRM_MODE_COLORIMETRY_BT709_YCC, "BT709_YCC" },
> >       /* Standard Definition Colorimetry based on IEC 61966-2-4 */
> > @@ -1066,9 +1066,9 @@ static const struct drm_prop_enum_list dp_colorsp=
aces[] =3D {
> >       /* Colorimetry based on IEC 61966-2-5 [33] */
> >       { DRM_MODE_COLORIMETRY_OPYCC_601, "opYCC_601" },
> >       /* Colorimetry based on ITU-R BT.2020 */
> > -     { DRM_MODE_COLORIMETRY_BT2020_CYCC, "BT2020_CYCC" },
> > +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1, "BT2020_DEPRECATED_1"=
 },
> >       /* Colorimetry based on ITU-R BT.2020 */
> > -     { DRM_MODE_COLORIMETRY_BT2020_YCC, "BT2020_YCC" },
> > +     { DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2, "BT2020_DEPRECATED_2"=
 },
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index c9be61d2348e..1aa5dedeec7b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -1763,14 +1763,12 @@ static void intel_dp_compute_vsc_colorimetry(co=
nst struct intel_crtc_state *crtc
> >       case DRM_MODE_COLORIMETRY_OPYCC_601:
> >               vsc->colorimetry =3D DP_COLORIMETRY_OPYCC_601;
> >               break;
> > -     case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> > -             vsc->colorimetry =3D DP_COLORIMETRY_BT2020_CYCC;
> > -             break;
> > -     case DRM_MODE_COLORIMETRY_BT2020_RGB:
> > -             vsc->colorimetry =3D DP_COLORIMETRY_BT2020_RGB;
> > -             break;
> > -     case DRM_MODE_COLORIMETRY_BT2020_YCC:
> > -             vsc->colorimetry =3D DP_COLORIMETRY_BT2020_YCC;
> > +     case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> > +     case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> > +     case DRM_MODE_COLORIMETRY_BT2020:
> > +             vsc->colorimetry =3D vsc->pixelformat =3D=3D DP_PIXELFORM=
AT_RGB
> > +                     ? DP_COLORIMETRY_BT2020_RGB
> > +                     : DP_COLORIMETRY_BT2020_YCC;
> >               break;
> >       case DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
> >       case DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> > @@ -3043,9 +3041,9 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_st=
ate *crtc_state,
> >       switch (conn_state->colorspace) {
> >       case DRM_MODE_COLORIMETRY_SYCC_601:
> >       case DRM_MODE_COLORIMETRY_OPYCC_601:
> > -     case DRM_MODE_COLORIMETRY_BT2020_YCC:
> > -     case DRM_MODE_COLORIMETRY_BT2020_RGB:
> > -     case DRM_MODE_COLORIMETRY_BT2020_CYCC:
> > +     case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> > +     case DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> > +     case DRM_MODE_COLORIMETRY_BT2020:
> >               return true;
> >       default:
> >               break;
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index eb4cc9076e16..42a3cf43168c 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -390,12 +390,13 @@ enum drm_privacy_screen_status {
> >   *   opYCC601 colorimetry format
> >   * @DRM_MODE_COLORIMETRY_OPRGB:
> >   *   opRGB colorimetry format
> > - * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
> > - *   ITU-R BT.2020 Y'c C'bc C'rc (linear) colorimetry format
> > - * @DRM_MODE_COLORIMETRY_BT2020_RGB:
> > - *   ITU-R BT.2020 R' G' B' colorimetry format
> > - * @DRM_MODE_COLORIMETRY_BT2020_YCC:
> > - *   ITU-R BT.2020 Y' C'b C'r colorimetry format
> > + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1:
> > + * @DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2:
> > + * @DRM_MODE_COLORIMETRY_BT2020:
> > + *   ITU-R BT.2020 [R' G' B'] or
> > + *    ITU-R BT.2020 [Y' C'b C'r] or
> > + *   ITU-R BT.2020 [Y'c C'bc C'rc] (linear)
> > + *   colorimetry format
> >   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
> >   *   DCI-P3 (SMPTE RP 431-2) colorimetry format
> >   * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
> > @@ -420,9 +421,9 @@ enum drm_colorspace {
> >       DRM_MODE_COLORIMETRY_SYCC_601,
> >       DRM_MODE_COLORIMETRY_OPYCC_601,
> >       DRM_MODE_COLORIMETRY_OPRGB,
> > -     DRM_MODE_COLORIMETRY_BT2020_CYCC,
> > -     DRM_MODE_COLORIMETRY_BT2020_RGB,
> > -     DRM_MODE_COLORIMETRY_BT2020_YCC,
> > +     DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_1,
> > +     DRM_MODE_COLORIMETRY_BT2020_DEPRECATED_2,
> > +     DRM_MODE_COLORIMETRY_BT2020,
> >       /* Additional Colorimetry extension added as part of CTA 861.G */
> >       DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
> >       DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,
> > --
> > 2.39.1
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

