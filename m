Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10496413162
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 12:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2106E933;
	Tue, 21 Sep 2021 10:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611ED6E912
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 09:01:49 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id n18so12905238plp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=56qdcbF4khZId0epbEdp0X64oIo3h3hxQw6L3Qej4kk=;
 b=Emi4BcUvaAsnynPqDTuG2hpNeLk/xr71b1qG5TugJPDqcKT/fyduYe3k/Z3YaROuoX
 bxYrzx1E6I+4zDr5c5wqwk7YSI072ENQ0Jp+JstaYy7sevPGVQG+FWl9qhQjtjfBYu9B
 OOPYGotgS7HsdY674eyHohczO4NCAnzcy/kbaa0siOcXrgrQSyMscVj0vagpyEHWvjSw
 ykaJR1wJILV8GMnj9VN/7Lk6KTJ2GfUVqVepYjsv0Xk8nc67z+p+wLbtHsvrwyMOIE2Y
 Cm0VHIdP4obcMSFJzQ19ZELoeTbHMMMwMViPsXep990NrkPnSrf92MdOo7E+boB40Fu8
 wk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=56qdcbF4khZId0epbEdp0X64oIo3h3hxQw6L3Qej4kk=;
 b=dP8xziI/k/3e07xgaCeZ+o82v6QgaLtRG7pmEK+sD/e55Bz6IYYwk4rQigjp77RTSc
 l+5t4Z57xso5NU/zZID3OSF1G1FP4nMcq9yUDNsoh9Wr7AyZVMqXG+BiU2qTbXvLalhi
 Wrdc5H9OEJEQlh6zEh6Rd93QmAXwf0pzSZvzDXLFNcwUeoe8dzsygjF9NZN5XUC1SoB4
 bNRsA26LYNsBfzT/0i5bcpsWbhC8TN/S64/vqjNrjozzpXsH0JzPoLeHImjj6JidLTCZ
 2lQDVL43aaPVm+lCGY35Mjz8RcW05kHBnwTt24N0TTbst2HiJKYzlX6CNF5syLV8imYz
 LG5Q==
X-Gm-Message-State: AOAM532fVotDxCg02f6lGSmcgxO6Ojd6HOgmdvqzAQ4ZXzx/VDw8sUs8
 4XL+D6ANIHiJawlJChacvb7zj2VVSK8vBXoSbdg6VA==
X-Google-Smtp-Source: ABdhPJxkhXDAgMHSOB81dxPKEiV/mPe07wPsWzLzC7dGArUAzbmez9eAszJ13drtSIgf5gkJT7PkZxdrGqUClXPaTxw=
X-Received: by 2002:a17:90a:de98:: with SMTP id
 n24mr4176955pjv.4.1632214908782; 
 Tue, 21 Sep 2021 02:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210920141101.194959-1-lma@semihalf.com>
 <051f4a37e178d11c6dbcd05b5d6be28731cd7302.camel@intel.com>
In-Reply-To: <051f4a37e178d11c6dbcd05b5d6be28731cd7302.camel@intel.com>
From: Lukasz Majczak <lma@semihalf.com>
Date: Tue, 21 Sep 2021 11:01:37 +0200
Message-ID: <CAFJ_xboPCc5HkSmu-yVsBF253JhBNSmttDgbOa=2w23EKvbW5A@mail.gmail.com>
Subject: Re: [PATCH v1] drm/i915/bdb: Fix version check
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "Lee, Shawn C" <shawn.c.lee@intel.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, 
 "upstream@semihalf.com" <upstream@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 21 Sep 2021 10:15:26 +0000
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

