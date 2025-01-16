Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5616EA13BE3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 15:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8EF10E1F6;
	Thu, 16 Jan 2025 14:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CKEm4TnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9308210E1F6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 14:13:30 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2f615e14d0fso218749a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 06:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737036810; x=1737641610; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4tLsdob9p3r0zB+KNzY3RQWBOKfuGomymPI9RGe1T8=;
 b=CKEm4TnMxUF7dZOAJTh/EJqvoPlDpe4d6RNc1Vjg/7rr0Ei0Otr4lBkPmr0Cz15Qp/
 zjFXkkfDD/8iIEoWznxEfnuLH922/Yrz1pcEUIUg3jnB65Uw7xZO7rEPrD+YF/ZnkZxL
 s26bMfTCE/dZNUzjj15G9eVjcOsJAIuKi3RfUkYqbnxd9nI8BDcQpmYKngyh87gWzV69
 p51rcUgCcqw66BSJD+p0LZASvX9dDI415WnI29ftc4XFxviWol6vkkYjvIg8lXg8QejC
 kiRi1NP7PllwARFddrQ/fFx8M8u+OTXSB2CZRMAjH+SWgy7CJnr2qpYlB11sJMB5ospP
 pZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737036810; x=1737641610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l4tLsdob9p3r0zB+KNzY3RQWBOKfuGomymPI9RGe1T8=;
 b=sTo5UAFhrFGyb5khG+xhPE6TcxJ9KggiMEuiGEeninMyY6jsDhCr8yNwQ9DQBl++wA
 rWWsgsvbY8rLacwEZgp7xaPOEtBfyV/9CfqiFKW10R60Q3YdKSSxA4cr5zVSsXScxMjd
 mXlRThz6JSSTirrNXXtGx3/t8Tg5lXO30iRziNmQZvNQIDMicbgUI6dRH2bE9fOBblsf
 pCvNbg7vyQtLctKogESyh43ALkRXFueNXFiRvbaqUBhV6F4Se5gpGG7mbVICLegVJ97E
 605yhEhLEstY43G1Ky30aGn57jehgNOwSfs6D6n4JoNu4YUuHw7dFrmphKbguXwZAIWE
 LpSg==
X-Gm-Message-State: AOJu0YwuCLcVS2mGblVj922kaFIBslb0Gjo6yzS0XKiuMfFwvgba2p+e
 fCVgkKfGme1mDJ1FwClEy6jQjS0bfAk7VR76M2eRqL7mD1+QhjbL7adtpK1Ud/QR4xUCWeeCCuH
 WEKv+q48xufnogMVKygXB7bIpmJo=
X-Gm-Gg: ASbGnculWA51Mr9/he6JfzgOUkQe8iOFXztkUq5iwBvsvE25lnh2ISUNQoc4cA+ZydD
 9nM2XsVW1yVcC7/a0eySMNIVgi0dJboqRBLVGhg==
X-Google-Smtp-Source: AGHT+IGEBVuiq2TF7XNNQqEZKs6lWNaXgb7A02ydi2PfDuul4/wW7hW4LYA7w4aNyw7EbME/f7Zv1wZkCluCA+GOde0=
X-Received: by 2002:a17:90b:1f83:b0:2ee:3fa7:ef23 with SMTP id
 98e67ed59e1d1-2f5490fa6f6mr18484754a91.8.1737036809943; Thu, 16 Jan 2025
 06:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20241106014638.350678-1-hamza.mahfooz@amd.com>
In-Reply-To: <20241106014638.350678-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Jan 2025 09:13:18 -0500
X-Gm-Features: AbW1kvZNeAnrH0a23JcEHlhqq31DN1ECb4MO0s-n_359N0OxBQS2BjINfCzkzP8
Message-ID: <CADnq5_MqTjprg3vPEMCPfq-i8yiuV_DTa==NdiSwRboH-NN1Zg@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: add CTA Video Format Data Block support
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Karol Herbst <kherbst@redhat.com>, 
 Ian Forbes <ian.forbes@broadcom.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 5, 2024 at 9:14=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.com=
> wrote:
>
> Video Format Data Blocks (VFDBs) contain the necessary information that
> needs to be fed to the Optimized Video Timings (OVT) Algorithm.
> Also, we require OVT support to cover modes that aren't supported by
> earlier standards (e.g. CVT). So, parse all of the relevant VFDB data
> and feed it to the OVT Algorithm, to extract all of the missing OVT
> modes.
>
> Cc: Ian Forbes <ian.forbes@broadcom.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Suggested-by: Karol Herbst <kherbst@redhat.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v3: move ovt stuff above add_cea_modes() and break up
>     calculate_ovt_mode() to make it easier to read.
>
> v4: fix 32 bit build and constify read-only vars.
>
> v5: Implement suggestions from:
>     https://lore.kernel.org/dri-devel/87plpbk92h.fsf@intel.com/
>     and export drm_ovt_mode().

Any concerns with this patch?  Can we land this?

Alex

> ---
>  drivers/gpu/drm/drm_edid.c | 465 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     |   3 +
>  2 files changed, 468 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 855beafb76ff..e5e34397be00 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -31,6 +31,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/byteorder/generic.h>
>  #include <linux/cec.h>
> +#include <linux/gcd.h>
>  #include <linux/hdmi.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
> @@ -741,6 +742,87 @@ static const struct minimode extra_modes[] =3D {
>         { 2048, 1536, 60, 0 },
>  };
>
> +struct cta_rid {
> +       u16 hactive;
> +       u16 vactive;
> +       u8 hratio;
> +       u8 vratio;
> +};
> +
> +/* CTA-861-I Table 11 - Resolution Identification (RID) */
> +static const struct cta_rid rids[] =3D {
> +       [0]  =3D { 0, 0, 0, 0 },
> +       [1]  =3D { 1280, 720, 16, 9 },
> +       [2]  =3D { 1280, 720, 64, 27 },
> +       [3]  =3D { 1680, 720, 64, 27 },
> +       [4]  =3D { 1920, 1080, 16, 9 },
> +       [5]  =3D { 1920, 1080, 64, 27 },
> +       [6]  =3D { 2560, 1080, 64, 27 },
> +       [7]  =3D { 3840, 1080, 32, 9 },
> +       [8]  =3D { 2560, 1440, 16, 9 },
> +       [9]  =3D { 3440, 1440, 64, 27 },
> +       [10] =3D { 5120, 1440, 32, 9 },
> +       [11] =3D { 3840, 2160, 16, 9 },
> +       [12] =3D { 3840, 2160, 64, 27 },
> +       [13] =3D { 5120, 2160, 64, 27 },
> +       [14] =3D { 7680, 2160, 32, 9 },
> +       [15] =3D { 5120, 2880, 16, 9 },
> +       [16] =3D { 5120, 2880, 64, 27 },
> +       [17] =3D { 6880, 2880, 64, 27 },
> +       [18] =3D { 10240, 2880, 32, 9 },
> +       [19] =3D { 7680, 4320, 16, 9 },
> +       [20] =3D { 7680, 4320, 64, 27 },
> +       [21] =3D { 10240, 4320, 64, 27 },
> +       [22] =3D { 15360, 4320, 32, 9 },
> +       [23] =3D { 11520, 6480, 16, 9 },
> +       [24] =3D { 11520, 6480, 64, 27 },
> +       [25] =3D { 15360, 6480, 64, 27 },
> +       [26] =3D { 15360, 8640, 16, 9 },
> +       [27] =3D { 15360, 8640, 64, 27 },
> +       [28] =3D { 20480, 8640, 64, 27 },
> +};
> +
> +/* CTA-861-I Table 12 - AVI InfoFrame Video Format Frame Rate */
> +static const u16 video_format_frame_rates[] =3D {
> +       /* Frame Rate 0-7 */
> +       0, 24, 25, 30, 48, 50, 60, 100,
> +       /* Frame Rate 8-15 */
> +       120, 144, 200, 240, 300, 360, 400, 480,
> +};
> +
> +/* CTA-861-I Table 13 - RID To VIC Mapping */
> +static const u8 rid_to_vic[][8] =3D {
> +       [0]  =3D {},
> +       [1]  =3D { 60, 61, 62, 108, 19, 4, 41, 47 },
> +       [2]  =3D { 65, 66, 67, 109, 68, 69, 70, 71 },
> +       [3]  =3D { 79, 80, 81, 110, 82, 83, 84, 85 },
> +       [4]  =3D { 32, 33, 34, 111, 31, 16, 64, 63 },
> +       [5]  =3D { 72, 73, 74, 112, 75, 76, 77, 78 },
> +       [6]  =3D { 86, 87, 88, 113, 89, 90, 91, 92 },
> +       [7]  =3D {},
> +       [8]  =3D {},
> +       [9]  =3D {},
> +       [10] =3D {},
> +       [11] =3D { 93, 94, 95, 114, 96, 97, 117, 118 },
> +       [12] =3D { 103, 104, 105, 116, 106, 107, 119, 120 },
> +       [13] =3D { 121, 122, 123, 124, 125, 126, 127, 193 },
> +       [14] =3D {},
> +       [15] =3D {},
> +       [16] =3D {},
> +       [17] =3D {},
> +       [18] =3D {},
> +       [19] =3D { 194, 195, 196, 197, 198, 199, 200, 201 },
> +       [20] =3D { 202, 203, 204, 205, 206, 207, 208, 209 },
> +       [21] =3D { 210, 211, 212, 213, 214, 215, 216, 217 },
> +       [22] =3D {},
> +       [23] =3D {},
> +       [24] =3D {},
> +       [25] =3D {},
> +       [26] =3D {},
> +       [27] =3D {},
> +       [28] =3D {},
> +};
> +
>  /*
>   * From CEA/CTA-861 spec.
>   *
> @@ -4131,6 +4213,7 @@ static int add_detailed_modes(struct drm_connector =
*connector,
>  #define CTA_DB_VIDEO                   2
>  #define CTA_DB_VENDOR                  3
>  #define CTA_DB_SPEAKER                 4
> +#define CTA_DB_VIDEO_FORMAT            6
>  #define CTA_DB_EXTENDED_TAG            7
>
>  /* CTA-861-H Table 62 - CTA Extended Tag Codes */
> @@ -4972,6 +5055,16 @@ struct cea_db {
>         u8 data[];
>  } __packed;
>
> +struct cta_vfd {
> +       u8 rid;
> +       u8 fr_fact;
> +       bool bfr50;
> +       bool fr24;
> +       bool bfr60;
> +       bool fr144;
> +       bool fr48;
> +};
> +
>  static int cea_db_tag(const struct cea_db *db)
>  {
>         return db->tag_length >> 5;
> @@ -5250,6 +5343,376 @@ static int edid_hfeeodb_extension_block_count(con=
st struct edid *edid)
>         return cta[4 + 2];
>  }
>
> +/* CTA-861 Video Format Descriptor (CTA VFD) */
> +static void parse_cta_vfd(struct cta_vfd *vfd, const u8 *data, int vfd_l=
en)
> +{
> +       vfd->rid =3D data[0] & 0x3f;
> +       vfd->bfr50 =3D data[0] & 0x80;
> +       vfd->fr24 =3D data[0] & 0x40;
> +       vfd->bfr60 =3D vfd_len > 1 ? (data[1] & 0x80) : true;
> +       vfd->fr144 =3D vfd_len > 1 ? (data[1] & 0x40) : false;
> +       vfd->fr_fact =3D vfd_len > 1 ? (data[1] & 0x3f) : 0x3;
> +       vfd->fr48 =3D vfd_len > 2 ? (data[2] & 0x1) : false;
> +}
> +
> +static bool vfd_has_fr(const struct cta_vfd *vfd, int rate)
> +{
> +       static const u8 factors[] =3D {
> +               1, 2, 4, 8, 12, 16
> +       };
> +       int factor =3D 0;
> +       int i;
> +
> +       switch (rate) {
> +       case 24:
> +               return vfd->fr24;
> +       case 48:
> +               return vfd->fr48;
> +       case 144:
> +               return vfd->fr144;
> +       }
> +
> +       if (!(rate % 25)) {
> +               if (!vfd->bfr50)
> +                       return false;
> +
> +               factor =3D rate / 25;
> +       } else if (!(rate % 30)) {
> +               if (!vfd->bfr60)
> +                       return false;
> +
> +               factor =3D rate / 30;
> +       }
> +
> +       for (i =3D 0; i < ARRAY_SIZE(factors); i++)
> +               if (factor =3D=3D factors[i] && (vfd->fr_fact & (1 << i))=
)
> +                       return true;
> +
> +       return false;
> +}
> +
> +#define OVT_PIXEL_CLOCK_GRANULARITY    1000            /* Hz */
> +#define OVT_MIN_HTOTAL_GRANULARITY     8               /* pixels */
> +#define OVT_MIN_VBLANK_DURATION        460000000       /* ps */
> +#define OVT_MIN_VBLANK_LINES           20
> +#define OVT_MIN_VSYNC_LEADING_EDGE     400             /* us */
> +#define OVT_MIN_VSYNC_LE_LINES         14
> +#define OVT_MIN_CLOCK_RATE_420         590000000       /* Hz */
> +#define OVT_PIXEL_FACTOR_420           2
> +#define OVT_MIN_HBLANK_444             80              /* pixels */
> +#define OVT_MIN_HBLANK_420             128             /* pixels */
> +#define OVT_MAX_CHUNK_RATE             650000000       /* Hz */
> +#define OVT_AUDIO_PACKET_RATE          195000          /* Hz */
> +#define OVT_AUDIO_PACKET_SIZE          32
> +#define OVT_LINE_OVERHEAD              32
> +#define OVT_HSYNC_WIDTH                32
> +#define OVT_VSYNC_WIDTH                8
> +
> +static u32 calculate_ovt_min_vtotal(const struct cta_rid *rid, u64 max_v=
rate,
> +                                   u32 vtotal_granularity)
> +{
> +       u64 max_active_time;
> +       u32 min_line_time;
> +       u32 min_vblank;
> +       u32 min_vtotal;
> +
> +       /* step 2 */
> +       max_active_time =3D div64_u64(1000000000000, max_vrate) -
> +               (u64)OVT_MIN_VBLANK_DURATION;
> +
> +       min_line_time =3D div_u64(max_active_time, rid->vactive);
> +
> +       min_vblank =3D max_t(u64, (u64)OVT_MIN_VBLANK_LINES,
> +                          DIV64_U64_ROUND_UP(OVT_MIN_VBLANK_DURATION,
> +                                             min_line_time));
> +
> +       min_vtotal =3D rid->vactive + min_vblank;
> +
> +       if (min_vtotal % vtotal_granularity)
> +               min_vtotal +=3D vtotal_granularity - (min_vtotal %
> +                                                   vtotal_granularity);
> +
> +       return min_vtotal;
> +}
> +
> +static u32 calculate_ovt_min_htotal(const struct cta_rid *rid,
> +                                   const u32 max_vrate,
> +                                   const u32 min_vtotal,
> +                                   u32 *min_hblank,
> +                                   u32 *htotal_granularity)
> +{
> +       u32 max_audio_packets_per_line;
> +       u32 htotal_granularity_chunk;
> +       u64 min_pixel_clock_rate;
> +       u32 min_line_rate;
> +       u32 min_htotal;
> +
> +       /* step 3 */
> +       min_line_rate =3D max_vrate * min_vtotal;
> +
> +       max_audio_packets_per_line =3D DIV_ROUND_UP(OVT_AUDIO_PACKET_RATE=
,
> +                                                 min_line_rate);
> +
> +       /* step 4 */
> +       *min_hblank =3D OVT_LINE_OVERHEAD + OVT_AUDIO_PACKET_SIZE *
> +               max_audio_packets_per_line;
> +
> +       min_htotal =3D rid->hactive + max(OVT_MIN_HBLANK_444, *min_hblank=
);
> +
> +       min_pixel_clock_rate =3D max_vrate * min_htotal * min_vtotal;
> +
> +       htotal_granularity_chunk =3D
> +               roundup_pow_of_two(DIV64_U64_ROUND_UP(min_pixel_clock_rat=
e,
> +                                                     OVT_MAX_CHUNK_RATE)=
);
> +
> +       *htotal_granularity =3D max(OVT_MIN_HTOTAL_GRANULARITY,
> +                                 htotal_granularity_chunk);
> +
> +       if (min_htotal % *htotal_granularity)
> +               min_htotal +=3D *htotal_granularity - (min_htotal %
> +                                                    *htotal_granularity)=
;
> +
> +       return min_htotal;
> +}
> +
> +static u64 calculate_ovt_pixel_clock_rate(const struct cta_rid *rid,
> +                                         const u32 max_vrate,
> +                                         const u32 min_hblank,
> +                                         u32 min_htotal,
> +                                         u32 min_vtotal,
> +                                         const u32 htotal_granularity,
> +                                         const u32 vtotal_granularity,
> +                                         u32 *htotal, u32 *vtotal)
> +{
> +       u32 resolution_granularity;
> +       u64 pixel_clock_rate;
> +       u64 min_resolution;
> +       u64 rem;
> +       u32 h;
> +       u64 r;
> +       u32 v;
> +
> +       resolution_granularity =3D OVT_PIXEL_CLOCK_GRANULARITY /
> +               gcd(OVT_PIXEL_CLOCK_GRANULARITY, max_vrate);
> +
> +       do {
> +               /* step 5 */
> +               min_resolution =3D 0;
> +               v =3D min_vtotal;
> +
> +               goto loop_end;
> +
> +               while (!min_resolution || r <=3D min_resolution) {
> +                       goto inner_loop_end;
> +
> +                       while (rem || div64_u64(max_vrate * r, (h & ~(h -=
 1))) >
> +                              OVT_MAX_CHUNK_RATE) {
> +                               h +=3D htotal_granularity;
> +                               r =3D (u64)h * (u64)v;
> +inner_loop_end:
> +                               div64_u64_rem(r, resolution_granularity, =
&rem);
> +                       }
> +
> +                       if (!min_resolution || r < min_resolution) {
> +                               *htotal =3D h;
> +                               *vtotal =3D v;
> +                               min_resolution =3D r;
> +                       }
> +
> +                       v +=3D vtotal_granularity;
> +
> +loop_end:
> +                       h =3D min_htotal;
> +                       r =3D (u64)h * (u64)v;
> +               }
> +
> +               pixel_clock_rate =3D max_vrate * min_resolution;
> +
> +               /* step 6 */
> +               min_htotal =3D rid->hactive + max(OVT_MIN_HBLANK_420,
> +                                               OVT_PIXEL_FACTOR_420 *
> +                                               min_hblank);
> +
> +       } while (pixel_clock_rate >=3D OVT_MIN_CLOCK_RATE_420 &&
> +                *htotal < min_htotal);
> +
> +       return pixel_clock_rate;
> +}
> +
> +static const struct cta_rid *find_rid(u8 rid)
> +{
> +       if (!rid || rid >=3D ARRAY_SIZE(rids))
> +               return NULL;
> +
> +       return &rids[rid];
> +}
> +
> +/* OVT Algorthim as specified in CTA-861-I */
> +struct drm_display_mode *drm_ovt_mode(struct drm_device *dev, int r_id,
> +                                     int vrefresh)
> +{
> +       const struct cta_rid *rid =3D find_rid(r_id);
> +       struct drm_display_mode *mode;
> +       u32 vtotal_granularity =3D 1;
> +       u32 htotal_granularity;
> +       u32 max_vrate =3D vrefresh;
> +       u64 pixel_clock_rate;
> +       u32 vsync_position;
> +       u32 min_hblank;
> +       u32 min_htotal;
> +       u32 min_vtotal;
> +       u32 htotal;
> +       u32 vtotal;
> +
> +       if (!rid)
> +               return NULL;
> +
> +       /* step 1 */
> +       switch (vrefresh) {
> +       case 24:
> +       case 25:
> +               max_vrate =3D 30;
> +               fallthrough;
> +       case 30:
> +               vtotal_granularity =3D 20;
> +               break;
> +       case 48:
> +       case 50:
> +               max_vrate =3D 60;
> +               fallthrough;
> +       case 60:
> +               vtotal_granularity =3D 20;
> +               break;
> +       case 100:
> +               max_vrate =3D 120;
> +               fallthrough;
> +       case 120:
> +               vtotal_granularity =3D 5;
> +               break;
> +       case 200:
> +               max_vrate =3D 240;
> +               fallthrough;
> +       case 240:
> +               vtotal_granularity =3D 5;
> +               break;
> +       case 300:
> +               max_vrate =3D 360;
> +               fallthrough;
> +       case 360:
> +               vtotal_granularity =3D 5;
> +               break;
> +       case 400:
> +               max_vrate =3D 480;
> +               fallthrough;
> +       case 480:
> +               vtotal_granularity =3D 5;
> +               break;
> +       }
> +
> +       min_vtotal =3D calculate_ovt_min_vtotal(rid, max_vrate,
> +                                             vtotal_granularity);
> +
> +       min_htotal =3D calculate_ovt_min_htotal(rid, max_vrate, min_vtota=
l,
> +                                             &min_hblank, &htotal_granul=
arity);
> +
> +       pixel_clock_rate =3D calculate_ovt_pixel_clock_rate(rid, max_vrat=
e,
> +                                                         min_hblank,
> +                                                         min_htotal,
> +                                                         min_vtotal,
> +                                                         htotal_granular=
ity,
> +                                                         vtotal_granular=
ity,
> +                                                         &htotal, &vtota=
l);
> +
> +       /* step 7 */
> +       vtotal =3D vtotal * max_vrate / (u32)vrefresh;
> +
> +       /* step 8 */
> +       vsync_position =3D max(OVT_MIN_VSYNC_LE_LINES,
> +                            DIV64_U64_ROUND_UP((u64)OVT_MIN_VSYNC_LE_LIN=
ES *
> +                                               pixel_clock_rate,
> +                                               (u64)htotal * (u64)100000=
0));
> +
> +       mode =3D drm_mode_create(dev);
> +
> +       if (!mode)
> +               return NULL;
> +
> +       /* step 10 */
> +       mode->clock =3D div_u64(pixel_clock_rate, 1000);
> +       mode->hdisplay =3D rid->hactive;
> +       mode->hsync_start =3D htotal - OVT_HSYNC_WIDTH * 2;
> +       mode->hsync_end =3D mode->hsync_start + OVT_HSYNC_WIDTH;
> +       mode->htotal =3D htotal;
> +
> +       mode->vdisplay =3D rid->vactive;
> +       mode->vsync_start =3D vtotal - vsync_position;
> +       mode->vsync_end =3D mode->vsync_start + OVT_VSYNC_WIDTH;
> +       mode->vtotal =3D vtotal;
> +
> +       return mode;
> +}
> +
> +static u8 find_vic(u8 rid, int rate_idx)
> +{
> +       if (video_format_frame_rates[rate_idx] > 120 || !find_rid(rid))
> +               return 0;
> +
> +       return rid_to_vic[rid][rate_idx - 1];
> +}
> +
> +/* CTA-861 Video Format Data Block (CTA VFDB) */
> +static int add_modes_from_vfdb(struct drm_connector *connector,
> +                              const struct cea_db *db)
> +{
> +       const struct drm_display_info *info =3D &connector->display_info;
> +       int vfdb_len =3D cea_db_payload_len(db);
> +       struct drm_display_mode *mode;
> +       struct cta_vfd vfd;
> +       int num_modes =3D 0;
> +       int rate_idx;
> +       int vfd_len;
> +       int rate;
> +       int i;
> +
> +       if (!vfdb_len)
> +               return 0;
> +
> +       vfd_len =3D (db->data[0] & 0x3);
> +
> +       if (!vfd_len)
> +               return 0;
> +
> +       vfd_len++;
> +       vfdb_len--;
> +       vfdb_len -=3D (vfdb_len % vfd_len);
> +
> +       for (i =3D 0; i < vfdb_len; i +=3D vfd_len) {
> +               parse_cta_vfd(&vfd, &db->data[i + 1], vfd_len);
> +
> +               for (rate_idx =3D 1; rate_idx <
> +                    ARRAY_SIZE(video_format_frame_rates); rate_idx++) {
> +                       rate =3D video_format_frame_rates[rate_idx];
> +
> +                       if (!vfd_has_fr(&vfd, rate) || find_vic(vfd.rid,
> +                                                               rate_idx)=
)
> +                               continue;
> +
> +                       mode =3D drm_ovt_mode(connector->dev, vfd.rid, ra=
te);
> +
> +                       if (!mode)
> +                               continue;
> +
> +                       mode->height_mm =3D info->height_mm;
> +                       mode->width_mm =3D info->width_mm;
> +
> +                       drm_mode_probed_add(connector, mode);
> +                       num_modes++;
> +               }
> +       }
> +
> +       return num_modes;
> +}
> +
>  /*
>   * CTA-861 YCbCr 4:2:0 Capability Map Data Block (CTA Y420CMDB)
>   *
> @@ -5318,6 +5781,8 @@ static int add_cea_modes(struct drm_connector *conn=
ector,
>                         /* Add 4:2:0(only) modes present in EDID */
>                         modes +=3D do_y420vdb_modes(connector, vdb420,
>                                                   cea_db_payload_len(db) =
- 1);
> +               } else if (cea_db_tag(db) =3D=3D CTA_DB_VIDEO_FORMAT) {
> +                       modes +=3D add_modes_from_vfdb(connector, db);
>                 }
>         }
>         cea_db_iter_end(&iter);
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index eaac5e665892..78831207ec65 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -450,6 +450,9 @@ struct drm_display_mode *
>  drm_display_mode_from_cea_vic(struct drm_device *dev,
>                               u8 video_code);
>
> +struct drm_display_mode *drm_ovt_mode(struct drm_device *dev, int rid,
> +                                     int vrefresh);
> +
>  /* Interface based on struct drm_edid */
>  const struct drm_edid *drm_edid_alloc(const void *edid, size_t size);
>  const struct drm_edid *drm_edid_dup(const struct drm_edid *drm_edid);
> --
> 2.46.1
>