pon., 20 wrz 2021 o 22:47 Souza, Jose <jose.souza@intel.com> napisa=C5=82(a=
):
>
> On Mon, 2021-09-20 at 16:11 +0200, Lukasz Majczak wrote:
> > With patch "drm/i915/vbt: Fix backlight parsing for VBT 234+"
> > the size of bdb_lfp_backlight_data structure has been increased,
> > causing if-statement in the parse_lfp_backlight function
> > that comapres this structure size to the one retrieved from BDB,
> > always to fail for older revisions.
> > This patch fixes it by comparing a total size of all fileds from
> > the structure (present before the change) with the value gathered from =
BDB.
> > Tested on Chromebook Pixelbook (Nocturne) (reports bdb->version =3D 221=
)
> >
> > Cc: <stable@vger.kernel.org> # 5.4+
> > Tested-by: Lukasz Majczak <lma@semihalf.com>
> > Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_bios.c     | 4 +++-
> >  drivers/gpu/drm/i915/display/intel_vbt_defs.h | 5 +++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/dr=
m/i915/display/intel_bios.c
> > index 3c25926092de..052a19b455d1 100644
> > --- a/drivers/gpu/drm/i915/display/intel_bios.c
> > +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> > @@ -452,7 +452,9 @@ parse_lfp_backlight(struct drm_i915_private *i915,
> >
> >       i915->vbt.backlight.type =3D INTEL_BACKLIGHT_DISPLAY_DDI;
> >       if (bdb->version >=3D 191 &&
> > -         get_blocksize(backlight_data) >=3D sizeof(*backlight_data)) {
> > +         get_blocksize(backlight_data) >=3D (sizeof(backlight_data->en=
try_size) +
> > +                                           sizeof(backlight_data->data=
) +
> > +                                           sizeof(backlight_data->leve=
l))) {
>
> Missing sizeof(backlight_data->backlight_control) but this is getting ver=
y verbose.
> Would be better have a expected size variable set each version set in the=
 beginning of this function.
>
> something like:
> switch (bdb->version) {
> case 191:
>         expected_size =3D x;
>         break;
> case 234:
>         expected_size =3D x;
>         break;
> case 236:
> default:
>         expected_size =3D x;
> }
>
>
> >               const struct lfp_backlight_control_method *method;
> >
> >               method =3D &backlight_data->backlight_control[panel_type]=
;
> > diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gp=
u/drm/i915/display/intel_vbt_defs.h
> > index 330077c2e588..fff456bf8783 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> > +++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
> > @@ -814,6 +814,11 @@ struct lfp_brightness_level {
> >       u16 reserved;
> >  } __packed;
> >
> > +/*
> > + * Changing struct bdb_lfp_backlight_data might affect its
> > + * size comparation to the value hold in BDB.
> > + * (e.g. in parse_lfp_backlight())
> > + */
>
> This is true for all the blocks so I don't think we need this comment.
>
> >  struct bdb_lfp_backlight_data {
> >       u8 entry_size;
> >       struct lfp_backlight_data_entry data[16];
>
Hi Jose, Jani

Jani - you are right - I was working on 5.4 with a backported patch  -
I'm sorry for this confusion.

Jose,

Regarding expected_size, I couldn't find documentation that could
described this structure size changes among revisions, so all I could
do is to do an educated guess, basing on comments at this structure,
like:

(gdb) ptype /o  struct bdb_lfp_backlight_data
/* offset    |  size */  type =3D struct bdb_lfp_backlight_data {
/*    0      |     1 */    u8 entry_size;
/*    1      |    96 */    struct lfp_backlight_data_entry data[16];
/*   97      |    16 */    u8 level[16];
/*  113      |    16 */    struct lfp_backlight_control_method
backlight_control[16];
/*  129      |    64 */    struct lfp_brightness_level
brightness_level[16]; /* 234+ */
/*  193      |    64 */    struct lfp_brightness_level
brightness_min_level[16]; /* 234+ */
/*  257      |    16 */    u8 brightness_precision_bits[16]; /* 236+ */

                           /* total size (bytes):  273 */
                         }

if (revision <=3D 234)
   expected_size =3D 129;
else if (revision > 234 && revision <=3D236)
  expected_size =3D 257;
else /* revision > 236 */
   expected_size =3D 273;

Is this approach ok? Otherwise I think I would need help from you to
get exact numbers for each revision...

Best regards,
Lukasz
